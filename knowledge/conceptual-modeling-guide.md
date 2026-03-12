# Conceptual Modeling Guide

> Distilled from [intent-to-conceptual-model.md](intent-to-conceptual-model.md).
> This is the practical version — when to use, how to execute.

---

## When to Use

The core question: **can I clearly name the key concepts and their relationships?**

- Yes → skip this, just do it
- Mostly, with fuzzy edges → quick pass (30 min): naming + boundaries + invariants
- No → full process

### High-Value Scenarios

| Scenario | Signal | Depth |
|---|---|---|
| **Design new product/feature concepts** | You can't yet name the core "things" or their boundaries | Full |
| **Redesign a confused system** | Same word means different things in different places; users say "hard to use" but can't explain why | Full |
| **Cross-role alignment** | Product, design, engineering understand "what this is" differently | Full (especially Rich Picture + CATWOE) |
| **Write a proposal/RFC/article** | "I know what I want to say but can't structure it" | Medium |
| **Learn a new domain** | Entering unfamiliar territory (new industry, tech, discipline) | Medium |
| **Make a non-trivial decision** | Stuck between options; same facts support different conclusions | Medium (especially worldview check) |
| **Debug a complex problem** | Can't isolate root cause; multiple hypotheses | Light (Cynefin judgment) |
| **Refactor/tech debt** | Need to decide where to invest effort | Light (Wardley evolution judgment) |
| **Communicate something complex** | Audience doesn't get it; "we're talking past each other" | Light (concept alignment check) |

### Skip Conditions

- Purely mechanical: config changes, typo fixes, dependency upgrades
- Clear pattern to follow: standard CRUD, known templates
- Problem and solution both already well-defined

---

## The Process

Five phases. Not always linear — expect spirals, especially between 2↔3.

### Phase 0: Judge the Problem Type

Before anything else: **what kind of problem is this?**

| Type | Signal | Strategy |
|---|---|---|
| **Clear** | Obvious cause-and-effect; known solutions exist | Apply known patterns, don't over-think |
| **Complicated** | Cause-and-effect exists but needs expert analysis | Decompose → Analyze → Model |
| **Complex** | Can't predict outcomes; only knowable in hindsight | Probe → Sense → Respond; let model emerge from experiments |
| **Chaotic** | No discernible cause-and-effect | Stabilize first, then model |

Most methodology assumes Complicated. But the most valuable problems are often Complex —
you can't define the complete model before experimenting. Recognize this early to avoid
wasting time on premature structuring.

### Phase 1: See the Mess (Before Structuring)

**Goal**: fully perceive the problem space without premature simplification.

**Do**:
- List all people/roles involved — including the overlooked and absent
- Note relationships: power, conflict, cooperation, dependency
- Note emotions, attitudes, unspoken tensions
- Note constraints: real vs assumed
- Capture anomalies — things that don't fit your current understanding

**Don't**:
- Jump to categories or frameworks
- Use technical jargon that pre-commits to a solution
- Ignore "soft" factors (politics, emotions, habits)

**Tool**: Rich Picture (SSM) — hand-drawn, messy, deliberately unstructured.
This is a pre-linguistic capture method. Drawing bypasses language's structuring tendency.

**When to use fully**: cross-role alignment, contested problems, new domains.
**When to abbreviate**: you already know the stakeholders and dynamics well.

### Phase 2: Name the Core Concepts

**Goal**: discover what "things" exist in this system and what they're called.

This is the hardest and most valuable step. Quality of naming = quality of understanding.

**Entry point**: list the core concepts, one sentence each — what it is and why it exists.
If you can do this naturally, the concepts are clear. If you struggle, that's where to dig.

**When a concept is unclear, diagnose with these questions** (internal tools, not a checklist
to present to others):
1. **Purpose** — one sentence: what problem does it solve?
2. **Boundaries** — what belongs to it, what doesn't?
3. **Relationships** — how does it relate to other concepts?
4. **Invariants** — what rules must ALWAYS hold?
5. **Lifecycle** — where does it come from, what states does it traverse, where does it end?
6. **Naming precision** — could this name mean something else? Is there a more exact word?

**When someone else is uncertain about a concept, don't ask these questions directly.**
Instead, ground it in a concrete scenario: "when a user does X, this concept is responsible
for Y — does that match your understanding?" Let the concept become tangible through examples,
not abstract through interrogation.

**Validation**: can you explain this system to an intelligent stranger using only these concepts?
If not, the decomposition is wrong.

**If you're stuck**, the problem might be your vocabulary, not your analysis. Try:

- Borrow vocabulary from other domains (music, gardening, medicine, biology)
- Let domain experts describe their world in their own words
- Attend to anomalies your current concepts can't explain
- Hold multiple naming frameworks simultaneously

