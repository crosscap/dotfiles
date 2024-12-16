# README

## crosscap's dotfile

Use [Dotbot](https://github.com/anishathalye/dotbot) to control these files.

### How to use

Run ./install

### dotfile list

Each file will be classified by the software using it.

#### bash

- .bash\_aliases
- .bash\_logout
- .bashrc
- .bashrc.backup
- .prefile

#### git

- .gitconfig
- .gitignore\_global
- my-gitignore.txt

#### vim

- .vimrc

#### emacs

- .emacs
- .emacs.d/init.el

#### conda

- .condarc

#### scheme

- .scheme.init

#### C & C++ formatting

- Cformat.txt

#### some installed scripts

##### docker

```shell
sudo apt install bash-completion
# add follow script to .bashrc

cat <<EOT >> ~/.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
EOT

# run following sentences
source ~/.bashrc
mkdir -p ~/.local/share/bash-completion/completions
docker completion bash > ~/.local/share/bash-completion/completions/docker
```

##### vim

Install plug.vim

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### rustup

```shell
rustup completions bash > ~/.local/share/bash-completion/completions/rustup
rustup completions bash cargo > ~/.local/share/bash-completion/completions/cargo
```

#### some apt packages

- source-highlight
- zsh

#### some git clone installation

- powerlevel10k
- lazyvim
- zsh-syntax-highlighting
- zsh-autosuggestions
