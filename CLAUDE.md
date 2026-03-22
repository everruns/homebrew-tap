# Homebrew Tap — Agent Guidance

## Repository

This is a Homebrew tap (`everruns/homebrew-tap`). Formulae live in `Formula/`.

## Style

Telegraph. Drop filler/grammar. Min tokens.

## Formulae

- Each formula is a Ruby file in `Formula/`
- Pre-built binary formulae: no `depends_on "rust"`, just `bin.install`
- Source-build formulae: use `depends_on "rust" => :build` and `cargo build`
- Always include a `test do` block

## Linting

Run before pushing:

```bash
brew audit --strict --new Formula/*.rb
```

## Branch Base

Always work on top of latest main from remote:

```bash
git fetch origin main
```

## Commits

Conventional Commits: `type(scope): description`

Types: feat, fix, docs, chore

## Shipping

Ship means: achieve the goal, lint the formula, create a PR, wait for CI green, merge with squash.

Use `/ship` for the canonical shipping workflow.

## CI

GitHub Actions runs `brew audit` on every PR. Never merge when CI is red.
