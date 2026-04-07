# Testing Standards

## Coverage Requirements
- Every new feature must include tests
- Every bug fix must include a regression test
- Every public function in services/ and repos/ must have at least one test
- Test files mirror source structure: `src/services/user.ts` → `tests/services/user.test.ts`

## Test Quality
- Test behavior, not implementation details
- Each test should have exactly one reason to fail
- Tests must be independent — no shared mutable state between tests
- Tests must be deterministic — no reliance on time, randomness, or network

## Naming Convention
- Describe blocks: module or class name
- It blocks: "should [expected behavior] when [condition]"
- Example: `it('should return 404 when user does not exist')`

## Mocking Rules
- Mock external dependencies (databases, APIs, file system)
- Never mock the system under test
- Use dependency injection to make mocking clean
- Reset all mocks in `beforeEach`

## Test Data
- Use factory functions, not inline object literals
- Use realistic data, not "test" or "foo"
- Keep test data close to the test that uses it
