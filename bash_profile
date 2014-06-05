export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="/Users/ageorges/.cabal/bin:$PATH"
export PATH="/Users/ageorges/bin:$PATH"

#node
export NODE_PATH="/usr/local/lib/node_modules"
export NPM_CONFIG_PREFIX="/usr/local"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--no-site-packages"
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
export PIP_RESPECT_VIRTUALENV="true"

# haskell
# export PATH="$HOME/.cabal/bin:$PATH"

# java

export JAVA_OPTS="-Djava.awt.headless=true"

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

alias ll="ls -l -a -t -h"
alias st='open -a "Sublime Text" .'

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
    echo "(${BLUE}$(git-branch-name)$(git-dirty)${RESET})"
  fi
}

function virtualenvify {
  if [[ -n $VIRTUAL_ENV ]]
  then
    echo "(${GREEN}${VIRTUAL_ENV##*/}${RESET})"
  elif [[ -n $HSENV ]]
  then
    echo "(${GREEN}${HSENV##*/}${RESET})"
  else
    echo ""
  fi
}

function make-prompt {
  local GRAY="\[\e[1;30m\]"
  local PURPLE="\[\e[0;35m\]"
  local BLUE="\[\e[0;34m\]"
  local YELLOW="\[\e[0;33m\]"
  local GREEN="\[\e[0;32m\]"
  local RESET="\[\e[0m\]"

  PS1="${GRAY}\w${RESET}$(virtualenvify)$(gitify)${YELLOW} ∞${RESET} "
}

PROMPT_COMMAND=make-prompt
make-prompt

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

export HISTFILESIZE=1000
export HISTTIMEFORMAT="%F %T "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if which grunt > /dev/null; then eval "$(grunt --completion=bash)"; fi

source `brew --prefix`/etc/profile.d/z.sh

function serve { python -m SimpleHTTPServer "$@" ;}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
