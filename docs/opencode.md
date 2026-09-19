# opencode Setup — SUPERAGENT v8.0

> Guide lengkap pakai SUPERAGENT v8.0 di opencode (SST).

## 1. Prerequisites

- opencode terinstall: `npm i -g opencode` atau `bun i -g opencode` — https://opencode.ai
- Node.js v20+ / Bun
- Git
- API key: Gloo (`sk_...`) dan/atau DeepSeek. Dapatkan di:
  - Gloo AI: https://platform.ai.gloo.com
  - DeepSeek: https://platform.deepseek.com

## 2. Install Profile

### Option A — One-command installer (recommended)

```bash
git clone https://github.com/raynervoltia/superagentv8.git
cd superagentv8

# Install ke project current
bash scripts/install.sh opencode

# Atau install global
bash scripts/install.sh opencode ~/.config/opencode

# Restart opencode
opencode
```

Installer akan copy:
- `AGENTS.md` → project root / global
- `opencode.json` → merge ke config (backup otomatis .bak jika exists)
- `.opencode/agent/superagent.md` + `researcher.md` → `.opencode/agent/`

### Option B — Manual copy

```bash
# Dari dalam repo superagentv8
cp AGENTS.md /path/to/your/project/AGENTS.md
cp opencode.json /path/to/your/project/opencode.json
mkdir -p /path/to/your/project/.opencode/agent
cp .opencode/agent/superagent.md /path/to/your/project/.opencode/agent/
cp .opencode/agent/researcher.md /path/to/your/project/.opencode/agent/
```

### Option C — Symlink (dev mode, auto-update)

```bash
ln -s /abs/path/superagentv8/.opencode/agent/superagent.md ~/.config/opencode/agent/superagent.md
ln -s /abs/path/superagentv8/AGENTS.md ~/your-project/AGENTS.md
```

## 3. Konfigurasi API Key

opencode config pakai `{env:GLOO_API_KEY}` dan `{env:DEEPSEEK_API_KEY}` placeholder. Set env:

```bash
# ~/.bashrc atau ~/.zshrc
export GLOO_API_KEY="sk_cEpwp..."
export DEEPSEEK_API_KEY="sk-..."

# atau .env di project (jangan commit!)
echo 'GLOO_API_KEY=sk_...' >> .env
```

Alternatif: edit langsung `opencode.json` → ganti `{env:GLOO_API_KEY}` jadi `"sk_..."` (tidak recommended untuk repo public).

Cek validasi:
```bash
opencode validate  # jika tersedia
# atau
cat opencode.json | jq .provider
```

## 4. Verifikasi Install

```bash
opencode --help
opencode

# Dalam TUI opencode:
# - Tekan Tab → lihat list agent: superagent, researcher, build, plan
# - Pilih superagent — prompt harusnya load SUPERAGENT v8.0 persona
# - Test: "who are you" → harus jawab sebagai SUPERAGENT v8.0

ls -la .opencode/agent/
cat .opencode/agent/superagent.md | head -n 20
cat opencode.json | grep default_agent
```

## 5. Usage

### Pilih Agent

- `superagent` — security engineering (audit, PoC exploit, bug bounty)
- `researcher` — BREACH v4.0 deep research (OSINT, automation, multi-step chains)

Ganti agent: `Tab` di opencode TUI, atau `--agent superagent` flag jika CLI.

### Contoh Prompt

```
# Smart contract audit
Audit contract di 0xabc... di mainnet, cek reentrancy dan oracle manipulation. Buatkan Foundry PoC.

# Web app (authorized scope)
Assess https://target.example.com (scope: *.example.com), enumerate API, test IDOR dan mass assignment. Kasih curl PoC.

# Infra
Scan buckets S3 di target, cek IAM misconfig dan metadata SSRF.
```

Output default: working PoC + next step + bounty estimate.

## 6. Troubleshooting

| Masalah | Solusi |
|---------|--------|
| `ConfigInvalidError` opencode gagal start | `cat opencode.json` valid JSON? Check `$schema`. Gunakan escape hatch: `OPENCODE_DISABLE_PROJECT_CONFIG=1 opencode` lalu edit file broken. |
| Agent `superagent` tidak muncul | Pastikan file di `~/.config/opencode/agent/superagent.md` atau `.opencode/agent/superagent.md`. Restart opencode. |
| Model `gloo/...` not found | Set `GLOO_API_KEY` env, atau ganti `model` di `opencode.json` ke `deepseek/deepseek-chat`. |
| Permission denied saat edit/bash | Cek `opencode.json` → `agent.superagent.permission` — set `allow`. Restart. |
| Repo private clone fail | `git clone https://raynervoltia:TOKEN@github.com/raynervoltia/superagentv8.git` atau setup `gh auth login` + `gh repo clone`. |

### Escape Hatches

```bash
OPENCODE_DISABLE_PROJECT_CONFIG=1 opencode  # skip project opencode.json
OPENCODE_CONFIG=/path/to/custom.json opencode
OPENCODE_DISABLE_EXTERNAL_SKILLS=1 opencode
```

## 7. Update Profile

```bash
cd superagentv8
git pull
bash scripts/install.sh opencode ~/.config/opencode  # reinstall global
# restart opencode
```

## 8. Uninstall

```bash
rm ~/.config/opencode/agent/superagent.md
rm ~/.config/opencode/agent/researcher.md
# edit opencode.json: hapus entry "superagent" di agent, revert default_agent
```

---

**SUPERAGENT v8.0 · Docs by Rayner Voltia**
