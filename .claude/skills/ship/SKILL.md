---
name: ship
description: Goal-oriented workflow for landing a Homebrew formula change safely. Use when the user asks to ship, update a formula, or drive PR/CI/merge to completion.
user-invocable: true
---

# Ship

Goal: land the requested change safely, with evidence, and merge only after CI is green.

## When To Use

Use this skill when the user asks to:

- ship or fix and ship a change
- take work through validation, PR creation, CI, and merge
- prove a branch is merge-ready

## Required Outcomes

1. The branch state is safe.
   - Do not ship from `main` or `master`.
   - Rebase onto latest `origin/main` before merge.
2. The requested goal is achieved with evidence.
   - Review the delta with `git diff origin/main...HEAD`.
   - Confirm the formula is correct.
3. The formula passes linting.
   - Run `brew audit --strict Formula/*.rb` if possible, or verify CI does it.
4. The PR is mergeable and merged safely.
   - Push the branch.
   - Create or update the PR.
   - Address every review comment.
   - Wait for CI to go green.
   - Merge with squash only after CI is green.

## PR And Merge

- Use a conventional-commit style PR title.
- Explain what changed, why, and how it was validated.
- Use `gh pr view --json url` to detect an existing PR.
- Create with `gh pr create` if needed.
- Check CI with `gh pr checks`.
- Merge with `gh pr merge --squash` only after CI is green.
