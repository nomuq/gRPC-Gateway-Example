#!/bin/sh

# check if protoc is installed
if ! which protoc > /dev/null; then
  echo "Protobuf compiler not found in PATH."
fi

# Update PATH so that the protoc compiler can find the plugins
export PATH="$PATH:$(go env GOPATH)/bin"

# check if protoc-gen-go is installed
if ! which protoc-gen-go > /dev/null; then
  echo "Protobuf Go compiler not found in PATH."
  echo "Installing it..."
  go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
  go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway
  go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2
fi

# if ! which buf > /dev/null; then
#   echo "Buf not found in PATH."
#   echo "Using Docker"
#   docker run --volume "$(pwd):/workspace" --workdir /workspace bufbuild/buf generate
# fi
  
buf generate