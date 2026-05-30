# Claude Code Projekt-Template

Ein wiederverwendbares Startpunkt-Template für neue Projekte mit Claude Code. Enthält vorkonfigurierte Regeln, Slash-Commands, Hooks und Einstellungen.

---

## Verzeichnisstruktur

```
.
├── CLAUDE.md                    # Projekt-Instruktionen für Claude (ins Git)
├── CLAUDE.local.md              # Persönliche Overrides (gitignored)
├── .gitignore
├── .claude/
│   ├── settings.json            # Claude Code Einstellungen
│   ├── mcp.json                 # MCP Server Konfiguration
│   ├── rules/
│   │   ├── coding-style.md      # Code-Konventionen
│   │   ├── testing-practices.md # Test-Richtlinien
│   │   └── git-workflow.md      # Git-Konventionen
│   ├── commands/
│   │   ├── summarize-pr.md      # /summarize-pr Slash-Command
│   │   └── todo-check.md        # /todo-check Slash-Command
│   └── hooks/
│       ├── pre-tool-use.sh      # Läuft vor jedem Tool-Aufruf
│       └── post-tool-use.sh     # Läuft nach jedem Tool-Aufruf
```

---

## Schnellstart

1. Dieses Repo klonen oder den Inhalt in ein neues Projekt kopieren
2. `CLAUDE.md` anpassen: Projektname, Tech-Stack, wichtige Befehle eintragen
3. `CLAUDE.local.md` für persönliche Notizen und lokale Pfade nutzen
4. In `.claude/settings.json` Permissions und Hooks aktivieren
5. In `.claude/mcp.json` MCP-Server eintragen (Tokens ersetzen)
6. Hook-Skripte ausführbar machen: `chmod +x .claude/hooks/*.sh`

---

## CLAUDE.md vs. CLAUDE.local.md

| Datei | Zweck | Git |
|---|---|---|
| `CLAUDE.md` | Team-weite Projekt-Instruktionen | ✅ committen |
| `CLAUDE.local.md` | Persönliche Overrides, lokale Pfade, private Notizen | ❌ gitignored |

Claude liest beide Dateien automatisch beim Start einer Session. `CLAUDE.local.md` überschreibt/ergänzt `CLAUDE.md` für den lokalen Nutzer.

**Was in CLAUDE.md gehört:**
- Projektbeschreibung und Ziele
- Tech-Stack und Architektur-Entscheidungen
- Wichtige Build-/Test-/Lint-Befehle
- Hinweise auf die `rules/`-Dateien
- Tabus (z. B. "nie Secrets committen")

**Was in CLAUDE.local.md gehört:**
- Eigene Arbeitsweise und Präferenzen
- Lokale Pfade (z. B. SDK-Installationspfad)
- Notizen die nur für einen selbst relevant sind
- Temporäre Hinweise während der Entwicklung

---

## rules/ — Konventionen für Claude

Dateien im `rules/`-Verzeichnis werden in `CLAUDE.md` referenziert und geben Claude detaillierte Richtlinien für spezifische Themen.

**Vorhandene Dateien:**
- `coding-style.md` — Namenskonventionen, Formatierung, Typen
- `testing-practices.md` — AAA-Pattern, Mocking, Coverage-Erwartungen
- `git-workflow.md` — Branch-Namen, Commit-Messages (Conventional Commits), PR-Regeln

**Neue Rule-Datei hinzufügen:**
1. Datei in `.claude/rules/` anlegen, z. B. `security.md`
2. In `CLAUDE.md` referenzieren: `Siehe .claude/rules/security.md für Security-Richtlinien.`

---

## commands/ — Eigene Slash-Commands

Markdown-Dateien in `.claude/commands/` werden automatisch als `/dateiname` Slash-Commands verfügbar.

**Aufruf im Chat:**
```
/summarize-pr
/todo-check
```

**Mit Argument:**
```
/summarize-pr 42
```
Das Argument steht im Command-Prompt als `$ARGUMENTS` zur Verfügung.

**Neuen Command schreiben:**
1. Datei `.claude/commands/mein-command.md` anlegen
2. Als Prompt formulieren, was Claude tun soll
3. Mit `/mein-command` aufrufen

**Tipp:** Commands können Shell-Befehle enthalten, die Claude ausführen soll, oder reine Instruktionen sein.

---

## hooks/ — Automatische Aktionen

Hooks sind Shell-Skripte, die Claude Code bei bestimmten Ereignissen ausführt.

### Verfügbare Event-Typen

| Event | Wann | Dateiname (Konvention) |
|---|---|---|
| `PreToolUse` | Vor jedem Tool-Aufruf | `pre-tool-use.sh` |
| `PostToolUse` | Nach jedem Tool-Aufruf | `post-tool-use.sh` |
| `Stop` | Wenn Claude seine Antwort beendet | `stop.sh` |
| `Notification` | Bei Benachrichtigungen | `notification.sh` |

### In settings.json aktivieren

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "",
        "hooks": [{ "type": "command", "command": "bash .claude/hooks/pre-tool-use.sh" }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "",
        "hooks": [{ "type": "command", "command": "bash .claude/hooks/post-tool-use.sh" }]
      }
    ]
  }
}
```

### Input / Output der Hooks

Hooks empfangen JSON via `stdin` mit Infos zum Tool-Aufruf. Bei `PreToolUse`:
- Exit code `0` → Tool-Aufruf wird durchgelassen
- Exit code `!= 0` → Tool-Aufruf wird blockiert (stderr-Output wird an Claude zurückgegeben)

Bei `PostToolUse` wird der Exit-Code ignoriert — reine Benachrichtigung.

---

## mcp.json — MCP Server

MCP (Model Context Protocol) Server erweitern Claude um neue Tools (Datenbank, Dateisystem, APIs usw.).

Datei: `.claude/mcp.json`

```json
{
  "mcpServers": {
    "mein-server": {
      "command": "npx",
      "args": ["-y", "@mein-paket/mcp-server"],
      "env": {
        "API_KEY": "HIER_TOKEN_EINTRAGEN"
      }
    }
  }
}
```

**Wichtig:** Tokens nie direkt eintragen und committen. Entweder:
- Umgebungsvariablen referenzieren: `"${MY_API_KEY}"`
- `mcp.json` zur `.gitignore` hinzufügen wenn Tokens nötig sind

---

## settings.json — Einstellungen

Datei: `.claude/settings.json`

Wichtige Felder:

```json
{
  "permissions": {
    "allow": ["Bash(git *)", "Bash(npm run *)"],
    "deny": ["Bash(rm -rf *)"]
  },
  "env": {
    "NODE_ENV": "development"
  },
  "hooks": { ... }
}
```

- `permissions.allow` — Tool-Aufrufe, die ohne Nachfrage erlaubt sind
- `permissions.deny` — Tool-Aufrufe, die immer blockiert werden
- `env` — Umgebungsvariablen für die Session
- `hooks` — Hook-Konfiguration (siehe oben)

---

## .gitignore Empfehlung

Mindestens diese Einträge sollten ignoriert werden:

```
CLAUDE.local.md      # Persönliche Notizen
.claude/logs/        # Hook-Logdateien
```

---

## Lizenz

Template frei verwendbar — anpassen und erweitern nach Bedarf.
