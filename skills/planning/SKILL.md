---
name: agentloops-planning
description: |
  Break a design into executable steps. Use after design is approved to create an implementation
  plan with concrete, independently committable steps. Reads the design document, decomposes
  into ordered steps with file targets and verification commands. Produces a .plan.md file
  in .designs/. Use for any approved design that needs implementation.
---

# Plan

## Precondition

An approved design document must exist at `.designs/<topic>.md` with Active status in INDEX.
If not → **stop, invoke /agentloops-design first**.

No code changes. Read code and the design doc to inform decomposition.

## Process

### 1. Read Context

- Read `.designs/INDEX.md` to locate the active design
- Read `.designs/<topic>.md` for approach, decisions, impact
- Read affected code paths to understand current state

### 2. Decompose into Steps

Break the design into ordered steps. Each step must be:

- **Independently committable** — the codebase works after each step
- **Verifiable** — has a concrete command to confirm correctness
- **Self-contained** — a new session can execute it without prior conversation context
- **Right-sized** — one coherent change (not 2-min micro-tasks, not full phases)

Ordering principles:
- Dependencies first (types, interfaces, data structures)
- Core logic before integrations
- Tests alongside or immediately after the code they test
- Each step builds on the last — no step requires jumping back

### 3. Write Plan File

Write `.designs/<topic>.plan.md`:

```markdown
# <Topic> Plan

> Design: [<topic>](<topic>.md)
> Status: 0/N steps done

## Steps

- [ ] 1. Short description of what to do
  - Files: `path/to/file.ts`, `path/to/other.ts`
  - Verify: `npm test -- --grep something`

- [ ] 2. Next step
  - Files: `path/to/file.ts`
  - Verify: `npm run lint && npm test`
```

Rules:
- **No code in the plan** — the executor is a capable Claude session
- **Every step has Files and Verify** — no exceptions
- **Status line** at the top — `0/N steps done`, updated by execute skill
- **Link to design doc** — executor reads it for rationale and context

### 4. Present for Approval

Show the plan to the user. They may:
- Reorder steps
- Split or merge steps
- Adjust scope
- Approve as-is

### 5. Update INDEX

If not already tracked, ensure `.designs/INDEX.md` reflects the active design has a plan.

## Skip Conditions

- Design is trivial (single-step, obvious implementation)
- User says to execute directly from design

## When Done

Plan is approved → **Next: user starts a new session and invokes /agentloops-execute**.

## When the Plan Doesn't Fit

If decomposition reveals the design is incomplete or flawed (e.g., missing a step that requires an unaddressed decision) → **stop, invoke /agentloops-design**. Don't paper over gaps with vague plan steps.
