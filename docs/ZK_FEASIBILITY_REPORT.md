Zero-Knowledge Feasibility Report — ZKADA Bridge

This document evaluates the feasibility of building a trustless Zero-Knowledge bridge between Cardano and Cosmos using modern zkVM technology.

Phase 1 aims to determine how practical, efficient, and secure it is to verify state from one blockchain on the other using Zero-Knowledge proofs.

🔷 1. Overview of zkVM Role in ZKADA

The zkVM (Zero-Knowledge Virtual Machine) is responsible for:

Reading blockchain state (Cardano or Cosmos)

Executing a deterministic program inside a zk circuit

Producing a verifiable proof of the program's execution

Allowing the other chain to validate this proof without trust

ZK proofs effectively replace:

❌ multisigs
❌ custodians
❌ relayers
❌ trusted bridges

This makes ZKADA trustless.

🔷 2. zkVM Candidates Evaluated

Phase 1 focuses on two leading zkVMs:

2.1 RISC Zero zkVM
🔹 Strengths

Mature developer ecosystem

Can prove arbitrary Rust programs

Wide community adoption

Excellent documentation

Proven track record in production ZK apps

🔹 Concerns

Large proof sizes

On-chain verification currently expensive

Requires strong hardware to generate proofs

2.2 Succinct SP1
🔹 Strengths

Faster proof generation

Better for on-chain verification due to smaller proofs

Active research team

Strong compatibility with multi-chain architectures

🔹 Concerns

Still rapidly evolving

Ecosystem smaller than RISC Zero

Fewer production examples

🔷 3. Key Feasibility Questions
3.1 Can we efficiently prove Cardano state?

Likely yes, using:

Ogmios for state extraction

Light Cardano node

Custom Rust code to interpret UTxO state

zkVM verification of lock events

Challenges:

Translating UTxO structure to zkVM-friendly format

Large state sizes → need commitments

3.2 Can Cosmos verify the proof on-chain (CosmWasm)?

Possible with limitations.

Options:

✔ Full on-chain verification

Works but may exceed gas limits

✔ Proof-commitment model (recommended)

zkVM proof verifies off-chain

On-chain only verifies proof hash + commitments

Minimizes gas usage

This is the most practical approach today.

3.3 Can Cardano verify zk proofs on-chain?

Currently limited, because:

Plutus does not yet support heavy cryptographic curves

On-chain RISC Zero verification is not feasible

Solution:

✔ Hash-based verification + off-chain proof acceptance

zkVM proof checked off-chain

Cardano validates proof hash + state commitment

Same pattern widely used in ZK rollups

This avoids Plutus limitations while maintaining trustlessness.

🔷 4. Estimated Performance
Metric	RISC Zero	SP1
Proof size	Large	Medium
Proof time	Slow	Medium/Fast
On-chain verification	Hard	Moderate
Production readiness	High	Medium
Best use-case	Strong proofs	Cross-chain proofs

Conclusion:
SP1 looks better for bridge verification.
But RISC Zero remains an excellent proving backend.

🔷 5. Major Challenges Identified
❗State extraction

Cardano UTxO → zkVM format
Cosmos state → zkVM format

❗Proof size

Must be reduced or hashed.

❗On-chain gas limits

Cosmos verification must remain minimal.

❗Data availability

Bridge state must be transparent and reproducible.

🔷 6. Feasibility Conclusion

Building ZKADA is technically feasible, but requires:

✔ hashed state commitments
✔ off-chain proof generation
✔ light on-chain verification logic
✔ specialized zkVM circuits
✔ careful gas budgeting for Cosmos

The current state of Zero-Knowledge technology supports the architecture described, and no major blockers exist.

This Phase 1 document will evolve as more experiments are conducted.

🔷 7. Milestone Alignment

This report contributes to:

Milestone 4 — Zero-Knowledge feasibility

Milestone 5 — Security Model

Milestone 6 — Phase 2 Roadmap
