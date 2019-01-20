import Data.Char
import System.Environment

main :: IO ()
main = do
  input <- getInput =<< getArgs
  putStrLn $ fullWidthifyText input

getInput :: [String] -> IO String
getInput args =
  if length args > 0 then
    pure $ unwords args
  else
    getContents

fullWidthifyText :: String -> String
fullWidthifyText =
  map (chr . convertChar . ord)

convertChar :: Int -> Int
convertChar ch
  | ch > 0x20 && ch < 0x7F = ch + 0xFEE0
  | ch == 0x20 = 0x3000
  | otherwise = ch
