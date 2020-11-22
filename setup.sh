#!/bin/bash

DOTFILES_DIR=${HOME}/dotfiles
DOTFILES=$(find)

for f in ${DOTFILES}
do
  if [ `echo $f | grep ".git"` ]; then
    continue
  elif [ `echo $f | grep "README.md"` ]; then
    continue
  elif [ `echo $f | grep "setup.sh"` ]; then
    continue
  fi
  ln -snfv $f 
done
