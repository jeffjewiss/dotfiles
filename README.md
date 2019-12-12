# Dotfiles

These are my dotfiles. There are many like them but these ones are mine.


#### Fish Shell
![](https://cldup.com/SUyn0L8rel.png)

#### Neovim
![](https://cldup.com/0xxgm5j8Up.png)

#### Writing
![](https://cldup.com/GS52Q9q2my.png)


## Installation

1. [Clone Repo](#clone-repo)
2. [Symlink Local Laptop](#symlink-local-laptop)
3. [Thoughtbot’s Laptop Script](#thoughtbots-laptop-script)
4. [RCM](#rcm)
5. [Install Fonts](#install-fonts)
6. [Emacs](#emacs)
7. [Vim](#vim)


### Clone Repo

```shell
git clone https://github.com/jeffjewiss/dotfiles ~/.dotfiles
```


### Symlink Local Laptop

```shell
ln -s ~/.dotfiles/laptop.local ~/.laptop.local
```


### Thoughtbot’s Laptop Script

```shell
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
less mac
sh mac 2>&1 | tee ~/laptop.log
rm mac laptop.log
```


### RCM

```shell
rcup -v
```


### Install Fonts

* [Input Mono](http://input.fontbureau.com/download/)
* [Fira Code](https://github.com/tonsky/FiraCode)
* [Noto Sans](https://fonts.google.com/specimen/Noto+Sans)


### Emacs

``` shell
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

### Vim

```shell
vim
:PlugInstall
```
