# From Intent to Conceptual Model: Theory, Frameworks & Practice

A comprehensive research compilation on how to go from a vague problem/intent to a unified
conceptual model — covering cognitive science, systems thinking, product design, domain modeling,
and emerging AI-era approaches.

---

## Part I: The Core Process (First-Principles Breakdown)

### The Six Key Transformations

The process from intent to conceptual model is not a linear pipeline but a series of
**irreversible cognitive transformations**, each eliminating ambiguity and adding structure.

#### 1. Problem Perception → Problem Definition

Starting point is often vague: "users find it hard to use", "we need feature X", "competitor did Y".

- **Who** encounters **what difficulty** in **what context**?
- Distinguish **surface requests** from **deep needs** — "faster horse" vs "mobility efficiency"
- Define **problem boundaries** — what's in scope, what's not
- Identify **constraints** — real (physics, regulation) vs assumed ("we've always done it this way")

**Output: A clear statement of what the problem is, why it matters, and where boundaries lie.**

#### 2. Problem Definition → Stakeholder Alignment

Same problem looks different to different roles:
- Users see experience pain points
- Business sees metrics and growth
- Engineering sees feasibility and cost
- Operations sees daily burden

This step finds **a higher-level description that simultaneously explains all perspectives**.
If perspectives contradict, the problem definition isn't deep enough.

**Output: Consensus on "what to solve" (not "how to solve").**

#### 3. Problem Space → Solution Space Exploration

The jump from "what's the problem" to "what are possible approaches":

- **Analogical transfer** — how do other domains solve similar problems?
- **Extreme case reasoning** — what if 10x users? What if only 1?
- **Inverse thinking** — what solutions are definitely wrong?
- **Diverge then converge** — don't lock onto the first idea

Common mistake: **jumping to the first solution and spending all effort defending it.**

**Output: 2-3 directions worth exploring, with rationale for selection/exclusion.**

#### 4. Solution Direction → Core Concept Discovery

The hardest and most critical step. The question: **what "things" fundamentally exist in this
system, and how do they relate?**

Key thinking moves:

- **Naming** — can you describe this concept in one word/phrase? Naming quality reflects
  understanding depth. Vague names ("that thing", "info module") = unclear thinking
- **Finding boundaries** — what belongs to each concept, what doesn't?
- **Finding relationships** — containment, dependency, triggering, or peer?
- **Finding invariants** — what rules must ALWAYS hold? ("an order must belong to a user",
  "balance cannot be negative")
- **Finding lifecycles** — where does each concept come from, what states does it traverse,
  where does it go?

Validation test: **Can you explain this system to an intelligent stranger using these concepts?**
If not, the concept decomposition is wrong.

**Output: Core entity list, relationship map, key rules/invariants.**

#### 5. Core Concepts → Unified Conceptual Model

Previous step found the parts; this step **assembles them into a self-consistent whole**:

