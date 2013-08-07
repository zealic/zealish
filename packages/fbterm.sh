#!/bin/sh
PACKAGES=(
  fbterm
  wqy-unibit
  fcitx fcitx-sunpinyin
)

# Configure permission
setcap 'cap_sys_tty_config+ep' /usr/bin/fbterm

pacman -S $(PACKAGES)
