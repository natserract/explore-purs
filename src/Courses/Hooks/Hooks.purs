-- Docs Halogen.Hooks
-- @see: https://pursuit.purescript.org/packages/purescript-halogen-hooks/0.4.3/docs/Halogen.Hooks
module Courses.Hooks where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Hooks.HookComponent as HookComponent
import Type.Proxy (Proxy(..))
import Types.Global (SttcComponent)

_child = Proxy :: Proxy "child"

type Slots = (child :: ∀ q. H.Slot q Void Unit)
data Action
  = Initialize
  | Finalize
  | Add
  | Reverse
  | Remove Int
  | ReportRoot String

make :: ∀ m. H.ComponentHTML Action Slots m
make =
  HH.div_
    [ HH.text "Render Hook Component"
    -- Render Another Component but with Different types
    -- If not using `slot_`  , you can't passing `HookComponent.make`
    -- Cause the type `H.Component` but expected is `ComponentHTML or HTML` 
    -- 
    -- | `slot_` -> Defines a slot for a child component
    -- 
    , HH.slot_ _child unit HookComponent.make unit
    ]

-- runHooksExample :: ∀ props act. SttcComponent props act
-- runHooksExample = do
--   HH.div_ [ 
--     make (\_ -> "")
--   ]
