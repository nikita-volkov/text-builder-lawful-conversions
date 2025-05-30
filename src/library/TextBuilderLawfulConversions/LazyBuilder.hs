{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.LazyBuilder where

import qualified Data.Text.Lazy.Builder
import LawfulConversions
import TextBuilder
import Prelude

instance IsSome Data.Text.Lazy.Builder.Builder TextBuilder where
  to = Data.Text.Lazy.Builder.fromText . toText

instance IsSome TextBuilder Data.Text.Lazy.Builder.Builder where
  to = lazyText . Data.Text.Lazy.Builder.toLazyText

instance IsMany Data.Text.Lazy.Builder.Builder TextBuilder

instance IsMany TextBuilder Data.Text.Lazy.Builder.Builder

instance Is Data.Text.Lazy.Builder.Builder TextBuilder

instance Is TextBuilder Data.Text.Lazy.Builder.Builder
