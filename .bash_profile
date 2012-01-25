if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

stty -ixon

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#source ~/.profile

 [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
