#!/bin/bash
#
# Author: Egidio Docile <egdoc.dev@gmail.com>
#
# This script is the container entrypoint

set -o errexit
set -o nounset
set -o pipefail

rm -rf /home/compiler/vim
git clone https://github.com/vim/vim.git --depth=1

cd vim
./configure \
  --with-features="${WITH_FEATURES}" \
  --with-compiledby="Egidio Docile" \
  --enable-multibyte \
  --enable-python3interp=yes \
  --enable-cscope \
  --enable-gui=no \
  --prefix="${PREFIX}"

make VIMRUNTIMEDIR="${PREFIX}/share/vim/vim82"
