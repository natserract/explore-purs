-- What you'll learn
-- | Functional component using `Hooks.component`
-- | Use State hooks

module Hooks.HookComponent where

import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks


make :: ∀ q i o m. H.Component q i o m
make = Hooks.component \_ _ → Hooks.do
  -- | Type:: newtype StateId state <-> .. /\ stateId
  --
  -- | A unique identifier for a state produced by `useState`, which can be passed
  -- | to the state functions `get`, `put`, `modify`, and `modify_` to get or
  -- | modify the state.
  --
  state /\ 
    setState :: Tuple Boolean (Hooks.StateId Boolean) ← Hooks.useState false

  let 
    state' = if state then "Show" else "Hide"
    handleChangeState = Hooks.modify_ setState (\_ → true)

  Hooks.pure do
    HH.div_
      [ HH.text "Click on the button to clear from local storage" 
      , HH.button 
        [ HP.title state'
        , HE.onClick \_ → handleChangeState
        ]
        [ HH.text state' ]
      ]