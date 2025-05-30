{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.LazyText where

import qualified Data.Text.Lazy
import LawfulConversions
import TextBuilder
import Prelude

instance IsSome Data.Text.Lazy.Text TextBuilder where
  to = to . toText

instance IsSome TextBuilder Data.Text.Lazy.Text where
  to = lazyText

instance IsMany Data.Text.Lazy.Text TextBuilder

instance IsMany TextBuilder Data.Text.Lazy.Text

instance Is Data.Text.Lazy.Text TextBuilder

instance Is TextBuilder Data.Text.Lazy.Text
