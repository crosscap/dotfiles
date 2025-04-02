# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  # alias grep='grep --color=auto'
  # Use extended grep
  alias grep='grep -E --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -Alh'
alias l='ls -CF'
alias lsl='ls -hl'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# change some software's default module
alias vi='vim'
alias view='vim -R'
alias vimtutor='vimtutor zh_CN'
alias mit='mit-scheme'
alias more='less'
alias wirte-good='npx write-good'
alias start='xdg-open'

# some history aliases
alias h='histroy'
alias r='fc -s'

# del alias for bash, cshell and zsh
alias del='fc -s ls=rm'

# some personal remove aliases
alias rmexe='find . -name "*.exe" -type f -delete'
alias rmout='find . -name "*.out" -type f -delete'
alias rmedbak='find . -name "*~" -type f -delete && find . -name ".*.swp" -type f -delete'
alias rmzoneinent='find . -name "*:Zone.Identifier" -type f -delete'

# some personal aliases
alias a='alias'
alias fd='fdfind'
alias cls='clear'
alias folddef='fold -s -w 80'
alias aptupdl='sudo apt update && echo "执行 apt list --upgradable" && apt list --upgradable'
alias emacsnw='emacs -nw'
alias py3doctest='python3 -m doctest'
alias ok='python3 ok --local'
alias neov='nvim'

# some personal cd and code aliases
alias cdw='cd $WORKING'
alias cdmycode='cd ~/code/mycode/'
alias cdccode='cd /mnt/c/Users/wangl/code'
alias codew='code $WORKING'
alias workw='cd $WORKING && code .'

# some personal bochs alias
alias bochs='bin/bochs -f bochsrc.disk'
alias sbochs='sudo bochs'

# some personal git aliases
alias gs='git status'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias glog='git log --graph --all --decorate'
alias glogs='git log --stat'
alias gist='gitstart'
alias gifi='gitfinish'

gitstart() {
  git checkout master
  if git pull; then
    git checkout doing
    git merge master
  else
    echo "Error: Could not pull from master"
  fi
}

gitfinish() {
  git checkout master
  git fetch
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse "@{u}")
  if [[ "$LOCAL" = "$REMOTE" ]]; then
    git merge doing
    git push
    git checkout doing
  else
    echo "Have updates in remote, please deal with it first"
  fi
}
