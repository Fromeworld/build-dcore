编译 DCore
作者: uy_sun 时间: 2019-09-17 12:17 am 分类: 计算物理
这段时间一直没怎么写关于科学计算的文章，一方面是懒，第二方面是因为没做出什么东西（也是懒）。现在要监督自己，去写点学到的知识和理解。

最近老师让我去了解一下 DMFT 方法，并尝试利用这个方法计算一下 VO_2VO 
2
​	
  体系。

这个方法的理论，有点难度，就先讲讲软件吧。这个软件是用 Python 写的，最近更新了 2.0 版本。这里来记录一下软件的安装过程，以免自己遗忘。

软件的 GitHub 主页：地址

依赖
根据 教程，我们先来整理一下这个软件的依赖，看看需要哪些东西才能开始编译。

首先我们需要安装 TRIQS 和 DFTTools/TRIQS。
接着需要一个杂质求解器，我选择了 ALPS/CT-HYB。因为 DCore 在开发的时候就用的这个。
安装
让我们先创建一个新的文件夹来存放各种依赖。

mkdir -p deps && cd deps
接着就可以开始安装各种依赖。

TRIQS
首先需要安装编译它所需要的依赖

sudo apt-get install cmake g++ gfortran git hdf5-tools \
     libblas-dev libboost-all-dev libfftw3-dev libgfortran3 \
     libhdf5-serial-dev libgmp-dev liblapack-dev libopenmpi-dev \
     python-dev python-h5py python-jinja2 python-mako python-matplotlib \
     python-mpi4py python-numpy python-scipy python-tornado python-zmq
在 deps 文件夹内创建 install_triqs.sh 文件，并填入以下内容。

#!/bin/bash

# 下载源代码并解压
curl -Lo triqs-2.1.1.tar.gz https://github.com/TRIQS/triqs/archive/2.1.1.tar.gz
tar zxvf triqs-2.1.1.tar.gz

# 设置安装目录
INSTALL_PREFIX=$(pwd)/triqs

# 设置编译所用的核心数
NCORES=6

# 用 cmake 配置编译步骤
mkdir -p triqs.build && cd triqs.build
cmake ../triqs-2.1.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# 编译，测试和安装
make -j$NCORES && make test && make install
cd ../
运行此脚本即可完成 triqs 的安装。

DFTTools/TRIQS
同样的，创建一个 install_DFTTools.sh 文件，填入以下内容，并运行。

#!/bin/bash

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
ALPSCore
在安装 CT-HYB 之前需要先安装 ALPSCore。

同上，创建一个 install_ALPSCore.sh 文件，填入以下内容，并运行。

#!/bin/bash

# 下载源代码并解压
curl -Lo alpscore-v2.2.0.tar.gz https://github.com/ALPSCore/ALPSCore/archive/v2.2.0.tar.gz
tar zxvf alpscore-v2.2.0.tar.gz

# 设置 ALPSCore 安装位置
INSTALL_PREFIX=$(pwd)/ALPSCore

# 设置编译所用的核心数
NCORES=6

# 用 cmake 配置编译步骤
mkdir -p ALPSCore.build && cd ALPSCore.build
cmake ../ALPSCore-2.2.0 -DALPS_INSTALL_EIGEN=yes -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

# 编译，测试和安装
make -j$NCORES && make test && make install
cd ../
ALPS/CT-HYB
接下来就可以安装杂质求解器，创建一个 install_CT-HYB.sh 文件，之后同上:joy:。

#!/bin/bash

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
DCore
准备工作都搞定了，正式开始编译 DCore。

创建一个 install_DCore.sh 文件。

#!/bin/bash

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
在编译完成之后，测试的过程中也许你会发现 Dcore 自带的 11 个测试全部都失败了。这是因为你的 Python 缺少了 enum 这个包。

pip install enum34
安装之后一切就将恢复正常。

恭喜你，到此就完成了整个软件的编译。

一些技巧
在编译完成之后的测试中

# 这样能显示测试时报错的输出
env CTEST_OUTPUT_ON_FAILURE=1 make test
在超算上安装
超算上因为没有 root 权限，所以缺少的库都需要自己去编译。并且要特别注意环境变量的设置，不然就没法找到对应的文件。

安装 Triqs 需要一下的库：

GMP
BLAS 和 LAPACK
FFTW
GMP
./configure --prefix=$HOME/hmy/build/DCore/deps/gmp --enable-cxx
make -j6 && make check && make install
添加环境变量

# GMP
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/gmp/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/gmp/include:$CPATH
OpenBLAS
make -j6
make install PREFIX=$HOME/hmy/build/DCore/deps/openblas
添加环境变量

# OpenBLAS
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/openblas/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/openblas/include:$CPATH
FFTW
./configure --enable-mpi --enable-shared --prefix=$HOME/hmy/build/DCore/deps/fftw
make -j6 && make check && make install
添加环境变量

# FFTW
export PATH=$HOME/hmy/build/DCore/deps/fftw/bin:$PATH
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/fftw/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/fftw/include:$CPATH
