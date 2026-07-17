# 🛡️ Code Execution, Verification & Cleaning Skills

> **Reusable AI skills for a four-stage code workflow—planning, execution/building, verification, and review—plus verification, cleanup, runtime auditing, and security-focused review.**

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)

---

## 📋 Table of Contents

- [Purpose](#-purpose)
- [Four-Stage Workflow](#-four-stage-workflow)
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Skills.sh Listing](#-skillssh-listing)
- [Repository Structure](#-repository-structure)
- [Core Principles](#-core-principles)
- [Verification Pipeline](#-verification-pipeline)
- [Reporting Workflow](#-reporting-workflow)
- [License](#-license)

---

## 🎯 Purpose

These skills guide AI agents through an explicit delivery workflow and empower them to:

- ✅ **Verify code correctness** - Ensure logic works as intended
- 🧹 **Remove dead code & duplication** - Keep codebases lean and maintainable
- 🔍 **Audit runtime behavior** - Browser-based verification with DevTools
- 🔒 **Check security issues** - Identify vulnerabilities and exposure risks
- 🏗️ **Enforce clean architecture** - Maintain modular, single-responsibility design
- 🧪 **Validate builds, tests & linting** - Automated quality gates

---

## 🧭 Four-Stage Workflow

Use [`skills/code-execution-skill/`](skills/code-execution-skill/) to coordinate every change through these ordered stages. Each stage has a required input and produces the handoff artifact required by the next stage.

| Stage | Input | Output / handoff |
| --- | --- | --- |
| **1. Planning** | Change request and repository context | **Approved plan** covering scope, approach, risks, acceptance criteria, and planned checks. |
| **2. Execution / Building** | Approved plan | **Implementation summary** recording completed work, changed files, build results, deviations, and known risks. |
| **3. Verification** | Implementation summary and changed code | **Verification results** with lint, test, runtime, security, and reporting evidence. |
| **4. Review** | Implementation summary and verification results | **Final review findings** with structural, security, and evidence-based disposition. |

### Shared verification and review skill

Both **verification** and **review** use the existing [`skills/code-verify-and-clean-skill/`](skills/code-verify-and-clean-skill/) skill. Do **not** move or rewrite that skill; it remains the shared source of truth.

- **Verification** follows its linting, tests, runtime checks, security checks, and reporting workflow. Record the commands, outcomes, evidence, remaining risks, and proceed/return recommendation in the verification results.
- **Review** follows its structural-cleanup standards, security-review guidance, [review template](skills/code-verify-and-clean-skill/assets/review-template.md), and verification evidence requirements. Record blocking issues, follow-ups, residual risks, and final disposition in the final review findings.

A change is complete only after all four artifacts are preserved: approved plan, implementation summary, verification results, and final review findings.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| **Static Analysis** | Automated linting, formatting, and compilation checks |
| **Runtime Auditing** | Live browser testing with console & network inspection |
| **Code Sanitization** | Remove unused imports, variables, and technical debt |
| **Security Scanning** | Detect injection points, token exposure, and client-side risks |
| **Architecture Review** | Enforce modularity and reusability patterns |

---

## 🚀 Getting Started

### Installation

```bash
npx skills add abozezo-dev/Code-Quality-Skill/code-execution-skill

# Add the shared verification and review skill
npx skills add abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill
```

### Quick Start

1. Add `code-execution-skill` and the shared `code-verify-and-clean-skill` to your AI agent configuration
2. Create and approve a plan, then implement and build the change
3. Use the existing verification-and-cleaning skill for verification and review
4. Preserve the four required handoff artifacts

---

## 🔗 Skills.sh Listing

View this skill on skills.sh:

- [Code Execution Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/code-execution-skill)
- [Code Verification & Cleaning Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill)

The repository page is customized with [`skills.sh.json`](skills.sh.json), and both skills live under [`skills/`](skills/) for a clean skills.sh-compatible layout.


---

## 📁 Repository Structure

```
Code-Quality-Skill/
├── skills/
│   ├── code-execution-skill/
│   │   └── SKILL.md                            # Four-stage delivery workflow
│   └── code-verify-and-clean-skill/
│       ├── assets/
│       │   ├── report-template.md          # Post-modification report template
│       │   ├── review-template.md          # Template for code reviews
│       │   ├── scan-template.md            # Pre-modification scan template
│       │   └── verification-checklist.md   # Comprehensive checklist
│       ├── reference/
│       │   ├── code-cleaning-universal.md  # Cleaning standards & patterns
│       │   ├── devtools-verification.md    # Browser audit workflows
│       │   ├── reporting-workflow.md       # SCAN.md and REPORT.md workflow
│       │   └── security-verification.md    # Security check guidelines
│       ├── scripts/
│       │   └── verify-pipeline.sh          # Automated verification script
│       └── SKILL.md                        # Full skill specification
├── .github/
│   └── workflows/
│       └── ci.yml                          # CI/CD pipeline
├── .gitignore                              # Local and generated file exclusions
├── skills.sh.json                          # skills.sh repository page customization
├── LICENSE                                 # MIT License
└── README.md                               # You are here!
```

---

## 🧠 Core Principles

### 1. Trust But Verify
Never assume code works just because it looks correct. Always:
- **Execute** - Boot servers, compile modules, run interpreters
- **Observe** - Use browser tools to catch visual/architectural breaks
- **Isolate** - Capture stack traces and system warnings

### 2. Radical Code Cleaning
Keep code lean, modern, and maintainable:
- 🗑️ Prune unused components, imports, and variables
- 🔄 Refactor complex logic into explicit early returns
- ♻️ Reuse global utilities instead of reinventing logic

### 3. Severity Tiers

| Marker | Meaning | Action |
|--------|---------|--------|
| 🔴 `[breaking-error]` | Code crashes or breaks workflows | **Blocks merge** |
| 🟡 `[code-smell]` | Works but introduces technical debt | Schedule refactor |
| 🟢 `[refactored]` | Auto-cleaned by agent | Already resolved |

---

## ⚙️ Verification Pipeline

### Phase 1: Static Analysis
```bash
# Run native linters and formatters
npm run lint
npm run format

# Execute pre-checks
./skills/code-verify-and-clean-skill/scripts/verify-pipeline.sh
```

### Phase 2: Structural Review
- Check modular breakdown (single responsibility)
- Audit for code duplication across modules
- Validate reusability patterns

### Phase 3: Live Browser Audits *(Frontend)*
1. Start local preview server
2. Open browser DevTools
3. Inspect console for errors/warnings
4. Trace network requests (no 400/500 errors)

---

## 📝 Reporting Workflow

The verification and cleaning workflow produces two application reports:

| Report | When Generated | Purpose |
|--------|----------------|---------|
| `SCAN.md` | Before modifications | Read-only scan report covering pre-modification verification, cleaning, and security findings. No application files may be modified during this stage. |
| `REPORT.md` | After modifications | Final application report documenting what changed, what was verified, remaining risks, and the final security/cleaning status. |

Use `SCAN.md` to establish the baseline state of the application before edits, then use `REPORT.md` to summarize the completed remediation and post-change validation. See `skills/code-verify-and-clean-skill/reference/reporting-workflow.md` for the full workflow and use `skills/code-verify-and-clean-skill/assets/scan-template.md` and `skills/code-verify-and-clean-skill/assets/report-template.md` as starting points for consistent reports.

---

## 📚 Additional Resources

- [DevTools Verification Guide](skills/code-verify-and-clean-skill/reference/devtools-verification.md)
- [Code Cleaning Standards](skills/code-verify-and-clean-skill/reference/code-cleaning-universal.md)
- [Security Verification](skills/code-verify-and-clean-skill/reference/security-verification.md)
- [Reporting Workflow Guide](skills/code-verify-and-clean-skill/reference/reporting-workflow.md)
- [SCAN.md Template](skills/code-verify-and-clean-skill/assets/scan-template.md)
- [REPORT.md Template](skills/code-verify-and-clean-skill/assets/report-template.md)
- [Review Template](skills/code-verify-and-clean-skill/assets/review-template.md)
- [Verification Checklist](skills/code-verify-and-clean-skill/assets/verification-checklist.md)

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2026 abozezo-dev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<p align="center">Made with ❤️ by <strong>abozezo-dev</strong></p>