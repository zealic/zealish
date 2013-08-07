#!/bin/sh
PACKAGES=(
  fbterm
  wqy-unibit
  yong
)

# Configure permission
setcap 'cap_sys_tty_config+ep' /usr/bin/fbterm
