module JsonUtil.Util where

pps :: [ String ] -> String
pps (x:xs) = x ++ pps xs
pps [] = ""
