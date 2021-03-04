#!/bin/sh
# shellcheck shell=dash

# Helpfully stolen commands from https://sh.rustup.rs

set -u

link() {
    local vim_config_dir=$1

    if [ ! -e "${HOME}/.vim" ]; then
        ln -s ${vim_config_dir}/.vim ${HOME}/.vim
    else
        err "Couldn't link ~/.vim since it already exists"
    fi

    if [ ! -e "${HOME}/.vimrc" ]; then
        ln -s ${vim_config_dir}/.vimrc ${HOME}/.vimrc
    else
        err "Couldn't link ~/.vimrc since it already exists"
    fi

    if [ ! -d "${vim_config_dir}/.vim/bundle/vundle/autoload" ]; then
        (cd ${vim_config_dir} && git submodule update --init --recursive)
    else
        err "Couldn't install vundle since .vim/bundle/vundle/autoload already exists"
    fi
}

install_vundle() {
    ensure vim +PluginInstall +qall
}

main() {
    need_cmd vim
    need_cmd git

    ensure_directory_doest_not_exist "${HOME}/vim-config"
    ensure git clone https://github.com/jaredlwong/vim-config.git "${HOME}/vim-config"
    ensure link "${HOME}/vim-config"
    ensure install_vundle
}

need_cmd() {
    if ! check_cmd "$1"; then
        err "need '$1' (command not found)"
    fi
}

check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

ensure_directory_does_not_exist() {
    local dir_path=$1
    if [ ! -d "${dir_path}" ]; then
        err "Directory ${dir_path} exists"
        exit 1
    fi
}

ensure_directory_exists() {
    local dir_path=$1
    if [ -d "${dir_path}" ]; then
        err "directory ${dir_path} does not exist"
        exit 1
    fi
}

ensure_file_does_not_exist() {
    local file_path=$1
    if [ ! -e "${file_path}" ]; then
        err "file ${file_path} exists"
        exit 1
    fi
}

ensure_file_exists() {
    local file_path=$1
    if [ -e "${file_path}" ]; then
        err "file ${file_path} does not exist"
        exit 1
    fi
}

say() {
    printf 'install.sh: %s\n' "$1"
}

err() {
    say "$1" >&2
    exit 1
}

# Run a command that should never fail. If the command fails execution
# will immediately terminate with an error showing the failing
# command.
ensure() {
    if ! "$@"; then err "command failed: $*"; fi
}

# This is just for indicating that commands' results are being
# intentionally ignored. Usually, because it's being executed
# as part of error handling.
ignore() {
    "$@"
}


main "$@" || exit 1
