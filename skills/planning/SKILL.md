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

A `.designs/<topic>.md` must exist with status `Designed` in INDEX.
If not → **stop, invoke /agentloops-design first**.

No code changes. Read code and the design doc to inform decomposition.

## Startup Protocol

1. Read `.designs/INDEX.md` — find entry with status `Designed`
2. Read `.designs/<topic>.intent.md` — recover original intent and scope
3. Read `.designs/<topic>.md` — understand approach, decisions, impact
4. Read affected code paths to understand current state

Do NOT start planning until you've completed these reads.
The intent + design files are your source of truth — not conversation history.

## Process

### 1. Decompose into Steps

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

### 2. Write Plan File

Write `.designs/<topic>.plan.md`:

```markdown
# <Topic> Plan

> Intent: [<topic>.intent.md](<topic>.intent.md)
> Design: [<topic>.md](<topic>.md)
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
- **Link to both intent and design** — executor reads them for full context

### 3. Present for Approval

Show the plan to the user. They may:
- Reorder steps
- Split or merge steps
- Adjust scope
- Approve as-is

### 4. Update INDEX

Update `.designs/INDEX.md`:
- Change status from `Designed` to `Planned`
- Add link to plan:

```markdown
- <topic> | Planned | YYYY-MM-DD | [intent](<topic>.intent.md) | [design](<topic>.md) | [plan](<topic>.plan.md)
```

## Handoff

Tell the user:

> 计划已记录到 `.designs/<topic>.plan.md`。
> 建议 **开新会话** 运行 `/agentloops-execute` 开始执行。
> 执行阶段会自动从 intent → design → plan 文件链恢复完整上下文。

## Skip Conditions

- Design is trivial (single-step, obvious implementation)
- User says to execute directly from design

## When the Plan Doesn't Fit

If decomposition reveals the design is incomplete or flawed (e.g., missing a step that
requires an unaddressed decision) → **stop, note what's wrong, invoke /agentloops-design**.
Don't paper over gaps with vague plan steps.
