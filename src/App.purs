module App where

import Prelude

import Components.HelloPurs as HelloPurs
import Data.Const (Const)
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Effect.Console (log)
import Halogen as H
import Halogen.HTML as HH

type State = {}
type ChildSlots =
  ( child :: H.Slot (Const Void) Unit Int )

data Query a = Any a
data Action
  = Initialize
  | Finalize
  | Add
  | Reverse
  | Remove Int
  | ReportRoot String


-- @see https://pursuit.purescript.org/packages/purescript-halogen/6.1.2/docs/Halogen#t:Component
-- -- `state` is the component's state
-- -- `query` is the query algebra; the requests that can be made of the component
-- -- `action` is the type of actions; messages internal to the component that can be evaluated
-- -- `eval` is a function that handles the HalogenQ algebra that deals with component lifecycle, handling actions, and responding to requests

make :: ∀ eff. H.Component eff Unit Void Aff
make = do
  H.mkComponent 
    { initialState
    , render
    , eval: H.mkEval
       ( H.defaultEval
        { handleAction = handleAction
        , initialize = Just Initialize
        , finalize = Just Finalize 
        }
       )
    }
  where
  initialState :: ∀ i. i -> State
  initialState _ = {}

  -- Component lifecycle
  handleAction :: ∀ o. Action -> H.HalogenM State Action ChildSlots o Aff Unit
  handleAction Initialize = H.liftEffect $ log "Initialize Root" 
  handleAction _ = pure unit

  render :: State -> H.ComponentHTML Action ChildSlots Aff
  render _ =
    let label = "Hello Purs!" 
    in HH.div_ 
      [ HH.h1_ [HH.text label]
      , HH.div_
          [HelloPurs.make]
      , HH.h2_ [HH.text "Alfin Surya"]
      ]