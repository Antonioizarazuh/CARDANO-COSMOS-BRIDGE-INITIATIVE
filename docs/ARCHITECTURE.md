ZKADA Architecture – Trustless Zero-Knowledge Bridge (Cardano ↔ Cosmos)

This document introduces the high-level architecture for ZKADA, the first trustless Zero-Knowledge interoperability bridge between Cardano and Cosmos/Osmosis.

The goal of Phase 1 is to design and document a secure bridge architecture that uses zero-knowledge proofs instead of multisigs, custodians, or trusted relayers.

🔷 1. Architecture Overview

ZKADA enables ADA to move between Cardano and Cosmos by verifying cryptographic proofs of state, not human trust.

The core idea:

User locks ADA on Cardano

The Cardano network produces a state proof

A zkVM (RISC Zero or SP1) generates a verifiable ZK proof of this state

Cosmos verifies that proof on-chain

Cosmos mints cADA (wrapped ADA)

Burn on Cosmos → proof → release ADA on Cardano

No multisig.
No custody.
No trusted 3rd parties.
Only math.

🔷 2. Components
2.1 Cardano Side

LockBoxADA smart contract

Holds ADA

Produces state commitments

Accepts ZK proofs to unlock ADA

Aiken/Plutus implementation

2.2 Cosmos Side (Osmosis)

cADA cw20 token

Mint/burn logic

Stores hash commitments

Verifies ZK proofs coming from Cardano

CosmWasm implementation

2.3 ZK Proof System

Evaluated zkVMs:

RISC Zero

Succinct SP1

Responsible for:

Loading Cardano transaction/state

Generating a cryptographic proof

Outputting a verifier-friendly structure

Ensuring no manipulation is possible

🔷 3. Bridge Flow (Simplified)
3.1 ADA → cADA (Cardano → Cosmos)
[User] → Lock ADA on Cardano
   ↓
Cardano State Snapshot
   ↓
zkVM generates ZK proof
   ↓
Cosmos verifies proof on-chain
   ↓
Cosmos mints cADA to user

3.2 cADA → ADA (Cosmos → Cardano)
[User] → Burn cADA on Cosmos
   ↓
Cosmos State Snapshot
   ↓
zkVM generates ZK proof
   ↓
Cardano verifies proof
   ↓
ADA released to user

🔷 4. Security Guarantees

Trustless, cryptographically verifiable

No multisigs

No custodial wallets

Chain-agnostic zkVM proofs

Replay-attack protection

Verifiable state transitions

Open-source implementation

🔷 5. Limitations (to be researched in Phase 1)

On-chain verification costs

Proof generation latency

Cross-chain finality alignment

Large proof sizes

Required indexing infrastructure

These topics will be analyzed in the Phase 1 Feasibility Report.

🔷 6. Relation to Catalyst Milestones

This architecture document contributes to:

Milestone 1 — High-level architecture

Milestone 2 — Cardano contract spec

Milestone 3 — Cosmos contract spec

Milestone 4 — zkVM feasibility

Milestone 5 — Security model

Milestone 6 — Phase 2 roadmap

It will be expanded step-by-step as milestones are delivered.

End of ARCHITECTURE.md
