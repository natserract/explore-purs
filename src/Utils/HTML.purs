module Utils.HTML where

import Prelude

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

-- You can use `<$>` or `<<<`
className :: ∀ r i. String → HH.IProp (class :: String | r) i
className = HP.class_ <$> HH.ClassName

placeholder :: ∀ r i. String → HH.IProp (placeholder :: String | r) i
placeholder = HP.prop (HH.PropName "placeholder")