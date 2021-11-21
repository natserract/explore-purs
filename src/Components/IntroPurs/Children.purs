module IntroPurs.Children where

import Halogen.HTML as HH

type Child = ∀ p a. HH.HTML p a

make :: ∀ props act. Child -> HH.HTML props act
make innerComponent =
  HH.div_ [ innerComponent ]