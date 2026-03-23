# Homebrew Tap for Everruns

Homebrew formulae for [Everruns](https://github.com/everruns/everruns) — a headless durable agentic harness engine.

## Installation

```bash
brew tap everruns/tap
brew install everruns
```

## Upgrade

```bash
brew upgrade everruns
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `everruns` | CLI for Everruns — run durable AI agents reliably and scalably |

## Updating Formulae

When a new Everruns release is published:

1. Update `url` and `sha256` in `Formula/everruns.rb` for each platform
2. Run `brew audit --strict --new Formula/everruns.rb` locally
3. Run `brew install --build-from-source Formula/everruns.rb` to verify
4. Open a PR — CI will lint and audit automatically
