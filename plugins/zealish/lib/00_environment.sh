OS=$(uname -s | tr '[:lower:]' '[:upper:]')
if [[ "$OS" == "LINUX" ]]; then
  export LANG=zh_CN.UTF-8

  # For input method
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx

  export BROWSER=firefox
fi
