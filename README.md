# 🎓 EduChainDAO — Decentralized Scholarship Voting System

---

## 📌 Overview

EduChainDAO is a blockchain-based decentralized application (dApp) that enables transparent and tamper-proof scholarship allocation using DAO governance.

Students apply for scholarships by submitting their documents via IPFS, and DAO members vote to approve or reject applications based on a quorum-based decision system.

---

## 🎯 Objective

To eliminate bias and improve transparency in scholarship distribution by:

* Decentralizing decision-making
* Ensuring fair voting through DAO members
* Storing student applications securely using IPFS

---

## 🚀 Key Features

* 📝 **Scholarship Application System** (via IPFS hash)
* 🗳️ **DAO-Based Voting Mechanism**
* 🔒 **One Member = One Vote (no double voting)**
* 👥 **Role-Based Access (Owner & Members)**
* 📊 **Quorum-Based Finalization (≥50% participation)**
* 🌐 **Blockchain Transparency & Immutability**

---

## ⚙️ Smart Contract Logic

### 👤 Roles

* **Owner** → Can add DAO members
* **Members** → Can vote and finalize applications

---

### 📥 Application Flow

1. Student submits application (IPFS hash stored on-chain)
2. Application is recorded with:

   * Student address
   * Vote counts (approve/reject)
   * Status flags

---

### 🗳️ Voting System

* Only DAO members can vote
* Each member can vote **once per application**
* Votes:

  * `true` → Approve
  * `false` → Reject

---

### ✅ Finalization Rules

* At least **50% of DAO members must vote** (quorum)
* Decision logic:

  * Approve if `approve > reject`
  * Otherwise → Reject
* Once finalized → cannot be changed

---

## 🖥 Frontend Features

* Connect wallet (private key via Ethers.js)
* Apply for scholarship using IPFS hash
* Vote (Approve / Reject)
* Finalize applications
* View all applications with:

  * Status (Pending / Approved / Rejected)
  * Vote counts
  * Direct IPFS document link

---

## 🛠 Tech Stack

* **Solidity (0.8.x)** — Smart Contract
* **Ethereum (Ganache)** — Local Blockchain
* **Ethers.js** — Contract Interaction
* **HTML + Bootstrap** — Frontend UI
* **IPFS (Pinata)** — Decentralized Storage

---

## 📁 Project Structure

* `EduChainDAO.sol` → Smart contract logic
* `index.html` → Frontend UI
* `/scripts` → Deployment scripts (if used)

---

## ▶️ How to Run

### 1. Start Ganache

Run local blockchain on:

```bash
http://127.0.0.1:7545
```

---

### 2. Deploy Smart Contract

* Compile and deploy using Remix or Hardhat
* Copy deployed contract address
* Replace in `index.html`:

```js
const address = "YOUR_CONTRACT_ADDRESS";
```

---

### 3. Run Frontend

* Open `index.html` in browser
* Click **Connect Wallet**
* Enter private key from Ganache

---

### 4. Use the App

* Apply using IPFS hash
* Vote as DAO member
* Finalize when quorum is met

---

## 🔐 Security Features

* Prevents double voting
* Role-based access control
* Immutable application records
* Transparent vote tracking

---

## 📈 Future Improvements

* MetaMask integration (instead of private key input)
* File upload directly to IPFS from UI
* Token-based DAO governance
* Smart contract upgradeability
* Deployment on public testnet (Goerli / Sepolia)

---

## 👩‍💻 Author

* **Vidhya Chetan**

---

## 🎉 Conclusion

EduChainDAO demonstrates how blockchain and DAO principles can be applied to real-world problems like scholarship distribution, ensuring fairness, transparency, and trust in decision-making.


Note: This project currently uses Ganache (local blockchain) for development and testing. 
It can be extended to MetaMask and public testnets like Sepolia.
