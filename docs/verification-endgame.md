# Endgame Verification

Milestone 6A verification covers the repository endgame subsystem.

## Implemented

- `OpenAdventure_Endgame.ni` is included in `OpenAdventure.ni`.
- `build.sh` composes `OpenAdventure_Endgame.ni` into `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
- Endgame state is tracked in `OpenAdventure_State.ni`.
- Cave closing initializes repository readiness when the cave fully closes.
- Runtime post-travel hooks update repository readiness in `LOC_NE` and `LOC_SW`.
- `BLAST` implements Open Adventure C splatter, defeat, and victory branches.
- Mirror/dwarf disturbance implements the fatal dwarves-awakened branch.
- Endgame completion applies the closed-cave bonus, not-quitting bonus, final score, and ranking output.
- Smoke coverage is present in `tests/smoke/11-endgame-system.sh`.

## Reference Checks

Open Adventure C:

- `actions.c::blast()` is mirrored for `BLAST` outcome selection.
- `actions.c::vbreak()` is mirrored for closed-cave mirror breaking.
- `actions.c::wake()` is mirrored for waking the repository dwarf.
- `score.c::score()` is mirrored for closed-cave bonus values.

Nelson Inform 6:

- Repository room layout and rod-placement puzzle behavior were used as a comparison source.

Conley Inform 7:

- No complete endgame behavior was available, so no Conley behavior was ported.

## Compile Result

Passed.

Command:

```sh
./build.sh --compile
```

Result:

- Inform 7 translated the 24,860-word source successfully.
- Build contains 185 rooms and 73 things.
- Artifact produced: `OpenAdventure.inform/Build/OpenAdventure.z8`.

## Smoke Test Result

Passed.

Command:

```sh
./test.sh
```

Result:

- Source generation check passed.
- Compile step passed.
- Existing smoke checks through cave closing passed.
- `tests/smoke/11-endgame-system.sh` passed.
