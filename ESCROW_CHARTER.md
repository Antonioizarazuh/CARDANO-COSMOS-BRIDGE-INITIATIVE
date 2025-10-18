# ESCROW_CHARTER.md

## Purpose
Hold community funds securely to support research, prototyping, testing, and auditing of a **Cardano ↔ Cosmos IBC bridge**. Funds are released only on verified milestones.

## Scope
- Funding phases: Research → Prototype → Testnet → Audit & Docs.
- Open-source, permissive license (MIT).
- Transparency-first: all wallets, txs, and updates public.

## Accepted Assets (initial)
- ADA (Cardano), ATOM/OSMO (Cosmos), USDC (EVM—Base/ETH).
- Exact deposit addresses are listed in `WALLETS.md`.

## Custody Model
- **Phase 1 (formation):** temporary single-signer (Project Lead) Gnosis Safe while recruiting signers.
- **Phase 2 (active):** upgrade to **3-of-5 multisig**:
  - 2 signers from Cardano community  
  - 2 signers from Cosmos community  
  - 1 neutral advisor (security/audit)
- Signers are doxxed (public handles) and listed in `SIGNERS.md`.

## Milestones & Releases
- M1 — Research & Design Spec (10%)  
- M2 — Prototype components (light clients/relayers) + docs (35%)  
- M3 — Public Testnet Bridge + test plan (35%)  
- M4 — Independent Security Review + Final Docs (20%)  

**Release rule:** Each payout requires a public milestone report + 3/5 multisig approval.  
All artifacts (code, docs, test results) must be public.

## Transparency & Reporting
- Public dashboards and escrow addresses.  
- Bi-weekly text update in `UPDATES.md`.  
- Monthly financial snapshot (in/out, balances).  

## Refund / Reallocation Policy
If there is **no measurable progress or public update for 12 months**, a **community review** will take place.  
The community, together with at least 3 of 5 multisig signers, will decide whether to:  
- Continue funding under new milestones,  
- Reassign funds to another dev team, or  
- Return funds pro-rata to contributors.  

This ensures accountability while allowing reasonable time for complex technical development.

## Fees
- Network fees only.  
- No coordinator salary from escrow unless explicitly approved via public vote.

## Changes to Charter
- Any change requires a public proposal, 7-day discussion period, and 3/5 multisig approval.

## Contacts
- Project Lead: [@Antonioizarazuh](https://x.com/Antonioizarazuh)

