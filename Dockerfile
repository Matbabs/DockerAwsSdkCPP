FROM ubuntu:18.04

# install dependencies
RUN apt-get update
RUN apt-get install git zip wget cmake g++ zlib1g-dev libssl-dev libcurl4-openssl-dev ninja-build -y

# build aws cpp sdk
RUN mkdir install
RUN git clone https://github.com/aws/aws-sdk-cpp.git
WORKDIR aws-sdk-cpp
RUN git checkout main
RUN git pull origin main
RUN git submodule update --init --recursive
RUN mkdir build
WORKDIR build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/install
RUN make
RUN make install
WORKDIR /

# build the custom runtime
RUN git clone https://github.com/awslabs/aws-lambda-cpp-runtime.git
WORKDIR aws-lambda-cpp-runtime
RUN mkdir build
WORKDIR build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=/install
RUN make 
RUN make install
WORKDIR /
