#!/bin/bash

# build

echo "start"

mkdir -p deps && cd deps

echo "installing from ppa and pip"

sh ./install_deps.sh

echo "installing triqs"

sh ./install_triqs.sh

echo "installing DFTTools"

sh ./install_DFTTools.sh

echo "installing ALPSCore"

sh ./install_ALPSCore.sh

echo "installing CT-HYB"

sh ./install_CT-HYB.sh

echo "DCore"

sh ./install_DCore.sh

echo "done"