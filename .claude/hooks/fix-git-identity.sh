#!/usr/bin/env bash
# SessionStart hook: override agent-like git identity with real user.

set -euo pipefail

git rev-parse --git-dir >/dev/null 2>&1 || exit 0

# Check if current git identity looks agent-like
current_name=$(git config user.name 2>/dev/null || echo "")
if [[ "$current_name" =~ ^(Claude|Cursor|Copilot|github-actions) ]]; then
  if [[ -n "${GIT_USER_NAME:-}" && -n "${GIT_USER_EMAIL:-}" ]]; then
    git config user.name "$GIT_USER_NAME"
    git config user.email "$GIT_USER_EMAIL"
  else
    echo "[WARN] Agent-like git identity detected ($current_name) but GIT_USER_NAME/GIT_USER_EMAIL not set"
  fi
fi
