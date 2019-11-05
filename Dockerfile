FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y make gcc g++ gcc-multilib g++-multilib cmake googletest
RUN mkdir -p /googletest/build /googletest/build-i386 && \
 cd /googletest/build && cmake /usr/src/googletest && make && make install && \
 cd /googletest/build-i386 && \
 cmake -DLIBRARY_OUTPUT_PATH=/usr/local/lib/i386-linux-gnu -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SHARED_LINKER_FLAGS=-m32 /usr/src/googletest && \
 make && cd / && rm -rf /googletest && \
 apt-get remove -y --purge cmake googletest && apt-get autoremove -y --purge && apt-get autoclean
