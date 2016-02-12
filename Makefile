.PHONY: clean deps test docker

EXECUTABLE ?= gceme
IMAGE ?= gceme
CI_BUILD_NUMBER ?= 0

LDFLAGS = -X "main.buildDate=$(shell date -u '+%Y-%m-%d %H:%M:%S %Z')"

clean:
	go clean -i

deps:
	go get -d -v

test:
	go test

docker: build
	docker build --rm -t $(IMAGE) .

$(EXECUTABLE): $(wildcard *.go)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $@ -ldflags '-s -w $(LDFLAGS)'

build: $(EXECUTABLE)
