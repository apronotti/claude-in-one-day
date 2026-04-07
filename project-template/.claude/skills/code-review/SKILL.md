---
name: code-review
description: >
  Review code against project standards. Use when reviewing PRs,
  before commits, or when asked to check code quality.
---

# Code Review

For each changed file, verify against this checklist:

## Architecture
- [ ] Follows project directory structure (routes → services → repos)
- [ ] Services do not import from routes
- [ ] No business logic in route handlers
- [ ] Database access only through repository layer

## Error Handling
- [ ] All async operations have error handling
- [ ] Services return `Result<T, AppError>`, never throw
- [ ] Error messages are user-friendly (no stack traces in API responses)
- [ ] Edge cases handled (null, empty, not found)

## Security
- [ ] No SQL injection (parameterized queries only)
- [ ] No XSS vulnerabilities (input sanitized)
- [ ] Auth/authorization checks present where needed
- [ ] No secrets, tokens, or PII in logs
- [ ] No hardcoded credentials or API keys

## Testing
- [ ] Tests exist for new/changed code
- [ ] Happy path covered
- [ ] Error cases covered
- [ ] Tests are independent (no shared mutable state)

## Code Quality
- [ ] No `console.log` or debug artifacts
- [ ] No `any` types (use `unknown` instead)
- [ ] No commented-out code
- [ ] Function names describe what they do
- [ ] No functions longer than 30 lines

## Output Format

For each issue found, report:

```
[SEVERITY] file:line — description
  Suggestion: how to fix
```

Severity levels:
- **MUST FIX**: Blocking — bugs, security issues, broken tests
- **SHOULD FIX**: Important — missing error handling, poor naming, no tests
- **NITPICK**: Optional — style suggestions, minor improvements

End with: `APPROVED` (no blocking issues) or `CHANGES REQUESTED` (has MUST FIX items)
