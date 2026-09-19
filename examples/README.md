# Examples — SUPERAGENT v8.0

Kumpulan contoh prompt & workflow pakai SUPERAGENT v8.0 di opencode.

## Smart Contract Audit

```bash
opencode --agent superagent
```

> "Audit https://github.com/example/defi-lending, fokus pada flash loan + oracle TWAP manipulation. Buatkan Foundry test PoC."

Expected output: recon → source analysis → attack surface → adversarial modeling → `test/PoC.t.sol` → `forge test --fork-url $RPC` → report.

## Web App — Authorized Bug Bounty

> "Target: https://shop.example.com (scope: *.example.com, program di Immunefi). Enumerasi API, cari IDOR di /api/cart dan SSRF di /api/webhook. Kasih curl PoC + impact."

## Infra — Cloud Bucket

> "Cek bucket S3 `s3://example-assets` permissions dan IAM, plus metadata SSRF di http://169.254.169.254. Kasih remediation."

---

Tambahkan contoh kamu via PR.
