---
name: agentloops-execute
description: |
  Execute plan steps with verification discipline. Use when a .plan.md exists in .designs/ and
  implementation work needs to happen. Reads the plan, picks up from the next incomplete step,
  executes with verification, and tracks progress. Designed for new sessions picking up work
  across session boundaries. Invoke at the start of a coding session to continue implementation.
---

# Execute

## Precondition

A plan file must exist at `.designs/<topic>.plan.md` with uncompleted `- [ ]` steps.
If no plan exists → **stop, invoke /agentloops-planning first**.
If all steps are already done → **stop, invoke /agentloops-review instead**.

## Startup Protocol

Every execution session begins the same way:

1. Read `.designs/INDEX.md` — find active designs
2. Read `.designs/<topic>.plan.md` — find next `- [ ]` step
3. Read `.designs/<topic>.md` — understand design context
4. Scan recently changed files (git log) — understand what previous sessions did

Do NOT start coding until you've completed these reads.

## Execution Loop

For each step:

### 1. Understand

Read the step's target files. Understand what exists before changing anything.

### 2. Implement

Write the code. Follow existing patterns and conventions. Keep changes minimal and focused on what the step describes.

### 3. Verify

Run the step's Verify command. It must pass.

- **Pass** → continue to Mark Done
- **Fail** → fix and retry (up to 3 attempts)
- **Still failing** → stop, leave step unchecked, add a note in the plan file under the step:
  `- Blocked: <reason>`

### 4. Mark Done

- Check the box: `- [ ]` → `- [x]`
- Add completion date: `- Done: YYYY-MM-DD`
- Update the Status line at the top: `M/N steps done`
- Commit code changes AND the updated plan file together

### 5. Continue or Stop

- **Next step exists and is independent** → continue
- **Blocked** → stop, report blocker
- **Session getting long** → stop at a clean boundary, progress is saved in the plan file
- **All steps done** → **Next: invoke /agentloops-review** (do NOT update INDEX — that's review's job)

## Commit Discipline

Each step = one commit. Commit message references the plan:

```
feat(auth): extract auth middleware (step 1/5)
```

Include both code changes and the updated `.plan.md` in the same commit.

## When Things Go Wrong

| Situation | Action |
|-----------|--------|
| Step is unclear | Read the design doc for context, then proceed with best judgment |
| Step seems wrong | Add a note, skip it, continue with next step |
| Design flaw discovered | Stop execution, note the issue in the plan → **invoke /agentloops-design** |
| Verify command itself is wrong | Fix the verify command in the plan, then run the corrected version |

## Do NOT

- Skip the startup protocol
- Execute without running verify
- Mark a step done if verify fails
- Modify the design doc (that's design skill's job)
- Reorder or add steps (that's planning skill's job — but you may add a `- Blocked:` note)
