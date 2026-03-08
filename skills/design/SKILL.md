---
name: agentloops-design
description: |
  Technical design before implementation. Use after intent has been clarified to make technical
  decisions. Reads the codebase deeply, decides on approach, interfaces, and patterns, then
  presents the design for user approval. Requires a clarified intent — if none exists,
  invoke agentloops-clarify first. Use for any task involving design decisions before writing code.
---

# Design

## Precondition

A `.designs/<topic>.intent.md` must exist (produced by clarify phase).
If not → **stop, invoke /agentloops-clarify first**.

No code changes. Read code to inform decisions. Present design for approval before implementation.

## Startup Protocol

1. Read `.designs/INDEX.md` — find entry with status `Clarified`
2. Read `.designs/<topic>.intent.md` — recover intent, decisions, scope
3. Scan relevant code paths based on intent

Do NOT start designing until you've completed these reads.
The intent file is your source of truth — not conversation history.

## Process

### 1. Deep-Read the Codebase

Go beyond the surface scan done during clarification:
- Trace full code paths affected by this change
- Map dependencies, interfaces, and data flow
- Identify existing patterns, conventions, and abstractions
- Find potential conflicts or side effects

### 2. Make Technical Decisions

Based on what you've read:
- Choose approach and justify why
- Define interfaces, data structures, module boundaries
- Decide: follow existing patterns or diverge (and why)
- Identify risks and unknowns

### 3. Present Design — Chunked, Not Dumped

Present the design in **3-4 short sections**, each ≤ 300 words. After each section,
pause for the user to confirm, question, or adjust.

**Section order:**

**A. Approach Summary** (~100 words)
> 一句话方案 + 为什么选这个而非其他方案。

Wait for user confirmation before continuing.

**B. Key Decisions** (~200 words)
> 关键技术决策列表，每条一行描述 + 一行理由。

Mark anything uncertain with `[NEEDS CLARIFICATION: specific question]`.
Wait for user confirmation.

**C. Impact & Changes** (~200 words)
> 哪些现有代码会被影响，改动范围多大。

Wait for user confirmation.

**D. Risks** (~100 words)
> 什么可能出问题，有什么不确定的。

Wait for final approval to proceed.

### 4. Write Design Document

After approval, write `.designs/<topic>.md`:

```markdown
# <Topic>

> One-line summary of what and why.
> Intent: [<topic>.intent.md](<topic>.intent.md)

## Approach

How, and why this over alternatives.

## Decisions

- Decision 1 — rationale
- Decision 2 — rationale

## Impact

What existing code is affected.

## Risks

What could go wrong, what's uncertain.
```

Keep it concise. The document is a working reference, not a specification.

### 5. Update INDEX

Update `.designs/INDEX.md`:
- Change status from `Clarified` to `Designed`
- Add link to design doc:

```markdown
- <topic> | Designed | YYYY-MM-DD | [intent](<topic>.intent.md) | [design](<topic>.md)
```

### 6. Handoff

Tell the user:

> 设计已记录到 `.designs/<topic>.md`。
> 建议 **开新会话** 运行 `/agentloops-planning` 进入规划阶段。
> 也可以在当前会话继续。

## Lifecycle (for other skills/sessions to follow)

| Event | Action |
|-------|--------|
| Design created | Status → Designed in INDEX |
| Design adjusted during execution | Update the .md file directly, INDEX stays |
| Implementation completed | Status → Completed in INDEX (add date) |
| New design replaces old | Old → Dropped (with reason), new entry added |
| Design abandoned | Status → Dropped in INDEX |

## Skip Conditions

- Task is purely mechanical (clarify already determined no design decisions)
- The approach is obvious and singular (no alternatives to weigh)
- In these cases, create a minimal design doc and proceed

## When the Design Doesn't Fit

If during design you discover the clarified intent needs revision → **stop, update
`.designs/<topic>.intent.md` with what changed and why, invoke /agentloops-clarify**.
Don't force a bad design to fit a flawed intent.
