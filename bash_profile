export PATH="$PATH"

#node
export NODE_PATH="/usr/local/lib/node"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PS1="\[\e[0;33m\]⚡\[\e[0m\] "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
