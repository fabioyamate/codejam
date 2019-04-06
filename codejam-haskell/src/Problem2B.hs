module Problem2B where

f = undefined

solve xs = foldl f "" xs

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

main = do
  cases <- fmap (tail . lines) getContents
  let answers = map solve cases
  putStr . unlines $ zipWith (++) prefixes answers
