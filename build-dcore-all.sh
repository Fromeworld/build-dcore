#!/bin/bash

# ======================
# 1.
mkdir -p deps && cd deps

# ======================
# 2.
sudo apt-get install cmake g++ gfortran git hdf5-tools \
     libblas-dev libboost-all-dev libfftw3-dev libgfortran3 \
     libhdf5-serial-dev libgmp-dev liblapack-dev libopenmpi-dev \
     python-dev python-h5py python-jinja2 python-mako python-matplotlib \
     python-mpi4py python-numpy python-scipy python-tornado python-zmq \
&& pip install enum34

# ======================
# 3.
# download source and untar
curl -Lo triqs-2.1.1.tar.gz https://github.com/TRIQS/triqs/archive/2.1.1.tar.gz
tar zxvf triqs-2.1.1.tar.gz

# set install dir
INSTALL_PREFIX=$(pwd)/triqs

# build core 
NCORES=6

# cmake disable test
mkdir -p triqs.build && cd triqs.build
cmake ../triqs-2.1.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DBuild_Tests=OFF

# compile
make -j$NCORES && make test && make install
cd ../

# ======================
# 4. installing DFTTools

# 下载源代码并解压
curl -Lo dft_tools-2.1.0.tar.gz https://github.com/TRIQS/dft_tools/archive/2.1.0.tar.gz
tar zxvf dft_tools-2.1.0.tar.gz

# 设置 Triqs 目录位置
TRIQS_PATH=$(pwd)/triqs

# 设置编译所用的核心数
NCORES=6

# 用 cmake 配置编译步骤
mkdir -p dft_tools.build && cd dft_tools.build
source $TRIQS_PATH/share/triqsvars.sh
cmake -DTRIQS_PATH=$TRIQS_PATH ../dft_tools-2.1.0

# 编译，测试和安装
make -j$NCORES && make test && make install
cd ../

# ======================
# 5. ALPS
# 
curl -Lo triqs-2.1.1.tar.gz https://github.com/TRIQS/triqs/archive/2.1.1.tar.gz
tar zxvf triqs-2.1.1.tar.gz

# 
INSTALL_PREFIX=$(pwd)/triqs

# 
NCORES=6

# 
mkdir -p triqs.build && cd triqs.build
cmake ../triqs-2.1.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# 
make -j$NCORES && make test && make install
cd ../

# ======================
# 6. CT-HYB

# 下载源代码并解压
curl -Lo ct-hyb-v1.0.3.tar.gz https://github.com/ALPSCore/CT-HYB/archive/v1.0.3.tar.gz
tar zxvf ct-hyb-v1.0.3.tar.gz

# 设置 ALPSCore 目录位置
ALPSCore_PATH=$(pwd)/ALPSCore/share/ALPSCore

# 设置 CT-HYB 安装位置
INSTALL_PREFIX=$(pwd)/CT-HYB

# 设置编译所用的核心数
NCORES=6

# 用 cmake 配置编译步骤
mkdir -p CT-HYB.build && cd CT-HYB.build
cmake -DALPSCore_DIR=$ALPSCore_PATH -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX ../CT-HYB-1.0.3

# 编译，测试和安装
make -j$NCORES && make test && make install
cd ../

# ======================
# 7. DCore

# 下载源代码并解压
curl -Lo dcore-v2.0.1.tar.gz https://github.com/issp-center-dev/DCore/archive/v2.0.1.tar.gz
tar zxvf dcore-v2.0.1.tar.gz

# 设置 DCore 安装目录
INSTALL_PREFIX=$(pwd)/install

# 设置 Triqs 目录位置
TRIQS_PATH=$(pwd)/deps/triqs

# 用 cmake 配置编译步骤
mkdir -p build && cd build
source $TRIQS_PATH/share/triqsvars.sh
cmake -DTRIQS_PATH=$TRIQS_PATH ../DCore-2.0.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# 编译，测试和安装
make && make test && make install
cd ../