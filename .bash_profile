# Minimal prompt
export PS1="\e[1;34m∴ \e[0m\W \e[1;32m$ \e[0m"

# PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Other Variables
[[ -d $HOME/projects/goroot ]] && export GOPATH=$HOME/projects/goroot
export HOMEBREW_GITHUB_API_TOKEN=8dd0bebc481ecbfc544822ea06558e40b2dd80bb
