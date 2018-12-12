module Main (main) where

import JsonUtil.SimpleJSON
import JsonUtil.PutJSON (putJValue)

main = do
  putJValue $ JString "a"
  putJValue $ JBool True
