module Problem1B where

import Data.List
import Data.Bits
import Data.Int

-- square N x N
-- row soldiers height in order
-- col soldiers height in order

-- N = 3
-- 2*3 - 1 = 5 lines

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

a :: [[Int]]
a = [[1, 2, 3],
     [2, 3, 5],
     [3, 5, 6],
     [2, 3, 4],
     [1, 2, 3]]

f :: String -> [Int]
f s = map read $ words s

g :: [Int] -> Int
g = foldl setBit 0

parseCase (x:xs) = ((n,c), drop l xs)
  where n = read x :: Int
        l = 2 * n - 1
        c = map f . take l $ xs

solve (s,xs) = n -- take s $ filter (testBit n) [1..]
  where (y:ys) = map g xs
        n = foldl xor y ys

parseCases [] = []
parseCases xs = c : (parseCases r)
  where (c,r) = parseCase xs

-- solveString = unwords . map show . solve
solveString = show . solve

main = do
  ls <- fmap (tail . lines) getContents
  let cases = parseCases ls
  let (y:ys) = map g [[40,58,91,128],
                      [33,34,44,58],
                      [21,34,59,97],
                      [10,21,23,40],
                      [74,97,120,128],
                      [10,33,51,74],
                      [51,59,73,91]]
  let n = foldl xor y ys
  print $ popCount n
  let answers = map solveString cases

  putStr . unlines $ zipWith (++) prefixes answers
