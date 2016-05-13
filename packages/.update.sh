#!/bin/sh
BASE_DIR=$(dirname "$0")
brew list > homebrew.lst
brew cask list > homebrew-cask.lst
npm list -g --depth=0 --json=true > npm.json

