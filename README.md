# SUPERAGENT v8.0 🛡️⚡

> Professional Security Engineering Assistant — opencode Agent Profile
> Industry-standard security research tooling for authorized professionals.

**Version:** 8.0  
**Author:** [Rayner Voltia](https://github.com/raynervoltia)  
**Repo:** https://github.com/raynervoltia/superagentv8  
**License:** MIT  
**Visibility:** Private

---

## 🎯 What is SUPERAGENT v8.0?

SUPERAGENT v8.0 adalah agent profile opencode yang mentransformasi AI menjadi **professional security engineering assistant** untuk authorized vulnerability research, smart contract auditing, exploit verification, dan coordinated disclosure via bug bounty programs.

Fungsinya setara dengan tool industri:
- **Burp Suite Professional** — web application security testing
- **Metasploit Framework** — penetration testing
- **Slither / Mythril** — smart contract analysis
- **Foundry / Hardhat** — exploit PoC development
- **Nmap / Nuclei** — network & vuln scanning

---

## 📦 Isi Repo

Repo ini hanya berisi **profile inti + installer** — model-agnostic, tanpa config provider, tanpa API key:

```
superagentv8/
├── README.md              → dokumentasi + cara pemasangan
├── LICENSE                → MIT
├── AGENTS.md              → SUPERAGENT v8.0 project rules (auto-loaded opencode)
├── agent/
│   ├── superagent.md      → SUPERAGENT v8.0 (primary agent)
│   └── researcher.md      → BREACH v4.0 (research agent)
└── scripts/
    └── install.sh         → installer (project / global)
```

### Agent

| Agent | File | Mode | Deskripsi |
|-------|------|------|-----------|
| **superagent** | `agent/superagent.md` | `primary` | Professional security engineering assistant — audit, exploit verification, Foundry PoC, bug bounty |
| **researcher** | `agent/researcher.md` | `all` | BREACH v4.0 — full-spectrum research: OSINT, automation, technical deep-dives |

Model & provider **tidak di-bundle** — set sendiri via opencode lu. Bebas pakai provider/model apa pun.

---

## 🚀 Installation

### Quick Install (script)

```bash
git clone https://github.com/raynervoltia/superagentv8.git
cd superagentv8

# Install ke project saat ini (./AGENTS.md + ./.opencode/agent/*.md)
bash scripts/install.sh project

# Install global (~/.config/opencode/) — aktif di semua session
bash scripts/install.sh global

# Restart opencode
opencode
```

### Manual Install

**Project-level** (hanya aktif di satu project):

```bash
cp AGENTS.md /path/to/ke/project/AGENTS.md
mkdir -p /path/to/ke/project/.opencode/agent
cp agent/*.md /path/to/ke/project/.opencode/agent/
```

**Global** (aktif di semua session):

```bash
cp AGENTS.md ~/.config/opencode/AGENTS.md
mkdir -p ~/.config/opencode/agent
cp agent/*.md ~/.config/opencode/agent/
```

### Model Setup

Profile ini model-agnostic:

1. Set provider + API key di config opencode lu sendiri (`opencode.json` / via TUI)
2. Pilih model favorit — agent bakal jalan di model apa pun
3. Tekan `Tab` di opencode untuk switch agent: `superagent` ↔ `researcher`

> Agent `researcher` (BREACH v4.0) dirancang sebagai dual-model variant: pakai **fast model** untuk task cepat, **deep-reasoning model** untuk riset kompleks. Set sesuai preferensi — routing escalation-nya udah ada di profile.

---

## ✅ Verifikasi

Setelah install, jalankan `opencode` lalu tanya:

```
who are you
```

- Agent **superagent** → harus jawab sebagai **SUPERAGENT v8.0**
- Agent **researcher** → harus jawab sebagai **BREACH v4.0**

---

## 🗑️ Uninstall

```bash
# Project-level
rm /path/to/ke/project/AGENTS.md
rm -rf /path/to/ke/project/.opencode/agent

# Global
rm ~/.config/opencode/AGENTS.md
rm -rf ~/.config/opencode/agent
```

---

## 📄 License

MIT © Rayner Voltia

**SUPERAGENT v8.0 · by Rayner Voltia · Ship exploits, not excuses. 🛡️⚡**
