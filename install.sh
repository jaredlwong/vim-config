#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -e "${HOME}/.vim" ]; then
	ln -s ${DIR}/.vim ${HOME}/.vim
else
	echo "Skipping linking ~/.vim"
fi

if [ ! -e "${HOME}/.vimrc" ]; then
	ln -s ${DIR}/.vimrc ${HOME}/.vimrc
else
	echo "Skipping linking ~/.vimrc"
fi

if [ ! -d "${DIR}/.vim/bundle/vundle/autoload" ]; then
	(cd ${DIR} && git submodule update --init --recursive)
else
	echo "Skipping install vundle"
fi

vim +PluginInstall +qall
