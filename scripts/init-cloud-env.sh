#!/usr/bin/env bash

# Cloud agent initialization for homebrew-tap.
# Installs gh + doppler, configures GitHub auth.
#
# Usage: ./scripts/init-cloud-env.sh

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

INSTALL_DIR="${HOME}/.cargo/bin"
mkdir -p "$INSTALL_DIR"
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  export PATH="$INSTALL_DIR:$PATH"
fi

install_gh() {
  if command -v gh &>/dev/null; then
    info "gh already installed: $(gh --version | head -1)"
    return 0
  fi

  info "Installing gh (GitHub CLI)..."
  ARCH=$(uname -m)
  case "$ARCH" in
    x86_64) GH_ARCH="amd64" ;;
    aarch64) GH_ARCH="arm64" ;;
    *) error "Unsupported architecture: $ARCH" ;;
  esac

  GH_VERSION="2.63.2"
  GH_TARBALL="gh_${GH_VERSION}_linux_${GH_ARCH}.tar.gz"
  GH_URL="https://github.com/cli/cli/releases/download/v${GH_VERSION}/${GH_TARBALL}"

  TEMP_DIR=$(mktemp -d)
  trap "rm -rf $TEMP_DIR" EXIT

  curl -fsSL --connect-timeout 10 --max-time 60 --retry 2 --retry-delay 2 "$GH_URL" -o "$TEMP_DIR/$GH_TARBALL"
  tar -xzf "$TEMP_DIR/$GH_TARBALL" -C "$TEMP_DIR"
  cp "$TEMP_DIR/gh_${GH_VERSION}_linux_${GH_ARCH}/bin/gh" "$INSTALL_DIR/gh"
  chmod +x "$INSTALL_DIR/gh"

  command -v gh &>/dev/null && info "gh installed: $(gh --version | head -1)" || error "Failed to install gh"
}

install_doppler() {
  if command -v doppler &>/dev/null; then
    info "doppler already installed: $(doppler --version 2>/dev/null)"
    return 0
  fi

  info "Installing Doppler CLI..."
  ARCH=$(uname -m)
  case "$ARCH" in
    x86_64) DOP_ARCH="amd64" ;;
    aarch64) DOP_ARCH="arm64" ;;
    *) error "Unsupported architecture: $ARCH" ;;
  esac

  DOP_VERSION="3.75.2"
  DOP_TARBALL="doppler_${DOP_VERSION}_linux_${DOP_ARCH}.tar.gz"
  DOP_URL="https://github.com/DopplerHQ/cli/releases/download/${DOP_VERSION}/${DOP_TARBALL}"

  TEMP_DIR=$(mktemp -d)
  trap "rm -rf $TEMP_DIR" EXIT

  curl -fsSL --connect-timeout 10 --max-time 60 --retry 2 --retry-delay 2 "$DOP_URL" -o "$TEMP_DIR/$DOP_TARBALL"
  tar -xzf "$TEMP_DIR/$DOP_TARBALL" -C "$TEMP_DIR"
  cp "$TEMP_DIR/doppler" "$INSTALL_DIR/doppler"
  chmod +x "$INSTALL_DIR/doppler"

  command -v doppler &>/dev/null && info "doppler installed: $(doppler --version 2>/dev/null)" || error "Failed to install doppler"
}

configure_gh_repo() {
  if ! command -v gh &>/dev/null; then
    warn "gh not installed, skipping repo config"
    return 0
  fi

  local remote_url repo
  remote_url=$(git remote get-url origin 2>/dev/null || echo "")
  [[ -z "$remote_url" ]] && return 0

  # Extract owner/repo from proxy or GitHub URL
  if [[ "$remote_url" =~ github\.com[:/]([^/]+/[^/.]+) ]]; then
    repo="${BASH_REMATCH[1]}"
  elif [[ "$remote_url" =~ /git/([^/]+/[^/.]+) ]]; then
    repo="${BASH_REMATCH[1]}"
  else
    warn "Could not extract repo from: $remote_url"
    return 0
  fi
  repo="${repo%.git}"

  # Add 'github' remote if origin uses a proxy
  if [[ ! "$remote_url" =~ github\.com ]]; then
    local github_url="https://github.com/${repo}.git"
    if ! git remote get-url github &>/dev/null; then
      info "Adding 'github' remote: $github_url"
      git remote add github "$github_url"
    fi
    git fetch github main 2>/dev/null || warn "Failed to fetch github/main"
    gh repo set-default github 2>/dev/null && info "gh default repo set: $repo" || warn "Failed to set default repo"
  else
    gh repo set-default "$repo" 2>/dev/null && info "gh default repo set: $repo" || warn "Failed to set default repo"
  fi
}

configure_gh_auth() {
  if ! command -v gh &>/dev/null; then return 0; fi

  if command -v doppler &>/dev/null; then
    if doppler run -- bash -lc 'GH_TOKEN="$GITHUB_TOKEN" gh auth status >/dev/null 2>&1'; then
      info "gh authenticated via Doppler token"
      return 0
    fi
  fi

  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    GH_TOKEN="$GITHUB_TOKEN" gh auth status >/dev/null 2>&1 && info "gh authenticated via GITHUB_TOKEN" || warn "GITHUB_TOKEN present but auth failed"
    return 0
  fi

  warn "gh not authenticated. Run: doppler run -- bash -lc 'GH_TOKEN=\"\$GITHUB_TOKEN\" gh auth status'"
}

configure_doppler() {
  [[ -z "${DOPPLER_TOKEN:-}" ]] && return 0
  command -v doppler &>/dev/null || return 0

  doppler setup --project everruns-dev --config dev --no-interactive 2>/dev/null \
    && info "Doppler configured" || warn "Failed to configure Doppler"
}

main() {
  echo "========================================"
  echo " homebrew-tap: Cloud Environment Init"
  echo "========================================"

  START_TIME=$(date +%s)

  install_gh & PID_GH=$!
  install_doppler & PID_DOP=$!

  FAILED=0
  wait $PID_GH || FAILED=1
  wait $PID_DOP || FAILED=1
  [[ "$FAILED" -eq 1 ]] && error "Tool install failed"

  configure_gh_repo
  configure_doppler
  configure_gh_auth

  END_TIME=$(date +%s)
  echo ""
  info "Ready in $((END_TIME - START_TIME))s"
  echo ""
  echo "Next: doppler run -- bash -lc 'GH_TOKEN=\"\$GITHUB_TOKEN\" gh pr create ...'"
  echo "========================================"
}

main "$@"
