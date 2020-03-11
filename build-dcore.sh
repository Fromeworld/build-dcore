#!/bin/bash

# build

echo "start"

mkdir -p deps && cd deps

echo "installing from ppa and pip"

exec  ./install_deps.sh

echo "installing triqs"

exec  ./install_triqs.sh

echo "installing DFTTools"

exec  ./install_DFTTools.sh

echo "installing ALPSCore"

exec  ./install_ALPSCore.sh

echo "installing CT-HYB"

exec  ./install_CT-HYB.sh

echo "DCore"

exec  ./install_DCore.sh

echo "done"