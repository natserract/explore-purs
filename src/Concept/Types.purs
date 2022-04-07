module Concept.Types
  ( arrayStringTpe
  , boolType
  , charType
  , fx
  , numberType
  , personIdentityFn
  , quantified
  , recordType
  , stringType
  )
  where

import Prelude

import Data.Array (length)

-- |# Simple types
numberType ∷ Int
numberType = 10

stringType :: String
stringType = "String"

boolType :: Boolean
boolType = true

charType :: Char
charType = 'A'

-- Array must homogeneous (same)
arrayStringTpe :: Array String
arrayStringTpe = ["Hello", "World"]

recordType :: Record (name:: String, age:: Int) 
recordType = {
  name : "",
  age : 2
}

-- Defining record type
type PersonIdentity = 
  { name:: String
  , age:: Int
  , address:: String
  }
personIdentityFn :: PersonIdentity
personIdentityFn = {
  name: "Name",
  age: 22,
  address: "New york city"
}

-- |# Quantified types

-- Similar with ($)
-- Teory: fx have argument function, which that's function has argument `a`
-- And the return type according with argument `b`
-- 
-- fx(f) -> fx(length([1, 2, 3]))
-- Example:
-- `exampleFx = fx length [1, 2, 3]`
fx :: forall a b. (a -> b) -> a -> b
fx f x = f x

quantified :: forall a b c. (a -> b -> c) -> b -> a -> c
quantified f b a = f a b

-- |# Type Constructor and Kinds
data Null