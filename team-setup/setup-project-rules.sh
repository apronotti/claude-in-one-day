#!/bin/bash
#
# setup-project-rules.sh — Sync team rules into a project
#
# This script copies the shared team rules (security, testing, API conventions)
# into a project's .claude/rules/ directory.
#
# Usage:
#   chmod +x setup-project-rules.sh
#   ./setup-project-rules.sh /path/to/your-project
#
# What it does:
#   1. Creates .claude/rules/ in the target project (if needed)
#   2. Copies team rule files from the project-template
#   3. Does NOT overwrite existing customized rules (asks first)
#
# Run this whenever team rules are updated to sync changes.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RULES_SOURCE="$REPO_ROOT/project-template/.claude/rules"

# Check argument
if [ -z "$1" ]; then
    echo ""
    echo "Usage: ./setup-project-rules.sh /path/to/your-project"
    echo ""
    echo "This copies team rules (security, testing, API conventions)"
    echo "into your project's .claude/rules/ directory."
    exit 1
fi

TARGET_PROJECT="$1"
TARGET_RULES="$TARGET_PROJECT/.claude/rules"

# Verify target is a real project directory
if [ ! -d "$TARGET_PROJECT" ]; then
    echo "ERROR: Directory not found: $TARGET_PROJECT"
    exit 1
fi

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   Claude in One Day — Team Rules Sync        ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "Source:  $RULES_SOURCE"
echo "Target:  $TARGET_RULES"
echo ""

# Create .claude/rules/ if needed
mkdir -p "$TARGET_RULES"

# Copy each rule file
COPIED=0
SKIPPED=0

for rule_file in "$RULES_SOURCE"/*.md; do
    if [ ! -f "$rule_file" ]; then
        continue
    fi

    filename=$(basename "$rule_file")
    target_file="$TARGET_RULES/$filename"

    if [ -f "$target_file" ]; then
        # Check if files differ
        if diff -q "$rule_file" "$target_file" > /dev/null 2>&1; then
            echo "   ✓ $filename (already up to date)"
            SKIPPED=$((SKIPPED + 1))
        else
            echo "   ⚠ $filename exists and differs from template."
            read -p "     Overwrite? (y/N): " response
            if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
                cp "$rule_file" "$target_file"
                echo "     Updated."
                COPIED=$((COPIED + 1))
            else
                echo "     Skipped."
                SKIPPED=$((SKIPPED + 1))
            fi
        fi
    else
        cp "$rule_file" "$target_file"
        echo "   + $filename (added)"
        COPIED=$((COPIED + 1))
    fi
done

echo ""
echo "✅ Done. $COPIED files copied, $SKIPPED skipped."
echo ""
echo "Rules installed in: $TARGET_RULES/"
echo "These auto-load in every Claude session for this project."
echo ""
