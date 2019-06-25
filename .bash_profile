# .bash_profile
# Run when bash is invoked as an interactive login shell

shopt -s extglob

hash rbenv 2>/dev/null && [ -d "$HOME/.rbenv" ] && eval "$(rbenv init -)"
hash nodenv 2>/dev/null && [ -d "$HOME/.nodenv" ] && eval "$(nodenv init -)"
hash pyenv 2>/dev/null && [ -d "$HOME/.pyenv" ] && eval "$(pyenv init -)"
hash pyenv-virtualenv-init 2>/dev/null && [ -d "$HOME/.pyenv" ] && eval "$(pyenv virtualenv-init -)"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -d "$HOME/code/gopath" ] && export GOPATH="$HOME/code/gopath" && export PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/.bin" ] && export PATH="$HOME/.bin:$PATH"

alias be='bundle exec'

# enable ls colors
export CLICOLOR=1

# disable less history
export LESSHISTFILE=-

# needed for gpg
export GPG_TTY=$(tty)

# editors
export EDITOR=vim
export BUNDLER_EDITOR=atom

# Homebrew
if hash brew &>/dev/null; then
  # shell completion
  BREW_PREFIX="$(brew --prefix)"
  for COMPLETION in "$BREW_PREFIX"/etc/bash_completion.d/*; do
    [[ -f "$COMPLETION" ]] && source "$COMPLETION"
  done
  if [[ -f "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
    source "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
  fi
  unset BREW_PREFIX

  # GitHub API Token
  export HOMEBREW_GITHUB_API_TOKEN=e8b8d58a71225a60d47b23947f3eb00e39e042f5
fi

# prompt
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
