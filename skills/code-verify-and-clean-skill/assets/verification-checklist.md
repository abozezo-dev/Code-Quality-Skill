
## `assets/verification-checklist.md`

```md
# Verification Checklist for AI Agent

This checklist must be strictly followed before approving any code changes or completing a refactoring task.

## 1. Architectural Boundaries
- [ ] Are all `use client` directives placed only at boundary components, avoiding unnecessary usage?
- [ ] Are props passed from Server Components to Client Components strictly serializable?
- [ ] Are Server Components fetching data directly from services or databases instead of internal route handlers?

## 2. Hydration & Browser APIs
- [ ] Are browser-specific APIs like `window`, `document`, and `localStorage` only used inside `useEffect` or event handlers?
- [ ] Are dynamic values like `Date.now()` and `Math.random()` stabilized to avoid server/client mismatches?
- [ ] Is the HTML structure valid, with no invalid nesting that could break hydration?

## 3. Caching & Data Fetching
- [ ] Do `fetch()` calls explicitly define caching strategy when needed?
- [ ] Is `'use cache'` used correctly for heavy computations or database queries where appropriate?
- [ ] Are unnecessary network hops avoided?

## 4. Routing & Layouts
- [ ] Do all parallel route folders include a `default.tsx` file where needed?
- [ ] Are global layouts free of interactive state that could leak across navigations?

## 5. Build & Runtime Execution
- [ ] Has the code been formatted and linted?
- [ ] Has the Browser DevTools console been checked for hydration or runtime errors?
- [ ] Were unused imports, dead variables, and commented-out blocks removed?

## 6. Reporting Workflow
- [ ] Was `SCAN.md` created before application file modifications?
- [ ] Does `SCAN.md` explicitly confirm the pre-modification stage was read-only?
- [ ] Does `SCAN.md` include verification, cleaning, and security findings?
- [ ] Were verification, cleaning, and security checks repeated after modifications?
- [ ] Was `REPORT.md` created after modifications as the final application report?
- [ ] Does `REPORT.md` document changes made, checks performed, remaining risks, and security/cleaning status?
