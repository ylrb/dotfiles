#!/bin/sh/

# copy ~ files
cp ~/.dotfiles.sh ~/.dotfiles/.dotfiles.sh
cp ~/.zshrc ~/.dotfiles/.zshrc
cp ~/.bashrc ~/.dotfiles/.bashrc
cp ~/.nanorc ~/.dotfiles/.nanorc

# copy ~ folders
#cp -r ~/.mozilla ~/.dotfiles/.mozilla TOO BIG!
#cp -r ~/.thunderbird ~/.dotfiles/.thunderbird TOO BIG!
cp -r ~/.fonts ~/.dotfiles/.fonts

# copy ~/.config files
cp ~/.config/background ~/.dotfiles/.config/background
cp ~/.config/user-dirs.dirs ~/.dotfiles/.config/user-dirs.dirs

# copy ~/.config folders
cp -r ~/.config/BetterDiscord ~/.dotfiles/.config/BetterDiscord 
cp -r ~/.config/BetterDiscord ~/.dotfiles/.config/BetterDiscord 
cp -r ~/.config/ctpv ~/.dotfiles/.config/ctpv
cp -r ~/.config/kitty ~/.dotfiles/.config/kitty 
cp -r ~/.config/lf ~/.dotfiles/.config/lfvsco

echo "Configuration files copied to ~/.dotfiles"

# git
cd ~/.dotfiles
git fetch
echo "Github repository fetched"
git add .
echo "Added all files"
git commit -m "Update" -q
echo "Git commit done"
echo "Username : IgrecL\nPAT : $(cat ~/.PAT)"
git push origin main
echo "Configuration files pushed to the Github repository."
