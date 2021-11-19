module App where

import Prelude

import Data.Const (Const)
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Effect.Console (log)
import Halogen as H
import Halogen.HTML as HHtml

type State = { }
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
  initialState :: forall i. i -> State
  initialState _ = {}

  -- Component lifecycle
  handleAction :: ∀ o. Action -> H.HalogenM State Action ChildSlots o Aff Unit
  handleAction Initialize = H.liftEffect $ log "Initialize Root" 
  handleAction _ = pure unit

  render :: State -> H.ComponentHTML Action ChildSlots Aff
  render _ = 
    let 
      label = "Hello Purs"
    in 
      HHtml.div_
        [HHtml.h1_ [HHtml.text label]]