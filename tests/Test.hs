{-# LANGUAGE QuasiQuotes, ExtendedDefaultRules #-}

module Main where

import Data.Text
import Data.String.Quote
import Test.HUnit

data Foo = Foo Int String deriving Show

t1 = "字元"

test0 = assertBool "" ([s||] == "")
test1 = assertBool "" ([s|1|] == "1")
test2 = assertBool "" ([s|2|] == pack "1")

tests = TestList
    [ TestLabel "Empty String" $ TestCase test0
    , TestLabel "String instance" $ TestCase test1
    , TestLabel "Text instance" $ TestCase test2
    ]

main = runTestTT tests

