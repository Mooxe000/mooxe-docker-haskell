#!/usr/bin/env bash

nix-shell -p '((import ./nix/release.nix).haskellPackages.hello-world)' \
  --command hello-world-exe
