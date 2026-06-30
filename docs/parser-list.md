# Parser List Readiness

This document tracks public parser-list readiness for `tree-sitter-javaswing`.

It should be reviewed after the standalone GitHub repository exists and before requesting inclusion in any public Tree-sitter parser index.

## Current Grammar Metadata

- Grammar name: `javaswing`
- Package name: `tree-sitter-javaswing`
- Scope: `source.javaswing`
- File types: `java`
- License: `MIT`
- Version: `0.1.0`
- ABI version: `15`
- Upstream grammar: `tree-sitter-java`
- External scanner: none
- Generated `src/parser.c`: present
- Generated `src/grammar.json`: present
- Generated `src/node-types.json`: present
- Binding metadata currently enabled: C only

## Repository Metadata

- Repository URL: `https://github.com/natan-sysview/tree-sitter-javaswing`
- Public commit SHA: fill after first commit
- Public release tag: fill after first release

## Remaining Metadata To Fill

These fields must be filled after the public GitHub repository is created:

- `tree-sitter.json` metadata repository link
- `package.json` repository link
- public maintainer or author metadata
- GitHub topics
- first public commit SHA
- first public release tag

Recommended GitHub topics:

- `tree-sitter`
- `parser`
- `grammar`
- `java`
- `swing`
- `javaswing`

## Required Public Checks

Run from a clean public clone:

```sh
npm ci
npm run generate
npm test
npm run parse:check
npm run query:check
npm run pack:check
npm run audit:check
```

Expected alpha validation:

- Corpus tests: `183/183`
- Parse smoke test: passes
- Query checks: pass
- Package dry-run: no private lab files
- NPM audit: no high severity vulnerabilities

## Private Evidence Policy

Private inventory results may be shared only as aggregate metrics:

- total files parsed;
- hard parse failures;
- files with `ERROR`;
- total `ERROR` nodes;
- total `MISSING` nodes;
- normalized inputs.

Do not publish private source paths, snippets, validation databases, MessagePack files, audit reports, hashes, local machine paths, or source-derived examples.

## Parser-List Submission Notes

Before requesting parser-list inclusion:

1. Confirm the public repository URL is stable.
2. Confirm `tree-sitter.json` has the repository link.
3. Confirm generated parser artifacts are committed.
4. Confirm CI is green on `main`.
5. Confirm the GitHub release is marked pre-release for alpha builds.
6. Confirm the package dry-run output contains only public grammar files.
7. Confirm issue templates and contribution docs ask for synthetic minimal examples.

Do not claim official GitHub.com syntax highlighting unless GitHub adopts the grammar through its own process.
