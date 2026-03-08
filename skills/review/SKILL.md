---
name: agentloops-review
description: |
  Review completed implementation against the original design. Use after all plan steps are
  marked done to validate that the implementation meets design intent, passes all tests, and
  maintains code quality. Produces a verdict: accept (mark Completed in INDEX) or remediate
  (append fix steps to the plan). Run in a new session for fresh perspective.
---

# Review

## Precondition

All steps in `.designs/<topic>.plan.md` must be marked `- [x]` done.
If uncompleted steps remain → **stop, invoke /agentloops-execute first**.

## Process

### 1. Load Context

- Read `.designs/INDEX.md` — find the design under review
- Read `.designs/<topic>.md` — the design intent and decisions
- Read `.designs/<topic>.plan.md` — what was planned and executed

### 2. Verify Holistically

Run full validation, not just individual step verifies:

- **Tests**: full test suite, not just step-level checks
- **Build**: clean build from scratch
- **Lint**: no new warnings or errors
- **Type check**: if applicable

Fix auto-fixable issues (lint, formatting) directly — up to 3 attempts.

### 3. Check Design Intent

For each design decision in `.designs/<topic>.md`:
- Is it reflected in the implementation?
- Any decision that was silently dropped or changed?
- Any unintended side effects?

This is the critical check that automated tests can't do.

### 4. Verdict

**Accept:**
- All tests pass
- Design intent is met
- No significant issues found
- → Move design to Completed in INDEX.md (add date)
- → Done

**Remediate (minor — implementation issues):**
- Issues found that can be fixed with additional steps
- → Append fix steps to `.designs/<topic>.plan.md` (continue numbering)
- → Update Status line to reflect new total
- → **Next: invoke /agentloops-execute**
- → Do NOT move to Completed

**Redesign (major — design-level flaw):**
- The approach itself is wrong, or a key decision was misguided
- → Move design to Dropped in INDEX.md (with reason)
- → **Next: invoke /agentloops-design** (or /agentloops-clarify if the intent itself was wrong)

### 5. Report

Summarize briefly:
- What was checked
- What passed
- What needs work (if remediate)
- Any observations for future reference

## Do NOT

- Rewrite working code for style preferences
- Add scope beyond the original design
- Mark Completed if there are real issues
- Create a separate report file (keep it in conversation + plan updates)
