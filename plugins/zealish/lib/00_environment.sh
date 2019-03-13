OS=$(uname -s | tr '[:lower:]' '[:upper:]')
if [[ "$OS" == "LINUX" ]]; then
  # For input method
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx

  export BROWSER=firefox
fi

export LANG=en_US.UTF-8
