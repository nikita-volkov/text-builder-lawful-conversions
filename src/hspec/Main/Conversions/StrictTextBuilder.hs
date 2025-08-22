{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Main.Conversions.StrictTextBuilder (spec) where

#if MIN_VERSION_text(2,1,2)

import Data.Function
import Data.Proxy
import qualified Data.Text.Encoding as TextEncoding
import Main.LawfulConversionsHspec
import Test.Hspec
import Test.QuickCheck.Arbitrary
import TextBuilder (TextBuilder)
import Prelude

spec :: Spec
spec = allUptoIs (Proxy @TextBuilder) (Proxy @TextEncoding.StrictTextBuilder)

instance Eq TextEncoding.StrictTextBuilder where
  a == b =
    on (==) TextEncoding.strictBuilderToText a b

instance Show TextEncoding.StrictTextBuilder where
  showsPrec d =
    showsPrec d . TextEncoding.strictBuilderToText

instance Arbitrary TextEncoding.StrictTextBuilder where
  arbitrary =
    TextEncoding.textToStrictBuilder <$> arbitrary

#else

import Test.Hspec
import Prelude

spec :: Spec
spec = pure ()

#endif
