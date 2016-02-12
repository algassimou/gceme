.PHONY: clean deps test docker

EXECUTABLE ?= gceme
IMAGE ?= gceme

clean:
	go clean -i

deps:
	go get -d -v

test:
	go test

docker: build
	docker build --rm -t $(IMAGE) .

$(EXECUTABLE): $(wildcard *.go)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $@

build: $(EXECUTABLE)
