#!/usr/bin/env runghc
-- {-# LANGUAGE OverloadedStrings #-}

-- import Shelly
pps :: [ String ] -> String
pps (x:xs) = x ++ pps xs
pps [] = ""

-- main :: IO ()
main = do
  print $
    pps [
      "Hello"
    , " "
    , "World"
    , "!!!"
    ]
