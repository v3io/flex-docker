REPOSITORY ?= iguaziodocker/
VERSION ?= 1.0.0

.PHONY: build
build:
	docker build --tag flex-docker:unstable .

.PHONY: release
release: build
	docker tag flex-docker:unstable $(REPOSITORY)flex-docker:$(VERSION)
