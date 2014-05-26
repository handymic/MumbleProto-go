export GOPATH = $(shell pwd)
export PATH := $(GOPATH)/bin:$(PATH)

all: compile

compile: setup
	wget https://raw.githubusercontent.com/mumble-voip/mumble/master/src/Mumble.proto \
		-O Mumble.proto && protoc --go_out=. *.proto

setup:
	go get -u code.google.com/p/goprotobuf/{proto,protoc-gen-go}
