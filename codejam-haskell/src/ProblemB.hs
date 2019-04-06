module ProblemB where

flipOne '+' = '-'
flipOne '-' = '+'

flipPancakes = reverse . map flipOne

happy = (== '+')

solve moves xs =
  if null xs' then moves else solve (moves + 1) (flipPancakes xs')
  where xs' = dropWhile happy . reverse $ xs

solveString xs = show $ solve 0 xs

-- reverse
-- drop all +, (moves = 0)
-- if empty?

prefixes = [ "Case #" ++ show n ++ ": " | n <- [1..]]

main = do
  cases <- fmap (tail . lines) getContents
  let answers = map solveString cases
  putStr . unlines $ zipWith (++) prefixes answers
