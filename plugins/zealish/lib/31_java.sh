# Java
export JAVA_HOME=/Library/Java/Home
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
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>

    <mirror>
      <id>aliyun-spring</id>
      <name>aliyun spring</name>
      <url>https://maven.aliyun.com/repository/spring</url>
      <mirrorOf>*</mirrorOf>
    </mirror>

    <mirror>
      <id>aliyun-spring-plugin</id>
      <name>aliyun spring-plugin</name>
      <url>https://maven.aliyun.com/repository/spring-plugin</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
</settings>
EOF
fi

# Gradle
GRADLE_BIN=`which gradle`
if [[ ! -z "${GRADLE_BIN}" ]]; then
  export GRADLE_HOME=`dirname $(dirname $(greadlink -f $GRADLE_BIN))`
fi
