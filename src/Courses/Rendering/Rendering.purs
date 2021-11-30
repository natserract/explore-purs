-- | Docs: @see https://github.com/purescript/documentation/blob/master/language/Syntax.md
-- You can write any way
module Courses.Rendering where

import Prelude

import Halogen.HTML as HH
import Rendering.Children as Children
import Rendering.Conditional as Conditional
import Rendering.Lists as Lists
import Rendering.WhereAndLet (exampleLet, exampleWhere)
import Types.Global (SttcComponent)

make :: ∀ props act. SttcComponent props act
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
    -- Same with: (\x → x) x
    fmt :: String → String
    fmt x = show x
  in
    HH.div_
      [ HH.span_
          [ HH.text $ name <> fmt ("Read")
          , HH.text $ properties.first <> properties.last -- Access record props
          ]
      , Children.make innerComponent
      , Lists.make
      , Conditional.make true
      ]

innerComponent :: ∀ props act. SttcComponent props act
innerComponent =
  HH.span_ [ HH.text "I'm a children" ]