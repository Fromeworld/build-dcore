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