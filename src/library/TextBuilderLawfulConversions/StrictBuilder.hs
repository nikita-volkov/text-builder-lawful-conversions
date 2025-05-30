{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module TextBuilderLawfulConversions.StrictBuilder where

#if MIN_VERSION_text(2,0,2) && !MIN_VERSION_text(2,1,2)

import Data.Functor
import Data.Text.Internal.StrictBuilder
import LawfulConversions
import TextBuilder (TextBuilder)
import qualified TextBuilderCore
import Prelude

instance IsSome StrictBuilder TextBuilder where
  {-# INLINE to #-}
  to (TextBuilderCore.TextBuilder size write) =
    StrictBuilder
      size
      ( \array offset ->
          write array offset $> ()
      )

instance IsSome TextBuilder StrictBuilder where
  {-# INLINE to #-}
  to (StrictBuilder size write) =
    TextBuilderCore.TextBuilder
      size
      ( \array offset ->
          write array offset $> offset + size
      )

instance IsMany StrictBuilder TextBuilder

instance IsMany TextBuilder StrictBuilder

instance Is StrictBuilder TextBuilder

instance Is TextBuilder StrictBuilder

#endif
