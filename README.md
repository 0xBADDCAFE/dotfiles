dotfiles
========

```shell
git clone --recursive https://github.com/0xBADDCAFE/dotfiles.git ~/.config/dotfiles

# Simlink the one to use
ln -s ~/.config/dotfiles/.vim ~/.vim
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
vim -c "call minpac#update()"
ln -s ~/.config/dotfiles/.minzshrc ~/.zshrc
# Run setup file to copy .zxxxxx files
zsh setup.zsh
```
