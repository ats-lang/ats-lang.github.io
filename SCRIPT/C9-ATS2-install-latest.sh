#!/usr/bin/env sh

######
#
# A shell script for
# installing ATS2 + ATS2-contrib
#
######
#
# Author: Hongwei Xi
# Authoremail: gmhwxiATgmailDOTcom
#
######

sudo apt-get update
#
# Installing gcc
# sudo apt-get install -y gcc
# Installing git
# sudo apt-get install -y git
#
sudo apt-get install -y build-essential
sudo apt-get install -y libgmp-dev libgc-dev

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

export PATSHOME=${PWD}/ATS2
export PATSHOMERELOC=${PWD}/ATS2-contrib

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
echo "export PATSHOMERELOC=${PWD}/ATS2-contrib" >> ${HOME}/.bashrc
echo "export PATSHOME_contrib=${PWD}/ATS2-contrib" >> ${HOME}/.bashrc
#
echo "export PATH=\${PATSHOME}/bin:\${PATH}" >> ${HOME}/.bashrc
#
######
#
# Building patsopt + patscc
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
(cd ATS2/src/CBOOT && make -C prelude)
(cd ATS2/src/CBOOT && make -C libc)
(cd ATS2/src/CBOOT && make -C libats)
#
(cd ATS2/utils/libatsopt && time make -f Makefile)
#
######
#
# For libatsynmark
#
(cd ATS2/utils/libatsynmark && time make -f Makefile)
#
######

sudo apt-get install -y erlang
sudo apt-get install -y libjson-c-dev

######
#
# For parsing constraints 
#
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve && time make DATS_C)
#
# For building patsolve_z3
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve-z3 && time make build)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve-z3 && mv -f patsolve_z3 ${PATSHOME}/bin)
#
######
#
# For parsing C code
# generated from ATS source
#
(cd ATS2-contrib/projects/MEDIUM/CATS-parsemit && time make DATS_C)
#
# For building atscc2js
#
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js && time make build)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js && mv -f atscc2js ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2js && time make all && time make all_in_one)
#
# For building atscc2erl
#
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2erl && time make build)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2erl && mv -f atscc2erl ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2erl && time make all && time make all_in_one)
(cd ATS2-contrib/contrib/libatscc/libatscc2erl/Session && time make all && time make all_in_one)
#
######
#
###### end of [C9-ATS2-install-cs520-z3.sh] ######
