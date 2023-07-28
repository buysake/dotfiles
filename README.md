# dotfiles

## Alacritty
```
$ cd ~/.config/alacritty/
$ ln -s ~/dotfiles/alacritty/alacritty.yml
$ mkdir -p ~/.config/alacritty/themes
$ git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

```

## asdf
```
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
```

## fish
```
$ curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/4.1.0/fisher.fish | source && fisher install jorgebucaran/fisher@4.1.0
$ sudo reboot
$ cd ~/.config/fish/conf.d
$ ln -s ~/dotfiles/fish/config.fish

$ source ~/.asdf/asdf.fish
$ mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

$ fisher install ./fish/theme
```

## tmux
```
$ cd ~
$ ln -s ~/dotfiles/tmux/.tmux.conf
```
