# Coding Style

## Core Principles

- **KISS (Keep It Simple, Stupid):** Choose the simplest solution. Avoid over-engineering.
- **DRY (Don't Repeat Yourself):** No logic duplication. Abstract recurring patterns.
- **YAGNI (You Ain't Gonna Need It):** Do not implement features speculatively.
- **Boy Scout Rule:** Leave the code cleaner than you found it.

---

## Naming

- Variables and functions: `camelCase` (JS/TS) or `snake_case` (Python)
- Classes and types: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` for modules, `PascalCase` for components
- Boolean variables: prefix with `is`, `has`, `can`, `should`
- Names must express intent: `elapsedTimeInDays` not `d`
- Pronounceable and searchable — avoid cryptic abbreviations
- Stay consistent with project-wide vocabulary (e.g. always `getUser`, never mix with `fetchUser` or `retrieveUser`)
- Use terms from the problem domain (Domain-Driven Naming)

## Functions & Methods

- One responsibility per function (SRP)
- Max ~30 lines; extract helpers if longer
- Prefer pure functions over side effects — no hidden state mutations
- Name functions after what they return, not what they do internally
- No magic numbers — assign to a named constant first
- Minimize parameters: 0–2 is ideal; use an options object for more
- **Command-Query Separation:** a function either changes state OR returns a value, never both

## Imports

- Group in order: stdlib → third-party → internal
- Blank line between groups
- No wildcard imports (`import *`)
- Prefer named exports over default exports

## Code Structure

- Flat is better than nested: return early instead of deep `if/else`
- Explicit over clever: readable code beats terse code
- No commented-out code — delete it, git has history
- Avoid abbreviations unless universally known (`id`, `url`, `i`)

## Comments & Documentation

- Write self-documenting code — names and structure should make comments about *what* unnecessary
- Comments explain *why*, not *how*: use them for non-obvious constraints, design decisions, or workarounds
- No dead code — commented-out blocks are deleted immediately

## Error Handling

- Use exceptions, not error codes
- Fail fast: validate preconditions early and throw immediately
- Avoid `null` returns — use optional types or empty collections instead

## Architecture & Design (SOLID)

- **S**ingle Responsibility: each class has exactly one reason to change
- **O**pen/Closed: open for extension, closed for modification
- **L**iskov Substitution: subclasses must be substitutable for their base class without breaking behavior
- **I**nterface Segregation: many specific interfaces over one large "god interface"
- **D**ependency Inversion: depend on abstractions, not concretions; inject dependencies

## Types (TS)

- Prefer `interface` for object shapes, `type` for unions/intersections
- Never use `any` — use `unknown` and narrow it
- Mark optional fields explicitly with `?`
- Avoid non-null assertions (`!`) without a comment explaining why

## Formatting

- Indent: 2 spaces
- Trailing commas in multi-line structures
- Semicolons: follow project config (pick one style, stay consistent)
- Max line length: 100 characters
