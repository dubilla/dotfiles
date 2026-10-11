#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract current directory
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Get git branch if in a git repo
git_info=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        git_info=" $(printf '\033[36m')($branch)$(printf '\033[0m')"
    fi
fi

# Extract model display name
model=$(echo "$input" | jq -r '.model.display_name')

# Calculate token usage percentage
usage=$(echo "$input" | jq '.context_window.current_usage')
usage_info=""
if [ "$usage" != "null" ]; then
    current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    size=$(echo "$input" | jq '.context_window.context_window_size')
    pct=$((current * 100 / size))
    usage_info=" $(printf '\033[33m')[${pct}%]$(printf '\033[0m')"
fi

# Color a plan-usage percentage: green < 50, yellow < 80, red otherwise
color_pct() {
    if [ "$1" -ge 80 ]; then printf '\033[31m'
    elif [ "$1" -ge 50 ]; then printf '\033[33m'
    else printf '\033[32m'; fi
}

# Plan rate limits (absent for API-key sessions)
limits_info=""
read -r five_pct five_reset week_pct week_reset <<< "$(echo "$input" | jq -r '
    .rate_limits // {} |
    [(.five_hour.used_percentage // "-"), (.five_hour.resets_at // "-"),
     (.seven_day.used_percentage // "-"), (.seven_day.resets_at // "-")] | @tsv')"
if [ "$five_pct" != "-" ] && [ -n "$five_pct" ]; then
    five_pct=${five_pct%.*}
    reset=""
    [ "$five_reset" != "-" ] && reset=" ↻$(date -r "$five_reset" '+%-I:%M%p' | tr 'APM' 'apm')"
    limits_info+=" · 5h $(color_pct "$five_pct")${five_pct}%$(printf '\033[0m')$(printf '\033[2m')${reset}$(printf '\033[0m')"
fi
if [ "$week_pct" != "-" ] && [ -n "$week_pct" ]; then
    week_pct=${week_pct%.*}
    reset=""
    [ "$week_reset" != "-" ] && reset=" ↻$(date -r "$week_reset" '+%a')"
    limits_info+=" · wk $(color_pct "$week_pct")${week_pct}%$(printf '\033[0m')$(printf '\033[2m')${reset}$(printf '\033[0m')"
fi

# Build status line
printf "$(printf '\033[32m')%s$(printf '\033[0m')%s $(printf '\033[35m')%s$(printf '\033[0m')%s%s" \
    "$(basename "$cwd")" \
    "$git_info" \
    "$model" \
    "$usage_info" \
    "$limits_info"
