module Rendering.WhereAndLet where

import Prelude

-- | Both let and where, you can choose and write any way
-- `let` expression
exampleLet :: { firstName :: String, lastName :: String }
exampleLet =
  let
    -- without type signatures (allowed)
    firstName = "First"

    -- with type signatures
    lastName :: String
    lastName = "Last"
  in
    { firstName
    , lastName
    }

-- `where` expression
exampleWhere :: { firstName :: String, lastName :: String }
exampleWhere =
  { firstName
  , lastName
  }
  where
  firstName :: String
  firstName = "First"

  lastName :: String
  lastName = "Last" <> nextName
    where
    nextName = "Mean" -- nested where expr