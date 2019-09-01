
build:
	nix-build -A hello-world ./nix/monorepo.nix

run:
	nix-shell \
		-p '((import ./nix/release.nix).haskellPackages.hello-world)' \
		--command hello-world-exe
