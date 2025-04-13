# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# --- Environment Variables ---
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'

# --- PATH Management ---
# Define directories to prepend to PATH (order matters)
path_dirs=(
  "$HOME/bin"                                    # User's private bin
  "$HOME/.local/bin"                             # User's local binaries
  "$HOME/.local/share/JetBrains/Toolbox/scripts" # JetBrains Toolbox scripts
  "/usr/local/go/bin"                            # Go language binaries
  "/opt/nvim-linux64/bin"                        # Neovim installation
  "$HOME/.cargo/bin"                             # Rust/Cargo binaries
  "$HOME/.duckdb/cli/latest"                     # DuckDB CLI
)

# Add valid directories to PATH (new entries take precedence)
for dir in "${path_dirs[@]}"; do
  if [[ -d "$dir" ]]; then
    PATH="$dir:$PATH"
  fi
done

# Deduplicate PATH entries (Bash-compatible method)
PATH=$(awk -v RS=: '!a[$0]++' <<<"$PATH" | paste -sd: -)
export PATH

# --- Conditional LESS syntax highlighting setup ---
# Find syntax highlighter for less
lesspipe_sh=$(command -v src-hilite-lesspipe.sh 2>/dev/null)
if [[ -n "$lesspipe_sh" ]]; then
  export LESSOPEN="| $lesspipe_sh %s"
fi
export LESS='-CMRs' # Set less options

# --- Locale Settings ---
export LC_COLLATE=C # C-style sorting

# --- Security-Sensitive Environment Variables ---
# Only set LD_LIBRARY_PATH if explicitly needed
if [[ -d "/usr/local/gmp/lib" ]]; then
  export LD_LIBRARY_PATH="/usr/local/gmp/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

# --- Local Configuration Overrides ---
[[ -f "$HOME/.local_path" ]] && source "$HOME/.local_path"

# --- Bash-Specific Configuration ---
# Load .bashrc for interactive Bash shells
if [[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]]; then
  source "$HOME/.bashrc"
fi
