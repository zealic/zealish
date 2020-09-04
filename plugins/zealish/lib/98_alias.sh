# aliases
alias docker4mac-shell="docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"

chrome() {
  local chrome_opts=${CHROME_OPTS}
  local chromeBin="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
  local tenant="${CHROME_TENANT:-$1}"
  local tenantDir
  if [[ -z "$tenant" ]]; then
    echo "Tenant name is required."
    return 1
  fi
  local tenantDir="$HOME/.zchrome/$tenant"
  if [[ ! -d "$tenantDir" ]]; then
    mkdir -p "$tenantDir" || return 1
  fi
  open -n -a "$chromeBin" --args --user-data-dir="$tenantDir" $chrome_opts
}

unsafe-chrome() {
  CHROME_OPTS=--disable-web-security chrome $@
}
