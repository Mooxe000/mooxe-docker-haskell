#
ImageName := mooxe/nix-haskell

build:
	docker build \
		--build-arg http_proxy=$${http_proxy} \
		--build-arg HTTP_PROXY=$${http_proxy} \
		--build-arg https_proxy=$${https_proxy} \
		--build-arg HTTPS_PROXY=$${https_proxy} \
		-t $(ImageName) .

rebuild:
	docker build \
		--no-cache \
		--build-arg http_proxy=$${http_proxy} \
		--build-arg HTTP_PROXY=$${http_proxy} \
		--build-arg https_proxy=$${https_proxy} \
		--build-arg HTTPS_PROXY=$${https_proxy} \
		-t $(ImageName) .

publish:
	docker push ${ImageName}

docker:
	docker run --rm \
		-e http_proxy=$${http_proxy} \
		-e HTTP_PROXY=$${http_proxy} \
		-e https_proxy=$${https_proxy} \
		-e HTTPS_PROXY=$${https_proxy} \
		-ti ${ImageName} /usr/bin/env bash
