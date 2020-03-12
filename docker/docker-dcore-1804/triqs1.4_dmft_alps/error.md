```
make -f CMakeFiles/alpscore_cthyb.dir/build.make CMakeFiles/alpscore_cthyb.dir/build
make[2]: Entering directory '/home/testuser/build/alps_cthyb'
[  4%] Building CXX object CMakeFiles/alpscore_cthyb.dir/src/solver_real.cpp.o
/usr/bin/c++  -DUSE_QUAD_PRECISION -Dalpscore_cthyb_EXPORTS -I/home/testuser/build/alps_cthyb -I/home/testuser/src/CT-HYB -isystem /usr/lib/x86_64-linux-gnu/openmpi/include/openmpi -isystem /usr/lib/x86_64-linux-gnu/openmpi/include/openmpi/opal/mca/event/libevent2022/libevent -isystem /usr/lib/x86_64-linux-gnu/openmpi/include/openmpi/opal/mca/event/libevent2022/libevent/include -isystem /usr/lib/x86_64-linux-gnu/openmpi/include -I/home/testuser/src/CT-HYB/include -I/home/testuser/src/CT-HYB/test -isystem /home/testuser/opt/ALPSCore/deps/eigen -isystem /home/testuser/opt/ALPSCore/include -isystem /usr/include/hdf5/serial  -std=c++11;-pthread -O3 -DNDEBUG -DBOOST_DISABLE_ASSERTS -DNDEBUG -fPIC   -o CMakeFiles/alpscore_cthyb.dir/src/solver_real.cpp.o -c /home/testuser/src/CT-HYB/src/solver_real.cpp
c++: fatal error: no input files
compilation terminated.
/bin/sh: 1: -pthread: not found
CMakeFiles/alpscore_cthyb.dir/build.make:65: recipe for target 'CMakeFiles/alpscore_cthyb.dir/src/solver_real.cpp.o' failed
make[2]: *** [CMakeFiles/alpscore_cthyb.dir/src/solver_real.cpp.o] Error 127
make[2]: Leaving directory '/home/testuser/build/alps_cthyb'
CMakeFiles/Makefile2:107: recipe for target 'CMakeFiles/alpscore_cthyb.dir/all' failed
make[1]: *** [CMakeFiles/alpscore_cthyb.dir/all] Error 2
make[1]: Leaving directory '/home/testuser/build/alps_cthyb'
Makefile:143: recipe for target 'all' failed
make: *** [all] Error 2
```

see <https://github.com/ALPSCore/CT-HYB/issues/14> there mem is not enough, here must use mpicompiler