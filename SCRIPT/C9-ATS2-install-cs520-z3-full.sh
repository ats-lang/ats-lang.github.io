#####
#
# A Script for Installing Z3 and ATS
# Written by Jacob Grishey
# Uses a script from Hongwei Xi
#
#####

# Update Repositories and make sure gcc, python, and json-c are installed
sudo apt-get update
sudo apt-get install gcc
sudo apt-get install python
sudo apt-get install libjson0

# Get Z3
wget https://github.com/Z3Prover/z3/archive/z3-4.4.1.tar.gz
mv z3-4.4.1.tar.gz ~/z3-4.4.1.tar.gz

# Unpack Z3
tar -xzvf ~/z3-4.4.1.tar.gz


cd ~/z3-z3-4.4.1

# Make build scripts
python scripts/mk_make.py

cd build

# Make and Install Z3 to z3-4.4.1 directory
make

sudo make PREFIX=~/z3-4.4.1 install

# Set environment variables to be used by ATS installation
echo "export Z3=~/z3-4.4.1" >> ~/.bashrc
echo "export PATH=${PATH}:${Z3}/bin" >> ~/.bashrc
echo "export LIBRARY_PATH=${LIBRARY_PATH}:${Z3}/lib" >> ~/.bashrc
echo "export C_INCLUDE_PATH=${C_INCLUDE_PATH}:${Z3}/include" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=${LD_LIBARY_PATH}:${Z3}/lib" >> ~/.bashrc

# Install pkg-config to handle Z3 and JSON lib
sudo apt-get install pkg-config

cd ~/

# Get and Run Hongwei Xi's install ATS script
wget https://raw.githubusercontent.com/ats-lang/ats-lang.github.io/master/SCRIPT/C9-ATS2-install-cs520-z3.sh
sh -v C9-ATS2-install-cs520-z3.sh


