module Models.Models where

import Prelude

data Object = Object {
  name :: String,
  title :: String
}

data Nodes a = Nodes a

make :: Nodes Object 
make = Nodes $ Object {
  name : "",
  title :  ""
}