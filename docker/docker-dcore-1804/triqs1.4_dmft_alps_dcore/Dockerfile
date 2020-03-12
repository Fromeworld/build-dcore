FROM fromeworld/triqs1.4_dmft_alps

# Clone and build DCORE
WORKDIR $HOME/src
RUN git clone https://github.com/issp-center-dev/DCore.git dcore.src \
    && mkdir $HOME/build/dcore.build
WORKDIR $HOME/build/dcore.build
RUN cmake -DTRIQS_PATH=$HOME/opt/triqs -DCMAKE_INSTALL_PREFIX=$HOME/opt/dcore $HOME/src/dcore.src \
 && make -j 2 install \
 && make test \
 && make clean
