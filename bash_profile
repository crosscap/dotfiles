#
# ~/.bash_profile
#

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set default pager
# export PAGER='most'

# set default editor
export EDITOR='vim'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Added by Toolbox App
export PATH="$PATH:/home/crosscap/.local/share/JetBrains/Toolbox/scripts"

# add some new PATH
if [[ -d "/usr/local/go/bin" ]]; then
  PATH="$PATH:/usr/local/go/bin"
fi
if [[ -d "/opt/nvim-linux64/bin" ]]; then
  PATH="$PATH:/opt/nvim-linux64/bin"
fi
if [[ -d "/home/crosscap/.duckdb" ]]; then
  PATH='/home/crosscap/.duckdb/cli/latest':$PATH
fi
export PATH

# add some software's environment
export LD_LIBRARY_PATH=/usr/local/gmp/lib:$LD_LIBRARY_PATH

# include local environment if it exists
if [[ -f "$HOME/.local_path" ]]; then
  source "$HOME/.local_path"
fi

# set less options
if [[ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]]; then
	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [[ -f "/usr/bin/src-hilite-lesspipe.sh" ]]; then
	export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
export LESS='-CMRs'

# set LC_COLLATE to C for sorting
export LC_COLLATE=C

[[ -f ~/.bashrc ]] && . ~/.bashrc
