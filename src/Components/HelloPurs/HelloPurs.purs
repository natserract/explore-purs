module Components.HelloPurs where

import Prelude

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Utils.HTML (className)

make :: ∀ props act. HH.HTML props act
make =
  ( HH.div_
      [ HH.div
          [ className "container" ]
          [ HH.h1
              [ HP.classes $ [ HH.ClassName "class-1", HH.ClassName "class-2" ] ]
              [ HH.text "Hello Purs H1!" ]
          ]
      , HH.div
          [ HP.class_ $ HH.ClassName "row" ]
          [ HH.h2_ [ HH.text "Hello Purs H2!" ] ]
      ]
  )