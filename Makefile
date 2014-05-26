export GOPATH = $(shell pwd)
export PATH := $(GOPATH)/bin:$(PATH)

all: compile

compile: setup
	protoc --go_out=. *.proto

setup:
	go get -u code.google.com/p/goprotobuf/{proto,protoc-gen-go}
