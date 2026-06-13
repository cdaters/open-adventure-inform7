# Information System Verification

Milestone 6B verification covers startup, help, about, info, news, credits, and version information.

## Implemented

- `OpenAdventure_Information.ni` is included in `OpenAdventure.ni`.
- `build.sh` composes `OpenAdventure_Information.ni` into `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
- Startup presentation prints `Welcome to Adventure!` and `(Please type HELP for instructions and information.)`.
- `HELP` prints a menu with:
  - Instructions for Playing
  - Historical Background
  - Open Adventure
  - About this Edition
  - Credits
  - Version Information
- Direct help section commands are implemented.
- `ABOUT`, `INFO`, `NEWS`, `VERSION`, and `VERSI` are implemented as out-of-world commands.
- Bare `?` is normalized to `HELP`.
- Credits include Crowther/Woods, Open Adventure, this Inform 7 edition, reference Inform ports, repository URL, and licensing.
- Smoke coverage is present in `tests/smoke/12-information-system.sh`.

## Reference Checks

Nelson Inform 6:

- Startup presentation follows `Advent.inf`.
- Help menu structure follows the Nelson menu concept.
- Historical background is summarized from Nelson's long historical preface.

Open Adventure C:

- `HELP`, `INFO`, `NEWS`, and `ACT_VERSION` concepts are preserved.
- Open Adventure Version 2.5 and 430-point identity are preserved in NEWS/INFO text.

Conley Inform 7:

- Inform-specific `ABOUT` command concept is preserved.
- `?` command rewriting follows the Conley parser approach.

## Compile Result

Passed.

Command:

```sh
./build.sh --compile
```

Result:

- Inform 7 translated the 26,218-word source successfully.
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
- Existing smoke checks through endgame passed.
- `tests/smoke/12-information-system.sh` passed.
