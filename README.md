# tree-sitter-javaswing

Tree-sitter grammar for Java Swing source code.

This grammar is a controlled fork of `tree-sitter-java` with additive Swing/AWT nodes for frontend structure that is otherwise hidden inside generic Java syntax. The goal is to expose official Java Swing concepts such as screens, components, listeners, layout wiring, dialog APIs, table models, combo boxes, text controls, root panes, timers, workers, focus, transfer handlers, and UI-thread invocation without breaking normal Java parsing.

## Scope

`tree-sitter-javaswing` still parses Java. Swing-specific rules are added only when the syntax can be recognized from local source text.

Included examples:

- Swing/AWT screen and component declarations, creations, and fields.
- `initComponents` generated UI blocks.
- Event listener wiring and event handler methods.
- Official layout, geometry, border, root pane, viewport, split pane, tabbed pane, toolbar, menu, popup, dialog, file chooser, table, list, combo box, spinner, text, focus, action, timer, worker, and transfer-handler APIs.
- High-volume validation against a private Java inventory using aggregate metrics.

Intentionally excluded:

- Client-specific GUI frameworks and subclasses.
- Third-party layout DSLs such as JGoodies `CellConstraints` and TableLayout profiles.
- Receiver-type-dependent calls such as broad `add(...)`, `setModel(...)`, `getModel()`, `setSelectedIndex(...)`, and `setResizable(...)` when local syntax cannot prove the receiver type.
- Semantic inheritance or symbol-table resolution.

## Current Validation

Latest stable validation snapshot:

- Tree-sitter corpus: `183/183` passing.
- Full Java inventory through FastParse: `3313/3313` parsed successfully.
- Hard parse failures: `0`.
- Files with Tree-sitter `ERROR`: `0`.
- `ERROR` nodes: `0`.
- `MISSING` nodes: `0`.
- Encoding-normalized inputs: `441`.

The private source inventory is not included in this repository. Public reports should use aggregate metrics only and must not include private source paths, snippets, or validation databases.

## Changelog And Releases

Public release history is tracked in `CHANGELOG.md`.

The initial alpha release notes are prepared in `docs/releases/0.1.0-alpha.md`.

Contribution guidelines are in `CONTRIBUTING.md`.

Security reporting guidance is in `SECURITY.md`.

## Development

Install dependencies:

```sh
npm ci
```

Generate parser artifacts:

```sh
npm run generate
```

Run corpus tests:

```sh
npm test
```

Run smoke, query, package, and dependency checks:

```sh
npm run metadata:check
npm run parse:check
npm run query:check
npm run pack:check
npm run audit:check
```

Private inventory validation is performed in the local parser lab and is intentionally excluded from the public package.

## Public Node Documentation

Public node and field documentation is generated from `src/node-types.json`:

```text
docs/nodes.md
```

It lists named `javaswing_*` nodes, public field names, and direct child node types.

Parser-list readiness notes are tracked in `docs/parser-list.md`.

## Rule Catalogs

Private rule catalogs in the parser lab record the official API basis, supported local syntax, excluded forms, semantic limits, corpus coverage, and audit result for each rule.

Those catalogs are not part of the public package until they pass a privacy review. The public corpus under `test/corpus/` contains synthetic examples for the supported parse shapes.

## Queries

The grammar ships with:

- `queries/highlights.scm`
- `queries/tags.scm`
- `queries/swing.scm`

The Swing query file is intended for downstream extraction experiments. Stable domain concepts should become named grammar nodes when they can be recognized safely by syntax alone.

## Public Release Status

This grammar is not public-release ready yet.

Before publication:

- Choose the final GitHub repository URL and update `tree-sitter.json`.
- Add or confirm package metadata for the intended distribution channels.
- Run CI for `tree-sitter generate`, `tree-sitter test`, query checks, and package dry-run.
- Confirm public issue templates and contribution guidelines do not request or expose private source.
- Review queries and package contents.
- Remove private validation artifacts from any public package or repository.
- Keep private corpus evidence as aggregate metrics only.

The current publication checklist lives in the private parser lab until the public repository exists.
