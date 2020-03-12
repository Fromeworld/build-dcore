# Shell script for building DCore

Copy paste a blog (google searched) see: <https://hehome.xyz/archives/807/>

Shell script for building DCore (DMFT software for CORrelated Electrons) <https://github.com/issp-center-dev/DCore>

## Usage

```bash
git clone https://github.com/Fromeworld/build-dcore.git
cd build-dcore
bash build-dcore-all.sh
```

## TODO

[x] remove tarballs
[x] install file outside of the git folder
[x] remove build folders
[x] source dcore
[x] Hubbard-I not found
[x] use docker
[ ] add https://github.com/aeantipov/pomerol and https://github.com/j-otsuki/pomerol2dcore/blob/master/CMakeLists.txt


## ALPS

To build alps it may need a lot mem. It give a error
``` 
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-7/README.Bugs> for instructions.
accumulators/CMakeFiles/alps-accumulators.dir/build.make:158: recipe for target 'accumulators/CMakeFiles/alps-accumulators.dir/src/wrapper_set_hdf5.cpp.o' failed
make[2]: *** [accumulators/CMakeFiles/alps-accumulators.dir/src/wrapper_set_hdf5.cpp.o] Error 4
make[2]: *** Waiting for unfinished jobs....
```