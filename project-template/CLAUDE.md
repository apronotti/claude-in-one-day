# Project: [your-project-name]

## Quick Facts
- **Stack**: [e.g., Python 3.12, FastAPI, Pydantic v2]
- **Database**: [e.g., PostgreSQL 16 via SQLAlchemy 2.0]
- **Test**: `pytest` [e.g., with pytest-asyncio]
- **Lint**: `ruff check .` and `ruff format .`
- **Run**: `uvicorn app.main:app --reload`
- **Deploy**: [e.g., `deploy.sh` or N/A]

## Architecture
- `app/routes/`      → FastAPI route handlers
- `app/services/`    → Business logic (no HTTP dependencies)
- `app/repos/`       → Database access via SQLAlchemy
- `app/middleware/`   → Auth, error handling, logging
- `app/utils/`       → Shared utilities and helpers
- `tests/`           → Mirrors `app/` structure

## Conventions (project-specific)
- Services never import from routes
- All API responses use `ApiResponse[T]` wrapper
- Errors are typed: `AppError(Exception)` with code and status
- Dates are ISO 8601 strings in API responses, `datetime` objects in code
- Use Pydantic models for request validation in route handlers
- Database queries always go through repository layer

## Do NOT
- Import from `routes/` inside `services/`
- Use `print()` in production code (use the logger)
- Hardcode configuration values (use env vars via pydantic-settings)
- Skip error handling on async operations
- [Add your project-specific anti-patterns here]

## Before Committing
- [ ] Tests pass: `pytest`
- [ ] Lint passes: `ruff check .`
- [ ] No `print()` in production code
- [ ] Error cases handled and typed
- [ ] Migration created if schema changed (alembic)
- [ ] [Add your project-specific checks here]
