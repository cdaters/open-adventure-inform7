# Source Hierarchy and Dispute Resolution

This document defines how the project decides which source to trust when data or
behavior appears contradictory.

## Canonical Sources

For this repository, the canonical model is split:

- `source/adventure.yaml` is the authoritative world model.
- `references/open-adventure-c/` is the authoritative source of gameplay behavior.

`adventure.yaml` is the structured specification for rooms, objects, travel
rules, messages, and vocab. The Open Adventure C implementation is the gameplay
reference for how those structures are interpreted during play (especially edge
cases and special flow).

`OpenAdventure.ni` is the hand-maintained gameplay layer and should implement the
behavior that is out of scope for generated world-model structure.

## Historical Sources

Historical Adventure lineages are consulted for context, not source-of-truth:

- Original Crowther/Woods Adventure behavior.
- `advent.adoc` and project notes in `references/open-adventure-c/`.

These matter when intent is unclear or when a historical quirk should be preserved,
but they do not override the canonical pair above.

## Reference Implementations

These are implementation references for Inform and parser strategy:

- `references/conley-inform7/Adventure.ni`
- `references/nelson-inform6/Advent.inf`

Treat these as design references:

- map/room modeling patterns in Inform,
- vocabulary and parser translation ideas,
- alternative implementations of the same world model.

Use them for guidance, not direct truth.

## Source Precedence Rules

1. For structural world data (rooms, objects, travel tables, vocab lists, messages,
   hints), `adventure.yaml` is authoritative.
2. For gameplay interpretation of that data, Open Adventure C is authoritative.
3. For parser behavior and engine wiring, follow `PROJECT.md` Parser Philosophy,
   then validate intent against C.
4. Reference implementations are lower priority and cannot force behavior changes.

## Conflict Resolution Examples

- **Travel condition disagreement**  
  If `adventure.yaml` defines a `loc -> target` transition and C behavior implies an
  extra precondition or side effect, keep the data from YAML, but resolve behavior
  against C semantics in the generated/system logic.

- **Object state mismatch**  
  If a generated object declaration and C-facing behavior diverge on score effects,
  state transitions, or special handling, preserve the YAML structure and align
  gameplay rules to C behavior.

- **Parser vocabulary conflict**  
  If one source treats a token as directional and another treats it as action/object
  vocabulary, keep the YAML vocabulary mapping and implement parser compatibility using
  the migration strategy in `docs/vocabulary-analysis.md` and the parser philosophy.

- **Reference implementation disagreement**  
  If either Conley or Nelson diverges from C/YAML on movement or object behavior,
  this project follows C/YAML and records a divergence note in `docs/` when needed.

## Repository Organization

- `source/adventure.yaml`: Canonical declarative input.
- `tools/`: Generator scripts that derive Inform source from YAML.
- `generated/`: Regenerated world-model files; never hand-edit.
- `docs/`: Analyses and architectural notes (milestone documentation).
- `references/`: Canonical behavioral reference and historical/reference ports.
- `OpenAdventure.ni`: Hand-maintained, non-generated gameplay logic.

## Guidance for Future Contributors

- Read `README.md` and `PROJECT.md` before changing architecture.
- Make edits to gameplay logic and parser behavior in `OpenAdventure.ni` only where
  needed, and keep YAML-derived structure generation in scripts.
- When `adventure.yaml` changes, regenerate `generated/*.ni`.
- Do not alter generated files directly; changes must come from generator updates.
- Update analysis docs in `docs/` when source assumptions change (travel, objects,
  vocabulary, world model).

## Guidance for Codex and AI-Assisted Work

- Treat this document as the resolution policy when sources conflict.
- Prefer source-of-truth behavior from Open Adventure C and structural truth from YAML.
- Flag ambiguous or genuinely conflicting cases in the user-facing analysis docs.
- If a change could alter behavior, default to generated outputs + documented exceptions
  rather than manual edits in generated files.
