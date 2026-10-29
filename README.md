# 🤖 AgentSyndicate: Trust-Aware Autonomous Agent Delegation

AgentSyndicate is a decentralized autonomous task orchestration and delegation framework running on the **Avalanche Fuji Testnet**. It enables a Lead Agent to discover, assess the trust of, and pay Worker Agents dynamically to execute specialized tasks.

---

## 📂 Project Structure & Architecture

The project is structured into four primary modules, dividing concerns cleanly across on-chain registries, orchestrator business logic, execution workers, and client dashboard visuals:

```
agentsyndicate/
├── contracts/             # Solidity Smart Contracts (Hardhat Suite)
│   ├── contracts/         # Registries (Identity, Reputation, Validation, MockUSDC)
│   └── scripts/           # Hardhat deployment & seeding scripts
├── lead-agent/            # Asynchronous FastAPI Orchestrator (Python)
│   ├── main.py            # Slim entry point bootloader
│   └── app/               # 3-Tier Layered Backend package
│       ├── infrastructure/# JSON-RPC blockchain caller & helpers
│       ├── services/      # Asynchronous risk check & settlement logic
│       ├── controllers/   # APIRouter endpoints (run-task & health)
│       └── config.py      # App env config and address cacher
├── worker/                # Express Task Execution Worker (Node.js)
│   └── index.js           # x402 payment processor & Gemini API caller
├── frontend/              # Interactive Client Telemetry Dashboard (Next.js)
│   ├── app/               # Theme layouts & globals.css with Neon Glass effects
│   └── components/        # Wallet cards, log console, and document viewers
├── .vscode/               # IDE interpreter pathing maps
├── run_project.bat        # Master one-click services startup script
└── deploy_usdc_on_fuji.bat# Helper script to deploy MockUSDC token
```

---

## ⚙️ Setup & Configuration

Configure your environment variables in a single `.env` file placed in the **project root** directory:

```env
# Avalanche Fuji C-Chain JSON-RPC endpoint
RPC_URL=https://api.avax-test.network/ext/bc/C/rpc

# Private keys for transaction signing (AVAX funded)
PRIVATE_KEY=0x...
FUJI_PRIVATE_KEY=0x...
WORKER_PRIVATE_KEY=0x...

# Google Gemini API key for academic worker generation
GEMINI_API_KEY=AIzaSy...
```

---

## 🚀 Running the Project

To spin up all services concurrently, run the one-click startup script from the root directory:

```bash
run_project.bat
```

This script will:
1. Scan and clean up any processes listening on ports `3000` (Next.js), `4000` (Worker Node), and `5000` (Lead Agent).
2. Start the FastAPI orchestrator on port `5000`.
3. Boot the Node.js worker node on port `4000`.
4. Open the Next.js telemetry client on `http://localhost:3000`.
