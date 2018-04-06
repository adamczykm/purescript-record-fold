module Test.Main where

import Prelude

import Data.Record.Catamorphism (recordApplyTo, recordCollect, recordLen, recordMap, recordShow)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe (Maybe(..))

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ show $ recordLen { a: 123, b: "hello"}
  log $ show $ recordShow { a: 123, b: "hello"}
  log $ show $ recordShow $ recordMap (Just) { a: 123, b: "hello" }
  log $ show $ recordShow $ recordApplyTo 5 { a: \x -> x + 1, b: \y -> y - 2 }
  let x = recordCollect { a: Just 5, b: Just "sth" }
  log $ show $ map recordShow x
