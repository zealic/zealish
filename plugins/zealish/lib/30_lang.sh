# Golang
export GOPATH=~/.go
path+=(
  ~/.go/bin
)

# Java
export JAVA_HOME=/Library/Java/Home
if [[ ! -d "${JAVA_HOME}" ]]; then
  echo "\e[33mWARN\e[0m: JAVA_HOME '${JAVA_HOME}' dosn't exists."
fi

if [[ -d "/usr/local/opt/groovy/libexec" ]]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi

GRADLE_BIN=`which gradle`
if [[ ! -z "${GRADLE_BIN}" ]]; then
  export GRADLE_HOME=`dirname $(dirname $(greadlink -f $GRADLE_BIN))`
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
