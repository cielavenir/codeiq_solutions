import Data.Char
import Data.List
main = putStr $ intercalate "" $ map (\i -> map (\x -> chr (x+i)) [97,65,12354,12450,12450,12354,65,97]) [0..25]