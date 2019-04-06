module Problem2C where

import Data.List
import qualified Data.Set as S
import Debug.Trace
import qualified Data.Map as Map
import qualified Data.Graph as G

bbb xs = foldl' f (S.empty, S.empty, 0) xs
  where f (fs, ss, fake) (x:y:xs) = if (S.member x fs && S.member y ss)
                                    then traceShow (x,y,"*",fake+1) $ (fs,ss,fake+1)
                                    else traceShow (x,y,"-",fake) $ (S.insert x fs, S.insert y ss, fake)

solve :: (Int, [[String]]) -> String
solve (n,xs) = show $ all*all - n - (length same)
  where ts = transpose xs
        firsts = (nub (ts !! 0))
        seconds = (nub (ts !! 1))
        all = length (nub (firsts ++ seconds))
        same = intersect firsts seconds

solve2 (n, xs) = if fakes > n then error "foo" else show fakes
  where (_, _, fakes) = bbb xs

parseCase (x:xs) = ((n,c), drop n xs)
  where n = read x :: Int
        c = map words . take n $ xs

parseCases [] = []
parseCases xs = c : (parseCases r)
  where (c,r) = parseCase xs

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

main = do
  ls <- fmap (tail . lines) getContents
  let cases = parseCases ls
  let answers = map solve2 cases
  putStr . unlines $ zipWith (++) prefixes answers
