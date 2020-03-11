#!/bin/bash

# build

echo "start"

echo "1. mkdir"

mkdir -p deps && cd deps

echo "2. installing from ppa and pip"

../install_deps.sh

echo "3. installing triqs"

../install_triqs.sh

echo "4. installing DFTTools"

../install_DFTTools.sh

echo "5. installing ALPSCore"

../install_ALPSCore.sh

echo "6. installing CT-HYB"

../install_CT-HYB.sh

echo "7. DCore"

../install_DCore.sh

echo "done"