# Implementation Coach Pattern

Use this file when the skill is operating in `implementation-coach` mode or
when a `feature-wave` needs the nested reasoning pattern for a `Human-Owned`
step.

## Teaching Sequence

Teach the implementation in this order:

1. State the external behavior first.
2. Name the hard constraints and invariants.
3. Derive the internal model or data structures from those constraints.
4. Sketch the public methods first and name helper contracts before helper
   bodies.
5. Implement or explain the smallest primitives first.
6. Assemble the public methods from those primitives.
7. Walk one concrete example end to end.
8. State what each helper mutates or returns, and avoid hidden side effects.

The explanation should make the data-structure choice feel inevitable from the
requirements. Do not jump straight to helper internals without first showing
the constraint that forces them.

## Output Expectations

When using this mode, keep the response centered on:

- feature goal
- external contract
- constraints and invariants
- derived structure
- public surface before helpers
- build order
- one worked example
- verification
- next smallest step

## Teaching Guardrails

- Do not recommend a helper before explaining what pressure or requirement
  created it.
- Do not say "store X in a map/list" without explaining what operation needs to
  stay `O(1)` or what invariant it protects.
- Keep one abstraction level at a time: contract first, helper details second.
- Call out mutation boundaries explicitly: what state changes, what does not,
  and what the caller must still do.
- Prefer one worked example over many shallow examples.
- When AI code already exists, do not treat the existing helper layout as
  authoritative. Re-derive the core path from requirements first.

## When To Use The Worked Example

See `references/worked-example-lrucache.md` when the user needs a concrete
example of deriving `dict + doubly linked list` from behavior and `O(1)`
constraints before helper internals.
