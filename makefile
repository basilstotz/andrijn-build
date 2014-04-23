TARGETS = all build image publish
.PHONY: ${TARGETS}
.PHONY: help

help:
	@echo "Targets are:"
	@echo "   ${TARGETS}" | fmt

all: build image publish

build:
	@./bin/build.sh

image:
	@./bin/image.sh

publish:
	@./bin/publish.sh
