Generate a horizontal system map showing how all requirements and architectures interrelate.

This complements `/traceability` (which is *vertical*: REQ → ARCH → TEST → code coverage).
`/system-map` is *horizontal*: which REQs share a scope, what builds on what, which
architecture components are touched by many features, and where the change-risk hotspots are.

The primary consumer is `/new-requirement`: before a new story is written, this map is the
pre-computed "touchpoint index" used to find related REQs without re-reading the whole catalog
(see "Claude Behaviour" in `.claude/rules/v-model.md`).

## How to build it

Do NOT rely on regex alone — explicit `REQ-XXX` cross-references in the files are sparse.
The real relationships live in shared modules, shared database tables, and the Background/Notes
sections. You must read and interpret, not just grep.

1. Scan `docs/requirements/REQ-*.md` and `docs/architecture/ARCH-*.md`. If
   `docs/requirements/REQ-INDEX.md` exists, read it for the canonical numbering and any
   **intentional numbering gaps**.
2. For each REQ, extract:
   - Title and status
   - **Touchpoints** — the modules, database tables, calculations, routes, and UI surfaces it
     affects. Read the REQ Background/ACs and its ARCH (`Database Schema`, `Overview`, file lists).
   - **Explicit references** — any `REQ-XXX` mentioned in the body.
   - **Supersedes** — any REQ explicitly marked as replacing another.
3. Derive REQ↔REQ relationships from BOTH explicit refs AND shared touchpoints
   (two REQs writing the same table, or extending the same module, are related even with no link):
   - **builds-on** — REQ depends on capability introduced by another (e.g. a tile builds on an import)
   - **overlaps** — both touch the same module/table/calculation, compatible
   - **supersedes / superseded-by** — explicit replacement
4. Stamp the output with today's date (run `date +%F`).

## Output — write to `docs/SYSTEM-MAP.md`

Use this structure:

```markdown
# System Map — <Project name>

**Generated:** <YYYY-MM-DD> · **Source:** N REQs, N ARCHs · **Regenerate:** `/system-map`

> ⚠️ Generated artifact. Do not hand-edit — it will be overwritten. If a relationship here
> looks wrong, fix the underlying REQ/ARCH and regenerate. Treat this map as stale once any
> REQ/ARCH changes; regenerate before relying on it.

## Domain Clusters

Group every REQ under a functional domain (e.g. Auth & Access, Master Data, Import,
Dashboard & Reporting, Platform & Infra). For each cluster:

### <Domain name>
- **REQs:** REQ-XXX (Title), REQ-YYY (Title), …
- **Shared architecture:** the tables / modules / routes this cluster owns
- **One-line purpose**

## Dependency Matrix

| REQ | Title | Builds on | Overlaps with | Supersedes |
|-----|-------|-----------|---------------|------------|
| REQ-011 | Batch import | REQ-005 | REQ-006, REQ-016 | — |

(Show only non-empty relationships. "Builds on" = hard dependency; "Overlaps with" = shared touchpoint.)

## Architecture Interplay (Touchpoint Index)

For each shared module / database table / calculation, list which REQs touch it.
This is the lookup for new stories — "new story touches X → these REQs also touch X".

| Touchpoint | Type | Touched by |
|-----------|------|------------|
| `orders` | table | REQ-004, REQ-005, REQ-011 |
| discount calculation | calculation | REQ-007, REQ-009 |
| `src/parsers/csv.ts` | module | REQ-005, REQ-011 |

## Hotspots (change-risk)

Rank the REQs and touchpoints with the most dependents. These are where a new or changed
requirement is most likely to cause a spec conflict or a code regression — review them first.

- **REQ-XXX** — N dependents: …
- **<touchpoint>** — touched by N REQs: …

## Coverage Notes

Flag anything notable: a domain with no tests, an orphan REQ with no relationships,
a touchpoint owned by a single REQ that many others read.

Also restate any **intentional numbering gaps** from `REQ-INDEX.md` (e.g. a REQ folded into
another, or a number never assigned) so a skipped number is never mistaken for a missing or
lost requirement.
```

## After writing

Tell the user:
- The file path written and the generated date
- A 2–3 line summary: number of domains, the top 1–2 hotspots
- Reminder: regenerate with `/system-map` whenever REQs/ARCHs change; `/new-requirement`
  consumes this map.
