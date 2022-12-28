{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}

module Test.Types.BackwardCompatible where

import Data.Binary
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Arbitrary.ADT

data Person = Person
  { name :: String,
    age :: Int
  }
  deriving (Eq, Show, Generic)

data PersonWithoutAge = PersonWithoutAge
  {
    nameWithoutAge :: String
  }
  deriving (Eq, Show, Generic)

instance Binary PersonWithoutAge

instance Binary Person where
  put = \(Person newName _) -> put (PersonWithoutAge newName)
  get = do
    PersonWithoutAge n <- get
    return $ Person n 0 

instance ToADTArbitrary Person

instance Arbitrary Person where
  arbitrary = genericArbitrary
