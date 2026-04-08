Before committing, follow this workflow:

1. Run tests: `pytest`
   - If any fail, fix them before proceeding
   - Do NOT commit with failing tests

2. Run lint: `ruff check .`
   - Fix any lint errors before proceeding

3. Review staged changes: `git diff --staged`
   - Verify no debug artifacts (print(), TODO comments)
   - Verify no secrets or credentials
   - Verify no unrelated changes mixed in

4. Write a commit message following conventional format:
   - Format: `type(scope): description`
   - Types: feat, fix, refactor, test, docs, chore
   - Scope: the module or area affected
   - Description: imperative mood, under 72 chars
   - Add body if the change is non-obvious

5. Commit with: `git commit`

Example:
```
feat(auth): add JWT refresh token rotation

Tokens now rotate on each refresh request, invalidating
the previous token. This prevents token reuse attacks.

Closes #142
```
