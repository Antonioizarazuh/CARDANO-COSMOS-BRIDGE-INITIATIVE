cADA Token Specification — Cosmos/Osmosis (cw20 Standard)

This document defines the cADA token, the Cosmos/Osmosis representation of ADA within the ZKADA trustless Zero-Knowledge bridge architecture.

cADA is a cw20-compliant wrapped asset, minted only after a valid Zero-Knowledge proof confirms ADA has been locked on Cardano.

🔷 1. Purpose

The cADA token serves as:

The Cosmos-side representation of ADA

A 1:1 backed asset

A tightly controlled mint/burn asset

The foundation for ADA liquidity on Osmosis and Cosmos DeFi

A verifiable state transition object inside ZK proofs

🔷 2. Token Properties
Property	Value
Name	cADA
Standard	cw20
Decimals	6
Supply Model	Dynamic (mint/burn via ZK proofs)
Mint Authority	ZKVerifierOsmosis
Burn Authority	ZKVerifierOsmosis

No human, multisig, or custodial entity can mint or burn cADA.

Only zero-knowledge validated events can do so.

🔷 3. Mint Operation (ADA → cADA)
3.1 Flow

ADA is locked on Cardano

zkVM generates a ZK proof of the lock state

Proof is submitted to Cosmos

ZKVerifierOsmosis validates the proof

cADA is minted for the user

3.2 Mint Conditions

Minting is allowed only when:

ZK proof is valid

LockBoxADA state matches expected state

Lock ID is unique (no replay)

State hash equals the hash inside the ZK proof

Mint amount = ADA locked.

🔷 4. Burn Operation (cADA → ADA)
4.1 Flow

User burns cADA on Cosmos

Cosmos module records burn event

zkVM generates proof

Proof is verified on Cardano

ADA is released to the user

4.2 Burn Conditions

Burn accepted only if:

cADA balance is sufficient

Burn event is included in Cosmos state

Burn transaction hash is unique

Matching ZK proof is provided on unlock

Burn amount = ADA to be released on Cardano.

🔷 5. Contract Specification (CosmWasm)
5.1 State Structure
Field	Description
total_supply	Current supply of cADA
balances	Mapping of user → amount
allowed_mints	Verified mint events (hash-based)
allowed_burns	Verified burn events
admin	Set to ZKVerifierOsmosis only
5.2 Entry Points

mint (ZKVerifierOsmosis only)

burn (user or contract)

transfer

send

balance_of

token_info

5.3 Metadata
{
  "name": "cADA",
  "symbol": "CADA",
  "decimals": 6
}

🔷 6. ZK Proof Integration

The minted or burned amount must match:

the proof-validated lock amount (Cardano → Cosmos)

the proof-validated burn amount (Cosmos → Cardano)

ZK proofs produce the following:

proof_state_hash

amount

recipient

burn_tx_hash or lock_tx_hash

The contract compares this with its internal expected state.

🔷 7. Security Requirements

cADA must guarantee:

100% backing by locked ADA

no minting without ZK proof

no burning without user authorization

no replay of burn or lock events

no external admin rights

deterministic logic

🔷 8. Phase 1 Deliverables

This specification contributes to:

Milestone 3 — Cosmos contract specification

Milestone 4 — zkVM feasibility (Cosmos-side requirements)

Milestone 5 — security model

Implementation is planned for Phase 2.
