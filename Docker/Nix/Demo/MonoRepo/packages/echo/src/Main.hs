{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Text as T
import Data.Monoid ((<>))

import Turtle
import Turtle.Line (unsafeTextToLine)

main :: IO ()
main =  do
  echo
    $ unsafeTextToLine . T.pack
    $ "Hello" <> " " <> "Haskell" <> "!!!"
