# Security

## Core Principles

- **Validate at boundaries:** Trust nothing from outside — user input, query params, request bodies, external APIs, environment variables read at runtime.
- **Least privilege:** Every component, role, and API key gets only the permissions it actually needs.
- **Fail securely:** On error, deny by default — never fall back to an open or permissive state.
- **Defense in depth:** No single control is enough; layer validation, authorization, and logging.
- **Security is not optional:** It is not a post-launch concern. Every PR is reviewed with security in mind.

---

## Secrets Management

- **Never hardcode** secrets, API keys, tokens, or passwords — not even in tests.
- Store secrets in environment variables; document expected names in `.env.example` with placeholder values.
- `.env` is always in `.gitignore`; verify before every commit.
- Rotate exposed credentials immediately — treat any accidental commit as a breach.
- Use a secrets manager (e.g. AWS Secrets Manager, HashiCorp Vault) in production environments.

---

## Input Validation & Sanitization

- Validate type, format, length, and range for every external input.
- Use an explicit allowlist, not a blocklist.
- Never build SQL, shell commands, or HTML by concatenating user input — use parameterized queries and template escaping.
- Reject invalid input early and return a clear error; do not silently strip or coerce.

---

## Authentication & Authorization

- **Authentication:** Verify identity before any protected operation. Use established libraries — do not roll your own crypto.
- **Authorization:** Check permissions on every request, server-side. Never rely on client-side guards alone.
- Enforce HTTPS everywhere; reject plain HTTP in production.
- Use short-lived tokens (JWT, session cookies) with secure, httpOnly, sameSite flags set.
- Implement rate limiting on authentication endpoints to prevent brute-force.

---

## Common Vulnerability Classes (OWASP Top 10)

| Class | Rule |
|---|---|
| Injection (SQL, shell, LDAP) | Always use parameterized queries / safe APIs |
| XSS | Escape all output; use a Content Security Policy header |
| CSRF | Use sameSite cookies and/or CSRF tokens on state-mutating endpoints |
| Broken Access Control | Re-check authorization server-side on every request |
| Security Misconfiguration | Remove debug endpoints, default credentials, and verbose error pages before deploy |
| Sensitive Data Exposure | Never log PII, passwords, or tokens; use TLS in transit; encrypt at rest where required |
| Insecure Dependencies | Run `npm audit` / `pip-audit` before merging; block PRs with critical vulnerabilities |
| Insecure Deserialization | Validate and type-check all deserialized data; avoid `eval` and unsafe deserialization methods |

---

## Error Handling & Logging

- Return generic error messages to clients — never expose stack traces, internal paths, or query details.
- Log errors server-side with enough context to debug, but **strip PII, tokens, and passwords** before writing to logs.
- Use structured logging (JSON) so log data is machine-readable and auditable.
- Treat log files as sensitive — restrict access and retain only as long as necessary.

---

## Dependency Security

- Audit dependencies before adding them: check download count, last publish date, and open CVEs.
- Prefer well-maintained, widely-used packages over obscure alternatives.
- Pin versions in lock files (`package-lock.json`, `requirements.txt`) — do not use unbounded ranges in production.
- Run `npm audit` / `pip-audit` as part of CI; fail the build on critical findings.
- Remove unused dependencies — every dependency is an attack surface.

---

## Code Review Security Checklist

Before approving any PR, verify:

- [ ] No secrets or credentials in diff
- [ ] All external inputs validated and sanitized
- [ ] Authorization checks present on new/changed endpoints
- [ ] No new `eval`, `exec`, or dynamic code execution without justification
- [ ] Error responses do not leak internal details
- [ ] No sensitive data written to logs
- [ ] New dependencies audited and justified
- [ ] Migrations do not expose or drop access controls

---

## Claude Behaviour

- Before writing any code that handles user input, authentication, or data persistence, apply the rules above.
- If a task requires a pattern that would violate these rules (e.g. string-concatenated SQL), stop and flag it before proceeding.
- When reviewing code (`/code-review`), always include a security pass using the checklist above.
- Never suggest storing secrets in code, even "temporarily" or "for testing".
