{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}

module Test.Types.BrokenSerialization where

import Data.Binary
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Arbitrary.ADT

data SumType
  = SumType1 Int
  | SumType2 String Int
  | SumType3 Double String Int
  deriving (Eq, Show, Generic)

instance Binary SumType

instance ToADTArbitrary SumType

instance Arbitrary SumType where
  arbitrary = genericArbitrary

data P2 = P2 String Int deriving (Eq, Show, Generic)
instance Binary P2


newtype FailBinary = FailBinary Int deriving (Generic, Eq, Show, Arbitrary)
instance Binary FailBinary where
  put (FailBinary n) = put n
  get = fail "This is made for failing!"

instance ToADTArbitrary FailBinary