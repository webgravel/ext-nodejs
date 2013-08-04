#!/bin/bash
if which node; then
    exit
fi
if [ ! -e v0.11.4.tar.gz ]; then
    wget https://github.com/joyent/node/archive/v0.11.4.tar.gz -O tmp.tar.gz
    mv tmp.tar.gz v0.11.4.tar.gz
fi
sha256sum --check nodejs.sha256sum || exit 1
tar xf v0.11.4.tar.gz || exit 1
cd node-0.11.4
./configure || exit 1
time make || exit 1
make install || exit 1
