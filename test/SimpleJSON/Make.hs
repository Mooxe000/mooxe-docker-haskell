#!/usr/bin/env runghc
{-# LANGUAGE OverloadedStrings #-}

import Shelly

main :: IO ()
main = shelly $ do

  run_ "runghc" [
      "-i../../src"
    , "./Main.hs"
    ]
