FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y make gcc g++ gcc-multilib g++-multilib cmake googletest
RUN mkdir -p /googletest/build /googletest/build-i386 && \
 cd /googletest/build && cmake /usr/src/googletest && make && make install && \
 cd /googletest/build-i386 && \
 cmake -DCMAKE_INSTALL_LIBDIR=/usr/local/lib32 -DCMAKE_CXX_FLAGS=-m32 -DBUILD_SHARED_LIBS=OFF /usr/src/googletest && \
 make && make install && cd / && rm -rf /googletest && \
 apt-get remove -y --purge cmake googletest && apt-get autoremove -y --purge && apt-get autoclean
