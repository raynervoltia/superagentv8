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

### Capability Domains
- **Blockchain & Smart Contract Security** — Solidity/Vyper/Rust, DeFi (Lending/DEX/Bridge/Perps/CDP), oracle manipulation, MEV, flash loan, proxy upgrade, reentrancy, access control, fee-on-transfer/rebase edge cases
- **Web Application & API Security** — recon, source map analysis, OpenAPI/GraphQL, JWT/OAuth, SQL/SSRF/SSTI/XXE/command injection, CORS/CSP, IDOR/mass assignment
- **Infrastructure & Network Security** — port scanning, cloud bucket/IAM, container escape, CI/CD pipeline injection

---

## 🚀 Quick Install

### opencode (SST)

```bash
# Clone private repo (butuh access)
git clone https://github.com/raynervoltia/superagentv8.git
cd superagentv8

# Install ke project saat ini
bash scripts/install.sh opencode

# Atau install global ke ~/.config/opencode
bash scripts/install.sh opencode ~/.config/opencode

# Restart opencode
opencode
# Pilih agent: superagent
```

Atau manual:
```bash
cp -R profiles/opencode/.opencode ./
cp profiles/opencode/opencode.json ./opencode.json
cp profiles/opencode/AGENTS.md ./AGENTS.md
```

### Verifikasi
```bash
# Cek agent terload
cat ~/.config/opencode/agent/superagent.md
# atau
ls .opencode/agent/
```

---

## 📁 Repo Structure

```
superagentv8/
├── .opencode/
│   └── agent/
│       ├── superagent.md      → Primary agent (SUPERAGENT v8.0)
│       └── researcher.md      → BREACH v4.0 dual-model research variant
├── profiles/
│   └── opencode/
│       ├── opencode.json      → Sanitized opencode config (provider + model)
│       ├── AGENTS.md          → Project rules auto-loaded
│       └── .opencode/
│           └── agent/
│               ├── superagent.md
│               └── researcher.md
├── opencode.json              → Root config (symlink-friendly)
├── AGENTS.md                  → Global instructions
├── scripts/
│   ├── install.sh             → One-command installer
│   └── sync-all.sh            → Sync placeholder
├── docs/
│   └── opencode.md            → Detailed opencode guide
├── examples/                  → Sample usage (soon)
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🧠 Agent Details

| Field | Value |
|-------|-------|
| **Name** | `superagent` |
| **Description** | Professional security engineering assistant for authorized vulnerability research |
| **Mode** | `primary` |
| **Model** | `gloo/gloo-anthropic-claude-opus-5` |
| **Temperature** | `0.2` |
| **Color** | `#ff4400` |
| **Permissions** | `edit: allow`, `bash: allow`, `read: allow`, `write: allow`, `webfetch: allow` |

Secondary agent `researcher` (BREACH v4.0) — dual-model `gloo/gloo-deepseek-v4-flash` → `gloo-deepseek-v4-pro` untuk deep reasoning research.

---

## ⚙️ Configuration

### Provider Setup

`opencode.json` sudah include 2 provider sanitized (tanpa hardcoded API key):

- **gloo** — `https://platform.ai.gloo.com/ai/v2` (Claude Opus 5, DeepSeek V4)
- **deepseek** — `https://api.deepseek.com/v1` (DeepSeek V3/R1/Coder)

Set API key via environment variable atau edit `opencode.jsonc`:

```bash
# Option 1: env var (recommended, private repo tetap jangan commit secrets!)
export GLOO_API_KEY="sk_..."
export DEEPSEEK_API_KEY="sk_..."

# Option 2: edit provider.options.apiKey di opencode.jsonc
# Ganti YOUR_GLOO_API_KEY_HERE / YOUR_DEEPSEEK_API_KEY_HERE
```

Validasi schema: `https://opencode.ai/config.json`  
Restart opencode setiap habis edit config: quit → `opencode`

### Default Agent

```json
{
  "model": "gloo/gloo-anthropic-claude-opus-5",
  "default_agent": "superagent"
}
```

Tekan `Tab` untuk switch agent: `superagent` ↔ `researcher` ↔ `build`/`plan` jika ada.

---

## 🔧 Usage

### Smart Contract Audit

```
Prompt: "Audit contract 0x... di Ethereum mainnet, fokus reentrancy + oracle manipulation"
→ SUPERAGENT akan: recon → source analysis → attack surface mapping → adversarial modeling → Foundry PoC → validation on fork → report + remediation
```

### Web App Assessment

```
Prompt: "Assess https://target.example.com (scope authorized), enumerasi API & test IDOR"
→ SUPERAGENT akan: recon → crawling → asset discovery → param analysis → fuzzing → injection → auth analysis → attack chain → curl PoC
```

### Output Standards

- **Quick:** 1-3 lines direct answer
- **Standard:** Working PoC code + next step
- **Comprehensive:** Structured audit (severity Immunefi: Critical/High/Medium/Low/Informational, PoC executable, remediation, impact)

---

## 📚 Documentation

- [opencode Setup](docs/opencode.md) — detailed install & troubleshooting
- [SUPERAGENT Profile](profiles/opencode/.opencode/agent/superagent.md) — full persona definition
- [BREACH Researcher](.opencode/agent/researcher.md) — dual-model research variant

---

## 🔐 Security & Disclosure

- Tool untuk **authorized professionals** — hanya test pada sistem yang kamu miliki / bug bounty dengan explicit scope.
- Output adalah work product untuk responsible disclosure (Immunefi, Hats, Cantina, Code4rena, Sherlock).
- Repo ini **private** — jangan share token atau API key di commit.

---

## 🛠️ Scripts

```bash
bash scripts/install.sh opencode        # install opencode profile ke $PWD
bash scripts/install.sh opencode ~/.config/opencode  # install global
bash scripts/sync-all.sh                # sync placeholder (manual sync)
```

---

## 👤 Author

**Rayner Voltia** — https://github.com/raynervoltia

SUPERAGENT v8.0 terinspirasi dari kebutuhan real bug bounty & audit: butuh tool yang langsung deliver **executable proof**, bukan teori.

---

## 📄 License

MIT — Use it, fork it, ship it. Lihat [LICENSE](LICENSE).

---

**SUPERAGENT v8.0 · Ship exploits, not excuses. 🛡️⚡**
