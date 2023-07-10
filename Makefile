BIN_NAME=server

build:
	GOARCH=amd64 GOOS=linux go build -o bin/${BIN_NAME}-linux server.go

run:
	go run server.go

container:
	docker build

clean:
	@rm -f bin/*
	go clean

all: build container
