# lf

- [lf](https://github.com/gokcehan/lf)
- [tips](https://github.com/gokcehan/lf/wiki/Tips)
- [command guide](https://pkg.go.dev/github.com/gokcehan/lf)

Check les trucs à installer pour que ctpv puisse tout preview dans lf (sur Github)

# GDM

- Fond noir : yay gdm-tools puis set-gdm-theme set -b black
- [Changer la langue](https://wiki.archlinux.org/title/GDM#Change_the_language)

# Changer l'action du bouton power

Gnome 42.4 est buggé donc il faut le faire via command line
- sudo gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'

# Lancer automatiquement Linux dans Grub

Permet de skip Grub sauf si on appuie sur ESC : [GRUB/Tips and Tricks](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Hide_GRUB_unless_the_Shift_key_is_held_down)

