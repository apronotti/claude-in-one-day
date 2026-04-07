---
name: debug
description: >
  Systematic debugging workflow. Use when tracking down bugs,
  errors, or unexpected behavior.
---

# Debug Workflow

Follow this sequence. Do NOT skip steps.

## 1. Reproduce
- Find the minimal steps to trigger the bug
- Identify: is it consistent or intermittent?
- Note the exact error message, stack trace, or unexpected behavior
- Check: does it happen in tests, dev, prod, or all?

## 2. Isolate
- Narrow down to the specific file and function
- Use `Grep` and `Read` to trace the code path
- Check recent changes: `git log --oneline -20` and `git diff`
- Identify the boundary: where does correct behavior end and the bug begin?

## 3. Hypothesize
- Form a specific theory about the root cause BEFORE making changes
- State the hypothesis clearly: "I believe X happens because Y"
- Consider: is this a logic error, a data error, a timing error, or an integration error?

## 4. Verify the Hypothesis
- Write a failing test that captures the bug
- Run it to confirm it fails for the expected reason
- If the test passes, your hypothesis is wrong — go back to step 3

## 5. Fix
- Make the minimal change that fixes the root cause
- Do NOT fix symptoms — fix the underlying problem
- If the fix is complex, explain why in a code comment

## 6. Confirm
- Run the failing test — it should now pass
- Run the full test suite — no regressions
- Run lint — no style violations introduced
- Manually verify the original reproduction steps

## 7. Prevent
- Is this a class of bug that could recur?
- Should we add a lint rule, a type constraint, or a validation check?
- Update CLAUDE.md or relevant skill if this reveals a convention gap

## Do NOT
- Make random changes hoping something works (shotgun debugging)
- Fix the symptom without understanding the cause
- Skip writing a regression test
- Change multiple things at once — one change per hypothesis
- Assume the bug is in a dependency without evidence
