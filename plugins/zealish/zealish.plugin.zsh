ZEALISH_LIB=$(dirname ${(%):-%x})

for script in $ZEALISH_LIB/lib/*.sh; do
  source $script
done
