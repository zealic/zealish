#!/bin/sh
BASE_DIR=$(cd `dirname "$0"` && echo "$PWD")
KARABINER_HOME="$HOME/Library/Application Support/Karabiner"
mkdir -p "$KARABINER_HOME" 2> /dev/null

cat > "$KARABINER_HOME/private.xml" <<EOF
<?xml version="1.0"?>
<root>
    <include path="$BASE_DIR/main.xml" />
</root>
EOF
