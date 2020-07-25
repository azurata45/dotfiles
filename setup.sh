 #!/bin/bash

DOTFILES_DIR = "${HOME}/dotfiles"
DOTFILES = "${DOTFILES_DIR}/*"

 for file in ${DOTFILES[@]}
 do
   echo "${DOTFILES_DIR}/${file}, ${HOME}/${file}"
   # ln -s $DOTFILES_DIR/$file $HOME/$file
 done