### Phase 3: Collide with Reality

**Goal**: test your concepts against real scenarios to drive spiral refinement.

**Do**:
- Walk through core user scenarios using your concepts — does it read naturally?
- Walk through edge cases — can the model describe them?
- Present to different roles — do they understand without extensive explanation?
- Look for "surprise" — gaps between what the model predicts and what actually happens

**Expect**:
- First-version concepts are meant to be wrong. Value = quality of feedback they provoke
- Each collision forces you to re-perceive the problem (back to Phase 1/2)
- Problem description and model co-evolve — you can't finish one before the other

**Convergence signals** (when to stop spiraling):
1. Core concepts stop changing; only details adjust
2. Multiple roles can communicate using the model without extra explanation
3. The model guides specific decisions: "should we add X?" gets a clear in/out answer
4. The model predicts scenarios you haven't seen yet, and validation confirms

### Phase 4: Assemble the Unified Model

**Goal**: compose concepts into a self-consistent whole.

**Checks**:
- **Consistency** — contradictions? Same thing called different names?
- **Completeness** — can all key scenarios be described?
- **Parsimony** — can any concept be removed without losing expressiveness? If yes, remove it
- **Composability** — can the model be split into independent sub-models and reassembled?
- **Unified metaphor** — does it follow one consistent mental model throughout?

**Output**: a description (text + simple diagrams) of core abstractions, their relationships,
and key rules. Understandable by anyone involved. Independent of implementation details.

### Phase 5: Decide Where to Invest

**Goal**: allocate modeling effort wisely (not everything deserves deep design).

Use Wardley evolution stages as a guide:

| Stage | What it means | Design investment |
|---|---|---|
| **Genesis** | Novel, uncertain, your differentiator | Heavy — full process, use all tools |
| **Custom-Built** | Has direction but not standardized yet | Moderate — focus on key interfaces |
| **Product** | Standardized, available to buy/lease | Light — integrate, don't reinvent |
| **Commodity** | Fully standardized utility | None — just use the standard solution |

This is a meta-judgment: not "how to model" but "where to model".

---

## Quick Reference: Techniques by Situation

| Situation | Technique | From |
|---|---|---|
| Don't know what kind of problem this is | Cynefin domain assessment | Phase 0 |
| Multiple stakeholders disagree on "what the problem is" | Rich Picture + CATWOE with explicit worldview | Phase 1 |
| Stuck in one vocabulary, can't see alternatives | Borrow domain language (music, biology, medicine...) | Phase 2 |
| "I know something's wrong but can't articulate it" | Stay with the body/intuition; prototype before documenting | Phase 2 |
| Concepts feel right individually but don't compose | Check invariants and lifecycle conflicts | Phase 4 |
| Everything seems equally important | Wardley Map evolution stage assessment | Phase 5 |
| Model keeps changing, can't converge | Check the 4 convergence signals; if none met, keep spiraling | Phase 3 |
| Team builds fast but ships the wrong thing | Probably skipped Phase 1-2; slow down naming and alignment | Phase 1-2 |

---

## Principles (Always Apply)

1. **Problem and solution co-evolve** — don't wait to "fully understand" before modeling;
   build rough models early, use them to discover what the problem actually is
2. **Naming is design** — can't name precisely = haven't truly understood
3. **Language constrains thought** — if you're stuck, change the vocabulary, not the analysis
4. **Models are constructed, not discovered** — every model starts from a worldview;
   not declaring it means being unconsciously controlled by it
5. **Minimum viable concepts** — if 3 concepts work, don't use 5
6. **First models are meant to be wrong** — their value is the quality of feedback they provoke
7. **Subtraction over addition** — some problems need dissolving, not solving

---

## Integration with agentloops

The design skill (step 2: Align Core Concepts) uses this guide's Phase 2-4 as its
underlying method. The 6 diagnostic questions are the agent's internal tools for preparing
concept presentations and probing when the user is uncertain.

| This guide | agentloops skill | How they connect |
|---|---|---|
| Phase 0-1 | `/agentloops-clarify` | Clarify does intent discovery; problem-type awareness improves framing |
| Phase 2-4 | `/agentloops-design` step 2 | Core concept alignment — always runs, self-calibrating depth |
| Phase 5 | `/agentloops-planning` | Evolution-stage judgment informs step granularity and effort allocation |
| Spiral / collision | Across sessions | Each session reads the file chain and may revise earlier phases |

For **software tasks**: use the agentloops skills directly. The concept alignment step in
design is lightweight when concepts are clear, and deepens naturally when they're not.

For **non-software tasks** (writing, decisions, learning, communication): use this guide
standalone. No file chain or INDEX needed — just the thinking process.
