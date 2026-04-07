# Feature-Wave Landing Protocol

Use this file when the skill is operating in `feature-wave` mode or when a
`triage` fallback still needs to preserve the one-wave landing model.

## Primary Usage Pattern

Default operating pattern:

1. Start from a dedicated worktree boundary for the task.
2. Human reviews the AI draft and identifies the `Human-Owned` core path.
3. If the core is still too noisy to reason about safely, run
   `reference-core-impl-skill` to distill a runnable minimal-complete sample.
4. Human reimplements that core path on `main` from requirements, invariants,
   and the learned sample, not by trust-copying the AI diff.
5. AI draft is used as reference for glue, tests, examples, and non-core
   scaffolding.
6. The wave closes only when `main` has the minimal verified business result.

Recommended sequence:

1. repository-local tmux bootstrap skill
2. `reference-core-impl-skill` when needed
3. `human-core-feature-wave-skill`
4. `git-commit-skill`

## What Counts As One Wave

One wave is one smallest verifiable business closure on `main`.

A wave may contain multiple small commits.
A wave must not try to solve the whole feature end-to-end if that breaks focus.

Examples:

- first request path returns the correct response for one happy path
- one state transition is implemented with checks and tests
- one read/write loop works with a stable contract

## Five Closed-Loop Questions

Before planning a wave, answer these five questions:

1. What is the user path or business path for this wave?
2. What is the success condition?
3. What invariant must not be broken?
4. What is the smallest change set on `main` to deliver this wave?
5. How will `main` be verified?

If planning drifts into migration details before these are clear, reset and
answer them first.

## Quick Control Split

Use this split before landing code.

### Human-Owned

Human decides and implements or refactors the core behavior.

Default for:

- business semantics and rule boundaries
- core algorithms and state machines
- invariants and consistency guarantees
- public contracts, API behavior, or event-schema meaning
- security, auth, or permission logic
- data model semantics, migrations, backfills, and deletion strategies
- idempotency, retry, or ordering guarantees

### Human-Confirm

AI may draft, but human must explicitly review and approve before merge.

Default for:

- table or schema changes
- cross-module interfaces
- migration scripts
- permission checks
- reliability-sensitive configuration

### AI-Auto

AI can draft directly and the human performs a quick spot-check.

Default for:

- CRUD handlers and repository boilerplate
- DTOs, mappers, and adapters
- repetitive glue code
- test scaffolding and example cases
- non-policy logging or metrics template wiring
- documentation updates for implemented behavior

## Commit Boundary Rule

This skill is commit-aware because a wave can contain many commits.

Rules:

- Prefer small, focused commits, not a single design-plan commit.
- Each commit must be reversible and independently reviewable.
- Every landing step must include a `commit_when` condition.
- Commit when a step reaches a verifiable local milestone, not when the whole
  feature is finished.

Good `commit_when` examples:

- request path compiles and returns a placeholder response with tests adjusted
- invariant check is enforced in one write path and the test passes
- mapper or DTO glue is wired with no contract change and a smoke check passes

## Triage Fallback

Use `mode=triage` only when the AI diff is too large to reason about safely:

- many files
- cross-layer changes
- audit-heavy handoff
- high-risk data or contract changes

Even in `triage`, start with:

- one-wave closed-loop goal
- quick control split
- human checkpoints

Triage is a fallback tool, not the default development entry point.

## Optional Multi-Agent Review

Default is single-agent.

Use multi-agent discussion only when it improves decision quality, not for
routine code copying.

Good uses:

- comparing a few implementation strategies for a `Human-Owned` core path
- reviewing a `Human-Confirm` schema or contract change
- designing rollback or verification for high-risk behavior
