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

### 2. Give Your One-Sentence Understanding First

Before any questions, state your understanding in one sentence:
> "我理解你想要 X，目的是 Y。对吗？"

Let the user confirm or correct direction. This anchors the conversation and avoids
asking questions based on a wrong premise.

### 3. Identify and Present Gray Areas

Find decisions the user hasn't made. Present them as a **short numbered list** (3-5 items max):

> 我发现这几个点需要确认：
> 1. 数据存储方式（影响性能和复杂度）
> 2. 错误处理策略（影响用户体验）
> 3. 是否需要兼容旧接口（影响工作量）
>
> 你想先聊哪个？或者哪些你不关心，我来定？

Rules:
- **User picks the topic**, not you
- **User can delegate**: "2 和 3 你定" is a valid answer — record your decision and rationale
- Don't front-load all questions; some may dissolve after earlier ones are answered

### 4. Deep-Dive Selected Areas

For each area the user wants to discuss:
- **Give 2-3 options with a recommended one**, not open-ended questions
- Each option: one line of what + one line of trade-off
- Mark your recommendation with ★
- Let the user pick, modify, or say "你推荐的就行"

Example:
> **数据存储方式：**
> A. SQLite — 简单，单文件，够用但并发受限
> B. PostgreSQL — 成熟，但需要额外部署 ★
> C. 文件系统 JSON — 零依赖，但查询能力弱
>
> 我倾向 B，因为后续需要复杂查询。你觉得呢？

### 5. Surface the Unseen

- Question the user's framing if it seems off
- If it smells like an XY problem, ask what problem they're actually solving
- Proactively surface requirements they haven't considered — but as observations, not interrogation
- The goal: help users discover what they don't know they don't know

### 6. Confirm Understanding

The test: can you make correct micro-decisions during implementation without coming back to ask?

- Walk through a concrete scenario: "When user does X, system does Y — correct?"
- List remaining assumptions explicitly
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

1. Write `.designs/<topic>.intent.md`:

```markdown
# <Topic>

> One-line summary of what and why.

## Intent

What the user wants to achieve and why.

## Decisions

- Decision 1 — rationale (user chose / delegated to AI)
- Decision 2 — rationale

## Scope

**In:** what's included
**Out:** what's explicitly excluded

## Open Questions

Anything deferred to design phase.
```

2. Update `.designs/INDEX.md` — add entry with status `Clarified`:

```markdown
- <topic> | Clarified | YYYY-MM-DD | [intent](<topic>.intent.md)
```

3. Tell the user:

> 意图已记录到 `.designs/<topic>.intent.md`。
> 建议 **开新会话** 运行 `/agentloops-design` 进入设计阶段，以获得更好的上下文质量。
> 也可以在当前会话继续。

**If pure discussion, Q&A, or explanation**: respond directly, no file needed.
