# Unix
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'
alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"
alias e='$EDITOR'
alias v='$VISUAL'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Grep
export GREP_OPTIONS='--color=auto'
