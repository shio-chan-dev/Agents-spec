---
name: human-core-feature-wave-skill
description: v0.1.19 - Guide one human-led AI feature landing wave where AI drafts stay reference-only, the human reimplements the core on main, and each landing step is closed, verifiable, and commit-aware.
---

# Human-Core Feature Wave Skill

## Trigger and Scope

Use this skill when the user wants either:

- a tutorial-first explanation for one feature or method without losing the
  reasoning behind each structure and helper, or
- a human-led, AI-assisted plan for landing one feature wave from an AI
  worktree or branch into `main` without trusting the AI diff as the source of
  truth

In scope:

- one-wave landing plans for a minimal closed loop on `main`
- implementation coaching for `Human-Owned` core logic
- explicit control ownership between human, review-required AI, and safe AI
  drafting
- commit-aware landing steps with verification checkpoints
- using AI drafts as reference for glue, tests, examples, and edge cases

Out of scope:

- broad multi-wave roadmaps by default
- direct trust-copy migration from the AI branch into `main`
- file-by-file migration plans with no business-closure anchor
- post-hoc diff summaries or code reviews without a landing or teaching goal

## Core Purpose

- Keep attention on user-visible behavior, business closure, and reasoning, not
  on diff migration.
- Help the human re-derive the core path from requirements and invariants
  before adopting any AI-generated structure.
- Land one smallest useful verified loop on `main` while keeping commit
  boundaries explicit and reversible.

## Modes

- `feature-wave`: default when AI has already drafted code and the goal is to
  land one smallest useful closed loop on `main`
- `implementation-coach`: use when the user mainly needs the reasoning path for
  a `Human-Owned` core step
- `triage`: fallback only when the AI change surface is too large to reason
  about safely in one wave

## Bundled Resources

- `references/feature-wave-landing.md`
  Read for the five closed-loop questions, control split, `commit_when` rules,
  triage fallback, and one-wave landing protocol.
- `references/implementation-coach-pattern.md`
  Read when teaching or re-deriving a `Human-Owned` core path from behavior and
  invariants rather than from existing helper layouts.
- `references/worked-example-lrucache.md`
  Read when a concrete example helps show how the skill derives structures from
  constraints before helper internals.

## Required Inputs

- `mode`, or a clear user intent signal that lets the mode be inferred
- for `implementation-coach`:
  - one-sentence feature or method goal
  - optional constraints or invariants
  - optional current code or code shape
- for `feature-wave`:
  - AI worktree path or branch name
  - `main_branch` when it is not `main`
  - current wave goal in one sentence
  - optional diff evidence such as `git diff`, changed files, or target paths

## Defaults

- main target: `main`
- wave scope: `single-closed-loop`
- output style: `tutorial-first`
- implementation style: `contract-first-with-explicit-helper-boundaries`
- plan horizon: `this-wave-only`
- integration strategy: `human-led-main-first`
- human core reimplementation: `default-on`
- AI draft status: `reference-only`
- agent mode: `single-agent` unless extra review materially improves quality

## Workflow

1. Clarify the mode and the smallest success condition.
   - Distinguish whether the user needs `feature-wave`,
     `implementation-coach`, or `triage`.
2. Establish the execution boundary.
   - When this flow will produce or modify real code, start from a dedicated
     worktree boundary and run the repository-local tmux bootstrap skill first.
3. For `feature-wave`, anchor the wave before planning.
   - Answer the five closed-loop questions in
     `references/feature-wave-landing.md`.
4. Decide whether the core needs distillation first.
   - If the core is still too noisy to reason about safely, run
     `reference-core-impl-skill` before landing code on `main`.
5. Split control ownership.
   - Use the quick control split in
     `references/feature-wave-landing.md` to separate `Human-Owned`,
     `Human-Confirm`, and `AI-Auto` work.
6. Re-derive the `Human-Owned` core path.
   - For each human-owned step, use the sequence in
     `references/implementation-coach-pattern.md`:
     behavior first, constraints second, structure third, helpers last.
7. Land the wave on `main` in human-led order.
   - Put the core boundary or contract skeleton first, close the minimal path,
     then adopt safe AI glue where appropriate.
8. Define verification and commit checkpoints.
   - Every landing step must be verifiable and include a `commit_when`
     condition.
9. Stop after one wave.
   - Hand off to `git-commit-skill` for commit-stage closure, or state the next
     wave in one line only.

## Output Format

```text
## Mode
## Goal
## Constraints and Invariants
## Core Path or Closed-Loop Answers
## Control Split
## Build or Landing Plan
## Verification
## Next Step
## Blocking Questions
```

## Guardrails

- Do not treat the AI branch or diff as the source of truth.
- Do not default to copying the AI core algorithm into `main`.
- Do not recommend helpers before explaining the requirement pressure that
  creates them.
- Do not default to full migration planning or a multi-wave roadmap.
- Do not start from schema or model work unless the current wave truly
  requires it.
- Do not let `implementation-coach` collapse into "here is the final code"
  without the requirements-to-structure path.
- Keep output to one wave at a time.
- Keep human control explicit for `Human-Owned` and `Human-Confirm` items.
- Do not output secrets, tokens, or PII.

## Verification Hooks

- Verify the one-wave goal or feature goal is explicit before any planning.
- Verify the `Human-Owned` core path is restated from requirements, not from
  the AI helper layout.
- Verify `implementation-coach` outputs explain constraints before internal
  structure and helper contracts.
- Verify every landing step names an owner, a `done_when`, and a
  `commit_when`.
- Verify main-branch verification is explicit for the current wave.
- Verify the AI draft is described as reference material rather than merge
  target.
- Verify the output ends with either one next small step or one-line next wave.
