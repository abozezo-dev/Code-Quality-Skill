# 🛡️ Code Verification & Cleaning Skill

> **A reusable AI skill for code verification, cleanup, runtime auditing, and security-focused review.**

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)

---

## 📋 Table of Contents

- [Purpose](#-purpose)
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Repository Structure](#-repository-structure)
- [Core Principles](#-core-principles)
- [Verification Pipeline](#-verification-pipeline)
- [License](#-license)

---

## 🎯 Purpose

This skill empowers AI agents to:

- ✅ **Verify code correctness** - Ensure logic works as intended
- 🧹 **Remove dead code & duplication** - Keep codebases lean and maintainable
- 🔍 **Audit runtime behavior** - Browser-based verification with DevTools
- 🔒 **Check security issues** - Identify vulnerabilities and exposure risks
- 🏗️ **Enforce clean architecture** - Maintain modular, single-responsibility design
- 🧪 **Validate builds, tests & linting** - Automated quality gates

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
npx skills add abozezo-dev/Code-Quality-Skill
```

### Quick Start

1. Add the skill to your AI agent configuration
2. Run verification on your target codebase
3. Review the generated reports in `assets/`

---

## 📁 Repository Structure

```
code-verify-and-clean-skill/
├── assets/
│   ├── review-template.md          # Template for code reviews
│   └── verification-checklist.md   # Comprehensive checklist
├── reference/
│   ├── code-cleaning-universal.md  # Cleaning standards & patterns
│   ├── devtools-verification.md    # Browser audit workflows
│   └── security-verification.md    # Security check guidelines
├── Scripts/
│   └── verify-pipeline.sh          # Automated verification script
├── .github/
│   └── workflows/
│       └── ci.yml                  # CI/CD pipeline
├── SKILL.md                        # Full skill specification
├── LICENSE                         # MIT License
└── README.md                       # You are here!
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
./Scripts/verify-pipeline.sh
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

## 📚 Additional Resources

- [DevTools Verification Guide](reference/devtools-verification.md)
- [Code Cleaning Standards](reference/code-cleaning-universal.md)
- [Security Verification](reference/security-verification.md)
- [Review Template](assets/review-template.md)
- [Verification Checklist](assets/verification-checklist.md)

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