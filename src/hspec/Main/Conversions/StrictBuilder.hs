{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Main.Conversions.StrictBuilder (spec) where

#if MIN_VERSION_text(2,0,2) && !MIN_VERSION_text(2,1,2)

import Data.Function
import Data.Proxy
import qualified Data.Text.Encoding as TextEncoding
import Main.LawfulConversionsHspec
import Test.Hspec
import Test.QuickCheck.Arbitrary
import TextBuilder (TextBuilder)
import Prelude

spec :: Spec
spec = allUptoIs (Proxy @TextBuilder) (Proxy @TextEncoding.StrictBuilder)

instance Eq TextEncoding.StrictBuilder where
  a == b =
    on (==) TextEncoding.strictBuilderToText a b

instance Show TextEncoding.StrictBuilder where
  showsPrec d =
    showsPrec d . TextEncoding.strictBuilderToText

instance Arbitrary TextEncoding.StrictBuilder where
  arbitrary =
    TextEncoding.textToStrictBuilder <$> arbitrary

#else

import Test.Hspec
import Prelude

spec :: Spec
spec = pure ()

#endif
