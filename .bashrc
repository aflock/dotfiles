
export TERM="screen-256color"
alias tmux="tmux -2"


alias la='ls -al'
alias ls='ls -G'
alias ll='ls -l'
alias gs='git status'
alias gd='git diff'
alias go='git checkout'
alias gb='git branch'
alias gcan='git commit --amend --no-edit'
alias gsl='git stash list --pretty=format:"%Cred* %Cblue%ad %Cred:: %C(green)%s" --date=relative'
alias gss='git stash save'
alias g='git'
alias gcam='git commit -am'
alias v='vim .'
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

alias hgs='hg status'
alias hgup='hg update'
alias vimall='vim -O $(hg chg -n)'
alias gphm='git push heroku master'
alias gsl='git smart-log'

GREY='\e[01;30m\]'
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[00m\]"
RESET='\e[0m\]'

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="$BLUE\u$GREY@$BLUE\h$GREY:$LIGHT_RED\W $GREY\D{%T}$PURPLE\$(parse_git_branch)$RESET\\n> "
export EDITOR=vim

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
fi
