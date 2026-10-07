# AI Learning Collection

Joe's AI learning notes, lab code, configs, evalsets, lab files and redacted screenshots, published as a Hugo + Hextra site for people to read and for AI to read.

- Catalogue: [INDEX.md](INDEX.md) · file tree: [TREE.txt](TREE.txt) · layout diagram: [layout.png](layout.png)
- AI-readable outputs: `/llms.txt` (index), `/llms-full.txt` (all notes in one file), and a raw `index.md` next to every HTML page

## Build locally

```bash
hugo server            # http://localhost:1313/ai-learning-collection/
hugo --minify          # static site in public/
```

Needs Hugo **extended** ≥ 0.146 (CI uses 0.167.0). The Hextra theme is a Hugo module vendored in `_vendor/` (`hugo mod vendor`), so builds work offline. Each track folder keeps its own `NOTES.md`; `hugo.toml` mounts it as a section page and publishes the folder's other files (code, configs, screenshots) next to it.

Deployment: `.github/workflows/hugo-pages.yml` (GitHub Pages, on push to `main`).

## Pre-commit leak check

A versioned pre-commit hook (`.githooks/pre-commit`, which runs `scripts/pii_scan.py`, Python 3 standard library only) blocks commits that would publish personal information or secrets. It only looks at the **staged** version of added or modified files.

- **Text files: offline rules, always on, no network.** It looks for:
  - emails, NZ/US/international phone numbers, dates of birth, street and PO Box addresses
  - IRD, passport, driver licence, NHI, SSN, NZ bank account, IBAN and Luhn-valid card numbers
  - API keys and tokens (`AIza…`, `sk-…`, GitHub, AWS, Slack, OAuth secrets, JWTs, bearer tokens), private keys, credentials inside URLs, `*_PASSWORD=` / `*_API_KEY=` style assignments
  - Qwiklabs usernames and project IDs, long engine/resource IDs, and `.env` or key files

  Word documents and spreadsheets are unpacked and checked as text. `_vendor/`, `public/`, `resources/`, lockfiles and non-image binaries are skipped.
- **Images are checked visually.** Staged PNG, JPEG, WebP and GIF files are sent one at a time to a vision model on any OpenAI-compatible Chat Completions endpoint that accepts `image_url` inputs. Results are cached per image in `.git/pii-scan-cache.json`, so an unchanged image isn't sent again. Only staged images are sent; text never leaves the machine.
- **What blocks a commit:** high-confidence findings block it and print a table with masked snippets. Medium and low findings are warnings only.

### Enable after cloning (each device)

```bash
sh scripts/install-hooks.sh
```

This sets `git config core.hooksPath .githooks` (local to the clone), checks for `python3`, and lists which provider settings it found and where from. Values are never printed. You can re-check at any time with `python3 scripts/pii_scan.py --show-config`.

### Configure the vision provider (per user, never committed)

Settings come from environment variables first, then `.pii-scan.env` in the repo root (git-ignored), then `~/.config/pii-scan/env` (for every repo on the device). Copy [`.pii-scan.env.example`](.pii-scan.env.example) to start.

| Variable | Purpose |
|---|---|
| `PII_SCAN_BASE_URL` | OpenAI-compatible base URL; `/chat/completions` is appended |
| `PII_SCAN_API_KEY` | Bearer key for that endpoint (can be empty for keyless local endpoints) |
| `PII_SCAN_MODEL` | Vision-capable model id. Required with `PII_SCAN_BASE_URL` |
| `ICA_BASE_API_URL`, `ICA_API_KEY` | IBM ICA fallback, used only when `PII_SCAN_BASE_URL` is unset. Model defaults to `gemini-3.6-flash` |
| `PII_SCAN_REASONING` | Optional `reasoning_effort`, sent only when set. On the ICA fallback it defaults to `low`; `off` disables it |
| `PII_SCAN_USER_AGENT` | HTTP User-Agent (default `pii-scan-precommit/1.0`; some gateways reject Python's default) |
| `PII_SCAN_TIMEOUT` / `PII_SCAN_TOTAL_TIMEOUT` / `PII_SCAN_WORKERS` | 30 s per image / 300 s total / 4 parallel requests |
| `PII_SCAN_NO_CACHE=1` | Ignore the per-image cache |
| `PII_SCAN_ALLOW_OFFLINE=1` | Don't block when staged images couldn't be checked |

Generic provider example (`.pii-scan.env`):

```bash
PII_SCAN_BASE_URL=https://llm-gateway.example.com/v1
PII_SCAN_API_KEY=...
PII_SCAN_MODEL=your-vision-model-id
```

IBM ICA example (an existing `ICA_*` environment works unchanged):

```bash
ICA_BASE_API_URL=https://...   # your ICA OpenAI-compatible base URL
ICA_API_KEY=...
```

### Fail-closed behaviour and overrides

- If images are staged and the vision check can't complete (no provider configured, gateway error, timeout, or image input rejected), the commit is **blocked**. Commits with no images never need a provider.
- `PII_SCAN_ALLOW_OFFLINE=1` accepts unchecked images for that run. The text rules still apply.
- **False positives:** add a narrow regex to `.pii-allowlist`. A plain line is matched against the flagged value and its source line; `path:<regex>` silences a whole file, which is the only way to accept an image finding.
- **Manual runs:** `python3 scripts/pii_scan.py` (staged), `--all` (every working file), `--paths a b`.
- **Deliberate bypass:** `git commit --no-verify`.
