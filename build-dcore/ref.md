# copy paste from

<https://hehome.xyz/archives/807/>

## 这样能显示测试时报错的输出
env CTEST_OUTPUT_ON_FAILURE=1 make test


在超算上安装
超算上因为没有 root 权限，所以缺少的库都需要自己去编译。并且要特别注意环境变量的设置，不然就没法找到对应的文件。

安装 Triqs 需要一下的库：

GMP
BLAS 和 LAPACK
FFTW
GMP
./configure --prefix=$HOME/hmy/build/DCore/deps/gmp --enable-cxx
make -j6 && make check && make install
添加环境变量

# GMP
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/gmp/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/gmp/include:$CPATH
OpenBLAS
make -j6
make install PREFIX=$HOME/hmy/build/DCore/deps/openblas
添加环境变量

# OpenBLAS
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/openblas/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/openblas/include:$CPATH
FFTW
./configure --enable-mpi --enable-shared --prefix=$HOME/hmy/build/DCore/deps/fftw
make -j6 && make check && make install
添加环境变量

# FFTW
export PATH=$HOME/hmy/build/DCore/deps/fftw/bin:$PATH
export LD_LIBRARY_PATH=$HOME/hmy/build/DCore/deps/fftw/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/hmy/build/DCore/deps/fftw/include:$CPATH