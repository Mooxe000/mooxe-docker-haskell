{-# LANGUAGE OverloadedStrings #-}

-- import qualified Data.Text as Text

import Data.Text as T
import Data.Monoid ((<>))

import Universe.World (world)
import Turtle
import Turtle.Line (unsafeTextToLine)

main :: IO ()
main =  do
  echo
    $ unsafeTextToLine . T.pack
    $ "Hello " <> world <> "!!!"
