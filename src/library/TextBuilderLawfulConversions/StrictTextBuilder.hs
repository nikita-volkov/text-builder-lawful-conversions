{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.StrictTextBuilder where

#if MIN_VERSION_text(2,1,2)

import Data.Functor
import Data.Text.Internal.StrictBuilder
import LawfulConversions
import TextBuilder (TextBuilder)
import qualified TextBuilderCore
import Prelude

instance IsSome StrictTextBuilder TextBuilder where
  {-# INLINE to #-}
  to (TextBuilderCore.TextBuilder size write) =
    StrictTextBuilder
      size
      ( \array offset ->
          write array offset $> ()
      )

instance IsSome TextBuilder StrictTextBuilder where
  {-# INLINE to #-}
  to (StrictTextBuilder size write) =
    TextBuilderCore.TextBuilder
      size
      ( \array offset ->
          write array offset $> offset + size
      )

instance IsMany StrictTextBuilder TextBuilder

instance IsMany TextBuilder StrictTextBuilder

instance Is StrictTextBuilder TextBuilder

instance Is TextBuilder StrictTextBuilder

#endif
