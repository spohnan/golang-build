FROM golang:1.7-alpine

RUN apk --no-cache add bash git && \
	go get -a github.com/golang/protobuf/protoc-gen-go

