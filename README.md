# dotfiles
To clone the repo, do the following

```shell
$ cd ~/
$ git clone https://github.com/kotalab/dotfiles .dotfiles
$ ln -s ~/.dotfiles/.zshrc ~/.zshrc
$ ln -s ~/.dotfiles/.powerline-shell.json ~/.powerline-shell.json
$ ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
$ ln -s ~/.dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
```

## Frequently used command top 10
`history|awk '{ $1=""; print $0 }'|sort|uniq -c|sort -r|head`
