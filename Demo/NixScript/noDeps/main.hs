#!/usr/bin/env nix-runghc
#! ghc=865

-- curl https://raw.githubusercontent.com/jmackie/nix-runghc/master/nix-runghc > \
--   ~/.local/bin/nix-runghc
-- chmo +x ~/.local/bin/nix-runghc

import Data.Typeable

type B = String
type C = Int
type D = Bool

data Customer = Customer {
  b :: B
, c :: C
, d :: D
} deriving ( Typeable )

customer = Customer {
  b = "Hello"
, c = 32
, d = True
}

instance Show Customer where
  show customer = "custormer::" ++ ( show $ typeOf customer ) ++ " {\n"
    ++ "  b: " ++ ( show $ b customer ) ++ "\n"
    ++ "  c: " ++ ( show $ c customer ) ++ "\n"
    ++ "  d: " ++ ( show $ d customer ) ++ "\n"
    ++ "}" 

main = do
  putStrLn $ show customer
