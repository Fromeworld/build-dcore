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