- **Consistency check** — contradictions between concepts? Same thing called different names?
- **Completeness check** — can all key user scenarios be described by this model?
- **Parsimony check** — can any concept be removed without losing expressiveness? If yes, remove it
- **Unified metaphor** — does the model follow a consistent mental model? (Git's "snapshot +
  pointer" metaphor runs throughout, rather than half filesystem half database)

**Output: Conceptual model document — text + simple diagrams describing the system's core
abstractions, understandable by anyone.**

#### 6. Model Validation → Scenario Regression

Take the model back to real scenarios:

- **Core scenario replay** — describe typical user flows using the model; does it read naturally?
- **Edge case testing** — extreme/abnormal paths; can the model describe them? (conceptually, not
  implementation-level)
- **Evolution testing** — if foreseeable requirements change, does the model need major rework?
  Good models extend naturally
- **Communication testing** — explain to different roles; do they understand and agree?

If validation fails, iterate back to step 4 or 3.

### Principles Throughout

| Principle | Description |
|---|---|
| **Problem before solution** | Time spent understanding the problem is never wasted |
| **Naming is design** | Can't name precisely = haven't truly understood |
| **Minimal concept set** | If 3 concepts suffice, don't use 5 |
| **Invariant-driven** | Define "what can't change" before "what can change" |
| **Model independent of implementation** | Good conceptual models don't depend on tech stack |

---

## Part II: Meta-Cognitive Layer — Know Your Problem First

### Cynefin Framework (Dave Snowden)

Core contribution: **different problem types require fundamentally different strategies**.

| Domain | Causality | Strategy | Modeling approach |
|---|---|---|---|
| **Clear** | Obvious | Sense→Categorize→Respond | Apply known models |
| **Complicated** | Exists but needs experts | Sense→Analyze→Respond | Decompose→Analyze→Model |
| **Complex** | Only retrospectively knowable | **Probe→Sense→Respond** | Multiple safe experiments, let model emerge |
| **Chaotic** | Unidentifiable | Act→Sense→Respond | Stabilize first, then model |

Most "problem→model" methodologies assume Complicated domain (analyzable). But valuable product
design problems are often in the **Complex domain** — you can't define the complete model before
executing; the model is a byproduct of experiments.

### Wicked Problems (Rittel & Webber, 1973)

Even more radical: **problem definition and solution are circularly dependent** — your understanding
of the problem depends on what solutions you can imagine, and vice versa. Modeling is not linear
"understand→abstract→formalize" but a **spiral of co-evolution between problem and model**.

Key characteristics:
- No definitive problem formulation
- No stopping rule
- Solutions are not true/false, only good/bad
- Every problem is essentially unique
- Every problem can be seen as a symptom of another problem

---

## Part III: Reasoning Logic — What Is Conceptual Modeling, Cognitively?

### Abductive Reasoning (Peirce / Kees Dorst)

Conceptual modeling is neither deductive nor inductive — it's **abduction**, the only reasoning
form that produces new ideas:

- **Deduction**: known rules + cases → derive results (no new knowledge)
- **Induction**: cases + results → generalize rules (statistical)
- **Abduction**: observed results → **creatively guess** possible rules and elements

Dorst's two types of design abduction:
- **Abduction-1**: known What + How, derive elements — routine design
- **Abduction-2**: only know What, **both How and elements unknown** — must co-evolve. This is
  the true core of design innovation.

**Practical implication**: Don't expect models to "emerge" from data. You must actively propose
hypothetical frameworks, then validate. Multiple competing frameworks in parallel > deep-diving
a single one.

### Conceptual Blending (Fauconnier & Turner)

New concepts emerge through **blending existing mental spaces**:

```
Input Space 1 (known domain A)  +  Input Space 2 (known domain B)
                  ↘                        ↙
              Generic Space (shared structure)
                        ↓
              Blended Space (emergent structure)
```

Innovation lies not in any single input but in **emergent structure after blending**.
Example: "ecosystem" + "software architecture" → "microservice ecosystem" (new reasoning
that exists in neither input space).

### Free Energy Principle (Karl Friston)

From neuroscience: conceptual modeling is fundamentally **building a generative model that
minimizes "surprise"**. The process: predict → prediction error → model update. A good model
doesn't "accurately reflect reality" but **efficiently compresses and predicts observed patterns**.

### Sensemaking (Karl Weick)

Modeling is not objective "discovery" but subjective "construction". A model's value is not
whether it's "correct" but whether it's **plausible enough to guide action**. The process is
inherently **retrospective** — you must first do things (explore, experiment, dialogue), then
extract the model from experience.

---

## Part IV: Methodological Layer — Best Practices

### Tier 1: High Originality, Strong Practicality

#### Daniel Jackson's Concept Design (MIT, 2021-2025)

Possibly **the most important conceptual design theory in recent years**. Core idea: a software
system = a set of independent concepts composed together.

Each concept:
1. **Name** + **Purpose** (one sentence: what problem it solves for the user)
2. **State** (internal memory, described as relations)
3. **Actions** (operations that change state)
4. **Operational Principle** (typical usage scenario demonstrating purpose)

Key constraint: **zero dependencies between concepts**. They compose through **synchronization** —
declarative rules describing how different concepts' actions relate.

2025 MIT progress ("What You See Is What It Does", Splash 2025):
- Proved this structure naturally suits LLM code generation — synchronizations are declarative,
  analyzable, verifiable
- Building a **Concept Catalog** — reusable library of verified concepts
- MIT News called this "legible software"

Three-step method:
1. Identify concepts and their purposes
2. Define state and actions for each concept
3. Define synchronization rules between concepts

#### EventStorming + Domain Storytelling + Context Mapping (DDD Evolution)

Three methods now seen as complementary (Annegret Junker, 2024/2025):

| Method | Focus | Best for |
|---|---|---|
| EventStorming | Domain events on timeline | Quickly reveal business process landscape |
| Domain Storytelling | Actor collaboration (Subject-Verb-Object) | Multi-role interaction discovery |
| Context Mapping | Integration relationships between bounded contexts | Architecture boundaries, team boundaries |

#### Shape Up's Shaping (Basecamp)

Currently the **most honest description of "conceptual design"** — acknowledges it requires
experience, judgment, and time; cannot be democratized into a workshop.

Key output: **Pitch** = Problem + Appetite + breadboard-level solution + Rabbit Holes + No-gos

#### Switch / Four Forces Model (Bob Moesta)

Deepest framework for understanding human behavior change:

```
Push (current pain) + Pull (new solution attraction)
              vs
Inertia (habit) + Anxiety (fear of new)
```

"Not enough features" is rarely why people don't adopt — **anxiety and inertia are usually bigger**.

### Tier 2: Deep Theory, Indirect but Profound Influence

#### Soft Systems Methodology (Checkland)

Only framework that **systematically embeds "worldview" into modeling methodology**:
1. Rich Picture — visualize the messy situation without premature structuring
2. Root Definition via CATWOE — conceptual models always start from a specific worldview
3. Compare ideal model with reality — value lies in exposing the gap

#### Architecture for Flow (Susanne Kaiser, 2023)

Aligns three perspectives:

| Perspective | Tool | Focus |
|---|---|---|
| Business Strategy | Wardley Map | Component evolution stage (Genesis→Commodity) |
| Software Design | DDD | Bounded contexts, domain model |
| Team Organization | Team Topologies | Cognitive load, interaction modes |

Genesis stage = core domain, worth careful design; Commodity = generic domain, just buy it.

#### Category Theory / Ologs (Spivak & Fong)

Provides **mathematical-level composability** for conceptual models: multiple local models can be
rigorously integrated via functors. The only framework providing formal multi-perspective
integration mechanisms.

### Tier 3: Emerging Frontiers (2024-2026)

#### AI Reshaping Conceptual Design

- AI makes **divergence cost approach zero**, but **convergence (judgment) remains scarce** →
  "solution surplus, judgment deficit" paradox
- Jackson's Concept Design naturally fits LLM: concept independence + synchronization
  declarativeness = LLM can reliably generate and compose functional modules
- **Intent-Driven Design**: from "requirements→spec→model→implementation" to
  "intent→AI interpretation→adaptive model→continuous adjustment"

#### Human-Agent Centered Design (H-ACD, 2025)

Traditional HCD assumes "humans are the only actors". H-ACD restructures interaction as a
**human-agent-system** triad. Core issues:
- When AI agents autonomously execute workflows, how to ensure intent alignment?
- How to prevent Agent Drift?

#### Context Engineering + Spec-Driven Development

AI-era insight: **input context quality determines output quality**. Design work shifts from
"writing code" to "constructing precise context and specifications".

---

## Part V: Cross-Disciplinary Perspectives

### Behavioral Design (Fogg, Kahneman, Thaler)

Shifts conceptual design focus from **"functional feasibility" to "behavioral feasibility"**.
Fogg's model: Behavior = Motivation × Ability × Prompt (all three must converge).

### Activity Theory (Engestrom)

Seven interacting elements: Subject, Object, Tools, Rules, Community, Division of Labor, Outcome.
Design innovations come from **contradictions** within the activity system. One of few frameworks
handling both individual cognition and socio-cultural structure.

### Affordance Theory (Gibson / Norman)

Radical ecological approach: don't start from "user needs" → "features". Instead, analyze the
**affordance landscape** of the environment-actor system. What action possibilities exist but
are unexploited?

### Metaphor-Driven Design (Lakoff & Johnson)

Metaphors are not rhetoric but **fundamental cognitive structure**. They solve the hardest concept
design problem: **how to communicate the essence of something that doesn't exist yet**.
"A library in your pocket" communicates the smartphone concept faster than any spec.

### Biomimicry

Provides a **completely orthogonal solution space** to conventional technical thinking.
The "biologize" step — translating "reduce drag" to "what organisms move efficiently in fluid?" —
is one of the most powerful reframing tools in conceptual design.

### Eastern Philosophy (Dao, Wabi-Sabi, Zen)

Challenges the Western assumption that **"design is problem-solving"**:
- Dao: some problems need to be **dissolved**, not solved
- Wabi-sabi: some "flaws" are part of the design, not defects to fix
- Zen's "beginner's mind": expertise can be an obstacle to conceptual innovation

---

## Part VI: Seven Deep Insights (Cross-Dimensional Synthesis)

### 1. Naming Is Design (Language as First Principle)

Ubiquitous Language (DDD), conceptual metaphors (Lakoff), biomimicry's "biologize" step,
Sapir-Whorf hypothesis — all point to the same truth: **the conceptual model you can build
is limited by the language you can use**. Can't name precisely = haven't truly understood.

### 2. Problem and Solution Are Inseparable

Wicked problems theory, Abduction-2, Cynefin Complex domain — for truly worthwhile problems,
"understanding the problem" and "building the model" are **the same process**. You cannot
complete one before starting the other.

### 3. Models Are Constructed, Not Discovered

Weick's sensemaking, SSM's worldview, Varela's enactivism — a model's value is not "correctness"
but **being plausible enough to guide action**. Different perspectives producing different models
is a feature, not a bug.

### 4. Subtraction Wisdom vs Addition Logic

Eastern philosophy (Dao's wu-wei, wabi-sabi's imperfect beauty, Zen's beginner's mind) offers
what Western methodology lacks: **some problems don't need solving, they need dissolving;
some "defects" don't need fixing, they're part of the design.**

### 5. Composability Is the Ultimate Quality Metric

Jackson's zero-dependency concepts + synchronization, category theory's functor integration,
DDD's bounded contexts — a good model's hallmark: **can be split into independent sub-models
and losslessly reassembled**.

### 6. From Blueprint to Living Expression of Intent

Traditional conceptual models are static blueprints. AI-era models are becoming **living
expressions of intent** — continuously interpreted, adapted, evolved. This redefines what
"model complete" means.

### 7. Frameworks Cannot Manufacture Excellence

All frameworks share a blind spot: assuming better process improves innovation quality.
But history's greatest product concepts (iPhone, Notion, Linear) came from **personal taste
and strong subjective judgment**, not framework output. Frameworks lower average failure rates
but cannot produce greatness.

---

## Part VII: Practical Combination Guide

| Scenario | Recommended Combination |
|---|---|
| **Feature improvement** (Complicated) | JTBD/ODI → Shape Up Shaping → execute |
| **New product exploration** (Complex) | Cynefin assessment → Switch 4-forces + EventStorming → multiple safe experiments → model emerges |
| **Platform/system design** | Wardley Map → DDD Context Mapping → Jackson Concept Design → team alignment |
| **Disruptive innovation** | Abduction-2 + Conceptual Blending → multi-framework parallel → SSM Rich Picture → wabi-sabi pruning |

---

## Key References

### Books
- Daniel Jackson, *The Essence of Software* (2021)
- Kees Dorst, *Frame Innovation* (2015)
- Donella Meadows, *Thinking in Systems* (2008)
- Susanne Kaiser, *Architecture for Flow* (2023)
- Teresa Torres, *Continuous Discovery Habits* (2021)
- Fauconnier & Turner, *The Way We Think* (2002)
- Lakoff & Johnson, *Metaphors We Live By* (1980)
- Annegret Junker, *Mastering Domain-Driven Design* (2024)
- Peter Checkland, *Systems Thinking, Systems Practice* (1981)
- Stafford Beer, *Brain of the Firm* (1972)
- Spivak & Fong, *Seven Sketches in Compositionality* (2018)

### Key Papers & Articles
- MIT, "What You See Is What It Does" (Splash 2025) — concepts + synchronizations
- Rittel & Webber, "Dilemmas in a General Theory of Planning" (1973) — wicked problems
- Weick, "Sensemaking in Organizations" (1995)
- Friston, "The free-energy principle: a unified brain theory?" (2010)
- Varela, Thompson & Rosch, "The Embodied Mind" (1991)

### 2024-2026 Emerging
- Human-Agent Centered Design (H-ACD) — hacd.lovable.app
- Intent-Driven Design — UX Collective (2025)
- Context Engineering + Spec-Driven Development — intent-driven.dev
- LLM-supported ontology engineering (Frontiers in Big Data, 2025)
- RAG+CoT for design ideation (Journal of Engineering Design, 2025)

---

## Part VIII: Deep Dive — Problem and Solution Are Inseparable

### Three Layers of Understanding

#### Layer 1: Epistemic Incompleteness

The surface reading: our understanding of the problem is always incomplete; building models
helps us understand the problem better; the process is spiral. This is true, but only the
first layer.

#### Layer 2: The Model Is a Probe, Not a Mirror

A deeper insight: models don't "reflect" the problem — they **probe** it.

- Surface metaphor: the problem is a mountain in fog; each model clears a layer of fog
- Better metaphor: **the problem is a swamp**; you throw a stone (model) in, observe how deep
  it sinks and what splashes up, then decide where to throw the next stone

The key difference: the mountain is fixed, you just see it more clearly. But the swamp is not
fixed — **your act of throwing the stone changes the swamp's shape**.

This is Cynefin's "probe→sense→respond" — your probe is itself an intervention.

**Concrete example**: You're designing a collaboration tool. Initial problem: "team communication
is inefficient". You build a model: messages, channels, notifications. When users see this model,
their feedback isn't about channel design — it's "actually our problem isn't communication, it's
not knowing who's doing what." The problem shifted from "communication efficiency" to "work
visibility". But note: it's not that the problem was always "work visibility" and you got it wrong.
Your "communication model" as a probe triggered a cognition that users themselves hadn't had before.
**Your model changed their understanding of the problem.**

#### Layer 3: Problem and Solution Are Two Sides of the Same Coin

The deepest layer, from Rittel's wicked problems theory: **every formulation of a problem
implies a solution direction; every solution conception redefines what the problem is.**

| Problem Formulation | Implied Solution Direction | Implied Concept Model |
|---|---|---|
| "Users can't find content" | Search/recommendation | Content, tags, intent, relevance |
| "Users don't know what they want" | Browse/discovery | Interest graph, content relations, paths |
| "Valuable content gets buried" | Curation/quality filtering | Quality signals, curators, community |

Three formulations of seemingly the same phenomenon, but each **automatically locks a completely
different conceptual model**. You cannot "understand the problem" before "building the model" —
because the act of describing the problem IS already modeling.

### The Spiral in Detail

```
Initial vague discomfort
    ↓
Attempt to describe the problem in some language (← this IS already modeling)
    ↓
Build a conceptual model based on this description
    ↓
Model collides with reality (users, stakeholders, real scenarios)
    ↓
Collision produces "surprise" (gap between expectation and reality)
    ↓
Surprise forces you to re-describe the problem (← new language = new model starting point)
    ↓
New description catalyzes new conceptual model
    ↓
…
```

Each loop doesn't return to the starting point — it **re-opens at a new level of understanding**.
That's why it's a spiral, not a cycle.

Friston's free energy principle gives this spiral a precise description: **each "surprise"
(prediction error) drives model update. Good modelers don't avoid surprise — they actively
manufacture it, because surprise is the only fuel for model evolution.**

### Convergence Signals

For wicked problems, the spiral theoretically never converges. But practically, "good enough"
signals include:

1. **Concept stability** — after several collisions, core concepts stop changing; only details adjust
2. **Multi-party communicability** — different roles can use the model to communicate without
   extensive supplementary explanation
3. **Actionability** — the model guides specific design decisions; when facing "should we add
   this feature?", the model gives clear in/out-of-scope answers
4. **Predictive power** — the model predicts scenarios you haven't encountered yet, and
   subsequent validation confirms

All four say the same thing: **the "surprise" between model and reality is steadily decreasing.**

### Practical Implications

1. **Don't wait to "understand the problem" before modeling** — build a rough concrete model
   (even a wrong one) as early as possible; use it to collide with reality; let collisions
   tell you what the problem actually is

2. **First-version models are meant to be wrong** — value lies not in correctness but in
   quality of feedback they provoke. A model that's "interestingly wrong" beats one that's
   "boringly right"

3. **Watch for problem-definition ossification** — if all modeling attempts orbit the same
   concepts without breakthrough, the problem isn't the model — it's that your problem
   definition has locked you in. Step back and re-describe the problem

4. **Problem description language choice is 100x more important than you think** — "can't find
   content" vs "don't know what they want" vs "good stuff gets buried" — seemingly same
   phenomenon, completely different concept universes

---

## Part IX: Deep Dive — Language as the Boundary of Thought

### The Fundamental Paradox

We don't just "use language to describe thinking results" — **we think IN language**. Language
is not the container of thought; language is the material of thought.

This creates a sharp paradox: if the language I think with limits my understanding, how can I
possibly "switch languages"? Even the cognition "I am limited" is produced within my current
language framework.

Wittgenstein: "The limits of my language mean the limits of my world."

### How Language Constrains Conceptual Modeling (Example)

Working on a "task management" tool, your language framework automatically includes: tasks,
deadlines, priorities, assignments, completion status, lists, kanban boards... No matter how
you recombine within this vocabulary, you can't escape the underlying metaphor of "decompose
things into items and track them".

But if someone says: "This isn't a task management problem, it's an **attention orchestration**
problem" — suddenly the concept universe changes: attention, context-switching cost, cognitive
load, focus, distraction, flow... A completely different vocabulary pointing to completely
different design directions.

**The crucial point**: while immersed in "task management" language, you won't naturally think
of "attention orchestration" because it's not in your vocabulary, and your thinking paths are
paved by your vocabulary.

### Five Paths Out of the Language Prison

If language constrains thought, and thought happens in language, **the force that breaks
the loop must come from outside language.**

#### 1. Body and Sensory Experience (Go Down)

Varela's enactivism: the deepest cognition is not linguistic but **embodied**. Frustration
while using a product, hesitation gestures observed in users, awkward finger movements —
these bodily sensations exist prior to language.

This is why **prototypes are more powerful than documents** — not because they're more
"intuitive" but because they activate body-level cognition. Your hands, eyes, posture tell
you things your language cannot yet express.

When you feel "something's wrong here but I can't articulate it" — that "can't articulate"
is the most valuable signal. Your body has detected the problem; your language hasn't caught up.

**Practice**: Don't rush to translate intuition into language. Stay with the inarticulate
feeling. Do, use, walk through the process. Let the body tell you.

#### 2. Borrow Language From Other Domains (Go Sideways)

This is what conceptual blending theory and biomimicry do.

When "task management" language yields nothing new, forcefully borrow another domain's vocabulary:

- **Music**: rhythm, movement, improvisation, ensemble, rest — "Does work have rhythm? Where
  are the rests?"
- **Gardening**: planting, nurturing, pruning, seasons, soil — "What season is this project in?
  What needs pruning?"
- **Medicine**: symptoms, diagnosis, treatment, recovery, prevention — "Is this acute or chronic?"

This isn't metaphor games — **it forces you into a different vocabulary**, and a different
vocabulary means different thinking paths.

Biomimicry's "biologize" step systematizes this: not randomly picking metaphors but methodically
translating the problem into another "language system".

#### 3. Let Heterogeneous People Describe Your Problem (Go Outward)

Your language limitation comes from your experience and training. A nurse, a construction worker,
a five-year-old describe the same phenomenon with completely different words.

This is not "user research" — user research typically means you ask questions in YOUR language
framework, and users answer within YOUR framework.

What I mean: **let them describe their world in THEIR language**, then listen for words you
don't have.

EventStorming and Domain Storytelling work not because of sticky notes and diagrams, but because
they create a space for **domain experts to speak in their language** rather than translating
into the tech team's language.

#### 4. Anomalies and Surprises (Go Toward the Strange)

Your current language can fluently describe all "normal cases". **When you encounter a phenomenon
your current language can't describe — that's the breakthrough point.**

Kuhn's scientific revolutions theory: paradigm shifts come not from better theories but from
**anomalies the old paradigm cannot explain**. When enough anomalies accumulate, the old
language collapses and new language emerges.

In product design: when you find user behavior completely inexplicable by your conceptual model —
don't dismiss it as an "edge case". **It might be the signal that your entire model needs rebuilding.**

"Task management" anomaly: Why do some highly effective people never use task management tools?
Your model says "managing tasks = effective", but reality has counterexamples. Seriously
investigating this anomaly might lead you to "attention orchestration" or "environment design" —
completely different concept domains.

#### 5. Hold Multiple Languages Simultaneously (Go Plural)

The most advanced and counter-intuitive strategy: **not finding one "correct" language to replace
the "wrong" one, but holding multiple languages simultaneously, attending to the gaps between them.**

Each language illuminates part of reality while obscuring another:

```
"Task management"        → Illuminates: structure, tracking, completion
                           Obscures: cognitive load, emotion, creativity

"Attention orchestration" → Illuminates: focus, distraction, flow
                            Obscures: collaboration, dependencies, delivery

"Gardening"              → Illuminates: growth cycles, patience, organicity
                            Obscures: urgency, precision, measurability
```

**True insight often hides in the overlap zones and blank spaces between multiple languages** —
things each language vaguely touches but none can independently express.

### Summary: Five Escape Routes

| Direction | Method | What It Does |
|---|---|---|
| **Down** (body) | Prototype, use, walk through | Access pre-linguistic knowing |
| **Sideways** (domains) | Borrow vocabularies from music, biology, medicine... | Force different thinking paths |
| **Outward** (people) | Let diverse others describe your world | Import words you don't have |
| **Toward anomalies** | Attend to what you can't explain | Find where current language breaks |
| **Plural** (multi-hold) | Hold multiple languages simultaneously | Find insight in the gaps between |

The common thread: **none of these are "think harder" — they are all "contact reality differently."
The key to the language prison is not inside the language — it's outside.**

---

## Part X: Deep Dive — SSM and Architecture for Flow

### 5. Soft Systems Methodology SSM (Peter Checkland)

#### Origin

Checkland at Lancaster University in the 1960-70s tried to apply systems engineering (hard
systems methods) to management and organizational problems — and **completely failed**.

Hard systems methods assume: a clearly defined problem exists, with an objective function to
optimize. Building bridges, designing circuits work this way. But "improve hospital management",
"raise school teaching quality" — there's no consensus on what the problem even is. Different
people see entirely different problems.

SSM grew from this failure: **for "soft" problems involving human activities, value conflicts,
and multi-party interests, there is no "objectively correct" model — only models that are
"meaningful from a specific perspective".**

#### Core Mechanism: Two-World Alternation

SSM's most distinctive design alternates between **two worlds**:

```
Real World (messy, chaotic, subjective, political)
     ↕  continuous back-and-forth
Systems Thinking World (structured, logical, idealized)
```

Not jumping from real world directly to solutions, but:
1. First, fully experience the chaos in the real world
2. Jump to the systems thinking world to build an ideal model
3. Bring the ideal model back to the real world for comparison
4. Insights from comparison drive change

#### Concrete Steps

##### Step 1: Rich Picture

SSM's most recognizable tool. Not a flowchart, not an architecture diagram — a **hand-drawn,
messy, subjective-factor-inclusive big picture**.

What to include:
- People and roles involved (not just "users" — including the overlooked, the absent)
- Their relationships (power, conflict, cooperation, dependency)
- Emotions and attitudes (anxiety, dissatisfaction, ambition)
- Physical environment and institutional constraints
- Ongoing processes and activities
- Known pain points, contradictions, concerns

Key principle: **don't rush to structurize**. Rich Pictures deliberately stay messy because
premature structuring loses information. Let complexity be **fully seen** first, not immediately
simplified.

This directly relates to "language constraints" — Rich Pictures are a **pre-linguistic or
supra-linguistic recording method**. Through drawing rather than words, you capture things
language struggles with: the atmosphere of tension, someone's marginalized position, the
absurdity of a process.

##### Step 2: Root Definition via CATWOE

This step jumps to the "systems thinking world". Choose a perspective, then define a "relevant
system" in strict format.

CATWOE Analysis:

| Element | Meaning | Question it forces |
|---|---|---|
| **C**ustomers | People affected by the system | Who benefits? Who is harmed? |
| **A**ctors | People performing activities in the system | Who actually does the work? |
| **T**ransformation | The system's core transformation | Input → Output? |
| **W**eltanschauung | Worldview | What beliefs make this transformation meaningful? |
| **O**wner | Person who can decide the system's fate | Who has power to start or stop it? |
| **E**nvironment | Constraints the system must accept | What can't be changed? |

**W (Weltanschauung) is the most critical and most often skipped.** It requires explicitly
stating: what underlying beliefs does this model rest on?

Example — two root definitions for "hospital emergency improvement":

**Root Definition A** (manager's perspective):
> A system operated by ER staff that transforms arriving patients (input) into triaged and
> routed patients (output), **based on the worldview that**: efficiency and throughput are
> the primary measures of ER quality.

**Root Definition B** (patient's perspective):
> A system with joint participation of medical staff and patients that transforms anxious,
> uncertain people (input) into people who feel cared for and clearly guided (output),
> **based on the worldview that**: the ER's primary duty is reducing fear and uncertainty.

Same ER, two root definitions, two completely different conceptual models. A's core concepts:
triage efficiency, wait time, throughput. B's core concepts: emotional state, information
transparency, care perception.

**SSM doesn't ask you to pick the "right" one — it asks you to acknowledge each as a valid
perspective, then explore the tension between them.**

##### Step 3: Conceptual Model

Based on the root definition, build a **minimal activity model of "what this system logically
needs to do if it existed"**.

Not a description of "what reality is" but a derivation of "what should logically be done
given this worldview". An idealized, internally consistent model.

##### Step 4: Comparison with Reality

Bring the idealized model back to the real world, comparing point by point:
- Does this activity exist in reality?
- If so, how well is it done?
- If not, why? Was it forgotten or intentionally excluded?
- What does the gap between reality and ideal mean?

**The model's value lies not in itself but in what the gap with reality exposes.**

#### Why SSM Matters

1. **Only framework that hard-codes "worldview" into methodology.** Others assume an objective
   problem awaits modeling. SSM says: no perspective-free problem description exists. Every model
   starts from a Weltanschauung — not explicitly stating it means being unconsciously controlled
   by it.

2. **Rich Pictures are a practical tool for "escaping the language prison."** Using drawings
   instead of words to capture the problem space, bypassing language's structuring tendency.

3. **Directly handles power and politics.** Owner and Environment aren't technical details —
   they acknowledge what most design methods ignore: models aren't built in a vacuum; someone
   has power to define what the "problem" is; someone's voice is excluded.

#### SSM Limitations

- Steps are heavyweight; full walkthrough requires extensive stakeholder participation and time
- CATWOE analysis has a learning curve, especially identifying "worldview"
- Outputs (Rich Pictures, root definitions) don't easily convert to software architecture or
  technical specs — other bridges needed from SSM to implementation
- Hard to convince teams to "draw a Rich Picture first, don't rush to structurize" in fast-paced
  product environments

---

### 6. Architecture for Flow (Susanne Kaiser, 2023)

#### Origin and Problem Addressed

Kaiser observed a recurring failure pattern:

- Business strategy says "we're entering a new market"
- Architect designs a microservice system
- Teams are organized as feature teams
- The three layers **aren't aligned** — strategy wants flexibility but architecture is rigid;
  architecture wants decoupling but teams share codebases; teams want autonomy but org structure
  requires centralized approval

This isn't a single-layer problem. It's **a lack of shared language and alignment mechanism
across strategy, architecture, and organization**.

Core claim: to design systems with continuous flow, you must **design all three layers
simultaneously, connected by the same set of concepts**.

#### Three Pillars and Their Connections

##### Pillar 1: Wardley Mapping (Business Strategy)

Simon Wardley's Wardley Map visualizes **value chain evolution**.

Two axes:
- **Y-axis = Value chain**: from user needs (top) to underlying support components (bottom),
  showing dependencies
- **X-axis = Evolution stage**: Genesis → Custom-Built → Product → Commodity

**Core insight**: components at different evolution stages need completely different management:

| Stage | Characteristics | Approach | Design investment |
|---|---|---|---|
| **Genesis** | New, uncertain, high exploration | Agile, experiments, high tolerance | Heaviest (core domain) |
| **Custom-Built** | Has direction but not yet standardized | Iterative, lean | Heavy (supporting domain) |
| **Product** | Standardized, leasable | Integration, configuration | Light |
| **Commodity** | Fully standardized, utility | Direct purchase | Zero (generic domain) |

This directly answers a classic design resource allocation question: **not everything deserves
careful design**. Spending three months designing a login system is waste — it's Commodity,
just use Auth0. But spending three months designing your core business concepts is necessary —
it's Genesis.

##### Pillar 2: DDD Strategic Design (Software Architecture)

DDD's strategic design provides **software-level concept boundary division**:

- **Bounded Context**: semantically clear concept boundaries
- **Context Map**: relationships and power dynamics between contexts
- **Core Domain / Supporting Domain / Generic Domain** classification

##### Pillar 3: Team Topologies (Team Organization)

Matthew Skelton and Manuel Pais's Team Topologies provides a **design language for team
structure**:

Four team types:
- **Stream-aligned team**: aligned to a business stream (main force)
- **Enabling team**: helps other teams gain new capabilities (coach)
- **Complicated-subsystem team**: handles components requiring deep expertise (specialist)
- **Platform team**: provides internal platform services (infrastructure)

Three interaction modes:
- **Collaboration**: two teams working closely (high bandwidth, temporary)
- **X-as-a-Service**: one team provides services to another (low bandwidth, stable)
- **Facilitating**: one team helps another grow (teaching)

Core constraint: **Cognitive Load** — a team has an upper limit on complexity it can effectively
handle. If a bounded context is too large, exceeding a team's cognitive load, it must be split.

#### How the Three Align (Key Innovation)

Kaiser's core contribution isn't inventing these three tools — they already existed separately.
Her contribution is **defining the mapping relationships between them**:

```
Wardley Map component evolution stages
        ↕ directly maps to
DDD domain type classification
        ↕ directly maps to
Team Topologies team types and interaction modes
```

Specific mapping:

| Wardley Evolution | DDD Domain Type | Suitable Team Type | Design Strategy |
|---|---|---|---|
| Genesis | **Core domain** | Stream-aligned (exploration mode) | Deep concept design, EventStorming, Concept Design |
| Custom-Built | **Supporting domain** | Stream-aligned or Complicated-subsystem | Moderate design, focus on key interfaces |
| Product | Supporting / Generic | Platform team (X-as-a-Service) | Integration and configuration |
| Commodity | **Generic domain** | No dedicated team, just purchase | Zero design investment |

**This solves a very common org problem**: why does Team A ship fast while Team B is slow?
Often not a capability issue — Team A handles Commodity domain (assemble off-the-shelf), Team B
handles Genesis domain (deep exploration needed), but the org uses the same KPIs for both.

#### Architecture for Flow Canvas

Kaiser designed an integrated canvas showing on one diagram:

1. Value chain and component evolution (from Wardley Map)
2. Bounded context boundaries and mapping relationships (from DDD)
3. Team types and interaction modes (from Team Topologies)
4. Evolution-driven design decisions (what to build, buy, or partner on)

The canvas's value: **letting CTO, product lead, and engineering manager converse on the same
diagram**. Previously they each looked at their own — CTO at architecture diagrams, PM at
roadmaps, EM at org charts — with no connection between the three.

#### Relation to Conceptual Modeling

Architecture for Flow directly affects a key decision in the "problem→conceptual model" process:
**where to invest conceptual design effort**.

If Wardley Map shows a component is in Commodity stage — extensive concept modeling is waste.
Use industry standard solutions.

If a component is in Genesis stage — worth deploying all heavy tools: EventStorming, Concept
Design, SSM Rich Pictures. Concept design quality here directly determines product
differentiation.

This is a **meta-level judgment**: not "how to model" but "is it worth modeling" and "where
to model".

#### Architecture for Flow Limitations

- Learning curves of three methods compound — most teams haven't mastered even one
- Wardley Map evolution stage judgment highly depends on experience and subjective judgment,
  not precise science
- Better suited for mid-to-large organizations; small teams (<10) rarely need such heavy
  alignment mechanisms
- Canvas alignment is a point-in-time snapshot — components evolve, teams change, requires
  regular updates

---

### SSM + Architecture for Flow: Complementary Relationship

| Dimension | SSM | Architecture for Flow |
|---|---|---|
| Core question | How to understand a chaotic problem space? | How to align strategy-architecture-organization? |
| Starting point | Vague, contested "soft" problems | Organizations with direction but lacking cross-layer alignment |
| Handling of "perspectives" | Explicitly acknowledges multiple perspectives, models each via CATWOE | Uses Wardley Map to establish shared strategic perspective |
| Guidance for conceptual modeling | Tells you **how to think** about problems (epistemological tool) | Tells you **where to invest** modeling effort (resource allocation tool) |
| Limitation compensation | SSM doesn't say how to allocate modeling resources → AFF fills this | AFF doesn't handle multi-party value conflicts → SSM fills this |

Combined workflow for problems that are both contested "soft" problems (needs SSM) and require
organizational alignment (needs AFF):

1. **Use SSM's Rich Picture** to unfold the problem space, identify different worldviews
2. **Use CATWOE for key perspectives** to build root definitions, clarify "from which angle
   are we modeling"
3. **Use Wardley Map to position** each component's evolution stage, determine concept design
   effort allocation
4. **Use DDD's Bounded Contexts** to divide concept boundaries
5. **Use Team Topologies to align** team structure

This walks from "chaotic multi-party disputes" step by step to "executable conceptual
architecture + team division of labor".
