# Project: [your-project-name]

## Quick Facts
- **Stack**: [e.g., Node.js 20, TypeScript 5.4, Express 4]
- **Database**: [e.g., PostgreSQL 16 via Prisma ORM]
- **Test**: `npm run test` [e.g., Vitest]
- **Lint**: `npm run lint` [e.g., ESLint + Prettier]
- **Build**: `npm run build` [e.g., tsc]
- **Deploy**: [e.g., `npm run deploy` or N/A]

## Architecture
- `src/routes/`      → Express route handlers
- `src/services/`    → Business logic (no HTTP dependencies)
- `src/repos/`       → Database access via Prisma
- `src/middleware/`   → Auth, error handling, logging
- `src/utils/`       → Shared utilities and helpers
- `tests/`           → Mirrors `src/` structure

## Conventions (project-specific)
- Services never import from routes
- All API responses use `ApiResponse<T>` wrapper
- Errors are typed: `AppError extends Error` with code and status
- Dates are ISO 8601 strings in API responses, `Date` objects in code
- Use `zod` for request validation in route handlers
- Database queries always go through repository layer

## Do NOT
- Import from `routes/` inside `services/`
- Use `console.log` in production code (use the logger)
- Hardcode configuration values (use env vars)
- Skip error handling on async operations
- [Add your project-specific anti-patterns here]

## Before Committing
- [ ] Tests pass: `npm run test`
- [ ] Lint passes: `npm run lint`
- [ ] No `console.log` in production code
- [ ] Error cases handled and typed
- [ ] Migration created if schema changed
- [ ] [Add your project-specific checks here]
