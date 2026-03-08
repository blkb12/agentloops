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

All steps in `.designs/<topic>.plan.md` must be marked `- [x]` done,
with status `Executing` in INDEX.
If uncompleted steps remain → **stop, invoke /agentloops-execute first**.

## Startup Protocol

Read the full file chain for fresh perspective:

1. Read `.designs/INDEX.md` — find entry with status `Executing`
2. Read `.designs/<topic>.intent.md` — recover original intent and scope
3. Read `.designs/<topic>.md` — the design approach and decisions
4. Read `.designs/<topic>.plan.md` — what was planned and executed

The file chain is your source of truth. Review with fresh eyes — not biased by
implementation context.

## Process

### 1. Verify Holistically

Run full validation, not just individual step verifies:

- **Tests**: full test suite, not just step-level checks
- **Build**: clean build from scratch
- **Lint**: no new warnings or errors
- **Type check**: if applicable

Fix auto-fixable issues (lint, formatting) directly — up to 3 attempts.

### 2. Check Design Intent

For each decision in `.designs/<topic>.md`:
- Is it reflected in the implementation?
- Any decision that was silently dropped or changed?
- Any unintended side effects?

For each scope item in `.designs/<topic>.intent.md`:
- Is everything in "In" scope actually implemented?
- Was anything out of "Out" scope accidentally included?

This is the critical check that automated tests can't do.

### 3. Verdict

**Accept:**
- All tests pass
- Design intent is met
- No significant issues found
- → Update INDEX status to `Completed` (add date)
- → Done

**Remediate (minor — implementation issues):**
- Issues found that can be fixed with additional steps
- → Append fix steps to `.designs/<topic>.plan.md` (continue numbering)
- → Update Status line to reflect new total
- → Tell the user:
  > 发现 N 个需要修复的问题，已追加到计划。
  > 建议 **开新会话** 运行 `/agentloops-execute` 继续修复。
- → Do NOT move to Completed

**Redesign (major — design-level flaw):**
- The approach itself is wrong, or a key decision was misguided
- → Update INDEX status to `Dropped` (with reason)
- → Tell the user:
  > 发现设计层面的问题：<问题描述>。
  > 建议 **开新会话** 运行 `/agentloops-design`（或 `/agentloops-clarify`）重新设计。

### 4. Report

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
