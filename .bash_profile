# .bash_profile
# Run when bash is invoked as an interactive login shell

[ -d /usr/local/etc/bash_completion.d ] && for f in /usr/local/etc/bash_completion.d/*; do source $f; done

hash rbenv 2>/dev/null && eval "$(rbenv init -)"
hash pyenv 2>/dev/null && eval "$(pyenv init -)"
hash pyenv-virtualenv-init 2>/dev/null && eval "$(pyenv virtualenv-init -)"

[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/projects/gopath" ] && export GOPATH="$HOME/projects/gopath" && PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/projects/bin" ] && PATH="$HOME/projects/bin:$PATH"
export PATH

alias gst='git status --short --branch'

function __set_prompt() {
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
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }__git_ps1 \"$pre\" \" $post\" \" [%s]\""
  else
    PS1="$pre $post"
  fi
}
__set_prompt
unset __set_prompt
