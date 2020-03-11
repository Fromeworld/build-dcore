#!/bin/bash

# build

echo "start"

mkdir -p deps && cd deps

echo "installing from ppa and pip"

bash install_deps.sh

echo "installing triqs"

bash install_triqs.sh

echo "installing DFTTools"

bash install_DFTTools.sh

echo "installing ALPSCore"

bash install_ALPSCore.sh

echo "installing CT-HYB"

bash install_CT-HYB.sh

echo "DCore"

bash install_DCore.sh

echo "done"