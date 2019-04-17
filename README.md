# dotfiles
To clone the repo, do the following

1. `cd`
1. `git clone https://github.com/kotalab/dotfiles .dotfiles`
1. `ln -s ~/.dotfiles/.zshrc ~/.zshrc`
1. `ln -s ~/.dotfiles/.powerline-shell.json ~/.powerline-shell.json`
1. `ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json`

## Frequently used command top 10
`history|awk '{ $1=""; print $0 }'|sort|uniq -c|sort -r|head`