# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gci="git pull --rebase && rake && git push"
alias branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%1B[0;32m%(authorname)%09%1B[0;36m(%(committerdate:relative))%09%1B[0;33m%(refname:short)%09%1B[m%(subject)' --count 10 | tail -r | column -t -s $'\t'"
alias gopr="git pull-request"
alias gpu='git push -u origin HEAD'

### Git tab completion script. ###
# curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL
# source ~/git-completion.bash

### Hub ###
# alias git=hub
# hub tab-completion script for bash.
# This script complements the completion script that ships with git.

# Check that git tab completion is available
#if declare -F _git > /dev/null; then
#  # Duplicate and rename the 'list_all_commands' function
#  eval "$(declare -f __git_list_all_commands | \
#        sed 's/__git_list_all_commands/__git_list_all_commands_without_hub/')"
#
#  # Wrap the 'list_all_commands' function with extra hub commands
#  __git_list_all_commands() {
#    cat <<-EOF
#alias
#pull-request
#fork
#create
#browse
#compare
#EOF
#    __git_list_all_commands_without_hub
#  }

  # Ensure cached commands are cleared
#  __git_all_commands=""
#fi
## END Git/Hub tab completion attempt ##
