---
name: test-writer
description: >
  Generate tests matching project conventions.
  Use when asked to add tests, test coverage, or write specs.
---

# Test Writing

## Framework & Location
- **Framework**: Vitest
- **Location**: `tests/` mirroring `src/` structure
- **Naming**: `[module].test.ts`
- **Run**: `npm run test`

## Test Structure

```typescript
import { describe, it, expect, beforeEach, vi } from 'vitest';

describe('ModuleName', () => {
  // Setup shared across tests in this block
  beforeEach(() => {
    // Reset mocks, create fixtures
  });

  describe('methodName', () => {
    it('should [expected behavior] when [condition]', () => {
      // Arrange
      const input = createTestInput();

      // Act
      const result = module.method(input);

      // Assert
      expect(result.ok).toBe(true);
      expect(result.data).toEqual(expected);
    });

    it('should return error when [error condition]', () => {
      // Test error cases explicitly
    });
  });
});
```

## What to Test (always)
1. **Happy path** — Normal input produces expected output
2. **Validation errors** — Bad input is rejected with clear errors
3. **Not found** — Missing resources return appropriate errors
4. **Edge cases** — Empty arrays, null values, boundary conditions
5. **Auth/permissions** — Unauthorized access is blocked (if applicable)

## What NOT to Do
- Never mock the system under test (SUT)
- Never use `Math.random()` or `Date.now()` without mocking
- Never share mutable state between test cases
- Never test implementation details (test behavior, not internals)
- Never write tests that depend on execution order

## Test Data
- Use factory functions for creating test objects
- Keep test data close to the test that uses it
- Use realistic values, not "test123" or "foo"

```typescript
// Good: factory function
function createUser(overrides?: Partial<User>): User {
  return {
    id: 'usr_test_001',
    email: 'ada@example.com',
    name: 'Ada Lovelace',
    ...overrides,
  };
}
```
