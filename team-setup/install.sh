#!/bin/bash
#
# install.sh — Claude in One Day: Team Setup
#
# This script installs the global Claude configuration for your team.
# It copies the global CLAUDE.md and settings.json to ~/.claude/
#
# Usage:
#   chmod +x install.sh
#   ./install.sh
#
# What it does:
#   1. Creates ~/.claude/ if it doesn't exist
#   2. Backs up existing config (if any)
#   3. Copies global CLAUDE.md and settings.json
#   4. Creates the global skills directory
#
# Safe to run multiple times — existing backups are preserved.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
GLOBAL_SOURCE="$REPO_ROOT/global"
TARGET_DIR="$HOME/.claude"
BACKUP_DIR="$HOME/.claude.backup.$(date +%Y%m%d_%H%M%S)"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   Claude in One Day — Global Config Setup    ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# Check source files exist
if [ ! -f "$GLOBAL_SOURCE/CLAUDE.md" ]; then
    echo "ERROR: global/CLAUDE.md not found."
    echo "Make sure you're running this from the team-setup/ directory."
    exit 1
fi

# Backup existing config
if [ -d "$TARGET_DIR" ]; then
    echo "📦 Backing up existing ~/.claude/ to $BACKUP_DIR"
    cp -r "$TARGET_DIR" "$BACKUP_DIR"
    echo "   Backup saved."
else
    echo "📁 Creating ~/.claude/ directory"
    mkdir -p "$TARGET_DIR"
fi

# Create subdirectories
mkdir -p "$TARGET_DIR/skills"

# Copy global config
echo "📄 Installing global CLAUDE.md"
cp "$GLOBAL_SOURCE/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"

if [ -f "$GLOBAL_SOURCE/settings.json" ]; then
    echo "⚙️  Installing global settings.json"
    cp "$GLOBAL_SOURCE/settings.json" "$TARGET_DIR/settings.json"
fi

echo ""
echo "✅ Global config installed to ~/.claude/"
echo ""
echo "Files installed:"
echo "   ~/.claude/CLAUDE.md       — Your global preferences (edit this!)"
if [ -f "$TARGET_DIR/settings.json" ]; then
    echo "   ~/.claude/settings.json   — Global permissions and model prefs"
fi
echo "   ~/.claude/skills/         — Add global skills here"
echo ""
echo "Next steps:"
echo "   1. Edit ~/.claude/CLAUDE.md with YOUR personal preferences"
echo "   2. Copy project-template/ into your project directory"
echo "   3. Edit the project CLAUDE.md with your stack details"
echo "   4. Run: cd your-project && claude"
echo ""
echo "Remember: global config LAYERS with project config — they don't replace."
echo ""
