module Rendering.Conditional where

import Prelude

import Halogen.HTML as HH
import Types.Global (SttcComponent)
import Utils.HTML (className)

make :: ∀ props act. Boolean -> SttcComponent props act
make state =
  if not state then render "loading..."
  else render "success"
  where
  render :: String -> SttcComponent props act
  render m = 
    HH.span 
      [ className if not state then "hidden" else "visible" ] --inline condition
      [ HH.text m ]