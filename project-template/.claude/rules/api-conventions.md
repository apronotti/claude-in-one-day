# API Conventions

## Response Format
All API responses use the `ApiResponse[T]` wrapper:

```python
# Success
{"ok": True, "data": T}

# Error
{"ok": False, "error": {"code": "NOT_FOUND", "message": "User not found"}}
```

## HTTP Status Codes
- 200: Success (GET, PUT, PATCH)
- 201: Created (POST that creates a resource)
- 204: No Content (DELETE)
- 400: Bad Request (validation errors)
- 401: Unauthorized (missing or invalid auth)
- 403: Forbidden (valid auth, insufficient permissions)
- 404: Not Found
- 409: Conflict (duplicate resource)
- 500: Internal Server Error (unexpected failures)

## Naming
- URLs use kebab-case: `/user-profiles`, not `/userProfiles`
- Use plural nouns for collections: `/users`, not `/user`
- Use resource IDs in path: `/users/{user_id}`, not `/users?id=123`
- Nest related resources: `/users/{user_id}/orders`

## Pagination
- Use cursor-based pagination for lists
- Return: `{"data": list[T], "cursor": str | None}`
- Accept: `?cursor=xxx&limit=20`
- Default limit: 20, max limit: 100

## Dates
- All dates in API responses are ISO 8601 strings: `2026-03-15T14:30:00Z`
- All dates in code are `datetime` objects
- Store in UTC, convert to user timezone only in the client

## Validation
- Validate all request input using Pydantic models
- Return specific validation error messages, not generic "invalid input"
- Validate at the route layer, before reaching services
