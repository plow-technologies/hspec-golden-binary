import Data.Proxy
import Lib (OnOrOff, Person)
import Test.Binary.GenericSpecs (mkGoldenFileForType)

main :: IO ()
main = do
  mkGoldenFileForType 10 (Proxy :: Proxy Person) "golden"
  mkGoldenFileForType 10 (Proxy :: Proxy OnOrOff) "golden"
