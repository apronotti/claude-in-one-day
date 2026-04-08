---
name: test-writer
description: >
  Generate tests matching project conventions.
  Use when asked to add tests, test coverage, or write specs.
---

# Test Writing

## Framework & Location
- **Framework**: pytest (with pytest-asyncio for async)
- **Location**: `tests/` mirroring `app/` structure
- **Naming**: `test_[module].py`
- **Run**: `pytest`

## Test Structure

```python
import pytest
from unittest.mock import AsyncMock, patch

class TestUserService:
    """Tests for the user service module."""

    @pytest.fixture
    def user_service(self):
        """Create a user service with mocked dependencies."""
        repo = AsyncMock()
        return UserService(repo=repo)

    async def test_create_user_returns_user_on_valid_input(
        self, user_service
    ):
        """Should create and return a user with valid data."""
        # Arrange
        input_data = create_user_input()

        # Act
        result = await user_service.create(input_data)

        # Assert
        assert result.ok is True
        assert result.data.email == input_data.email

    async def test_create_user_returns_error_on_duplicate(
        self, user_service
    ):
        """Should return error when email already exists."""
        # Test error cases explicitly
```

## What to Test (always)
1. **Happy path** — Normal input produces expected output
2. **Validation errors** — Bad input is rejected with clear errors
3. **Not found** — Missing resources return appropriate errors
4. **Edge cases** — Empty lists, None values, boundary conditions
5. **Auth/permissions** — Unauthorized access is blocked (if applicable)

## What NOT to Do
- Never mock the system under test (SUT)
- Never use `random()` or `datetime.now()` without mocking
- Never share mutable state between test cases
- Never test implementation details (test behavior, not internals)
- Never write tests that depend on execution order

## Test Data
- Use factory functions for creating test objects
- Keep test data close to the test that uses it
- Use realistic values, not "test123" or "foo"

```python
# Good: factory function
def create_user(**overrides) -> User:
    defaults = {
        "id": "usr_test_001",
        "email": "ada@example.com",
        "name": "Ada Lovelace",
    }
    return User(**(defaults | overrides))
```
