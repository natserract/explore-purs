-- | Docs: @see https://github.com/purescript/documentation/blob/master/language/Syntax.md
-- You can write any way
module Components.IntroPurs where

import Prelude

import Halogen.HTML as HH
import IntroPurs.Children as Children
import IntroPurs.WhereAndLet (exampleLet, exampleWhere)

make :: ∀ props act. HH.HTML props act
make =
  let
    -- Variable declaration
    name :: String
    name = "John"

    -- | Property Accessors
    properties :: { first :: String, last :: String }
    properties =
      { first: exampleLet.firstName
      , last: exampleWhere.lastName
      }

    -- Function declaration
    -- Same with: (\x -> x <> " Str") x
    fmt :: String -> String
    fmt x = x <> " Str"
  in
    HH.div_
      [ HH.span_
          [ HH.text $ name <> fmt ("Read")
          , HH.text $ properties.first <> properties.last -- Access record props
          ]
      , Children.make innerComponent
      ]

innerComponent :: ∀ props act. HH.HTML props act
innerComponent =
  HH.span_ [ HH.text "I'm a children" ]