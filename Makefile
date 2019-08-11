in:
	docker run --rm -ti \
		--name=haskell \
		-p 3000:3000 \
		-v $$(pwd):/root/haskell \
			mooxe/haskell /bin/bash
