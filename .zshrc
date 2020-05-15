# enable ls colors
export CLICOLOR=1

# disable less history
export LESSHISTFILE=-

# editors
export EDITOR=vim
export BUNDLER_EDITOR=code

# completion
autoload -Uz compinit
compinit

# PROMPT='%B%F{cyan}%1~ %F{green}%(!.#.$)%f%b '

function manpdf { man -t "$@" | open -f -a Preview }

zle_highlight+=(paste:none)

if [[ -f '/usr/local/etc/bash_completion.d/git-prompt.sh' ]]; then
    source '/usr/local/etc/bash_completion.d/git-prompt.sh'
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM=auto
    GIT_PS1_DESCRIBE_STYLE=branch
    GIT_PS1_SHOWCOLORHINTS=1
    precmd () { __git_ps1 '%B%F{cyan}%1~%f%b ' '%B%F{green}%(!.#.$)%f%b ' '[%s] ' }
fi
