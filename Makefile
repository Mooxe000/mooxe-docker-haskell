build:
	docker build -t mooxe/haskell .

rebuild:
	docker build --no-cache -t mooxe/haskell .

in:
	docker run --rm -ti \
		--name=haskell \
		-p 3030:3000 \
		-v $$(pwd):/root/haskell \
			mooxe/haskell /bin/bash

push:
	docker push mooxe/haskell
