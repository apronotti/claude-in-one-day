# Security Rules

These rules apply to ALL code in ALL projects. No exceptions.

## Data Protection
- Never log secrets, tokens, API keys, or PII (names, emails, IPs)
- Never hardcode credentials — use environment variables
- Never commit `.env` files or files containing secrets
- Use `crypto.randomUUID()` for IDs, never `Math.random()`

## Input Handling
- Always validate and sanitize user input before processing
- Always parameterize SQL queries — never concatenate user input into queries
- Always escape output to prevent XSS in any HTML context
- Reject unexpected fields — do not blindly spread user input into objects

## Authentication & Authorization
- Verify authentication on every protected endpoint
- Verify authorization (does THIS user have access to THIS resource?)
- Use constant-time comparison for token/password checks
- Set secure cookie flags: HttpOnly, Secure, SameSite

## Network
- HTTPS for all external requests
- Set appropriate CORS policies — never use `*` in production
- Validate and sanitize URLs before making requests (SSRF prevention)
- Set timeouts on all external HTTP calls

## Dependencies
- Pin dependency versions (exact, not range)
- Review new dependencies before adding — check maintenance status, license, size
- Run `npm audit` regularly and address critical vulnerabilities
