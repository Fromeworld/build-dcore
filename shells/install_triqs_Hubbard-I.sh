#!/bin/bash

# 
git clone https://github.com/malte-schueler/triqs_hubbardI triqs_hubbardI.src

# triqs path
TRIQS_PATH=$(pwd)/triqs

# core number
NCORES=6

# cmake
mkdir -p triqs-hubbardI.build && cd triqs-hubbardI.build
source $TRIQS_PATH/share/triqsvars.sh
cmake ../triqs_hubbardI.src

# compile
make -j$NCORES && make test && make install
cd ../