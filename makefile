TARGETS = all build image publish
.PHONY: ${TARGETS}
.PHONY: help

help:
	@echo "Targets are:"
	@echo "   ${TARGETS}" | fmt

all: build image publish

build:
	@./build.sh

image:
	@./image.sh

publish:
	@./publish.sh
