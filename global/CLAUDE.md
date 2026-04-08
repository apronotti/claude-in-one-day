# Global Preferences
# Place this file at ~/.claude/CLAUDE.md
# It loads automatically in EVERY project.

## Communication Style
- Be direct. Skip preamble and filler.
- When I ask for code, give me code. Explain only if I ask.
- If something is wrong with my approach, say so. Do not be sycophantic.
- Use `gh` CLI for all GitHub operations.

## Code Style (all projects)
- Add type hints to all public functions and methods
- Never use `from module import *`
- Always handle exceptions explicitly, never bare `except: pass`
- Write tests alongside implementation, not after
- Prefer composition over deep inheritance hierarchies
- Keep functions under 30 lines; extract when longer

## Git Conventions
- Conventional commits: type(scope): description
- Types: feat, fix, refactor, test, docs, chore
- Keep subject line under 72 characters
- Add body for non-obvious changes
- Never commit directly to main

## When Uncertain
- Ask me before making architectural decisions
- Prefer the simpler solution when two options are equivalent
- If a task touches more than 5 files, present a plan first
