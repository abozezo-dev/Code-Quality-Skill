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
