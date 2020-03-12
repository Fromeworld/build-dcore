FROM fromeworld/triqs1.4_dmft

# Clone and build DCORE
WORKDIR $HOME/src
RUN git clone https://github.com/issp-center-dev/DCore.git dcore.src && mkdir $HOME/build/dcore.build
WORKDIR $HOME/build/dcore.build
RUN cmake -DTRIQS_PATH=$HOME/opt/triqs $Home/src/dcore.src -DCMAKE_INSTALL_PREFIX=$HOME/opt/dcore \
 && make -j 2 install \
 && make test \
 && make clean
