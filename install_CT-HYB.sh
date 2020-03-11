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