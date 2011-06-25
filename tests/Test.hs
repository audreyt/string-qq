{-# LANGUAGE QuasiQuotes, ExtendedDefaultRules #-}

module Main where

import Data.Text
import Data.String.QQ
import Test.HUnit

test0 = assertBool "" ([s||] == "")
test1 = assertBool "" ([s|1|] == "1")
test2 = assertBool "" ([s|2|] == pack "2")
test0' = assertBool "" ([s|
|] == "")
test1' = assertBool "" ([s|
1|] == "1")
test2' = assertBool "" ([s|
2|] == pack "2")

tests = TestList
    [ TestLabel "Empty String" $ TestCase test0
    , TestLabel "String instance" $ TestCase test1
    , TestLabel "Text instance" $ TestCase test2
    , TestLabel "Empty String with trimmed leading newline" $ TestCase test0'
    , TestLabel "String instance with trimmed leading newline" $ TestCase test1'
    , TestLabel "Text instance with trimmed leading newline" $ TestCase test2'
    ]

main = runTestTT tests

