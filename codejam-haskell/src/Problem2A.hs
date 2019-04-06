module Problem2A where

import Data.List
import qualified Data.Map as Map

frequencies s = map (\x->([head x], length x)) . group . sort $ s

words = [("ZERO", 0), ("ONE", 1), ("TWO", 2), ("THREE", 3), ("FOUR", 4), ("FIVE", 5), ("SIX",6), ("SEVEN",7), ("EIGHT", 8), ("NINE", 9)]

count acc m l = case Map.lookup l m of
  Just v -> (take (count v) (repeat d)) ++ acc
  Nothing -> acc

f xs = foldl
  let freq = Map.fromList $ frequencies xs


solve xs = foldl f "" xs

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

main = do
  cases <- fmap (tail . lines) getContents
  let answers = map solve cases
  putStr . unlines $ zipWith (++) prefixes answers
