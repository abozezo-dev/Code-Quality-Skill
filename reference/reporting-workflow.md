# Reporting Workflow Guide

This guide defines the required two-report workflow for verification, cleaning, and security review runs.

## Purpose

The reporting workflow creates an auditable record before and after file modifications:

- `SCAN.md` captures the complete pre-modification application state.
- `REPORT.md` captures the final post-modification application state.

Agents must use these reports to separate read-only discovery from implementation and final validation.

## Stage 1: Pre-Modification Scan (`SCAN.md`)

Before modifying application files, perform a read-only scan of the repository and create `SCAN.md`.

### Requirements

1. Scan the application without modifying files.
2. Create `SCAN.md` as the complete pre-modification application report.
3. Include verification, cleaning, and security findings in `SCAN.md`.
4. Explicitly state in `SCAN.md` that no files may be modified during this stage.

### Required Content

`SCAN.md` must include:

- scope of files, modules, routes, or services reviewed
- commands or tools used for read-only verification
- build, test, lint, type-check, and runtime findings when applicable
- dead code, duplication, formatting, and maintainability findings
- security findings, including input validation, authorization, secret exposure, and unsafe client storage risks
- risks that require modification during the implementation stage
- explicit confirmation that application files were not modified during the scan stage

## Stage 2: Implementation

After `SCAN.md` is complete, apply the approved file modifications required by the task.

During implementation:

- keep changes focused on the requested work and scan findings
- avoid unrelated rewrites
- preserve behavior unless an intentional behavior change is required
- track each meaningful change for inclusion in `REPORT.md`

## Stage 3: Post-Modification Report (`REPORT.md`)

After files have been scanned and modified, repeat verification, cleaning, and security checks, then create `REPORT.md`.

### Requirements

1. Perform verification, cleaning, and security checks again.
2. Create `REPORT.md` as the complete post-modification application report.
3. Include what was changed, what was verified, remaining risks, and security/cleaning status.

### Required Content

`REPORT.md` must include:

- summary of completed changes
- files modified and why
- verification commands and results
- cleaning actions performed or confirmed unnecessary
- security checks performed and results
- resolved findings from `SCAN.md`
- remaining risks, limitations, or follow-up work
- final status for verification, cleaning, and security

## Evidence Standard

Reports should prefer evidence over assertions. Include command names, routes tested, files reviewed, and clear pass/fail/warning status.

## Completion Rule

A verification and cleaning workflow is not complete until both reports exist when modifications are made:

1. `SCAN.md` before implementation
2. `REPORT.md` after implementation and final checks
