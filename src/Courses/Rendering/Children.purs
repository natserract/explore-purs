module Rendering.Children where

import Halogen.HTML as HH
import Types.Global (SttcComponent)

make :: ∀ props act. (SttcComponent props act) → SttcComponent props act
make innerComponent =
  HH.div_ [ innerComponent ]