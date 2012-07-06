export PATH="/usr/local/share/python:/usr/local/bin:$PATH"

#node
export NODE_PATH="/usr/local/lib/node"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# svn
export SVN_EDITOR="subl"

# python
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--no-site-packages"
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
export PIP_RESPECT_VIRTUALENV="true"

if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
  source /usr/local/share/python/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# export PS1="\[\e[0;33m\]⚡\[\e[0m\] "
export PS1="\[\e[0;33m\]λ\[\e[0m\] "
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias mou="open -a Mou.app"
