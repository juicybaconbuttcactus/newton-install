#!/bin/bash -e

################################################################################
# FGSL version 0.9.4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   Deleted parameter "-p" after command "cp" in Makefile
################################################################################

module load gcc/4.8.1
module load gsl/1.15

./configure --prefix $APPDIR --gsl $INSTALLDIR/gsl/1.15 --bits 64
make
make test
make install
#chmod -R 755 $APPDIR
