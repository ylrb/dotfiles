# lf

- [lf](https://github.com/gokcehan/lf)
- [tips](https://github.com/gokcehan/lf/wiki/Tips)
- [command guide](https://pkg.go.dev/github.com/gokcehan/lf)

Check les trucs à installer pour que ctpv puisse tout preview dans lf (sur Github)

# GDM

- Fond noir : yay gdm-tools puis set-gdm-theme set -b black
- [Changer la langue](https://wiki.archlinux.org/title/GDM#Change_the_language)

# Grub fond noir

Prendre n'importe quel thème sur www.gnome-look.org et changer l'image en image toute noire.

# Lancer automatiquement Linux dans Grub

Permet de skip Grub sauf si on appuie sur SHIFT : [GRUB/Tips and Tricks](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Hide_GRUB_unless_the_Shift_key_is_held_down)

# Ibus dans Firefox

Il faut changer les variable suivantes dans /etc/environment :
GTK_IM_MODULE=ibus
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus
