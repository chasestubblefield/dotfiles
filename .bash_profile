# .bash_profile
# Run when bash is invoked as an interactive, login shell

# PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d $HOME/projects/bin ] && export PATH="$HOME/projects/bin:$PATH"

# Other
[ -d $HOME/projects/gopath ] && export GOPATH=$HOME/projects/gopath
[ -d /usr/local/etc/bash_completion.d ] && for f in /usr/local/etc/bash_completion.d/*; do source $f; done

alias gst='git status --short --branch'

function __set_ps1() {
  local bold_cyan='\[\e[1;36m\]'
  local bold_green='\[\e[1;32m\]'
  local reset='\[\e[0m\]'
  local pre="$bold_cyan\W$reset"
  local post="$bold_green\$$reset "
  if declare -fF __git_ps1 >/dev/null; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM=auto
    GIT_PS1_DESCRIBE_STYLE=branch
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }__git_ps1 \"$pre\" \" $post\""
  else
    PS1="$pre $post"
  fi
}
__set_ps1
