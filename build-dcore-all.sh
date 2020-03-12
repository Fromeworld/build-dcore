#!/bin/bash

# ======================
# 1. make build dir
mkdir -p ../dcore-deps && cd ../dcore-deps

# ======================
# 2. install deps by ubuntu apt and then pip
sudo apt-get install cmake g++ gfortran git hdf5-tools \
     libblas-dev libboost-all-dev libfftw3-dev libgfortran3 \
     libhdf5-serial-dev libgmp-dev liblapack-dev libopenmpi-dev \
     python-dev python-h5py python-jinja2 python-mako python-matplotlib \
     python-mpi4py python-numpy python-scipy python-tornado python-zmq \
&& pip install enum34 # for dcore test

# ======================
# 3. install triqs
# download source and untar
curl -Lo triqs-2.1.1.tar.gz https://github.com/TRIQS/triqs/archive/2.1.1.tar.gz
tar zxvf triqs-2.1.1.tar.gz

# set install dir
INSTALL_PREFIX=$(pwd)/triqs

# set multi-core to compile
NCORES=6

# cmake disabled test otherwise takes forever (problem when 60% test/...bubble, 100% disk usage)
mkdir -p triqs.build && cd triqs.build
cmake ../triqs-2.1.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DBuild_Tests=OFF

# compile
make -j$NCORES && make test && make install
make clean
cd ../
rm triqs-2.1.1.tar.gz
rm -rf triqs.build

# ======================
# 4. install DFTTools

# download source and untar
curl -Lo dft_tools-2.1.0.tar.gz https://github.com/TRIQS/dft_tools/archive/2.1.0.tar.gz
tar zxvf dft_tools-2.1.0.tar.gz

# set install dir
TRIQS_PATH=$(pwd)/triqs

# set multi-core to compile
NCORES=6

# cmake
mkdir -p dft_tools.build && cd dft_tools.build
source $TRIQS_PATH/share/triqsvars.sh
cmake -DTRIQS_PATH=$TRIQS_PATH ../dft_tools-2.1.0

# compile and test
make -j$NCORES && make test && make install
make clean
cd ../
rm dft_tools-2.1.0.tar.gz
rm -rf dft_tools.build

# ======================
# 5. ALPS
# download source and untar
curl -Lo alpscore-v2.2.0.tar.gz https://github.com/ALPSCore/ALPSCore/archive/v2.2.0.tar.gz
tar zxvf alpscore-v2.2.0.tar.gz

# set install dir
INSTALL_PREFIX=$(pwd)/ALPSCore

# set multi-core to compile
NCORES=6

# cmake
mkdir -p ALPSCore.build && cd ALPSCore.build
cmake ../ALPSCore-2.2.0 -DALPS_INSTALL_EIGEN=yes -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# compile and test
make -j$NCORES && make test && make install 
make clean
cd ../
rm alpscore-v2.2.0.tar.gz
rm -rf ALPSCore.build

# ======================
# 6. CT-HYB

# download source and untar
curl -Lo ct-hyb-v1.0.3.tar.gz https://github.com/ALPSCore/CT-HYB/archive/v1.0.3.tar.gz
tar zxvf ct-hyb-v1.0.3.tar.gz

# alps pat
ALPSCore_PATH=$(pwd)/ALPSCore/share/ALPSCore

# CT-HYB path
INSTALL_PREFIX=$(pwd)/CT-HYB

# set multi-core to compile
NCORES=6

# cmake
mkdir -p CT-HYB.build && cd CT-HYB.build
cmake -DALPSCore_DIR=$ALPSCore_PATH -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX ../CT-HYB-1.0.3

# compile and test
make -j$NCORES && make test && make install
make clean
cd ../
rm ct-hyb-v1.0.3.tar.gz
rm -rf CT-HYB.build

# ======================
# 7. DCore

# download source and untar
curl -Lo dcore-v2.0.1.tar.gz https://github.com/issp-center-dev/DCore/archive/v2.0.1.tar.gz
tar zxvf dcore-v2.0.1.tar.gz

#  DCore path
INSTALL_PREFIX=$(pwd)/install

#  Triqs path
TRIQS_PATH=$(pwd)/deps/triqs

# cmake
mkdir -p DCore.build && cd DCore.build
source $TRIQS_PATH/share/triqsvars.sh
cmake -DTRIQS_PATH=$TRIQS_PATH ../DCore-2.0.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# compile and test
make && make test && make install
make clean
cd ../
rm dcore-v2.0.1.tar.gz
rm -rf DCore.build

# ======================
# 
sudo apt-get clean
sudo apt-get autoclean