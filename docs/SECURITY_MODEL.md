ZKADA Security & Threat Model

The ZKADA Security Model defines the trust assumptions, adversary types, threat surfaces, and cryptographic guarantees required for a fully trustless Zero-Knowledge bridge between Cardano and Cosmos.

The goal is to ensure that no human, validator, multisig, or third party can forge transfers or compromise the value locked in the bridge.

🔷 1. Security Philosophy

ZKADA follows three principles:

1. Trust no human. Trust only math.

All validation must rely on cryptographic proofs, not signatures or custodial keys.

2. Reject unverifiable states.

Any proof or state transition not cryptographically validated must be rejected.

3. Avoid state ambiguity.

Both chains must handle events deterministically, with strict replay protection.

🔷 2. Threat Actors Considered

ZKADA assumes several potential adversaries:

2.1 Malicious bridge users

Attempting double unlocks, fake burns, fake locks, or invalid proofs.

2.2 Malicious relayers

Intercepting data or sending manipulated proof payloads.

2.3 Compromised zkVM prover environment

Attempting to forge proofs or modify circuit inputs.

2.4 Chain-level adversaries

Temporary chain forks on Cardano or Cosmos.

2.5 Replay attackers

Reusing old proofs or previously executed burn events.

🔷 3. Assets Secured by ZKADA

ZKADA protects:

ADA locked on Cardano

cADA minted on Cosmos

state commitments used in ZK proofs

recipient addresses

proof authenticity and uniqueness

event ordering

The bridge MUST ensure:

no ADA is unlocked without a valid burn

no cADA is minted without a valid lock

no double mint / double unlock

no forged state enters the system

🔷 4. Security Mechanisms
4.1 Zero-Knowledge Proofs (Core Defense)

ZK proofs guarantee:

correctness of the reported Cardano/Cosmos state

deterministic program execution inside the zkVM

tamper-proof computation

no disclosure of unnecessary chain data

full independence from human trust

4.2 Replay Protection

Replay attacks are prevented through:

lock_id uniqueness on Cardano

burn_tx_hash uniqueness on Cosmos

hash-based event tracking

one-time-use commitments

strict matching between proof state and on-chain state

4.3 Proof Integrity

Each proof contains:

proof_commitment

state_hash

event_hash

recipient

amount

Validator checks:

hash(zk_proof) == proof_commitment


If not → reject.

4.4 Deterministic Verification

Both chains require:

deterministic hash formats

consistent byte encodings

canonical serialization

strict state representation rules

No ambiguity = no vulnerability.

4.5 Prevention of Forged Proofs

A forged proof cannot unlock or mint assets because:

circuit ID must match

zkVM validity is checked

expected state hash must equal on-chain state hash

event hashes must match actual chain events

mismatch = immediate rejection

🔷 5. Failure Scenarios and Mitigations
Scenario A: Cosmos tries to mint without lock

Mitigation:
ZKVerifierOsmosis requires a matching Cardano lock proof with strict state verification.

Scenario B: User tries fake burn

Mitigation:
ZKVerifierCardano checks Cosmos burn state through ZK proof → mismatch → reject.

Scenario C: zkVM bug or prover compromise

Mitigation:

circuits must be audited

proof structure must be reproducible

proof commitments must be deterministic

optional multi-prover redundancy

Scenario D: Replay of old burn or lock

Mitigation:

one-time-use hashes

permanent tracking on both chains

proof root mismatches lead to rejection

🔷 6. Chain Reorganizations (Fork Handling)
Cardano

Short-lived forks can happen.
Solution:

require finality depth (e.g., 5–15 blocks)

only accept finalized state as proof input

Cosmos

Cosmos SDK has stronger finality assumptions.
Solution:

store block height

verify block commitment inside zkVM

🔷 7. Trust Model Summary

ZKADA does not require:

multisigs

custodial keys

trusted relayers

centralized operators

governance-based approval

external permissioning

ZKADA does require:

correctness of zkVM execution

honesty of underlying cryptographic primitives

deterministic access to public chain data

This is the minimum trust possible.

🔷 8. Contribution to Milestones

This document supports:

Milestone 4 — Zero-Knowledge Feasibility

Milestone 5 — Security Model

Milestone 6 — Roadmap and system guarantees
