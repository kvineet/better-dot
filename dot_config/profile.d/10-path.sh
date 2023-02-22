#!/usr/bin/env sh

# Set .local/bin path

if [ -d "/home/kvineet/.local/bin" ]; then
	PATH=$PATH:"/home/kvineet/.local/bin"
fi

# Set gopath bin
if [[ -v GOPATH ]]; then
	PATH=$PATH:"$GOPATH/bin"
elif command -v go &> /dev/null; then
	PATH=$PATH:"$(go env GOPATH)/bin"
fi

