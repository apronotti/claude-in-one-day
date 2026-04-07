Review the current PR against our project standards:

1. Get the PR diff: `gh pr diff`

2. For each changed file, check against this criteria:
   - Follows project architecture (CLAUDE.md conventions)
   - Error handling is complete and typed
   - No security issues (SQL injection, XSS, auth bypass)
   - Tests cover the changed code (happy path + error cases)
   - No console.log, debug artifacts, or commented-out code
   - Naming matches project conventions

3. Check for cross-cutting concerns:
   - If schema changed: migration file exists?
   - If new route added: registered in index?
   - If new dependency: justified and version-pinned?
   - If env var added: documented in README/.env.example?

4. Output a structured review:

   ## Summary
   [1-2 sentence summary of what the PR does]

   ## Issues Found

   ### MUST FIX (blocking)
   - [file:line] — [description + suggested fix]

   ### SHOULD FIX (important)
   - [file:line] — [description + suggested fix]

   ### NICE TO HAVE (suggestions)
   - [file:line] — [description]

   ## Verdict
   APPROVED / CHANGES REQUESTED
