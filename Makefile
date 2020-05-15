SHELL:=$(PREFIX)/bin/sh
TAG?=$(shell git describe --tags)
VERSION:=$(shell npx semver $(TAG))

rebuild: clean | build

build: \
	pub/version.txt \
	pub/openapi.yaml \
	pub/openapi.json \

clean:
	rm -rf pub

pub/version.txt:
	@mkdir --parents $(@D)
	echo $(VERSION) > $@

pub/openapi.yaml: src/openapi.yaml
	@mkdir --parents $(@D)
	sed 's/0.0.0-local/$(VERSION)/' $< > $@

pub/openapi.json: pub/openapi.yaml
	@mkdir --parents $(@D)
	npx js-yaml $< > $@

.PHONY: \
	clean \
	build \
	rebuild \
