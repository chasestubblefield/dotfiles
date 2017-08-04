# Minimal prompt
export PS1="\[\033[1;36m\]\W \[\033[1;32m\]$ \[\033[0m\]"

# PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Other
[[ -d $HOME/projects/goroot ]] && export GOPATH=$HOME/projects/goroot
