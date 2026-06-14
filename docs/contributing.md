# Contributing

Thank you for working on Open Adventure in Inform 7. The main contribution rule
is simple: preserve Open Adventure behavior unless a documented intentional
deviation is approved.

## Source Hierarchy

Use this order when deciding what behavior is correct:

1. `references/open-adventure-c/`
2. `source/adventure.yaml`
3. `references/nelson-inform6/Advent.inf`
4. `references/conley-inform7/Adventure.ni`
5. Existing project architecture docs and runtime code

Open Adventure C is authoritative for gameplay behavior.

## Development Setup

Install:

- Inform 7 10.1.2 command-line tools
- Inform 6 from the Inform distribution
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`

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

## Editing Rules

- Edit `source/adventure.yaml` for source data changes.
- Edit `tools/generators/` when generated Inform output needs a structural
  change.
- Edit `OpenAdventure_*.ni` for runtime behavior.
- Do not hand-edit `generated/*.ni` or
  `OpenAdventure.inform/Source/OpenAdventure.generated.ni` as durable source.
- Keep changes narrowly scoped to the subsystem being fixed.
- Update docs when behavior, verification status, or release status changes.

## Testing Expectations

Small documentation-only changes do not require the full transcript suite, but
any source or generated-output change should run at least:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Behavior changes should also run:

```bash
python3 tools/run_transcripts.py --execute --timeout 90
```

For full-route parity work, run:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

## Adding Tests

Use smoke tests for build, artifact, and subsystem sanity checks. Use transcript
suites for player-visible behavior.

When adding transcript expectations:

- Prefer C-backed output fragments from Open Adventure logs.
- Keep fragments stable and meaningful.
- Avoid overfitting to whitespace or interpreter prompts.
- Document any intentional deviation in `docs/known-differences.md`.

## Pull Request Checklist

Before proposing a change:

- Confirm the source hierarchy for any behavior claim.
- Regenerate generated files if generator or YAML data changed.
- Run the relevant build and transcript commands.
- Update affected architecture, verification, or release docs.
- Include the command results in the PR description.
