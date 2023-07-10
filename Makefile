BIN_NAME=server
GITHASH=$(shell git rev-parse --short=7 -1 HEAD)
REGISTRY=juner/echoapps

build:
	GOARCH=amd64 GOOS=linux go build -ldflags "-X main.GitCommit=${GITHASH}" -o bin/${BIN_NAME}-linux server.go

run:
	go run server.go

container:
	docker build -t ${REGISTRY}:${GITHASH} .
	docker push ${REGISTRY}:${GITHASH}

clean:
	go clean
	rm -f bin/*

all: build container
