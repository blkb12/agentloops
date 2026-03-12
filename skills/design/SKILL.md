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

1. Read `.designs/INDEX.md` — find entry with status `Clarified` or `Designing`
2. Read `.designs/<topic>.intent.md` — recover intent, decisions, scope
3. Read `.designs/<topic>.md` if it exists — **resume from existing content**, don't restart
4. Scan relevant code paths based on intent

Do NOT start designing until you've completed these reads.
The intent file and design doc (if partial) are your source of truth — not conversation history.

## Process

The design doc is a **working document** — write to it as sections get confirmed, not all at
the end. This ensures progress survives session breaks.

### 1. Deep-Read the Codebase

Go beyond the surface scan done during clarification:
- Trace full code paths affected by this change
- Map dependencies, interfaces, and data flow
- Identify existing patterns, conventions, and abstractions
- Find potential conflicts or side effects

### 2. Align Core Concepts

Before technical decisions, align with the user on what the core "things" are.

**Present**: list the concepts you identified from intent + code, one sentence each:

> 基于意图和代码，我理解这个系统的核心概念是：
> - **Concept A**：一句话——它是什么，为什么存在
> - **Concept B**：一句话
> - **Concept C**：一句话
>
> 这跟你的理解一致么？有没有觉得不对、多余、或者缺少的？

**React to the user's response**:

- User confirms → write Concepts section to design doc, proceed
- User adjusts a concept → update your understanding, re-present if needed
- User is unsure about a concept → ground it in a concrete scenario:
  "比如用户做 X 的时候，这个概念负责的是 Y——是这样理解么？"
- User is unsure overall → describe the system as a short story, let concepts emerge
  from the narrative
- Concepts feel tangled → dig deeper: what's its boundary? what does it NOT include?
  what rules must always hold?

The 6 diagnostic questions (purpose, boundaries, relationships, invariants, lifecycle,
naming precision) are your internal tools — use them to prepare and probe.
Don't expose them as a checklist.

Reference `knowledge/conceptual-modeling-guide.md` for deeper techniques when concepts
prove difficult to untangle.

**When confirmed** → write the Concepts section to `.designs/<topic>.md`.
If this is the first write to the design doc, also update INDEX status to `Designing`:

```markdown
- <topic> | Designing | YYYY-MM-DD | [intent](<topic>.intent.md) | [design](<topic>.md)
```

### 3. Make Technical Decisions

Based on the aligned concepts:
- Choose approach and justify why
- Define interfaces, data structures, module boundaries
- Decide: follow existing patterns or diverge (and why)
- Identify risks and unknowns

### 4. Present & Write — Chunked

Present each section (≤ 300 words), get confirmation, **write to design doc immediately**.

**A. Approach Summary** (~100 words)
> 一句话方案 + 为什么选这个而非其他方案。

Confirmed → write to doc. Wait before continuing.

**B. Key Decisions** (~200 words)
> 关键技术决策列表，每条一行描述 + 一行理由。

Mark anything uncertain with `[NEEDS CLARIFICATION: specific question]`.
Confirmed → write to doc.

**C. Impact & Changes** (~200 words)
> 哪些现有代码会被影响，改动范围多大。

Confirmed → write to doc.

**D. Risks** (~100 words)
> 什么可能出问题，有什么不确定的。

Confirmed → write to doc.

### 5. Final Review

All sections are now in the design doc. Present a brief summary for the user to review
the full picture.

**Simple designs** — flat bullet list:

> **设计要点确认：**
> - 方案：...
> - 关键决策：...
> - 改动范围：...
> - 风险：...
>
> 确认无误？

**Complex designs** — group by section with key points:

> **设计要点确认：**
>
> **概念**（共 N 个）
> - ...
>
> **方案**
> - ...
>
> **决策**（共 N 项）
> - ...
>
> **影响范围**
> - ...
>
> **风险**
> - ...
>
> 确认无误？

Rules:
- One line per bullet — this is a checklist, not a re-presentation
- No new information — only what was already confirmed
- If >20 items, group and note count

This catches contradictions or gaps that weren't visible in the chunked view.

### 6. Finalize

- Ensure design doc is complete and consistent
- Update `.designs/INDEX.md` — status `Designed`:

```markdown
- <topic> | Designed | YYYY-MM-DD | [intent](<topic>.intent.md) | [design](<topic>.md)
```

- Tell the user:

> 设计已记录到 `.designs/<topic>.md`。
> 建议 **开新会话** 运行 `/agentloops-planning` 进入规划阶段。
> 也可以在当前会话继续。

## Design Document Template

```markdown
# <Topic>

> One-line summary of what and why.
> Intent: [<topic>.intent.md](<topic>.intent.md)

## Concepts

- **Concept A** — what it is and why it exists
- **Concept B** — ...

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
Sections are written incrementally as confirmed — the doc may be partial during the process.

## Lifecycle (for other skills/sessions to follow)

| Event | Action |
|-------|--------|
| Design started | Status → Designing in INDEX, create partial doc |
| Design completed | Status → Designed in INDEX |
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
