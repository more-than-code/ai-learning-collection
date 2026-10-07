#!/bin/sh
# Enable the versioned git hooks in this clone and report the pii-scan settings (values are never shown).
# Usage (from anywhere inside the repo):  sh scripts/install-hooks.sh
set -e
root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "install-hooks: run this inside the git repository" >&2; exit 1; }
cd "$root"

if ! command -v python3 >/dev/null 2>&1; then
  echo "install-hooks: python3 not found. The pre-commit hook needs Python 3 (standard library only) and will" >&2
  echo "               block commits until it is installed." >&2
  exit 1
fi
echo "python3: $(python3 --version 2>&1)"

chmod +x .githooks/pre-commit scripts/pii_scan.py scripts/install-hooks.sh 2>/dev/null || true
git config core.hooksPath .githooks
echo "git config core.hooksPath = $(git config --get core.hooksPath)  (local to this clone)"
echo

python3 scripts/pii_scan.py --show-config
echo
echo "Hook enabled. Text files are always checked offline; images need the vision provider above."
echo "Configure it via environment variables, .pii-scan.env (copy .pii-scan.env.example) or ~/.config/pii-scan/env."
echo "Bypass a single commit deliberately with: git commit --no-verify"
