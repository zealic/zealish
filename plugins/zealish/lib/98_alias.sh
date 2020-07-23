# aliases
alias docker4mac-shell="docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"

if [[ ! -d $HOME/.unsafe-chrome ]]; then
  mkdir -p $HOME/.unsafe-chrome
fi
alias unsafe-chrome="open -n -a \"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" --args --user-data-dir=\"$HOME/.unsafe-chrome\" --disable-web-security"
