#!/usr/bin/env sh

######
#
# A shell script for
# installing ATS2 + ATS2-contrib
#
# This is mainly for teaching CS520
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

git clone git://git.code.sf.net/p/ats2-lang/code ATS2
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
(cd ATS2 && ./configure)
(cd ATS2 && time make all)
#
######
#
# Installing patscc and patsopt
#
# (cd ATS2 && sudo make install)
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
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-z3 && time make build)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-z3 && mv -f patsolve_z3 ${PATSHOME}/bin)
#
# For building patsolve_smt2
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-smt2 && time make build)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve/ATS-extsolve-smt2 && mv -f patsolve_smt2 ${PATSHOME}/bin)
#
######

sudo apt-get install -y erlang

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
# For building atscc2py3
#
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2py3 && time make build)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2py3 && mv -f atscc2py3 ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2py3 && time make all && time make all_in_one)
#
# For building atscc2cli
#
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2cli && time make build)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2cli && mv -f atscc2cli ${PATSHOME}/bin)
(cd ATS2-contrib/contrib/libatscc/libatscc2cli && time make all && time make all_in_one)
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
