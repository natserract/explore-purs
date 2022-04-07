module Courses.Conditional
  ( ifelse
  , caseof
  , guard
  , ternary
  , (?)
  ) where

import Prelude

import Data.String (null, toUpper)

-- | If Else
ifelse :: ∀ t. Eq t => t → t → String
ifelse x y =
  if x == y then show "True"
  else "False"

-- | Case of
caseof :: ∀ t. Eq t => Boolean → String
caseof l = case l of
  true → show $ toUpper "Welcome"
  _ → show $ toUpper "Please logged in!"

-- | Guard guard
guard :: ∀ t. Eq t => String → String
guard s
  | s == "1" = show "Next!"
  | null s = show "Stop!"
  | otherwise = show "Not Found"

-- | Ternary condition
-- | From: https://github.com/purescripters/purescript-conditional
-- | ```purescript
-- | implTernary a = a ? (show "True") $ (show "False")
-- | ```
-- 
ternary :: ∀ t. Boolean → t → t → t
ternary c a b = if (c) then a else b

infixl 1 ternary as ?