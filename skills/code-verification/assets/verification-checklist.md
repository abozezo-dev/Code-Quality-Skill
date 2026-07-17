# Verification Checklist

Use this checklist before approving code changes.

## Static and Build Checks

- [ ] Relevant formatter was run or its status was recorded.
- [ ] Relevant linter was run or its status was recorded.
- [ ] Relevant type checker or compiler was run or its status was recorded.
- [ ] Relevant automated tests were run or their absence was recorded.
- [ ] Build/package command was run when the project provides one.

## Change-Focused Checks

- [ ] The changed behavior has a command-backed or test-backed verification result.
- [ ] Failures were investigated and affected checks were rerun after fixes.
- [ ] Skipped checks are identified with an environment or configuration reason.
- [ ] Pass/fail/warning results are reported without overstating coverage.

## Escalation

- [ ] Browser-facing changes were sent through `runtime-devtools-audit`.
- [ ] Security-sensitive changes were sent through `security-review`.
- [ ] Cleanup/refactoring changes were sent through `clean-code`.
