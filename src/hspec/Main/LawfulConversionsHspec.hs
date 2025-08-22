module Main.LawfulConversionsHspec where

import Control.Monad (forM_)
import Data.Proxy (Proxy (..))
import qualified LawfulConversions
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck.Instances ()
import TextBuilderLawfulConversions ()
import Prelude

isSome :: (LawfulConversions.IsSome a b, Eq a, Eq b, Show a, Show b, Arbitrary b) => Proxy a -> Proxy b -> Spec
isSome a b = describe "IsSome" do
  forM_ (LawfulConversions.isSomeProperties a b) \(name, property) ->
    prop name property

isMany :: (LawfulConversions.IsMany a b, Eq a, Eq b, Show a, Show b, Arbitrary a, Arbitrary b) => Proxy a -> Proxy b -> Spec
isMany a b = describe "IsMany" do
  forM_ (LawfulConversions.isManyProperties a b) \(name, property) ->
    prop name property

is :: (LawfulConversions.Is a b, Eq a, Eq b, Show a, Show b, Arbitrary a, Arbitrary b) => Proxy a -> Proxy b -> Spec
is a b = describe "Is" do
  forM_ (LawfulConversions.isProperties a b) \(name, property) ->
    prop name property

allUptoIs :: (LawfulConversions.Is a b, Eq a, Eq b, Show a, Show b, Arbitrary a, Arbitrary b) => Proxy a -> Proxy b -> Spec
allUptoIs a b = do
  describe "Forward" do
    isSome a b
    isMany a b
    is a b

  describe "Backward" do
    isSome b a
    isMany b a
    is b a
