# Author Edition Design

Date: 2026-06-14

## Objective

Create an Inform 7 author-friendly edition that opens cleanly in Inform 7
10.1.2 and compiles through the IDE without replacing the RC1 generator-driven
workflow.

Prototype:

```text
OpenAdventure-AuthorEdition.inform/
```

## Current Architecture

The RC1 workflow is generator-driven:

1. `tools/yaml2inform.py` reads `source/adventure.yaml`.
2. Generator modules write:
   - `generated/Rooms.ni`
   - `generated/Objects.ni`
   - `generated/Vocabulary.ni`
   - `generated/Travel.ni`
3. `build.sh` transforms selected generated output:
   - room short descriptions become printed names;
   - problematic bracketed room text is escaped;
   - the generated `DOOR` object is renamed to `the door object`;
   - the generated travel metadata table is normalized into IDE/Inform table
     syntax.
4. `build.sh` concatenates generated source and runtime modules into:
   - `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
5. `ni` translates that composed source to Inform 6.
6. `inform6` emits the Glulx story file.

The runtime module order is significant:

```text
OpenAdventure_State.ni
OpenAdventure_Conditions.ni
OpenAdventure_Plover.ni
OpenAdventure_Troll.ni
OpenAdventure_Bear.ni
OpenAdventure_Dwarves.ni
OpenAdventure_Pirate.ni
OpenAdventure_Scoring.ni
OpenAdventure_Reincarnation.ni
OpenAdventure_Dragon.ni
OpenAdventure_CaveClosing.ni
OpenAdventure_Endgame.ni
OpenAdventure_Information.ni
OpenAdventure_Runtime.ni
```

## Why the Existing Project Is Not IDE-Friendly

The current `OpenAdventure.inform` bundle is a command-line compilation target,
not a conventional Inform author project.

Problems:

- It does not provide the conventional IDE entry point
  `Source/story.ni`.
- Its composed source is named `Source/OpenAdventure.generated.ni`, and
  `build.sh` passes that file directly to `ni` with `-source`.
- The source composition step is external to the IDE.
- The default command-line target is still `Inform6/16`, while the release
  target is Glulx.
- The generated files cannot be included directly from `OpenAdventure.ni`
  without reproducing the transformations currently embedded in `build.sh`.

In short, pressing Go in the IDE bypasses the repository's source-composition
logic and expects a project-shaped source file.

## Design Options

### Option A: Emit an IDE-Friendly Project

Maintain the current generated workflow and add an assembler that emits a
normal Inform project:

```text
OpenAdventure-AuthorEdition.inform/
  Settings.plist
  uuid.txt
  Source/story.ni
  Materials/
```

Benefits:

- Preserves RC1 architecture.
- Keeps generated source reproducible.
- Lets authors open and compile the project in the IDE.
- Keeps the IDE project disposable and regenerable.

Costs:

- `story.ni` is a generated composition artifact and should not become the
  long-term hand-edited source of truth.
- Authors must understand which files are durable source and which are emitted
  output.

### Option B: Convert RC1 Into a Native Inform Author Project

Make `OpenAdventure.inform/Source/story.ni` the primary source and move away
from generated composition.

Benefits:

- Most familiar for Inform authors.
- Easier to hand-edit inside the IDE.

Costs:

- Breaks the source hierarchy.
- Risks divergence from `source/adventure.yaml`.
- Makes future regeneration and parity corrections harder.
- Would require reworking build/test/transcript assumptions.

### Option C: Maintain Both Workflows

Keep the RC1 generator-driven project as the release/development workflow and
emit an author-friendly project for IDE work.

Benefits:

- Preserves RC1 behavior and transcript parity.
- Supports IDE authoring and future extension work.
- Avoids forcing all contributors into the IDE workflow.
- Keeps generated data and runtime code authoritative in the repository.

Costs:

- Requires a small amount of workflow discipline.
- The Author Edition must be regenerated after source, generator, or runtime
  changes.

## Recommendation

Use **Option C**.

The long-term structure should maintain both workflows:

- `OpenAdventure.inform`: RC1 command-line build/test target.
- `OpenAdventure-AuthorEdition.inform`: generated IDE author project.
- `tools/make_author_edition.py`: assembler for the author project.

The Author Edition should be treated as a convenience artifact generated from
the same source hierarchy as RC1, not as a replacement architecture.

## Prototype Architecture

`tools/make_author_edition.py` now assembles:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.inform/Settings.plist
OpenAdventure-AuthorEdition.inform/uuid.txt
OpenAdventure-AuthorEdition.inform/Materials/.gitkeep
```

The generated `Settings.plist` uses Inform's bundled sample-project convention:

```text
IFOutputSettings / IFSettingZCodeVersion = 256
```

That setting selects Glulx in Inform 7 10.1.2.

## Verification

Prototype command-line verification:

```bash
python3 tools/make_author_edition.py
/Applications/Inform.app/Contents/MacOS/ni \
  -at /Applications/Inform.app/Contents/Resources \
  -source OpenAdventure-AuthorEdition.inform/Source/story.ni \
  -release -format=Inform6/32 \
  -o OpenAdventure-AuthorEdition.inform/Build/OpenAdventure-AuthorEdition.i6
/Applications/Inform.app/Contents/MacOS/inform6 \
  -E2w~S~DG +/Applications/Inform.app/Contents/Resources/Library/6.11 \
  OpenAdventure-AuthorEdition.inform/Build/OpenAdventure-AuthorEdition.i6 \
  OpenAdventure-AuthorEdition.inform/Build/OpenAdventure-AuthorEdition.ulx
OPENADVENTURE_STORY=OpenAdventure-AuthorEdition.inform/Build/OpenAdventure-AuthorEdition.ulx \
  python3 tools/run_transcripts.py --execute --timeout 90
```

Result:

- Inform 7 translation succeeded.
- Inform 6 Glulx compilation succeeded.
- Author-edition artifact was identified as Glulx game data.
- Transcript replay passed 15/15.

GUI note:

- The project has the expected IDE shape and Glulx settings.
- This milestone verified the exact `Source/story.ni` compilation path from the
  command line. Manual GUI confirmation should consist of opening
  `OpenAdventure-AuthorEdition.inform` in Inform 7 10.1.2 and pressing Go.
