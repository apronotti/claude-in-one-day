---
name: api-endpoint
description: >
  Create a new API endpoint following project conventions.
  Use when asked to add a route, endpoint, or API method.
---

# New API Endpoint

When creating a new endpoint, always follow this sequence:

1. **Route handler** in `app/routes/`
   - Define the FastAPI path operation
   - Add Pydantic model for request validation
   - Call the service method
   - Return using `ApiResponse[T]` wrapper

2. **Service method** in `app/services/`
   - Implement business logic here
   - No HTTP dependencies (no Request/Response objects)
   - Return `Result[T, AppError]`, never raise
   - Handle all error cases explicitly

3. **Repository method** in `app/repos/` (if DB access needed)
   - Use SQLAlchemy session for all queries
   - Return typed data, not raw query results
   - Handle database errors and wrap in AppError

4. **Pydantic models** for validation
   - Define request/response models in `app/schemas/`
   - Include field descriptions and examples
   - Add custom validators where needed

5. **Tests** in `tests/`
   - Happy path test
   - Validation error test (bad input)
   - Business logic error test (e.g., not found)
   - Auth/permission test if applicable

6. **Register route** in `app/routes/__init__.py`

## Error Handling Pattern

```python
# Service returns Result, never raises
@dataclass
class Result(Generic[T, E]):
    ok: bool
    data: T | None = None
    error: E | None = None

# Route converts to HTTP
result = await user_service.create(data)
if not result.ok:
    raise HTTPException(
        status_code=result.error.status,
        detail=result.error.message
    )
return ApiResponse(ok=True, data=result.data)
```
