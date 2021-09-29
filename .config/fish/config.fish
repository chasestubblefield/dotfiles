status --is-interactive; and type -q rbenv; and source (rbenv init - | psub)
status --is-interactive; and type -q nodenv; and source (nodenv init - | psub)
test -d $HOME/.cargo/bin; and set -p PATH $HOME/.cargo/bin
test -d $HOME/.deno/bin; and set -p PATH $HOME/.deno/bin
