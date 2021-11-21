module IntroPurs.WhereAndLet where

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
  lastName = "Last"