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
(cd $ATSHOME/bootstrap1 && rm -f *.o)
(cd $ATSHOME/ccomp/runtime/GCATS && make && make clean)
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
(cd ATS2 && cp ${ATSHOME}/config.h .)
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
(cd ATS2/src && make cleanall)
#
(cd ATS2/src/CBOOT && make -C prelude)
(cd ATS2/src/CBOOT && make -C libc)
(cd ATS2/src/CBOOT && make -C libats)
(cd ATS2/utils/libatsopt && make && make clean)
#
cp -f ATS2/utils/libatsopt/libatsopt.a ${ATSHOME}/ccomp/lib
#
######
#
# For libatsynmark
#
(cd ATS2/utils/libatsynmark && make && make clean)
#
cp -f ATS2/utils/libatsynmark/libatsynmark.a ${ATSHOME}/ccomp/lib
#
######
#
# sudo apt-get install -y erlang
#
######

sudo apt-get install -y libjson-c-dev

######
#
# For parsing constraints 
#
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve && time make DATS_C)
#
# For building patsolve_z3
#
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-z3 && time make build)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-z3 && mv -f patsolve_z3 ${PATSHOME}/bin)
#
# For building patsolve_smt2
#
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-smt2 && time make build)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-smt2 && mv -f patsolve_smt2 ${PATSHOME}/bin)
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
(cd ATS2-contrib/contrib/libatscc/libatscc2js && time make all && time make all_in_one)
#
# For building atscc2pl
#
(cd ATS2/contrib/CATS-atscc2pl && time make all)
(cd ATS2/contrib/CATS-atscc2pl && mv -f atscc2pl ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2pl && time make all && time make all_in_one)
#
# For building atscc2py3
#
(cd ATS2/contrib/CATS-atscc2py3 && time make all)
(cd ATS2/contrib/CATS-atscc2py3 && mv -f atscc2py3 ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2py3 && time make all && time make all_in_one)
#
# For building atscc2php
#
(cd ATS2/contrib/CATS-atscc2php && time make all)
(cd ATS2/contrib/CATS-atscc2php && mv -f atscc2php ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2php && time make all && time make all_in_one)
#
# For building atscc2scm
#
(cd ATS2/contrib/CATS-atscc2scm && time make all)
(cd ATS2/contrib/CATS-atscc2scm && mv -f atscc2scm ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2scm && time make all && time make all_in_one)
#
# For building atscc2clj
#
(cd ATS2/contrib/CATS-atscc2clj && time make all)
(cd ATS2/contrib/CATS-atscc2clj && mv -f atscc2clj ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2clj && time make all && time make all_in_one)
#
# For building atscc2erl
#
(cd ATS2/contrib/CATS-atscc2erl && time make all)
(cd ATS2/contrib/CATS-atscc2erl && mv -f atscc2erl ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2erl && time make all && time make all_in_one)
(cd ATS2-contrib/contrib/libatscc/libatscc2erl/Session && time make all && time make all_in_one)
#
######
#
###### end of [C9-ATS2-install-cs520-latest.sh] ######
