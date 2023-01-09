module Main where

-- Depth-First Traversal
-- Predictive Parsing

-- Simple Infix to Postfix Translator
{- Specs:
 - expr -> expr + term { print '+' }
 - expr -> expr - term { print '-' }
 - expr -> term
 - term -> 0           { print '0' }
 - ...
 - term -> 9           { print '9' }
-}

lookahead = undefined

expr :: IO ()
expr = do 
    term 
    forever $ do
        case lookahead of
            '+' -> do
                match '+'
                term
                print '+'
            '-' -> do
                match '-'
                term
                print '-'
            _ -> pure ()

rest :: IO ()
rest 
    | lookahead == '+' = do
        match '+'
        term
        print '+'
        rest' lookahead
    | lookahead == '-' 
        match '-'
        term
        print '-'
        rest' lookahead
    | otherwise = pure ()
    where 
        rest' '+' = do
            match '+'
            term
            print '+'
            rest
        rest' '-' = do
            match '-'
            term
            print '-'
            rest 


term :: IO ()
term
    | isDigit lookahead = do
        print lookahead
        match lookahead
    | otherwise = errorCall

errorCall :: IO ()
errorCall = undefined

main :: IO ()
main = putStrLn "hello "
