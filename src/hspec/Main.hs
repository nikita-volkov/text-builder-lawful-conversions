{-# OPTIONS_GHC -Wno-orphans #-}

module Main (main) where

import Data.Proxy (Proxy (..))
import qualified Data.Text
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Builder
import qualified Main.Conversions.StrictBuilder
import qualified Main.Conversions.StrictTextBuilder
import Main.LawfulConversionsHspec
import Test.Hspec
import Test.QuickCheck.Arbitrary
import Test.QuickCheck.Instances ()
import TextBuilder (TextBuilder)
import TextBuilderLawfulConversions ()
import Prelude

main :: IO ()
main = hspec do
  describe "Data.Text.Text" do
    allUptoIs (Proxy @Data.Text.Text) (Proxy @TextBuilder)

  describe "Data.Text.Lazy.Text" do
    allUptoIs (Proxy @Data.Text.Lazy.Text) (Proxy @TextBuilder)

  describe "Data.Text.Lazy.Builder.Builder" do
    allUptoIs (Proxy @Data.Text.Lazy.Builder.Builder) (Proxy @TextBuilder)

  describe "Data.Text.Encoding.StrictBuilder" do
    Main.Conversions.StrictBuilder.spec

  describe "Data.Text.Encoding.StrictTextBuilder" do
    Main.Conversions.StrictTextBuilder.spec

instance Arbitrary Data.Text.Lazy.Builder.Builder where
  arbitrary = Data.Text.Lazy.Builder.fromText <$> arbitrary
