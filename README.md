# 🛡️ Code Quality Skills

A collection of independently installable skills for code cleanup, verification, browser-runtime auditing, and security review. The original `code-verify-and-clean-skill` remains available as an optional orchestration skill that composes the focused skills and manages the two-report workflow.

## Install a focused skill

```bash
# Choose the capability that matches the task.
npx skills add abozezo-dev/Code-Quality-Skill/clean-code
npx skills add abozezo-dev/Code-Quality-Skill/code-verification
npx skills add abozezo-dev/Code-Quality-Skill/runtime-devtools-audit
npx skills add abozezo-dev/Code-Quality-Skill/security-review
```

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

MIT. See [LICENSE](LICENSE).
