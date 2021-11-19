module Components.HelloPurs where

-- Using common API like in haskell (eg. $, <<<, etc)

import Prelude

import Halogen.HTML as HHtml

type State = {  message :: String }
data Action = Toggle
data Query a = IsOn (Boolean -> a)
data Message = Toggled Boolean

-- @see https://pursuit.purescript.org/packages/purescript-halogen/6.1.2/docs/Halogen#t:Component
-- -- `state` is the component's state
-- -- `query` is the query algebra; the requests that can be made of the component
-- -- `action` is the type of actions; messages internal to the component that can be evaluated
-- -- `eval` is a function that handles the HalogenQ algebra that deals with component lifecycle, handling actions, and responding to requests
make = do
  HHtml.div_
    [ HHtml.h1_ [HHtml.text "Hello Purs!"] ]