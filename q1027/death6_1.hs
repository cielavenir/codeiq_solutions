import Data.List
main=putStr$intercalate":"$map show$filter(\i->all(\j->(mod i j)>0)[2..i-1])[2..999]