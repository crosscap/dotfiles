# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set default pager
# export PAGER='most'

# set default editor
export EDITOR='vim'

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

# include local environment if it exists
if [[ -f "$HOME/.local_path" ]]; then
  source "$HOME/.local_path"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# add some new PATH
# PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
PATH="/usr/local/go/bin:$PATH"
PATH="$PATH:/opt/nvim-linux64/bin"
export PATH

# add some software's environment
# export MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH
# export INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH
export LD_LIBRARY_PATH=/usr/local/gmp/lib:$LD_LIBRARY_PATH

# change some environment
if [[ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]]; then
	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [[ -f "/usr/bin/src-hilite-lesspipe.sh" ]]; then
	export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
export LESS=" -R "

. "$HOME/.cargo/env"
