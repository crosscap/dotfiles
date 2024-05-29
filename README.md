# README

## crosscap's dotfile

Each file will be classified by the software using it.

### bash

- .bash_aliases
- .bash_logout
- .bashrc
- .bashrc.backup
- .prefile

### git

.gitconfig
.gitignore
my-gitignore.txt

### vim

- .vimrc

### emacs

- .emacs.d/init.el

### conda

.condarc

### scheme

.scheme.init

### C & C++ formatting

Cformat.txt

### some instelled script

#### docker

```shell
sudo apt install bash-completion
# add follow script to .bashrc

cat <<EOT >> ~/.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
EOT

source ~/.bashrc
mkdir -p ~/.local/share/bash-completion/completions
docker completion bash > ~/.local/share/bash-completion/completions/docker
```

#### rustup

```shell
rustup completions bash > ~/.local/share/bash-completion/completions/rustup
```
