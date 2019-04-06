module Problem1A where

f m c = max (m++[c]) ([c]++m)

solve xs = foldl f "" xs

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

main = do
  cases <- fmap (tail . lines) getContents
  let answers = map solve cases
  putStr . unlines $ zipWith (++) prefixes answers
