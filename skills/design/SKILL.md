---
name: agentloops-design
description: |
  Technical design before implementation. Use after intent has been clarified to make technical
  decisions. Reads the codebase deeply, decides on approach, interfaces, and patterns, then
  presents the design for user approval. Requires a Task with clarified intent — if none exists,
  invoke agentloops-clarify first. Use for any task involving design decisions before writing code.
---

# Design

## Precondition

A Task with clarified intent must exist. If not → **stop, invoke /agentloops-clarify first**.

No code changes. Read code to inform decisions. Present design for approval before implementation.

## Process

### 1. Read INDEX

Read `.designs/INDEX.md` (if it exists) to understand current design landscape:
- Active designs that may relate to this task
- Completed designs with relevant context
- Avoid duplicating or conflicting with existing designs

### 2. Deep-Read the Codebase

Go beyond the surface scan done during clarification:
- Trace full code paths affected by this change
- Map dependencies, interfaces, and data flow
- Identify existing patterns, conventions, and abstractions
- Find potential conflicts or side effects

### 3. Make Technical Decisions

Based on what you've read:
- Choose approach and justify why
- Define interfaces, data structures, module boundaries
- Decide: follow existing patterns or diverge (and why)
- Identify risks and unknowns

### 4. Present Design for Approval

Summarize:
- **Approach** — how, and why this over alternatives
- **Key technical decisions** — with rationale
- **Impact** — what existing code is affected
- **Risks** — what could go wrong, what's uncertain

Get explicit approval before proceeding.

### 5. Write Design Document

After approval, write `.designs/<topic>.md`:

```markdown
# <Topic>

> One-line summary of what and why.

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

### 6. Update INDEX

Update `.designs/INDEX.md` (create if not exists):

```markdown
# Designs

## Active
- [topic](topic.md) — one-line summary

## Completed

## Dropped
```

Rules:
- New design → add to Active
- Redesign of existing topic → move old entry to Dropped (with reason), add new to Active
- Same topic name overwrites the design file; INDEX tracks the transition

### 7. Update Task

Add design decisions to the Task:
- Approach chosen
- Key technical decisions
- Any scope adjustments discovered during design

→ **Next: invoke /agentloops-planning**

## Lifecycle (for other skills/sessions to follow)

| Event | Action |
|-------|--------|
| Design created | Add to Active in INDEX |
| Design adjusted during execution | Update the .md file directly, INDEX stays |
| Implementation completed | Move to Completed in INDEX (add date) |
| New design replaces old | Old → Dropped (with reason), new → Active |
| Design abandoned | Move to Dropped in INDEX |

## Skip Conditions

- Task is purely mechanical (clarify already determined no design decisions)
- The approach is obvious and singular (no alternatives to weigh)

## When the Design Doesn't Fit

If during design you discover the clarified intent needs revision (e.g., assumed approach isn't feasible) → **stop, invoke /agentloops-clarify**. Don't force a bad design to fit a flawed intent.
