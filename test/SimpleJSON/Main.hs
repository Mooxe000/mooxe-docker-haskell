-- file: ch05/Main.hs

module Main (main) where

import JsonUtil.SimpleJSON

result :: JValue
result = JObject [
    ( "query", JString "awkward squad haskell" )
  , ( "estimatedCount", JNumber 3920 )
  , ( "moreResults", JBool True )
  , ( "results", JArray [
        JObject [
          ("title", JString "Simon Peyton Jones: papers")
        , ("snippet", JString "Tackling the awkward ...")
        , ("url", JString "http://.../marktoberdorf/")
        ]
      ]
    )
  ]

main = do
  print $ JObject [
    ( "foo", JNumber 1 )
  , ( "bar", JBool False )
  ]
  print $ result
