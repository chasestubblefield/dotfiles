# PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

# Other
[ -d $HOME/projects/gopath ] && export GOPATH=$HOME/projects/gopath
if [ -d /usr/local/etc/bash_completion.d ]; then
  for f in /usr/local/etc/bash_completion.d/*; do source $f; done
fi

if declare -fF __git_ps1 >/dev/null; then
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM=auto
  export PS1='\[\033[1;36m\]\W\[\033[0m\]$(__git_ps1)\[\033[1;32m\] \$\[\033[0m\] '
else
  export PS1='\[\033[1;36m\]\W\[\033[1;32m\] \$\[\033[0m\] '
fi

alias gst='git status --short --branch'
