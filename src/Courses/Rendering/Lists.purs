module Rendering.Lists where

import Prelude

import Halogen.HTML as HH
import Types.Global (SttcComponent)

items :: Array String
items = [ "Items 1", "Items 2" ]

make :: ∀ props act. SttcComponent props act
make =
  HH.ul_ $
    map
      ( \s ->
          HH.li_
            [ HH.text s ]
      )
      items