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