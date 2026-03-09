#!/usr/bin/env bash
set -euo pipefail

CLAUDE_DIR="${HOME}/.claude"
PLUGINS_DIR="${CLAUDE_DIR}/plugins"
SKILLS_DIR="${CLAUDE_DIR}/skills"
PLUGIN_NAME="agentloops"

# Resolve the repo's absolute path (where this script lives)
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

SKILLS=(clarify design planning execute review)

# Colors (no-op if not a terminal)
if [ -t 1 ]; then
  GREEN='\033[0;32m'; YELLOW='\033[0;33m'; RED='\033[0;31m'; RESET='\033[0m'
else
  GREEN=''; YELLOW=''; RED=''; RESET=''
fi

info()  { echo -e "${GREEN}✓${RESET} $1"; }
warn()  { echo -e "${YELLOW}!${RESET} $1"; }
error() { echo -e "${RED}✗${RESET} $1" >&2; }

# ── Preflight ──────────────────────────────────────────────

# Verify skill files exist in this repo
for skill in "${SKILLS[@]}"; do
  if [ ! -f "${REPO_DIR}/skills/${skill}/SKILL.md" ]; then
    error "Missing skills/${skill}/SKILL.md — is this the right directory?"
    exit 1
  fi
done

# ── Install ────────────────────────────────────────────────

echo "Installing ${PLUGIN_NAME} into ${CLAUDE_DIR}"
echo ""

# 1. Ensure directories exist
mkdir -p "${PLUGINS_DIR}" "${SKILLS_DIR}"

# 2. Symlink repo → ~/.claude/plugins/agentloops
PLUGIN_LINK="${PLUGINS_DIR}/${PLUGIN_NAME}"

if [ "${REPO_DIR}" = "${PLUGIN_LINK}" ]; then
  # Repo is already at the plugin location (no symlink needed)
  info "Plugin directory: ${PLUGIN_LINK} (direct)"
elif [ -L "${PLUGIN_LINK}" ]; then
  existing="$(readlink "${PLUGIN_LINK}")"
  if [ "${existing}" = "${REPO_DIR}" ]; then
    info "Plugin symlink already exists: ${PLUGIN_LINK} → ${REPO_DIR}"
  else
    warn "Plugin symlink points elsewhere: ${existing}"
    warn "Updating to: ${REPO_DIR}"
    ln -sfn "${REPO_DIR}" "${PLUGIN_LINK}"
    info "Plugin symlink updated"
  fi
elif [ -e "${PLUGIN_LINK}" ]; then
  error "${PLUGIN_LINK} exists but is not a symlink. Please remove it first."
  exit 1
else
  ln -s "${REPO_DIR}" "${PLUGIN_LINK}"
  info "Plugin symlink: ${PLUGIN_LINK} → ${REPO_DIR}"
fi

# 3. Symlink each skill → ~/.claude/skills/agentloops-<name>
#    Uses relative path so it works portably through the plugin symlink
for skill in "${SKILLS[@]}"; do
  link="${SKILLS_DIR}/${PLUGIN_NAME}-${skill}"
  target="../plugins/${PLUGIN_NAME}/skills/${skill}"

  if [ -L "${link}" ]; then
    existing="$(readlink "${link}")"
    if [ "${existing}" = "${target}" ]; then
      info "Skill ${skill}: already linked"
    else
      ln -sfn "${target}" "${link}"
      info "Skill ${skill}: updated"
    fi
  elif [ -e "${link}" ]; then
    warn "Skill ${skill}: ${link} exists but is not a symlink, skipping"
  else
    ln -s "${target}" "${link}"
    info "Skill ${skill}: linked"
  fi
done

# ── Summary ────────────────────────────────────────────────

echo ""
echo "Done. Installed:"
echo "  Plugin:  ${PLUGIN_LINK} → ${REPO_DIR}"
for skill in "${SKILLS[@]}"; do
  echo "  Skill:   ${PLUGIN_NAME}-${skill}"
done

echo ""
echo "What was touched:"
echo "  - ${PLUGINS_DIR}/${PLUGIN_NAME}  (symlink)"
echo "  - ${SKILLS_DIR}/${PLUGIN_NAME}-* (symlinks × ${#SKILLS[@]})"
echo "  - Nothing else. No config files modified."

echo ""
echo "To uninstall:  ${REPO_DIR}/uninstall.sh"
echo "To update:     cd ${REPO_DIR} && git pull"
