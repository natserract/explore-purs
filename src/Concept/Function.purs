module Concept.Concept
  ( backwards
  , forwards
  , num
  , numFunc
  )
  where

import Prelude

import Data.Array (filter, head)
import Data.Maybe (Maybe)

-- This is quick concept of fp especially purescript and haskell, 
-- it's very important to understand!
--
-- resource from https://egghead.io/lessons/purescript-introduction-functional-programming-concepts-in-purescript

-- | # Specify Function Arguments
--
-- | Variable declaration 
num :: Int -- Type declaration
num = 2

-- | Function declaration
numFunc :: Int -> Int
numFunc = {- lambda -} \n -> n * 2

-- (<<<), In PureScript, the function composition operators are `<<<` and `>>>`
--- Semigroup ( a ⋅ b ) ⋅ c = a ⋅ ( b ⋅ c )
--- `<<<`: “backwards composition”
--- `>>>`: “forwards composition”
backwards ∷ Maybe Int
backwards = head <<< filter (\x -> x > 2) $ [1, 2, 3]

forwards ∷ Maybe Int
forwards =  filter (\x -> x > 2) >>> head $ [1, 2, 3]