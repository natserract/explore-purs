module Types.Global
  ( DynComponent
  , SttcComponent
  )
  where

import Halogen as H
import Halogen.HTML as HH

type SttcComponent props act = HH.HTML props act
type DynComponent query input output m = H.Component query input output m