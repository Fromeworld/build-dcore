FROM fromeworld/triqs1.4_dmft

# Clone and build ALPSCore
WORKDIR $HOME/src
RUN git clone -b master --single-branch https://github.com/ALPSCore/ALPSCore.git \
 && mkdir $HOME/build/ALPSCore
WORKDIR $HOME/build/ALPSCore
RUN cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_INSTALL_PREFIX=$HOME/opt/ALPSCore -DDocumentation=OFF -DTesting=OFF -DALPS_INSTALL_EIGEN=true -DALPS_CXX_STD=custom $HOME/src/ALPSCore
RUN make -j 2 \
&& make install \
&& make clean

# Clone and build ALPS/CT-HYB
WORKDIR $HOME/src
RUN git clone -b master --single-branch https://github.com/ALPSCore/CT-HYB.git \
&& mkdir $HOME/build/alps_cthyb
WORKDIR $HOME/build/alps_cthyb
# You must use a MPI C++ compiler. 
RUN cmake -DCMAKE_CXX_COMPILER=/usr/bin/mpic++ -DALPSCore_DIR=$HOME/opt/ALPSCore/share/ALPSCore -DCMAKE_VERBOSE_MAKEFILE=ON  -DCMAKE_INSTALL_PREFIX=$HOME/opt/alps_cthyb -DCMAKE_CXX_FLAGS="-std=c++11" $HOME/src/CT-HYB 
RUN make\
 && make install \
 && make test \
 && make clean

ENV ALPSCore_DIR="$HOME/opt/ALPSCore"
# Clone and build pytriqs interface of ALPS/CT-HYB
WORKDIR $HOME/src
RUN git clone -b master --single-branch https://github.com/shinaoka/triqs_interface.git && mkdir $HOME/build/triqs_interface
WORKDIR $HOME/build/triqs_interface
ENV ALPSCoreCTHYB_DIR="$HOME/opt/alps_cthyb"
RUN cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DTRIQS_PATH=$HOME/opt/triqs $HOME/src/triqs_interface \
 && make -j 2 install \
 && make test \
 && make clean
