
cd ~/

git clone https://github.com/issp-center-dev/DCore.git dcore.src

mkdir dcore.build && cd dcore.build

cmake -DTRIQS_PATH=/home/testuser/opt/triqs ../dcore.src -DCMAKE_INSTALL_PREFIX=../dcore

make && make test && make install

cd ../

export PATH=$PATH:~/dcore/bin 


# 
# <https://hub.docker.com/r/shinaoka/triqs1.4_dmft_alps>

# ```
# docker pull shinaoka/triqs1.4_dmft_alps
# ```


# docker run -i -t --entrypoint /bin/bash shinaoka/triqs1.4_dmft_alps
