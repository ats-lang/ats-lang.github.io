#!/usr/bin/env sh

######
#
# A shell script for
# installing ATS-Postiats + utils
#
######
#
# Author: Artyom Shalkhakov
# Authoremail: artyomDOTshalkhakovATgmailDOTcom
#
# Based on a similar script by Hongwei Xi
#
######

#
# NOTE: to install MSYS2, follow the steps from:
#
#  https://msys2.github.io/
#

pacman -S gcc
pacman -S autoconf git
pacman -S binutils wget tar make
pacman -S gmp gmp-devel
pacman -S libgc-devel

######
#
# for installing ats-anairiats
#
######

export GCC=gcc

######
#
export ATSVER=0.2.12
export ATSPACK=ats-lang-anairiats-${ATSVER}
export ATSPACKTGZ=${ATSPACK}.tgz
#
######
#
export \
ATSLANGURL_srcfg=\
http://sourceforge.net/projects/ats-lang
export \
ATSLANGURL_github=http://ats-lang.github.io
#
######
#
wget -q \
${ATSLANGURL_github}/ATS-Anairiats/${ATSPACKTGZ}
#
tar -zxf ${ATSPACKTGZ}
#
export ATSHOME=${PWD}/${ATSPACK}
export ATSHOMERELOC=ATS-${ATSVER}
#
(cd ${ATSHOME} && ./configure&&make CC=${GCC} all_ngc)
#
######

git clone https://github.com/githwxi/ATS-Postiats ATS2
git clone https://github.com/githwxi/ATS-Postiats-contrib.git ATS2-contrib

######

ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libats/SATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libats/DATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libats/ML/SATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libc/SATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libc/CATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/libc/sys/CATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/prelude/SATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/prelude/DATS/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/prelude/DATS/SHARE/CODEGEN/Makefile.gen
ln -sf ${PWD}/ATS2/share/Makefile.gen ${PWD}/ATS2/prelude/CATS/CODEGEN/Makefile.gen

######

export PATSHOME=${PWD}/ATS2
export PATSCONTRIB=${PWD}/ATS2-contrib

######
#
export PATH=${PATSHOME}/bin:${PATH}
#
######
#
echo "export ATSHOME=${PWD}/${ATSPACK}" >> ${HOME}/.bashrc
echo "export ATSHOMERELOC=ATS-${ATSVER}" >> ${HOME}/.bashrc
#
echo "export PATSHOME=${PWD}/ATS2" >> ${HOME}/.bashrc
#
echo "export PATH=\${PATSHOME}/bin:\${PATH}" >> ${HOME}/.bashrc
#
echo "export PATSCONTRIB=${PWD}/ATS2-contrib" >> ${HOME}/.bashrc
#
######
#
# Building patsopt + patscc
#
(cd ATS2 && make -f codegen/Makefile_atslib)
# some dirs do not have the files, yet, so skip them
mv ${PWD}/ATS2/libats/SATS/CODEGEN/*.sats ${PWD}/ATS2/libats/SATS/ 2>/dev/null; true
mv ${PWD}/ATS2/libats/DATS/CODEGEN/*.dats ${PWD}/ATS2/libats/DATS/ 2>/dev/null; true
mv ${PWD}/ATS2/libats/ML/SATS/CODEGEN/*.sats ${PWD}/ATS2/libats/ML/SATS/ 2>/dev/null; true
mv ${PWD}/ATS2/libc/SATS/CODEGEN/*.sats ${PWD}/ATS2/libc/SATS/ 2>/dev/null; true
mv ${PWD}/ATS2/libc/CATS/CODEGEN/*.cats ${PWD}/ATS2/libc/CATS/
mv ${PWD}/ATS2/libc/sys/CATS/CODEGEN/*.cats ${PWD}/ATS2/libc/sys/CATS/
mv ${PWD}/ATS2/prelude/SATS/CODEGEN/*.sats ${PWD}/ATS2/prelude/SATS/
mv ${PWD}/ATS2/prelude/DATS/CODEGEN/*.dats ${PWD}/ATS2/prelude/DATS/
mv ${PWD}/ATS2/prelude/DATS/SHARE/CODEGEN/*.dats ${PWD}/ATS2/prelude/DATS/SHARE/
mv ${PWD}/ATS2/prelude/CATS/CODEGEN/*.cats ${PWD}/ATS2/prelude/CATS/
#
######
#
(cd ATS2 && time make -f Makefile_devl)
#
######
#
# Installing patscc and patsopt
#
# (cd ATS2 && sudo make install)
#
######
#
# For libatsopt
#
# (cd ATS2/src/CBOOT && make -C prelude)
# (cd ATS2/src/CBOOT && make -C libc)
# (cd ATS2/src/CBOOT && make -C libats)
# (cd ATS2/utils/libatsopt && time make -f Makefile)
#
######
#
# For libatsynmark
#
# (cd ATS2/utils/libatsynmark && time make -f Makefile)
#
######

#sudo apt-get install -y erlang
#sudo apt-get install -y libjson-c-dev

######
#
# For parsing constraints
#
# (cd ATS2/contrib/ATS-extsolve && time make DATS_C)
#
# For building patsolve_z3
# (cd ATS2/contrib/ATS-extsolve-z3 && time make build)
# (cd ATS2/contrib/ATS-extsolve-z3 && mv -f patsolve_z3 ${PATSHOME}/bin)
#
# For building patsolve_smt2
# (cd ATS2/contrib/ATS-extsolve-smt2 && time make build)
# (cd ATS2/contrib/ATS-extsolve-smt2 && mv -f patsolve_smt2 ${PATSHOME}/bin)
#
######
#
# For parsing C code
# generated from ATS source
#
(cd ATS2/contrib/CATS-parsemit && time make all)
#
# For building atscc2js
#
(cd ATS2/contrib/CATS-atscc2js && time make all)
(cd ATS2/contrib/CATS-atscc2js && mv -f atscc2js ${PATSHOME}/bin)
#
# (cd ATS2-contrib/contrib/libatscc/libatscc2js && time make all && time make all_in_one)
#
# For building atscc2erl
#
# (cd ATS2/contrib/CATS-atscc2erl && time make all)
# (cd ATS2/contrib/CATS-atscc2erl && mv -f atscc2erl ${PATSHOME}/bin)
# (cd ATS2-contrib/contrib/libatscc/libatscc2erl && time make all && time make all_in_one)
# (cd ATS2-contrib/contrib/libatscc/libatscc2erl/Session && time make all && time make all_in_one)
#
######
#
###### end of [msys2-build-ats2.sh] ######
