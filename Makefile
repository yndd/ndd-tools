BIN_DIR = $(shell pwd)/bin
BINARY = $(shell pwd)/bin/ndd-gen

all: build

build: ## Build binaries: ndd-gen
	mkdir -p $(BIN_DIR)
	go build -o $(BINARY) ./cmd/ndd-gen/main.go 

fmt: ## Run go fmt against code.
	go fmt ./...

vet: ## Run go vet against code.
	go vet ./...

test:
	go test -race ./... -v

lint:
	golangci-lint run

clint:
	docker run -it --rm -v $$(pwd):/app -w /app golangci/golangci-lint:v1.40.1 golangci-lint run -v
