LockBoxADA — Cardano Smart Contract Specification

This document defines the LockBoxADA smart contract, responsible for safely locking ADA on Cardano and releasing it only after a valid Zero-Knowledge proof is verified.

LockBoxADA is a critical component in the trustless ZKADA bridge architecture.

🔷 1. Purpose

The LockBoxADA contract enables:

Secure locking of ADA

Creation of verifiable state commitments

Prevention of replay attacks

Zero-Knowledge proof–based unlocking

Trustless cross-chain transfers

🔷 2. Contract Structure
2.1 UTxO Model

LockBoxADA uses a single or multi-UTxO approach containing:

Value: locked ADA

Datum: structured metadata

Redeemer: ZK proof input for unlocking

The datum holds:

Field	Description
sender_pubkey	The Cardano user who locked the ADA
amount	ADA amount locked
lock_id	Unique ID for this lock operation
state_hash	Hash of state used by the zkVM
timestamp	Slot/time of locking
🔷 3. Lock Operation (ADA → Cardano LockBox)
3.1 User Action

User sends ADA to LockBoxADA with a valid datum.

Conditions:

ADA > minimum threshold

Unique lock_id

Correct sender signature

3.2 Contract Validation Rules

Validator must ensure:

Correct datum format

Lock transaction is signed by the sender

No double-spend attempt

State commitment is deterministic

After successful validation, the ADA is officially locked.

🔷 4. Unlock Operation (After Proof Verification)

Unlocking requires a verifiable Zero-Knowledge proof generated using zkVM (RISC Zero or SP1).

4.1 Redeemer Fields
Field	Description
zk_proof	Zero-Knowledge proof blob
expected_state_hash	State hash to verify against datum
cosmos_burn_tx_hash	Hash of token burn on Cosmos
recipient_address	ADA recipient address
🔷 5. Unlock Validation Logic

The validator script checks:

Proof Verification

Calls into the on-chain ZKVerifierCardano mechanism

Must validate zk proof against expected state

State Matching

expected_state_hash must equal datum’s state_hash

Ensures deterministic origin

Burn Confirmation

cosmos_burn_tx_hash matches state proven by zkVM

No Replay

Each lock_id can only be unlocked once

Correct Recipient

Unlock sends ADA to correct address

If all checks pass → ADA is released.

🔷 6. Security Considerations

All inputs must be deterministic

ZK proof must be verified on-chain

LockBox must reject mismatched state proofs

Replay protection is mandatory

Large proofs must be handled via hashed commitments

ADA can never be unlocked without proof verification

🔷 7. Implementation Notes (Aiken/Plutus)
Recommended:

Aiken for clean, modern syntax

use blake2b_256 for state_hash

multi-UTxO mode for parallelism

precise datum/redeemer types

test harness using plutus-test / aiken test

This contract will be implemented in Phase 2 after research completion.

End of LOCKBOX_SPEC.md
