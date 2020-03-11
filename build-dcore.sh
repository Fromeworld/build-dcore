#!/bin/bash

# build

echo "start"

mkdir -p deps && cd deps

echo "installing from ppa and pip"

../install_deps.sh

echo "installing triqs"

../install_triqs.sh

echo "installing DFTTools"

../install_DFTTools.sh

echo "installing ALPSCore"

../install_ALPSCore.sh

echo "installing CT-HYB"

../install_CT-HYB.sh

echo "DCore"

../install_DCore.sh

echo "done"