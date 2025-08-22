{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.String where

import Data.Function
import Data.Functor
import Data.String
import LawfulConversions
import TextBuilder

instance IsSome String TextBuilder where
  to = toString
  maybeFrom = fmap text . maybeFrom

instance IsMany String TextBuilder where
  from = string
