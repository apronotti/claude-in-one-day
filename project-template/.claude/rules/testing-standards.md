# Testing Standards

## Coverage Requirements
- Every new feature must include tests
- Every bug fix must include a regression test
- Every public function in services/ and repos/ must have at least one test
- Test files mirror source structure: `app/services/user.py` → `tests/services/test_user.py`

## Test Quality
- Test behavior, not implementation details
- Each test should have exactly one reason to fail
- Tests must be independent — no shared mutable state between tests
- Tests must be deterministic — no reliance on time, randomness, or network

## Naming Convention
- Test files: `test_[module].py`
- Test classes: `TestClassName`
- Test methods: `test_should_[expected]_when_[condition]`
- Example: `test_should_return_404_when_user_does_not_exist`

## Mocking Rules
- Mock external dependencies (databases, APIs, file system)
- Never mock the system under test
- Use `pytest.fixture` for dependency injection
- Use `unittest.mock.patch` or `pytest-mock` for mocking

## Test Data
- Use factory functions, not inline dict literals
- Use realistic data, not "test" or "foo"
- Keep test data close to the test that uses it
