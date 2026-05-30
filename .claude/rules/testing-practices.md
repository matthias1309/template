# Testing Practices

## Philosophy

- Test behavior, not implementation details
- Tests are documentation — write them for the next developer
- A failing test should tell you exactly what broke and why
- Prefer fewer, meaningful tests over many shallow ones

## FIRST Principles

Tests must be:
- **Fast** — run in milliseconds, never block on I/O
- **Independent** — no test depends on another; any order must work
- **Repeatable** — same result every time, in any environment
- **Self-Validating** — pass or fail with no manual inspection needed
- **Timely** — written alongside the code, not as an afterthought

## Test Structure

Use Arrange-Act-Assert (AAA):

```
// Arrange
const user = buildUser({ role: 'admin' })

// Act
const result = canDeletePost(user, post)

// Assert
expect(result).toBe(true)
```

## Naming

- Test files: `*.test.ts` or `*.spec.ts` next to the source file
- Describe blocks: name of the unit under test
- Test cases: `it('should <expected behavior> when <condition>')`

## Unit Tests

- Test one thing per `it()` block
- No real I/O — mock filesystem, network, database
- Fast: each test should finish in < 50ms
- Deterministic: no reliance on current time, random values, or order

## Integration Tests

- Allowed to hit real databases/services in test environment
- Use a dedicated test database, never production data
- Seed data explicitly per test or test suite — don't rely on shared state
- Clean up after yourself (transactions or truncate)

## Mocking

- Mock at the boundary (module boundary or network boundary), not inside implementation
- Prefer dependency injection over module-level mocking where possible
- Verify mock interactions only when the call itself is the behavior being tested

## Coverage

- Aim for 80%+ line coverage on business logic
- 100% coverage does not mean 100% correctness — test edge cases explicitly
- Don't write tests purely to hit a coverage number

## What Not to Test

- Framework internals (ORM queries, HTTP routing)
- Trivial getters/setters with no logic
- Code that will be deleted soon
