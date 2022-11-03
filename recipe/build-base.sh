#!/bin/bash

set -e

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./config/

# configure
./configure \
	--disable-static \
	--enable-shared \
	--includedir=${PREFIX}/include/gds \
	--prefix=${PREFIX} \
;

# build
make -j ${CPU_COUNT} VERBOSE=1 V=1

# test
make -j ${CPU_COUNT} VERBOSE=1 V=1 check

# install
make -j ${CPU_COUNT} VERBOSE=1 V=1 install
