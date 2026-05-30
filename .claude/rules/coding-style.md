# Coding Style

## Naming

- Variables and functions: `camelCase` (JS/TS) or `snake_case` (Python)
- Classes and types: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` for modules, `PascalCase` for components
- Boolean variables: prefix with `is`, `has`, `can`, `should`

## Functions

- One responsibility per function
- Max ~30 lines; extract helpers if longer
- Prefer pure functions over side effects
- Name functions after what they return, not what they do internally
- No magic numbers — assign to a named constant first

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
