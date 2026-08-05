# pre-commit-hooks

Reusable hook configurations for the [pre-commit](https://pre-commit.com/)
framework, published so other repositories can reference them in their
`.pre-commit-config.yaml`. This repository eats its own dog food: it installs
and runs the same hooks it distributes.

The capitalized words REQUIRED, MUST, MUST NOT, RECOMMENDED, SHOULD,
SHOULD NOT, OPTIONAL, and MAY are to be interpreted as described in
[IETF RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Tech stack

- Python 3 (`hooks/validate_commit_message.py`), run by pre-commit as a
  `language: script` hook — no external Python dependencies.
- The [pre-commit](https://pre-commit.com/) framework itself, installed via `pipx`.

## Project structure

- **[hooks/validate_commit_message.py](./hooks/validate_commit_message.py)** \
  Validates that a commit message matches `<type>: <description>`, where
  `<type>` is one of the revision types defined in TS-9 (`chore`, `feature`,
  `fix`, `maintenance`, `merge`, `performance`, `refactor`, `release`,
  `revert`, `step`, `style`).

- **[.pre-commit-hooks.yaml](./.pre-commit-hooks.yaml)** \
  The hook manifest consumed by downstream repositories — declares the
  `validate-commit-message` hook ID, entry point, and `commit-msg` stage.

- **[.pre-commit-config.yaml](./.pre-commit-config.yaml)** \
  This repository's own pre-commit config, referencing the hooks it defines.

- **[CHANGELOG.md](./CHANGELOG.md)** \
  Records changes to the hooks per version, including breaking changes to
  the commit-message format (eg. renamed/removed type prefixes).

## Rules

- MUST update `VALID_TYPES` in `hooks/validate_commit_message.py` and
  `CHANGELOG.md` together — the list is the single source of truth for
  allowed commit types and any change to it is a breaking change for every
  downstream consumer pinned to this hook.

- MUST tag a new version (`rev:` in consumers' configs) after any change to
  `hooks/` or `.pre-commit-hooks.yaml`, and record it in `CHANGELOG.md`.

- SHOULD run `pre-commit install` locally so commits in this repository are
  validated by the same hook it ships.

## References

This project follows Kieran Potts' technical standards. Read the relevant
standard(s) below for the current task; their RFC 2119 rules MUST be followed
unless explicitly overridden elsewhere in this file.

- **[TS-9: Version Control](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/009/AGENTS.md)**
- **[TS-11: Versioning](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/011/AGENTS.md)**
- **[TS-35: Python](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/035/AGENTS.md)**
