FROM golang:1.7-alpine

MAINTAINER andy@andyspohn.com

RUN apk --no-cache add autoconf automake bash build-base curl gcc g++ git libtool libstdc++ libc6-compat

RUN git clone https://github.com/google/protobuf --depth 1 && \
	cd ./protobuf && \
	./autogen.sh && \
    ./configure --prefix=/usr && \
    make -j 8 && \
    make check && \
    make install && \
    cd .. && \
	rm -rf ./protobuf && \
	apk del build-base autoconf automake libtool gcc g++

RUN go get -u github.com/golang/protobuf/protoc-gen-go && \
	go get github.com/golang/protobuf/proto && \
	go get golang.org/x/net/context && \
	go get google.golang.org/grpc && \
	mv /go/bin/protoc-gen-go /usr/local/go/bin