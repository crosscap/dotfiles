# chenge some software's default modle
alias vi='vim'
alias vimtutor='vimtutor zh_CN'

# some personal aliases
alias fd='fdfind'
alias cls='clear'
alias aptupdl='sudo apt update && echo "执行 apt list --upgradable" && apt list --upgradable'
alias rmexe='find . -name "*.exe" -type f -delete'
alias rmout='find . -name "*.out" -type f -delete'
alias rmeditorbackup='find . -name "*~" -type f -delete && find . -name ".*.swp" -type f -delete'
alias rmzoneinent='find . -name "*:Zone.Identifier" -type f -delete'
alias codew='code $WORKING'
alias workw='cd $WORKING && code .'
alias codebashrc='code ~/.bashrc'
alias codealiases='code ~/.bash_aliases'
alias bochs='~/bochs/bin/bochs'
alias sbochs='sudo ~/bochs/bin/bochs'
alias emacsnw='emacs -nw'
alias mit='mit-scheme'
alias more='less'
alias py3doctest='python3 -m doctest'
alias ok='python3 ok --local'

# some personal cd aliases
alias cdw='cd $WORKING'
alias cdmycode='cd ~/code/mycode/'
alias cdccode='cd /mnt/c/Users/wangl/code'

# some personal git aliases
alias gs='git status'
alias gitcm='git commit -m'
alias gitstart='git checkout master && git pull && git checkout doing && git merge master'
alias gitfinish='git checkout master && git merge doing && git push && git checkout doing'
alias gitlog='git log --graph | less'
