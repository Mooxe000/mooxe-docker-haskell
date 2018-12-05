#!/usr/bin/env runghc

main = do
  map dd [1..5]
  where dd n = do
    print $ show n ++ "\n"
