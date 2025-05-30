{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.StrictText where

import qualified Data.Text
import LawfulConversions
import TextBuilder

instance IsSome Data.Text.Text TextBuilder where
  to = toText

instance IsSome TextBuilder Data.Text.Text where
  to = text

instance IsMany Data.Text.Text TextBuilder

instance IsMany TextBuilder Data.Text.Text

instance Is Data.Text.Text TextBuilder

instance Is TextBuilder Data.Text.Text
