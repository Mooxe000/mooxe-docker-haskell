#!/usr/bin/env nix-runghc
#! ghc=865

{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports    #-}

module Main where

  import Data.Text as T
  import Data.Monoid ((<>))
  
  import "turtle" Turtle
  import "turtle" Turtle.Line (unsafeTextToLine)
  
  main :: IO ()
  main =  do
    echo
      $ unsafeTextToLine . T.pack
      $ "Hello" <> " " <> "Haskell" <> "!!!"
