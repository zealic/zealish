if [[ ! -e ~/.ssh/config ]]; then
  cat > ~/.ssh/config <<EOF
Include $ZEALISH/share/ssh/*.conf
EOF
fi
