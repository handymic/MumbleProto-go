export GOPATH = $(shell pwd)
export PATH := $(GOPATH)/bin:$(PATH)

all: Mumble.pb.go

Mumble.pb.go: Mumble.proto
	protoc --go_out=. $<

Mumble.proto:
	curl https://raw.githubusercontent.com/mumble-voip/mumble/master/src/$@ > $@

setup:
	go get -u code.google.com/p/goprotobuf/{proto,protoc-gen-go}

.PHONY: Mumble.proto Mumble.pb.go
