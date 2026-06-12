# Travel System Analysis (adventure.yaml)

This report summarizes movement-generation data from `source/adventure.yaml` for
Milestone 1. It is based on a direct pass over all `locations[*].travel` entries
in the source data.

## Travel Action Types

The following action kinds were found in the current travel data:

- `goto`: **583**
- `speak`: **34**
- `special`: **6**
- unknown action kinds: **0**

`special` entries use the numeric token (`2` or `3`) used by the original C
implementation, while `speak` entries reference message labels such as
`WHICH_WAY`.

## Derived Classification Buckets

`goto`, `speak`, and `special` are the only canonical kinds and are all handled
in the generator as taxonomy buckets for now.

### Conditional actions

Rules that include `cond`:

- total: **49**
- by condition kind:
  - `not`: 25
  - `carry`: 7
  - `pct`: 12
  - `with`: 4
  - `nodwarves`: 1

### Random actions

Rules whose condition is `pct`-based are treated as random/probabilistic
movement:

- total: **12**
- random by kind:
  - `goto`: 5
  - `speak`: 7

### Forced moves

Rules where `verbs` is an empty list (no player verb required) are treated as
forced transitions.

- total: **23**
- locations: **22**

| Source Location | Forced rule count |
| --- | --- |
| LOC_BUILDING1 | 2 |
| LOC_BADDIRECTION | 1 |
| LOC_CLIFFTOP | 1 |
| LOC_CLIMBSTALK | 1 |
| LOC_CRACK | 1 |
| LOC_DOME | 1 |
| LOC_FOOF1 | 1 |
| LOC_FOOF2 | 1 |
| LOC_FOOF3 | 1 |
| LOC_FOOF4 | 1 |
| LOC_FOOF5 | 1 |
| LOC_FOOF6 | 1 |
| LOC_FOOTSLIP | 1 |
| LOC_GRUESOME | 1 |
| LOC_NECKBROKE | 1 |
| LOC_NOCLIMB | 1 |
| LOC_NOMAKE | 1 |
| LOC_PARALLEL1 | 1 |
| LOC_PARALLEL2 | 1 |
| LOC_PLANTTOP | 1 |
| LOC_SEWER | 1 |
| LOC_SNAKEBLOCK | 1 |

### Locations with mixed action types

Most locations use only `goto`; the following have additional action kinds.

- 26 locations
- includes `speak` and/or `special` action entries

Examples (not exhaustive):

- `LOC_HILL`, `LOC_VALLEY`, `LOC_SLIT`, `LOC_GRATE`, `LOC_BELOWGRATE`, `LOC_EASTBANK`, `LOC_WESTBANK`
- `LOC_Y2`, `LOC_ALCOVE`, `LOC_PLOVER`, `LOC_SWCHASM`, `LOC_NECHASM`
- `LOC_BEDQUILT`, `LOC_SWISSCHEESE`, `LOC_BREATHTAKING`, `LOC_LARGE`, `LOC_RESNORTH`
- `LOC_SHELLROOM`, `LOC_RESERVOIR`, `LOC_WITTSEND`, `LOC_SECRET4`, `LOC_SECRET6`

## Source Coverage

- total locations: **185**
- locations with at least one travel rule: **184**
- total travel rules: **623**

## Generator output shape (current milestone)

`tools/generators/travel.py` now emits `generated/Travel.ni` as grouped comment
blocks:

- grouped by source location (first-level block)
- grouped inside each location by action type (`goto`, `speak`, `special`, unknown)
- each rule includes compact metadata for future use:
  - verb list (or `<forced>`)
  - forced/conditional/random markers
  - condition payload (when present)
  - action payload (`destination`, message label, or special code)

No runtime/gameplay logic is introduced in this milestone.
