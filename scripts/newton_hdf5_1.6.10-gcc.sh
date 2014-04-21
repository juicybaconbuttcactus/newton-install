#!/bin/bash

################################################################################
# HDF5 version 1.6.10-gcc INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="hdf5"
VERSION="1.6.10-gcc"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module switch openmpi openmpi/1.4.3-gcc-psm

./configure --prefix=$APPDIR --enable-parallel --enable-shared CC=mpicc
make
make test
make install