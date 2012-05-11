export PATH="$PATH"

export PS1="\[\e[0;33m\]⚡\[\e[0m\] "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

if [[ -e "/usr/local/etc/bash_completion.d/git-completion.bash" ]]
then
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
fi
