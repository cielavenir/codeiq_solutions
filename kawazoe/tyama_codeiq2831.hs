#!/usr/bin/env runghc
import Data.List
c n = if (mod n 2)==0 then (c $ div n 2) else if (mod n 5)==0 then (c $ div n 5) else n
f n = foldl' (\s i -> s+(div n $ c i)) 0 [1..n]
main = readLn >>= print . f