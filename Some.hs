module Some where


import Control.Monad
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    expr $ head args

expr str = forever $ do
    case (head str) of
       '+' -> print '+'
       '-' -> print '-'
       _   -> pure ()
