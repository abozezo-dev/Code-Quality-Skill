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
- [Workflow](#-workflow)
- [Resources](#-resources)
- [License](#-license)

---

## 🎯 Purpose

These skills guide AI agents through an explicit delivery workflow and empower them to:

| Need | Owning sub-skill |
|------|------------------|
| Remove dead code, duplication, and unnecessary complexity | [Clean Code](skills/clean-code/SKILL.md) |
| Run builds, tests, linters, and formatting checks | [Code Verification](skills/code-verification/SKILL.md) |
| Inspect a running frontend with browser DevTools | [Runtime Auditing](skills/runtime-auditing/SKILL.md) |
| Review injection risks, exposed tokens, and client-side security issues | [Security Review](skills/security-review/SKILL.md) |
| Perform the complete scan, cleanup, verification, and reporting workflow | [Code Verification & Cleaning bundle](skills/code-verify-and-clean-skill/SKILL.md) |

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

- **[Clean Code](skills/clean-code/SKILL.md)** — owns dead-code removal, duplicate-code reduction, simplification, and modularity improvements.
- **[Code Verification](skills/code-verification/SKILL.md)** — owns compilation, tests, linting, formatting, and other automated quality gates.
- **[Runtime Auditing](skills/runtime-auditing/SKILL.md)** — owns browser-based validation, console inspection, network checks, and UI runtime diagnostics.
- **[Security Review](skills/security-review/SKILL.md)** — owns security-focused review for injection points, credential exposure, and client-side risks.
- **[Code Verification & Cleaning](skills/code-verify-and-clean-skill/SKILL.md)** — the optional bundle that combines every sub-skill and coordinates the end-to-end reporting workflow.

---

## 🚀 Installation

Install the smallest sub-skill that covers the task. For example, install **Clean Code** by itself:

#### Code Verification & Cleaning

```bash
npx skills add abozezo-dev/Code-Quality-Skill/clean-code
```

#### Project Planning

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

View these skills on skills.sh:

- [Code Execution Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/code-execution-skill)
- [Code Verification & Cleaning Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/code-verify-and-clean-skill)
- [Project Planning Skill](https://skills.sh/abozezo-dev/Code-Quality-Skill/project-planning)

The repository page is customized with [`skills.sh.json`](skills.sh.json), and both skills live under [`skills/`](skills/) for a clean skills.sh-compatible layout.


---

## 📁 Repository Structure

```text
Code-Quality-Skill/
├── skills/
│   ├── code-execution-skill/
│   │   └── SKILL.md                            # Four-stage delivery workflow
│   └── code-verify-and-clean-skill/
│       ├── assets/                             # Bundle report and review templates
│       ├── reference/                          # Bundle workflow guides
│       ├── scripts/                            # Bundle automation
│       └── SKILL.md                            # All-in-one workflow
├── .github/workflows/ci.yml                    # CI checks
├── skills.sh.json                              # skills.sh repository configuration
├── LICENSE                                     # MIT license
└── README.md                                   # You are here
```

Each directory above links to its own `SKILL.md`: [Clean Code](skills/clean-code/SKILL.md), [Code Verification](skills/code-verification/SKILL.md), [Runtime Auditing](skills/runtime-auditing/SKILL.md), [Security Review](skills/security-review/SKILL.md), and the [all-in-one bundle](skills/code-verify-and-clean-skill/SKILL.md).

---

## 🧠 Core Principles

### 1. Trust But Verify — Code Verification and Runtime Auditing

Do not treat code that looks correct as code that is correct. **Code Verification** executes builds, tests, and static checks; **Runtime Auditing** validates the running application, including browser console output and network activity.

### 2. Keep Code Lean — Clean Code

**Clean Code** keeps codebases maintainable by pruning unused components, imports, and variables; reducing duplication; and simplifying complex logic into explicit, reusable modules.

### 3. Treat Security Findings as First-Class — Security Review

**Security Review** identifies injection opportunities, exposed tokens, and client-side exposure risks before they become production issues.

### 4. Use Clear Severity Tiers — All-in-One Bundle

The **Code Verification & Cleaning** bundle uses consistent markers when coordinating multiple sub-skills:

| Marker | Meaning | Action |
|--------|---------|--------|
| 🔴 `[breaking-error]` | Code crashes, fails checks, or breaks a workflow | **Blocks merge** |
| 🟡 `[code-smell]` | Code works but adds debt or avoidable complexity | Schedule remediation |
| 🟢 `[refactored]` | A cleanup was applied and verified | Already resolved |

---

## ⚙️ Workflow

1. **Clean Code** removes obvious dead code, duplication, and structural bloat.
2. **Code Verification** runs the repository's native build, test, lint, and formatting commands.
3. **Runtime Auditing** validates changed frontend behavior in a live browser when applicable.
4. **Security Review** checks the changed surface for security risks.
5. The **all-in-one bundle** coordinates the full workflow and records the pre-change `SCAN.md` and post-change `REPORT.md` when comprehensive reporting is required.

---

## 📚 Resources

The optional bundle supplies shared workflow resources; use the indicated sub-skill for the capability each resource supports.

| Resource | Capability owner | Description |
|----------|------------------|-------------|
| [Code Cleaning Standards](skills/code-verify-and-clean-skill/reference/code-cleaning-universal.md) | [Clean Code](skills/clean-code/SKILL.md) | Cleaning standards and patterns for reducing technical debt. |
| [DevTools Verification Guide](skills/code-verify-and-clean-skill/reference/devtools-verification.md) | [Runtime Auditing](skills/runtime-auditing/SKILL.md) | Browser, layout, console, and network-audit guidance. |
| [Security Verification Guide](skills/code-verify-and-clean-skill/reference/security-verification.md) | [Security Review](skills/security-review/SKILL.md) | Security checks for injection and client-side exposure. |
| [Reporting Workflow Guide](skills/code-verify-and-clean-skill/reference/reporting-workflow.md) | [Code Verification & Cleaning bundle](skills/code-verify-and-clean-skill/SKILL.md) | `SCAN.md` and `REPORT.md` workflow and evidence standards. |
| [Verification Checklist](skills/code-verify-and-clean-skill/assets/verification-checklist.md) | [Code Verification](skills/code-verification/SKILL.md) | Checklist for automated verification gates. |
| [Review Template](skills/code-verify-and-clean-skill/assets/review-template.md) | [Security Review](skills/security-review/SKILL.md) | Consistent review findings and remediation notes. |
| [SCAN.md Template](skills/code-verify-and-clean-skill/assets/scan-template.md) | [Code Verification & Cleaning bundle](skills/code-verify-and-clean-skill/SKILL.md) | Baseline report template before modifications. |
| [REPORT.md Template](skills/code-verify-and-clean-skill/assets/report-template.md) | [Code Verification & Cleaning bundle](skills/code-verify-and-clean-skill/SKILL.md) | Final report template after remediation and validation. |

---

## Reporting workflow

This project is licensed under the [MIT License](LICENSE).

---

<p align="center">Made with ❤️ by <strong>abozezo-dev</strong></p>
