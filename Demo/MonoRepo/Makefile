
build:
	nix-build -A TurtleEcho ./nix/monorepo.nix

run:
	nix-shell \
		-p '((import ./nix/release.nix).haskellPackages.TurtleEcho)' \
		--command TurtleEcho
