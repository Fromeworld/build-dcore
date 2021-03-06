#!/bin/bash

# 下载源代码并解压
curl -Lo triqs-2.1.1.tar.gz https://github.com/TRIQS/triqs/archive/2.1.1.tar.gz
tar zxvf triqs-2.1.1.tar.gz

# 设置安装目录
INSTALL_PREFIX=$(pwd)/triqs

# 设置编译所用的核心数
NCORES=6

# 用 cmake  disabled tests otherwise take forever (problem when 60% test/...bubble, 100% disk usage)
mkdir -p triqs.build && cd triqs.build
cmake ../triqs-2.1.1 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DBuild_Tests=OFF

# 编译，测试和安装
make -j$NCORES && make test && make install
cd ../