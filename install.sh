#!/usr/bin/env bash

args=$@

targetDir=$HOME/.config/nvim
mkdir -p $targetDir
flags="--verbose=1 -t ${targetDir}"

if [[ "$args" == "--uninstall" ]]; then
  echo 'Uninstalling'
  flags="-D --verbose=1 -t $HOME"
fi

stow $flags .   # newest
