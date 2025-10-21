{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE TemplateHaskell     #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LockADA where

import           Plutus.V1.Ledger.Api
import           PlutusTx
import           PlutusTx.Prelude

-- | Validator always succeeds (dummy logic)
{-# INLINABLE validateLock #-}
validateLock :: BuiltinData -> BuiltinData -> BuiltinData -> ()
validateLock _ _ _ = ()  -- accept all transactions for demo purposes

-- | Compile validator into a Plutus script
validator :: Validator
validator = mkValidatorScript $$(PlutusTx.compile [|| validateLock ||])
