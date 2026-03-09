#!/usr/bin/env bash
set -euo pipefail

CLAUDE_DIR="${HOME}/.claude"
PLUGINS_DIR="${CLAUDE_DIR}/plugins"
SKILLS_DIR="${CLAUDE_DIR}/skills"
PLUGIN_NAME="agentloops"

SKILLS=(clarify design planning execute review)

# Colors
if [ -t 1 ]; then
  GREEN='\033[0;32m'; YELLOW='\033[0;33m'; RESET='\033[0m'
else
  GREEN=''; YELLOW=''; RESET=''
fi

info() { echo -e "${GREEN}✓${RESET} $1"; }
warn() { echo -e "${YELLOW}!${RESET} $1"; }

echo "Uninstalling ${PLUGIN_NAME}"
echo ""

# 1. Remove skill symlinks
for skill in "${SKILLS[@]}"; do
  link="${SKILLS_DIR}/${PLUGIN_NAME}-${skill}"
  if [ -L "${link}" ]; then
    rm "${link}"
    info "Removed skill symlink: ${PLUGIN_NAME}-${skill}"
  elif [ -e "${link}" ]; then
    warn "Skipped ${link} (not a symlink, may be manually created)"
  fi
done

# 2. Remove plugin symlink (but NOT the repo itself)
plugin_link="${PLUGINS_DIR}/${PLUGIN_NAME}"
if [ -L "${plugin_link}" ]; then
  rm "${plugin_link}"
  info "Removed plugin symlink: ${plugin_link}"
elif [ -d "${plugin_link}" ]; then
  warn "Plugin at ${plugin_link} is a directory (not a symlink), not removing."
  warn "If you want to fully remove, delete it manually: rm -rf ${plugin_link}"
fi

echo ""
echo "Done. Removed:"
echo "  - ${SKILLS_DIR}/${PLUGIN_NAME}-* symlinks"
echo "  - ${PLUGINS_DIR}/${PLUGIN_NAME} symlink"
echo ""
echo "Your repo is untouched. You can re-install anytime with ./install.sh"
