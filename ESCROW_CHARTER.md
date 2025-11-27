> NOTE: This was part of an older escrow-based concept and is NOT used in the current ZKADA trustless design.

# 🏦 ESCROW CHARTER  

## 🎯 Purpose  
Hold community funds securely to support the research, prototyping, testing, and auditing of a **Cardano ↔ Cosmos IBC bridge**.  
Funds are released only after verified milestones are completed and approved.  

---

## 📜 Scope  
- Funding phases: **Research → Prototype → Testnet → Audit & Docs**  
- Fully open-source under the **MIT License**  
- **Transparency-first:** all wallets, transactions, and updates are public and verifiable  

---

## 💰 Accepted Assets (Initial)  
- **ADA** (Cardano)  
- **ATOM / OSMO** (Cosmos)  
- **USDC** (on Base or Ethereum network)  

Exact deposit addresses will be listed in [`WALLETS.md`](./WALLETS.md).  

---

## 🔐 Custody Model  

### Phase 1 — Formation  
- Temporary single-signer **Gnosis Safe** controlled by the Project Lead while recruiting multisig signers.  

### Phase 2 — Active Multisig  
- Upgraded to **3-of-5 multisig** for fund releases:  
  - 2 signers from the **Cardano** community  
  - 2 signers from the **Cosmos** community  
  - 1 neutral **advisor** (focused on security or auditing)  

Signers and their verified public handles will be listed in [`SIGNERS.md`](./SIGNERS.md).  

---

## 🧩 Milestones & Releases  

| Milestone | Description | Escrow Release |
|------------|--------------|----------------|
| **M1** | Research & Design Spec | 10% |
| **M2** | Prototype components (light clients, relayers) + documentation | 35% |
| **M3** | Public Testnet Bridge + testing & validation plan | 35% |
| **M4** | Independent Security Review + Final Documentation | 20% |

**Release Rules:**  
- Each milestone requires a **public report** and **3-of-5 multisig approval**.  
- All code, documentation, and test results must be public before funds are released.  

---

## 📊 Transparency & Reporting  
- **Public dashboards and addresses** for every wallet.  
- **Bi-weekly updates** in [`UPDATES.md`](./UPDATES.md).  
- **Monthly financial reports** showing incoming/outgoing funds and balances.  

---

## 🔁 Refund / Reallocation Policy  
If there is **no measurable progress or public update for 12 months**, a **community review** will be initiated.  

Following that review, the community — together with at least **3 of 5 multisig signers** — will decide whether to:  
- Continue funding under new milestones,  
- Reassign funds to another development team, or  
- Return funds **pro-rata** to original contributors.  

This ensures accountability while allowing flexibility for complex technical work.  

---

## ⚖️ Fees  
- Only network or transaction fees are deducted.  
- No coordinator or management fees are taken from the escrow unless **explicitly approved** by public vote and recorded in [`UPDATES.md`](./UPDATES.md).  

---

## 🧾 Amendments  
Any change to this charter must:  
1. Be proposed publicly,  
2. Stay open for discussion for **at least 7 days**, and  
3. Receive **3-of-5 multisig approval** before being applied.  

---

## 👥 Contacts  
- **Project Lead:** [@Antonioizarazuh](https://x.com/Antonioizarazuh)  
- **Community Channel:** to be announced  

---

*Last updated: October 2025*  
