# Java
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk '{ print $3 }')
if [[ ! -d "${JAVA_HOME}" ]]; then
  echo "\e[33mWARN\e[0m: JAVA_HOME '${JAVA_HOME}' dosn't exists."
fi

if [[ -d "/usr/local/opt/groovy/libexec" ]]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi

# Maven
## Fuck GFW
if [[ ! -f ~/.m2/settings.xml ]]; then
  cat > ~/.m2/settings.xml <<EOF
<settings>
  <mirrors>
    <mirror>
      <id>aliyun-public</id>
      <name>aliyun public</name>
      <url>https://maven.aliyun.com/repository/public</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
</settings>
EOF
fi

# Gradle
if GRADLE_BIN=`which gradle`; then
  export GRADLE_HOME=`dirname $(dirname $(greadlink -f $GRADLE_BIN))`
fi
