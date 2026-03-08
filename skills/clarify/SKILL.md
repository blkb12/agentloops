---
name: agentloops-clarify
description: |
  Intent clarification before task execution. Use this skill on ANY new task — features, bugs,
  refactoring, architecture changes, or any work instruction. Before writing code or making changes,
  invoke this skill first. Only skip for purely mechanical operations (typo, rename) with zero
  ambiguity, or when user explicitly says "直接做"/"just do it". When in doubt, use this skill.
  Even tasks that look simple often hide complexity.
---

# Clarify

No code. No edits. No implementation.
You may read files and search code ONLY to inform your questions.

## Process

### 1. Read Before You Ask

Scan relevant context before asking anything:
- Related code, configs, recent commits
- Existing patterns and conventions
- The architecture around the change area

### 2. Identify Gray Areas

Find decisions the user hasn't made:
- Multiple valid approaches
- Ambiguous scope boundaries
- Unstated constraints or preferences
- Conflicts with existing patterns

### 3. Ask Structured Questions

- One question at a time
- Prefer choices: "A or B?" not "How do you want to handle this?"
- Include trade-offs with each option
- Ground in codebase: "Module X uses pattern Y. Follow it here, or diverge?"
- Let questions emerge from context, not a checklist — open threads, follow what resonates

### 4. Surface the Unseen

- Question the user's framing if it seems off
- Proactively surface requirements they haven't considered
- If it smells like an XY problem, ask what problem they're actually solving
- The goal: help users discover what they don't know they don't know

### 5. Confirm Understanding

The test: can you make correct micro-decisions during implementation without coming back to ask?

- State understanding in concrete terms, not a paraphrase
- Walk through a scenario: "When user does X, system does Y — correct?"
- List assumptions explicitly
- Get approval to proceed

## You Will Want to Skip This

| Your reasoning | Why it's wrong |
|---|---|
| "This is simple" | Simple-looking tasks hide complexity. 5 min clarification saves hours of rework |
| "I'll read the code first" | Reading code for implementation IS implementation. Read only to inform questions |
| "User seems in a hurry" | Shipping wrong things fast saves no time |
| "I already understand" | Understanding ≠ confirmed understanding. State it, get confirmation |
| "It's a follow-up" | New request = new clarification, unless same intent chain |
| "I'll ask as I go" | Mid-implementation questions create sunk cost bias |

## Skip Conditions

ALL must be true:
- Purely mechanical (typo, rename, formatting)
- Zero design decisions
- 100% unambiguous intent

OR user explicitly says: "直接做" / "just do it" / "不用问了"

## When Done

**If the task leads to execution** (code changes, implementation, configuration):
1. Create a Task with:
   - **Intent** — what and why
   - **Decisions** — choices made during clarification
   - **Scope** — in and explicitly out
2. → **Next: invoke /agentloops-design**

**If pure discussion, Q&A, or explanation**: respond directly, no Task needed.
