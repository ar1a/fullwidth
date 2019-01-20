import Data.Char

main :: IO ()
main = do
  input <- getContents
  putStrLn $ fullWidthifyText input

fullWidthifyText :: [Char] -> [Char]
fullWidthifyText =
  map (chr . convertChar . ord)

convertChar :: Int -> Int
convertChar ch
  | ch > 0x20 && ch < 0x7F = ch + 0xFEE0
  | ch == 0x20 = 0x3000
  | otherwise = ch
