# .bash_profile
# Run when bash is invoked as an interactive login shell

shopt -s extglob

[ -d /usr/local/etc/bash_completion.d ] && for f in /usr/local/etc/bash_completion.d/*; do source "$f"; done

hash rbenv 2>/dev/null && eval "$(rbenv init -)"
hash pyenv 2>/dev/null && eval "$(pyenv init -)"
hash pyenv-virtualenv-init 2>/dev/null && eval "$(pyenv virtualenv-init -)"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -d "$HOME/code/gopath" ] && export GOPATH="$HOME/code/gopath" && export PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/.bin" ] && export PATH="$HOME/.bin:$PATH"

alias gst='git status --short --branch'
alias be='bundle exec'

# enable ls colors
export CLICOLOR=1

# disable less history
export LESSHISTFILE=-

# needing for encrypting with gpg
export GPG_TTY=$(tty)

__set_prompt() {
  local bold_cyan='\[\e[1;36m\]'
  local bold_green='\[\e[1;32m\]'
  local reset='\[\e[0m\]'
  local pre="$bold_cyan\W$reset"
  local post="$bold_green\$$reset "
  if declare -F __git_ps1 >/dev/null; then
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
