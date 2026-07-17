# 🛡️ Code Quality Skills

> **Reusable AI skills for plan-driven implementation, React/Next.js implementation guidance, and code verification, cleanup, runtime auditing, and security-focused review.**

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)

---

## 📋 Table of Contents

- [Purpose](#-purpose)
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Implementation Workflow](#-implementation-workflow)
- [Skills.sh Listing](#-skillssh-listing)
- [Repository Structure](#-repository-structure)
- [Core Principles](#-core-principles)
- [Verification Pipeline](#-verification-pipeline)
- [Reporting Workflow](#-reporting-workflow)
- [License](#-license)

---

## 🎯 Purpose

These skills empower AI agents to:

- ✅ **Verify code correctness** - Ensure logic works as intended
- 🧹 **Remove dead code & duplication** - Keep codebases lean and maintainable
- 🔍 **Audit runtime behavior** - Browser-based verification with DevTools
- 🔒 **Check security issues** - Identify vulnerabilities and exposure risks
- 🏗️ **Enforce clean architecture** - Maintain modular, single-responsibility design
- 🧪 **Validate builds, tests & linting** - Automated quality gates
- 🧭 **Execute approved plans incrementally** - Implement small, verified changes that follow repository conventions

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
npx skills add abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill
npx skills add abozezo-dev/Code-Quality-Skill/execution
npx skills add abozezo-dev/Code-Quality-Skill/react-best-practices
```

### Quick Start

1. Install `execution` after an implementation plan has been approved.
2. Ask the agent to implement the plan; it works in small verifiable increments and hands off to `code-verify-and-clean-skill`.
3. For React or Next.js changes, install `react-best-practices` too. `execution` invokes it only for React/Next.js work.
4. Run verification on the target codebase and review the generated report templates in `skills/code-verify-and-clean-skill/assets/`.

## 🧭 Implementation Workflow

The [`execution`](skills/execution/SKILL.md) skill consumes an **approved** plan, discovers local conventions,
implements one independently verifiable increment at a time, and sends the completed change to
[`code-verify-and-clean-skill`](skills/code-verify-and-clean-skill/SKILL.md) for verification and review.

For React or Next.js implementation tasks, it has an explicit local dependency on
[`react-best-practices`](skills/react-best-practices/SKILL.md). Install both skills for those projects; no React
guidance is applied to non-React work.

---

## 🔗 Skills.sh Listing

View this skill on skills.sh:

- [Code Verification & Cleaning Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill)
- [Implementation Execution](https://skills.sh/abozezo-dev/Code-Quality-Skill/execution)
- [React and Next.js Best Practices](https://skills.sh/abozezo-dev/Code-Quality-Skill/react-best-practices)

The repository page is customized with [`skills.sh.json`](skills.sh.json), and all skill files live under [`skills/`](skills/) for a clean skills.sh-compatible layout.

---

## 📁 Repository Structure

```
Code-Quality-Skill/
├── skills/
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
│   ├── execution/
│   │   └── SKILL.md                        # Approved-plan implementation workflow
│   └── react-best-practices/
│       └── SKILL.md                        # React and Next.js implementation guidance
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

Install the orchestrator only when a coordinated scan, remediation, verification, and final report are needed:

```bash
npx skills add abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill
```

## Skills

| Skill | Use it for | Included resources |
|---|---|---|
| [`clean-code`](skills/clean-code/) | Dead-code removal, unused imports, duplication, complexity reduction, data flow, and modular architecture. | Universal cleaning guide and clean-code review template. |
| [`code-verification`](skills/code-verification/) | Builds, tests, linters, formatters, type checks, and evidence-backed verification. | Optional cross-ecosystem pipeline and verification checklist. |
| [`runtime-devtools-audit`](skills/runtime-devtools-audit/) | Browser rendering, hydration, console, network, and interaction audits. | DevTools verification guide. |
| [`security-review`](skills/security-review/) | Input validation, authorization, injection, secrets, storage, uploads, redirects, and secure defaults. | Security verification guide. |
| [`code-verify-and-clean-skill`](skills/code-verify-and-clean-skill/) | Composing the focused skills and producing before/after quality reports. | Reporting workflow plus `SCAN.md` and `REPORT.md` templates. |

## Repository structure

```text
skills/
├── clean-code/
│   ├── assets/review-template.md
│   ├── reference/code-cleaning-universal.md
│   └── SKILL.md
├── code-verification/
│   ├── assets/verification-checklist.md
│   ├── scripts/verify-pipeline.sh
│   └── SKILL.md
├── runtime-devtools-audit/
│   ├── reference/devtools-verification.md
│   └── SKILL.md
├── security-review/
│   ├── reference/security-verification.md
│   └── SKILL.md
└── code-verify-and-clean-skill/  # Optional orchestrator
    ├── assets/{scan-template,report-template}.md
    ├── reference/reporting-workflow.md
    └── SKILL.md
```

## Reporting workflow

When using the orchestration skill, create `SCAN.md` after a read-only assessment and before application changes. After remediation and re-verification, create `REPORT.md` that records results, reconciles findings, and notes remaining risks. See [the reporting workflow](skills/code-verify-and-clean-skill/reference/reporting-workflow.md) for requirements.

## License

<p align="center">Made with ❤️ by <strong>abozezo-dev</strong></p>
