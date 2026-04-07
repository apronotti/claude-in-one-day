---
name: api-endpoint
description: >
  Create a new API endpoint following project conventions.
  Use when asked to add a route, endpoint, or API method.
---

# New API Endpoint

When creating a new endpoint, always follow this sequence:

1. **Route handler** in `src/routes/`
   - Define the HTTP method and path
   - Add zod schema for request validation
   - Call the service method
   - Return using `ApiResponse<T>` wrapper

2. **Service method** in `src/services/`
   - Implement business logic here
   - No HTTP dependencies (no req/res objects)
   - Return `Result<T, AppError>`, never throw
   - Handle all error cases explicitly

3. **Repository method** in `src/repos/` (if DB access needed)
   - Use Prisma client for all queries
   - Return typed data, not raw query results
   - Handle database errors and wrap in AppError

4. **Validation schema** using zod
   - Define request body, params, and query schemas
   - Place alongside the route handler
   - Include meaningful error messages

5. **Tests** in `tests/`
   - Happy path test
   - Validation error test (bad input)
   - Business logic error test (e.g., not found)
   - Auth/permission test if applicable

6. **Register route** in `src/routes/index.ts`

## Error Handling Pattern

```typescript
// Service returns Result, never throws
type Result<T, E> = { ok: true; data: T } | { ok: false; error: E };

// Route converts to HTTP
const result = await userService.create(data);
if (!result.ok) {
  return res.status(result.error.status).json(
    ApiResponse.error(result.error.message)
  );
}
return res.status(201).json(ApiResponse.success(result.data));
```
