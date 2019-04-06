module ProblemC where

import Data.Maybe (isNothing, fromJust, isJust)

base [] n = 0
base (x:xs) n = x*n^(length xs) + (base xs n)

chrToBin '1' = 1
chrToBin '0' = 0

binToChr 1 = '1'
binToChr 0 = '0'

-- nonTrivialDivisor :: Int -> Maybe Int
nonTrivialDivisor n = if null nonTrivialDivisors then Nothing else Just (head nonTrivialDivisors)
  where threshold = ceiling . sqrt . fromInteger $ n
        nonTrivialDivisors = [x | x <- [2..threshold], n `mod` x == 0]

-- test :: [Int] -> Maybe [Int]
test input =
  if any isNothing ks then Nothing else Just (map fromJust ks)
  where ks = map nonTrivialDivisor . map (base input) $ [2..10]

cartesianProduct :: [[a]] -> [[a]]
cartesianProduct [] = [[]]
cartesianProduct (list:lists)
  = [ (x:xs) | x <- list, xs <- cartesianProduct lists ]

generateTests size = [ [1] ++ xs ++ [1] | xs <- cartesianProduct (replicate (size - 2) [0,1]) ]

solve n j = take j answers
  where answers = [ (testCase, fromJust (test testCase)) | testCase <- generateTests n, isJust (test testCase) ]

formatAnswer (jamcoin, ks) = concat (map show jamcoin) ++ " " ++ unwords (map show ks)

-- large set, just find from oposite
-- find the factors, and multiply then



main = do
  putStrLn "Case #1:"
  putStr . unlines $ map show $ take 10 [b2*b3*b4*b5*b6*b7*b8*b9*b10 | b2 <- [2,4..], b3 <- [3,6..], b4 <- [4,8..], b5 <- [5,10..], b6 <- [6,12..], b7 <- [7,14..], b8 <- [8,16..], b9 <- [9,18..], b10 <- [10,20..]]
  -- putStr . unlines $ map formatAnswer (solve 32 500)
