#!/bin/bash

################################################################################
# IOAPI version 3.1 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
#   
################################################################################

APPNAME="ioapi"
VERSION="3.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

mkdir -p $APPDIR
rm -rf $APPDIR/*
cp -rf * $APPDIR
cd $APPDIR

export APPDIR=$APPDIR
export BIN=Linux2_x86_64ifort
cd ioapi
cp newton_makefile/Makefile .
make clean
make
