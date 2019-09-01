#
ImageName := mooxe/nix-haskell

build:
	docker build -t $(ImageName) .

rebuild:
	docker build --no-cache -t $(ImageName) .

publish:
	docker push ${ImageName}

docker:
	docker run --rm -ti ${ImageName} /usr/bin/env bash
