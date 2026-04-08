# [Claude in One Day](https://github.com/apronotti/claude-in-one-day/blob/main/Claude_in_One_Day_book.pdf) — Companion Repository

> Every template, configuration file, and skill from the book **"Claude in One Day: A Software Engineer's Field Guide"** by Alejandro Pronotti.

**Don't retype — fork, customize, and start building.**

## What's Inside

```
claude-in-one-day/
│
├── global/                      # Chapter 3: Global layer (~/.claude/)
│   ├── CLAUDE.md                # Personal defaults for all projects
│   └── settings.json            # Global permissions and model prefs
│
├── project-template/            # Chapters 3-7: Full project setup
│   ├── CLAUDE.md                # Project-level config (stack, arch)
│   └── .claude/
│       ├── settings.json        # Hooks + MCP servers
│       ├── commands/            # Chapter 5: Slash commands
│       │   ├── commit.md
│       │   ├── review-pr.md
│       │   └── deploy-staging.md
│       ├── skills/              # Chapter 4: Five starter skills
│       │   ├── api-endpoint/SKILL.md
│       │   ├── code-review/SKILL.md
│       │   ├── test-writer/SKILL.md
│       │   ├── debug/SKILL.md
│       │   └── explain-code/SKILL.md
│       ├── agents/              # Chapter 5: Custom agents
│       │   ├── reviewer.md
│       │   ├── debugger.md
│       │   └── planner.md
│       └── rules/               # Chapter 3: Modular team standards
│           ├── security-rules.md
│           ├── testing-standards.md
│           └── api-conventions.md
│
└── team-setup/                  # Chapter 9: Team configuration
    ├── install.sh               # Symlinks global config to ~/.claude/
    ├── setup-project-rules.sh   # Syncs team rules into any project
    └── .gitignore-template      # What to exclude from git
```

## Quick Start

### Individual Setup (15 minutes)

```bash
# 1. Clone this repo
git clone https://github.com/apronotti/claude-in-one-day.git
cd claude-in-one-day

# 2. Copy global config to your home directory
cp global/CLAUDE.md ~/.claude/CLAUDE.md

# 3. Edit with YOUR preferences
nano ~/.claude/CLAUDE.md

# 4. Copy project template into your project
cp -r project-template/.claude /path/to/your-project/
cp project-template/CLAUDE.md /path/to/your-project/

# 5. Edit project CLAUDE.md with YOUR stack details
nano /path/to/your-project/CLAUDE.md

# 6. Start Claude Code
cd /path/to/your-project
claude
```

### Team Setup (Chapter 9)

```bash
# Option A: Symlink global config for entire team
cd team-setup
chmod +x install.sh
./install.sh

# Option B: Sync team rules into a specific project
chmod +x setup-project-rules.sh
./setup-project-rules.sh /path/to/your-project
```

## How Layering Works

Configuration files **accumulate, they don't replace each other**. All layers are active simultaneously:

```
Layer 1: ~/.claude/CLAUDE.md          (always loaded — your personal defaults)
    +
Layer 2: project/CLAUDE.md           (adds project-specific context)
    +
Layer 2b: .claude/rules/*.md         (adds modular team standards)
    =
Claude sees ALL of the above at the same time
```

Only when instructions directly conflict does the more specific layer win. See Chapter 3 of the book for the full explanation.

## Customization Guide

Every file in this repo is a **starting point, not a final product**. The most important customizations:

| File | What to change |
|------|---------------|
| `global/CLAUDE.md` | Your communication style, universal code conventions |
| `project-template/CLAUDE.md` | Your stack, framework, architecture, build commands |
| `skills/*.md` | Your team's specific patterns and conventions |
| `agents/*.md` | Model preferences, persona instructions |
| `.claude/settings.json` | Your MCP server URLs, hook commands |
| `.claude/rules/*.md` | Your organization's security and quality standards |

## The Book

📖 **Claude in One Day** — A Software Engineer's Field Guide to CLAUDE.md, Skills, MCP, and Agentic Workflows

The book walks through the complete setup process in 10 chapters, from mental model to production-ready configuration. These templates are the practical companion — the book explains the *why* behind every file. Contact the author for access.

## License

MIT — Use freely, modify freely, share freely.

## Updates

Star this repo to get notified when templates are updated for new Claude Code features. Claude Code evolves fast — these templates evolve with it.

---

*Built by [Alejandro Pronotti](https://github.com/apronotti)*
