#!/usr/bin/env bash

if [ ! -d $HOME/.vim/bundle/YouCompleteMe ]; then
	echo "YouCompleteMe isn't installed. Try running ./install.sh" >&2
	exit 1
fi

sudo apt-get install -y build-essential cmake python-dev python3-dev

cd $HOME/.vim/bundle/YouCompleteMe

output=$(./install.py -h 2>&1)
if [ $? -ne 0 ]; then
	echo "./install.py -h failed: $output" >&2
	exit 1
fi

output=$(./install.py --clang-completer --gocode-completer --tern-completer)
if [ $? -ne 0 ]; then
	echo "./install.py failed: $output" >&2
	exit 1
fi
