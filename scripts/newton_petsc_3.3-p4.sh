#!/bin/bash

################################################################################
# PETSC version 3.3-p4 INSTALL SCRIPT
#   for use on UTK Newton only
#
# Files changed in order to compile:
#   None
################################################################################

APPNAME="petsc"
VERSION="3.3-p4"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"

module load intel-compilers/2011.5.220
module load hypre/2.8.0b
module load valgrind/3.8.0

LAPACK=$INSTALLDIR/intel/2011.5.220/mkl/lib/intel64
HYPRE=$INSTALLDIR/hypre/2.8.0b
VALGRIND=$INSTALLDIR/valgrind/3.8.0

./configure --prefix=$APPDIR \
  --with-blas-lapack-dir=$LAPACK \
  --with-hypre=1 \
  --with-hypre-dir=$HYPRE \
  --with-valgrind-dir=$VALGRIND

make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug all
make PETSC_DIR=`pwd` PETSC_ARCH=arch-linux2-c-debug install
