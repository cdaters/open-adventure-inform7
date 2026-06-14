# Open Adventure Inform 7 Reconstruction

This project reconstructs Open Adventure in Inform 7 using generated world data
plus dedicated runtime subsystems. The goal is Open Adventure behavioral parity
with a maintainable source hierarchy:

1. Open Adventure C is authoritative for gameplay behavior.
2. `source/adventure.yaml` is authoritative for generated world data.
3. Generated Inform files are build artifacts.
4. Hand-written `OpenAdventure_*.ni` files implement runtime behavior.

## Current Status

Release classification: **Release Candidate for Glulx**.

Current measured state:

- Glulx build target passes compile and smoke verification.
- Transcript execution passes 15/15 suites with `--timeout 90`.
- Complete solve, treasure collection, and endgame transcript routes pass.
- Z8 remains experimental and is not a release target because of memory limits.

Primary release artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Milestone Progress

| Milestone | Scope | Status | Result |
|---|---|---|---|
| 2A | Data source extraction | Complete | `source/adventure.yaml` stabilized and analyzed |
| 2B | Language and command analysis | Complete | Vocabulary and parser tokens mapped |
| 2C | Baseline architecture | Complete | Core architecture docs and current-state baseline |
| 2D | Unresolved travel investigation | Complete | Non-direct travel rules identified and classified |
| 3A | Gameplay systems analysis | Complete | Gameplay catalog and runtime ownership boundaries |
| 3B | Runtime framework | Complete | State, condition, and event foundations |
| 3C | Travel dispatch integration | Complete | Generated travel rows route through runtime dispatch |
| 3D | Plover implementation | Complete | Plover travel handlers implemented |
| 3E | Build/test baseline | Complete | Inform build and smoke pipeline established |
| 3F | Documentation refresh | Complete | Architecture and roadmap refreshed |
| 4A | Plover hardening | Complete | Plover dispatch integrated |
| 4B | Troll / bridge / chasm | Complete | Troll bridge and chasm travel behavior implemented |
| 4C | Dwarf travel gating | Complete | Dwarf restrictions integrated with travel dispatch |
| 4D | Dwarf subsystem | Complete | Activation, encounter, blocking, and attack behavior |
| 4E | Pirate subsystem | Complete | Chest placement, theft, and dwarf/pirate ordering |
| 4F | Treasure and scoring | Complete | Treasure tracking, deposits, and score hooks |
| 5A | Death and reincarnation | Complete | Death flow, resurrection, item disposition, penalties |
| 5B | Bear subsystem | Complete | Feeding, chain, following, troll interaction |
| 5C | Dragon subsystem | Complete | Confrontation, confirmation, death transformation |
| 5D | Cave closing | Complete | Clocks, warnings, closure, repository transition |
| 6A | Endgame | Complete | Repository puzzle, blast outcomes, final score/rank |
| 6B | Information system | Complete | Startup, HELP, ABOUT, INFO, NEWS, credits, version |
| 7A | Transcript framework | Complete | Transcript suites, walkthrough docs, discrepancy inventory |
| 7B | Runnable artifact correction | Complete | Build pipeline produces real story artifacts |
| 7C | VM target analysis | Complete | Glulx selected as release target; Z8 experimental |
| 7D | Transcript execution | Complete | Glulx transcript execution enabled |
| 7E | Runtime crash fix | Complete | Startup/runtime recursion crash resolved |
| 7F | Discrepancy analysis | Complete | Transcript failures classified and prioritized |
| 8A | Release readiness baseline | Complete | Parser/transcript harness stabilized |
| 8B | Transcript corrections | Complete | Lamp and replay corrections applied |
| 8C | Gameplay parity corrections | Complete | Shared gameplay failures reduced |
| 8D | Route and walkthrough parity | Complete | Route assumptions and access paths corrected |
| 8E | Full walkthrough parity | Complete | First major walkthrough divergences isolated |
| 8F | Treasure/endgame parity | Complete | Late treasure and repository issues reduced |
| 8G | Divergence elimination | Complete | Oil-bottle route divergence resolved |
| 8H | Endgame completion parity | Complete | Complete endgame route passes |
| 8I | Final walkthrough parity | Complete | Full manifest passes 15/15 |
| 9A | Release packaging and presentation | Complete | Release docs and package plan |
| 10A | Inform 7 Author Edition | In progress | IDE-friendly author project prototype |

## Build and Test Commands

Build the Glulx target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Run smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run transcript verification:

```bash
python3 tools/run_transcripts.py --execute --timeout 90
```

Run upstream walkthrough verification:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

## Author Edition

Milestone 10A adds a generated Inform IDE project:

```text
OpenAdventure-AuthorEdition.inform
```

Regenerate it with:

```bash
python3 tools/make_author_edition.py
```

The Author Edition coexists with the RC1 project. It emits
`Source/story.ni` and a Glulx `Settings.plist` for Inform 7 10.1.2 IDE use,
while keeping `source/adventure.yaml`, generator code, and `OpenAdventure_*.ni`
as durable source.

## Release Packaging

RC1 should ship as a Glulx release containing:

- `OpenAdventure.ulx`
- `README.md`
- `LICENSE`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/build-and-test.md`
- transcript verification summary from `docs/transcript-results.md`

The full source repository remains the contributor package.

## Remaining Work

Release-preparation work:

- Finish Milestone 10A GUI confirmation by manually pressing Go in Inform 7.
- Run final Glulx smoke and transcript verification before tagging.
- Tag RC1 with build and transcript evidence.

Future work:

- Decide whether to pursue Z8 memory optimization.
- Decide whether Author Edition artifacts should be committed long term or
  generated on demand.
- Expand manual playtest coverage beyond transcript routes.
- Add CI automation for Glulx build, smoke tests, and transcripts.
- Consider packaged release assets such as screenshots, cover art, or a Blorb.

Roadmap details are in `docs/project-roadmap.md`.
