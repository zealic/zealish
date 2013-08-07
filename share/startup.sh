#/bin/sh
_BASE_DIR=$(cd .. & echo "$PWD")
_OS_NAME=$1

# Load all of the config files.
for config_file in "$_BASE_DIR/lib/*.sh"; do
  source $config_file
done

source "$_BASE_DIR/system/${_OS_NAME}.sh"
