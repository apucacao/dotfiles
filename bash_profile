export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="/usr/local/texlive/2011/bin/x86_64-darwin:$PATH"
export PATH="/opt/maven2/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH="$HOME/bin:$PATH"

#node
export NODE_PATH="/usr/local/lib/node_modules"
export NPM_CONFIG_PREFIX="/usr/local"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# svn
export SVN_EDITOR="vim"

# python
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--no-site-packages"
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
export PIP_RESPECT_VIRTUALENV="true"

# haskell
export PATH="$HOME/.cabal/bin:$PATH"

if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
  source /usr/local/share/python/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

alias ll="ls -l -a -t -h"
alias subl='open -a "Sublime Text 2" .'

# show git info in prompt

function git-branch-name {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git-dirty {
  st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st != "nothing to commit, working directory clean" ]]
  then
    echo "*"
  fi
}

function gitify {
  status=$(git status 2>/dev/null | tail -n 1)
  if [[ $status == "" ]]
  then
    echo ""
  else
    echo "(${PURPLE}$(git-branch-name)$(git-dirty)${RESET})"
  fi
}

function make-prompt {
  local RESET="\[\e[0m\]"
  local GRAY="\[\e[1;30m\]"
  local PURPLE="\[\e[1;35m\]"
  local YELLOW="\[\e[0;33m\]"

  PS1="${GRAY}\w${RESET}$(gitify) ${YELLOW}∞${RESET} "
}

PROMPT_COMMAND=make-prompt
make-prompt

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

export HISTTIMEFORMAT="%F %T "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export MAVEN_OPTS="-Xmx2048m"
