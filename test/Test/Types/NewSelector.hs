{-# LANGUAGE DeriveGeneric #-}

module Test.Types.NewSelector where

import Data.Binary
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Arbitrary.ADT

data Person = Person
  { name :: String,
    age :: Int,
    address :: String
  }
  deriving (Eq, Show, Generic)

instance Binary Person

instance ToADTArbitrary Person

instance Arbitrary Person where
  arbitrary = genericArbitrary
