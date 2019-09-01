in:
	docker run --rm -ti \
		--name=haskell \
		-p 3000:3000 \
		-v $$(pwd):/root/haskell \
			mooxe/nix-haskell /usr/bin/env bash

# --add-host github.com:192.30.253.112 \
# --add-host gist.github.com:192.30.253.118 \
# --add-host assets-cdn.github.com:151.101.112.133 \
# --add-host raw.githubusercontent.com:151.101.184.133 \
# --add-host gist.githubusercontent.com:151.101.112.133 \
# --add-host cloud.githubusercontent.com:151.101.184.133 \
# --add-host camo.githubusercontent.com:151.101.112.133 \
# --add-host avatars0.githubusercontent.com:151.101.112.133 \
# --add-host avatars1.githubusercontent.com:151.101.112.133 \
# --add-host avatars2.githubusercontent.com:151.101.184.133 \
# --add-host avatars3.githubusercontent.com:151.101.12.133 \
# --add-host avatars4.githubusercontent.com:151.101.12.133 \
# --add-host avatars5.githubusercontent.com:151.101.184.133 \
# --add-host avatars6.githubusercontent.com:151.101.184.133 \
# --add-host avatars7.githubusercontent.com:151.101.184.133 \
# --add-host avatars8.githubusercontent.com:151.101.12.133 \
