module ProblemD where

import Control.Monad
import Data.List

f ks 1 = ks
-- f ks 2 = map (g ks) ks
f ks c = concatMap (g (f ks (c - 1))) ks

g ks 'L' = ks
g ks 'G' = map (const 'G') ks

run k c = do
  putStr . unlines $ map (flip f c) (replicateM k ['G', 'L'])


solve k c s =
  if k == s then
    [1..k]
  else
    []

--view (count, gs, pos, 'L') 'L' = (count, gs, pos+1, 'L')
view (count, gs, pos, 'G') 'L' = (count+1, (pos-1):gs, pos+1, 'L')
-- view (count, gs, pos, 'L') 'G' = (count, gs, pos+1, 'G')
--view (count, gs, pos, 'G') 'G' = (count, gs, pos+1, 'G')
view (count, gs, pos, _) k = (count, gs, pos+1, k)



main = do
  run 3 3
  print $ foldl view (0,[],1,'L') (f "LGLL" 4)
