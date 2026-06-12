[ Generated Travel ]
[ Milestone 2C: generated travel dispatch for non-direct rules ]
[ action taxonomy ]
[ goto: direct destination transition ]
[ goto_direct: unconditional single mapped direction ]
[ goto_non_direct: deterministic non-mappable / ambiguous verb forms ]
[ goto_forced: verbs=[] (automatic transition) ]
[ goto_magic_word: includes XYZZY / PLUGH ]
[ goto_random: cond [pct, N] ]
[ goto_conditional: cond types carry/with/not/.. ]
[ speak: terminal message label ]
[ special: special movement code ]
[ generated table fields: source-loc, action-kind, travel-category, verbs, condition-kind, condition args, random-chance, magic-word marker, and handwritten requirement ]
[ special and nodwarves conditions remain unresolved (hand-written dependencies). ]

[ LOC_START ]
[ action summary: goto=5 ]

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_HILL ]
[ action summary: goto=4, speak=1 ]
[ direct map (goto) rules ]
west of LOC_HILL is LOC_ROADEND.
north of LOC_HILL is LOC_FOREST20.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_BUILDING ]
[ action summary: goto=4 ]

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_VALLEY ]
[ action summary: goto=5, speak=1 ]
[ direct map (goto) rules ]
west of LOC_VALLEY is LOC_FOREST12.

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_ROADEND ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_ROADEND is LOC_FOREST15.
north of LOC_ROADEND is LOC_FOREST21.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_CLIFF ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_CLIFF is LOC_FOREST19.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SLIT ]
[ action summary: goto=5, speak=1 ]
[ direct map (goto) rules ]
west of LOC_SLIT is LOC_FOREST10.

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_GRATE ]
[ action summary: goto=6, speak=1 ]
[ direct map (goto) rules ]
south of LOC_GRATE is LOC_FOREST10.
west of LOC_GRATE is LOC_FOREST9.

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_BELOWGRATE ]
[ action summary: goto=4, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_COBBLE ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_DEBRIS ]
[ action summary: goto=6 ]

[ non-direct travel rules emitted to dispatch table: 6 ]
[ LOC_AWKWARD ]
[ action summary: goto=5 ]

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_BIRDCHAMBER ]
[ action summary: goto=5 ]

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_PITTOP ]
[ action summary: goto=7 ]
[ direct map (goto) rules ]
down of LOC_PITTOP is LOC_MISTHALL.

[ non-direct travel rules emitted to dispatch table: 6 ]
[ LOC_MISTHALL ]
[ action summary: goto=6 ]
[ direct map (goto) rules ]
up of LOC_MISTHALL is LOC_PITTOP.

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_CRACK ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_EASTBANK ]
[ action summary: goto=3, speak=2 ]

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_NUGGET ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_KINGHALL ]
[ action summary: goto=8 ]
[ direct map (goto) rules ]
north of LOC_KINGHALL is LOC_SNAKEBLOCK.

[ non-direct travel rules emitted to dispatch table: 7 ]
[ LOC_NECKBROKE ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_NOMAKE ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_DOME ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WESTEND ]
[ action summary: goto=3, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_EASTPIT ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WESTPIT ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_CLIMBSTALK ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WESTBANK ]
[ action summary: speak=2, goto=4 ]
[ direct map (goto) rules ]
north of LOC_WESTBANK is LOC_PARALLEL1.
west of LOC_WESTBANK is LOC_MISTWEST.

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_FLOORHOLE ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_SOUTHSIDE ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WESTSIDE ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_BUILDING1 ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SNAKEBLOCK ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_Y2 ]
[ action summary: goto=5, special=1 ]
[ direct map (goto) rules ]
south of LOC_Y2 is LOC_FLOORHOLE.
west of LOC_Y2 is LOC_WINDOW1.

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_JUMBLE ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
up of LOC_JUMBLE is LOC_MISTHALL.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WINDOW1 ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_BROKEN ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_BROKEN is LOC_DUSTY.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_SMALLPITBRINK ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SMALLPIT ]
[ action summary: goto=1, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_DUSTY ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_PARALLEL1 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MISTWEST ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_MISTWEST is LOC_WESTBANK.
north of LOC_MISTWEST is LOC_PARALLEL2.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_ALIKE1 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
up of LOC_ALIKE1 is LOC_MISTWEST.
north of LOC_ALIKE1 is LOC_ALIKE1.
east of LOC_ALIKE1 is LOC_ALIKE2.
south of LOC_ALIKE1 is LOC_ALIKE4.
west of LOC_ALIKE1 is LOC_ALIKE11.

[ LOC_ALIKE2 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_ALIKE2 is LOC_ALIKE1.
south of LOC_ALIKE2 is LOC_ALIKE3.
east of LOC_ALIKE2 is LOC_ALIKE4.

[ LOC_ALIKE3 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_ALIKE3 is LOC_ALIKE2.
down of LOC_ALIKE3 is LOC_MAZEEND3.
south of LOC_ALIKE3 is LOC_ALIKE6.
north of LOC_ALIKE3 is LOC_MAZEEND9.

[ LOC_ALIKE4 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_ALIKE4 is LOC_ALIKE1.
north of LOC_ALIKE4 is LOC_ALIKE2.
east of LOC_ALIKE4 is LOC_MAZEEND1.
south of LOC_ALIKE4 is LOC_MAZEEND2.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND1 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND2 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND3 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALIKE5 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
east of LOC_ALIKE5 is LOC_ALIKE6.
west of LOC_ALIKE5 is LOC_ALIKE7.

[ LOC_ALIKE6 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_ALIKE6 is LOC_ALIKE3.
west of LOC_ALIKE6 is LOC_ALIKE5.
down of LOC_ALIKE6 is LOC_ALIKE7.
south of LOC_ALIKE6 is LOC_ALIKE8.

[ LOC_ALIKE7 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_ALIKE7 is LOC_ALIKE5.
up of LOC_ALIKE7 is LOC_ALIKE6.
east of LOC_ALIKE7 is LOC_ALIKE8.
south of LOC_ALIKE7 is LOC_ALIKE9.

[ LOC_ALIKE8 ]
[ action summary: goto=6 ]
[ direct map (goto) rules ]
west of LOC_ALIKE8 is LOC_ALIKE6.
east of LOC_ALIKE8 is LOC_ALIKE7.
south of LOC_ALIKE8 is LOC_ALIKE8.
up of LOC_ALIKE8 is LOC_ALIKE9.
north of LOC_ALIKE8 is LOC_ALIKE10.
down of LOC_ALIKE8 is LOC_MAZEEND11.

[ LOC_ALIKE9 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_ALIKE9 is LOC_ALIKE7.
north of LOC_ALIKE9 is LOC_ALIKE8.
south of LOC_ALIKE9 is LOC_MAZEEND4.

[ LOC_MAZEEND4 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALIKE10 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_ALIKE10 is LOC_ALIKE8.
north of LOC_ALIKE10 is LOC_ALIKE10.
down of LOC_ALIKE10 is LOC_MAZEEND5.
east of LOC_ALIKE10 is LOC_PITBRINK.

[ LOC_MAZEEND5 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_PITBRINK ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_PITBRINK is LOC_ALIKE10.
south of LOC_PITBRINK is LOC_MAZEEND6.
north of LOC_PITBRINK is LOC_ALIKE12.
east of LOC_PITBRINK is LOC_ALIKE13.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND6 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_PARALLEL2 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_LONGEAST ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_LONGEAST is LOC_LONGWEST.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_LONGWEST ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_LONGWEST is LOC_LONGEAST.
north of LOC_LONGWEST is LOC_CROSSOVER.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_CROSSOVER ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_CROSSOVER is LOC_LONGEAST.
north of LOC_CROSSOVER is LOC_DEADEND7.
east of LOC_CROSSOVER is LOC_WESTSIDE.
south of LOC_CROSSOVER is LOC_LONGWEST.

[ LOC_DEADEND7 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_COMPLEX ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_COMPLEX is LOC_ANTEROOM.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_BEDQUILT ]
[ action summary: goto=8, speak=4 ]
[ direct map (goto) rules ]
east of LOC_BEDQUILT is LOC_COMPLEX.
west of LOC_BEDQUILT is LOC_SWISSCHEESE.
up of LOC_BEDQUILT is LOC_DUSTY.
north of LOC_BEDQUILT is LOC_THREEJUNCTION.
down of LOC_BEDQUILT is LOC_ANTEROOM.

[ non-direct travel rules emitted to dispatch table: 7 ]
[ LOC_SWISSCHEESE ]
[ action summary: goto=5, speak=2 ]
[ direct map (goto) rules ]
northeast of LOC_SWISSCHEESE is LOC_BEDQUILT.
west of LOC_SWISSCHEESE is LOC_EASTEND.
east of LOC_SWISSCHEESE is LOC_SOFTROOM.

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_EASTEND ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_EASTEND is LOC_SWISSCHEESE.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SLAB ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_SLAB is LOC_WESTEND.
north of LOC_SLAB is LOC_BEDQUILT.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_SECRET1 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
south of LOC_SECRET1 is LOC_SECRET4.
north of LOC_SECRET1 is LOC_MIRRORCANYON.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_SECRET2 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_SECRET2 is LOC_THREEJUNCTION.
south of LOC_SECRET2 is LOC_TOPSTALACTITE.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_THREEJUNCTION ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
southeast of LOC_THREEJUNCTION is LOC_BEDQUILT.
south of LOC_THREEJUNCTION is LOC_SECRET2.
north of LOC_THREEJUNCTION is LOC_WINDOW2.

[ LOC_LOWROOM ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
southwest of LOC_LOWROOM is LOC_WINDING.
north of LOC_LOWROOM is LOC_DEADCRAWL.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_DEADCRAWL ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_SECRET3 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_SECRET3 is LOC_KINGHALL.
west of LOC_SECRET3 is LOC_SECRET6.
down of LOC_SECRET3 is LOC_WIDEPLACE.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WIDEPLACE ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
south of LOC_WIDEPLACE is LOC_TIGHTPLACE.
north of LOC_WIDEPLACE is LOC_TALL.

[ LOC_TIGHTPLACE ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
north of LOC_TIGHTPLACE is LOC_WIDEPLACE.

[ LOC_TALL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_TALL is LOC_WIDEPLACE.
west of LOC_TALL is LOC_BOULDERS1.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_BOULDERS1 ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
south of LOC_BOULDERS1 is LOC_TALL.

[ LOC_SEWER ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALIKE11 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
north of LOC_ALIKE11 is LOC_ALIKE1.
west of LOC_ALIKE11 is LOC_ALIKE11.
south of LOC_ALIKE11 is LOC_ALIKE11.
east of LOC_ALIKE11 is LOC_MAZEEND8.

[ LOC_MAZEEND8 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND9 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALIKE12 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_ALIKE12 is LOC_PITBRINK.
east of LOC_ALIKE12 is LOC_ALIKE13.
west of LOC_ALIKE12 is LOC_MAZEEND10.

[ LOC_ALIKE13 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_ALIKE13 is LOC_PITBRINK.
west of LOC_ALIKE13 is LOC_ALIKE12.
northwest of LOC_ALIKE13 is LOC_MAZEEND12.

[ LOC_MAZEEND10 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_MAZEEND11 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALIKE14 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_NARROW ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_NOCLIMB ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_PLANTTOP ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_INCLINE ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_GIANTROOM ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_GIANTROOM is LOC_NARROW.
east of LOC_GIANTROOM is LOC_CAVEIN.
north of LOC_GIANTROOM is LOC_IMMENSE.

[ LOC_CAVEIN ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_IMMENSE ]
[ action summary: goto=2, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_WATERFALL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_WATERFALL is LOC_INCLINE.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SOFTROOM ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ORIENTAL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
southeast of LOC_ORIENTAL is LOC_SWISSCHEESE.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_MISTY ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
west of LOC_MISTY is LOC_ALCOVE.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ALCOVE ]
[ action summary: goto=2, special=1 ]
[ direct map (goto) rules ]
east of LOC_ALCOVE is LOC_PLOVER.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_PLOVER ]
[ action summary: special=2, goto=3 ]
[ direct map (goto) rules ]
west of LOC_PLOVER is LOC_ALCOVE.

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_DARKROOM ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_ARCHED ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_SHELLROOM ]
[ action summary: goto=3, speak=2 ]
[ direct map (goto) rules ]
down of LOC_SHELLROOM is LOC_SLOPING1.
south of LOC_SHELLROOM is LOC_COMPLEX.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_SLOPING1 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
down of LOC_SLOPING1 is LOC_CULDESAC.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_CULDESAC ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_ANTEROOM ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
up of LOC_ANTEROOM is LOC_COMPLEX.
west of LOC_ANTEROOM is LOC_BEDQUILT.
east of LOC_ANTEROOM is LOC_WITTSEND.

[ LOC_DIFFERENT1 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
south of LOC_DIFFERENT1 is LOC_DIFFERENT3.
southwest of LOC_DIFFERENT1 is LOC_DIFFERENT4.
northeast of LOC_DIFFERENT1 is LOC_DIFFERENT5.
southeast of LOC_DIFFERENT1 is LOC_DIFFERENT6.
up of LOC_DIFFERENT1 is LOC_DIFFERENT7.
northwest of LOC_DIFFERENT1 is LOC_DIFFERENT8.
east of LOC_DIFFERENT1 is LOC_DIFFERENT9.
west of LOC_DIFFERENT1 is LOC_DIFFERENT10.
north of LOC_DIFFERENT1 is LOC_DIFFERENT11.
down of LOC_DIFFERENT1 is LOC_LONGWEST.

[ LOC_WITTSEND ]
[ action summary: speak=2, goto=1 ]
[ direct map (goto) rules ]
east of LOC_WITTSEND is LOC_ANTEROOM.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_MIRRORCANYON ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
south of LOC_MIRRORCANYON is LOC_SECRET1.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_WINDOW2 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
west of LOC_WINDOW2 is LOC_THREEJUNCTION.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_TOPSTALACTITE ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
north of LOC_TOPSTALACTITE is LOC_SECRET2.
down of LOC_TOPSTALACTITE is LOC_ALIKE4.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_DIFFERENT2 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southwest of LOC_DIFFERENT2 is LOC_DIFFERENT3.
north of LOC_DIFFERENT2 is LOC_DIFFERENT4.
east of LOC_DIFFERENT2 is LOC_DIFFERENT5.
northwest of LOC_DIFFERENT2 is LOC_DIFFERENT6.
southeast of LOC_DIFFERENT2 is LOC_DIFFERENT7.
northeast of LOC_DIFFERENT2 is LOC_DIFFERENT8.
west of LOC_DIFFERENT2 is LOC_DIFFERENT9.
down of LOC_DIFFERENT2 is LOC_DIFFERENT10.
up of LOC_DIFFERENT2 is LOC_DIFFERENT11.
south of LOC_DIFFERENT2 is LOC_DEADEND13.

[ LOC_RESERVOIR ]
[ action summary: goto=2, speak=1 ]
[ direct map (goto) rules ]
north of LOC_RESERVOIR is LOC_RESBOTTOM.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_MAZEEND12 ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
southeast of LOC_MAZEEND12 is LOC_ALIKE13.

[ LOC_NE ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
southwest of LOC_NE is LOC_SW.

[ LOC_SW ]
[ action summary: goto=1, speak=1 ]
[ direct map (goto) rules ]
northeast of LOC_SW is LOC_NE.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_SWCHASM ]
[ action summary: goto=2, speak=3, special=1 ]
[ direct map (goto) rules ]
southwest of LOC_SWCHASM is LOC_WINDING.

[ non-direct travel rules emitted to dispatch table: 5 ]
[ LOC_WINDING ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
down of LOC_WINDING is LOC_LOWROOM.
up of LOC_WINDING is LOC_SWCHASM.

[ LOC_SECRET4 ]
[ action summary: goto=1, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_SECRET5 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_SECRET5 is LOC_SECRET1.
east of LOC_SECRET5 is LOC_SECRET3.

[ LOC_SECRET6 ]
[ action summary: goto=1, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_NECHASM ]
[ action summary: goto=4, speak=2, special=1 ]
[ direct map (goto) rules ]
northeast of LOC_NECHASM is LOC_CORRIDOR.

[ non-direct travel rules emitted to dispatch table: 6 ]
[ LOC_CORRIDOR ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_CORRIDOR is LOC_NECHASM.

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_FORK ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_FORK is LOC_CORRIDOR.

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_WARMWALLS ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_BREATHTAKING ]
[ action summary: goto=3, speak=1 ]

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_BOULDERS2 ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_LIMESTONE ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_BARRENFRONT ]
[ action summary: goto=4 ]

[ non-direct travel rules emitted to dispatch table: 4 ]
[ LOC_BARRENROOM ]
[ action summary: goto=3 ]

[ non-direct travel rules emitted to dispatch table: 3 ]
[ LOC_DIFFERENT3 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
west of LOC_DIFFERENT3 is LOC_DIFFERENT1.
southeast of LOC_DIFFERENT3 is LOC_DIFFERENT4.
northwest of LOC_DIFFERENT3 is LOC_DIFFERENT5.
southwest of LOC_DIFFERENT3 is LOC_DIFFERENT6.
northeast of LOC_DIFFERENT3 is LOC_DIFFERENT7.
up of LOC_DIFFERENT3 is LOC_DIFFERENT8.
down of LOC_DIFFERENT3 is LOC_DIFFERENT9.
north of LOC_DIFFERENT3 is LOC_DIFFERENT10.
south of LOC_DIFFERENT3 is LOC_DIFFERENT11.
east of LOC_DIFFERENT3 is LOC_DIFFERENT2.

[ LOC_DIFFERENT4 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
northwest of LOC_DIFFERENT4 is LOC_DIFFERENT1.
up of LOC_DIFFERENT4 is LOC_DIFFERENT3.
north of LOC_DIFFERENT4 is LOC_DIFFERENT5.
south of LOC_DIFFERENT4 is LOC_DIFFERENT6.
west of LOC_DIFFERENT4 is LOC_DIFFERENT7.
southwest of LOC_DIFFERENT4 is LOC_DIFFERENT8.
northeast of LOC_DIFFERENT4 is LOC_DIFFERENT9.
east of LOC_DIFFERENT4 is LOC_DIFFERENT10.
down of LOC_DIFFERENT4 is LOC_DIFFERENT11.
southeast of LOC_DIFFERENT4 is LOC_DIFFERENT2.

[ LOC_DIFFERENT5 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
up of LOC_DIFFERENT5 is LOC_DIFFERENT1.
down of LOC_DIFFERENT5 is LOC_DIFFERENT3.
west of LOC_DIFFERENT5 is LOC_DIFFERENT4.
northeast of LOC_DIFFERENT5 is LOC_DIFFERENT6.
southwest of LOC_DIFFERENT5 is LOC_DIFFERENT7.
east of LOC_DIFFERENT5 is LOC_DIFFERENT8.
north of LOC_DIFFERENT5 is LOC_DIFFERENT9.
northwest of LOC_DIFFERENT5 is LOC_DIFFERENT10.
southeast of LOC_DIFFERENT5 is LOC_DIFFERENT11.
south of LOC_DIFFERENT5 is LOC_DIFFERENT2.

[ LOC_DIFFERENT6 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
northeast of LOC_DIFFERENT6 is LOC_DIFFERENT1.
north of LOC_DIFFERENT6 is LOC_DIFFERENT3.
northwest of LOC_DIFFERENT6 is LOC_DIFFERENT4.
southeast of LOC_DIFFERENT6 is LOC_DIFFERENT5.
east of LOC_DIFFERENT6 is LOC_DIFFERENT7.
down of LOC_DIFFERENT6 is LOC_DIFFERENT8.
south of LOC_DIFFERENT6 is LOC_DIFFERENT9.
up of LOC_DIFFERENT6 is LOC_DIFFERENT10.
west of LOC_DIFFERENT6 is LOC_DIFFERENT11.
southwest of LOC_DIFFERENT6 is LOC_DIFFERENT2.

[ LOC_DIFFERENT7 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
north of LOC_DIFFERENT7 is LOC_DIFFERENT1.
southeast of LOC_DIFFERENT7 is LOC_DIFFERENT3.
down of LOC_DIFFERENT7 is LOC_DIFFERENT4.
south of LOC_DIFFERENT7 is LOC_DIFFERENT5.
east of LOC_DIFFERENT7 is LOC_DIFFERENT6.
west of LOC_DIFFERENT7 is LOC_DIFFERENT8.
southwest of LOC_DIFFERENT7 is LOC_DIFFERENT9.
northeast of LOC_DIFFERENT7 is LOC_DIFFERENT10.
northwest of LOC_DIFFERENT7 is LOC_DIFFERENT11.
up of LOC_DIFFERENT7 is LOC_DIFFERENT2.

[ LOC_DIFFERENT8 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
east of LOC_DIFFERENT8 is LOC_DIFFERENT1.
west of LOC_DIFFERENT8 is LOC_DIFFERENT3.
up of LOC_DIFFERENT8 is LOC_DIFFERENT4.
southwest of LOC_DIFFERENT8 is LOC_DIFFERENT5.
down of LOC_DIFFERENT8 is LOC_DIFFERENT6.
south of LOC_DIFFERENT8 is LOC_DIFFERENT7.
northwest of LOC_DIFFERENT8 is LOC_DIFFERENT9.
southeast of LOC_DIFFERENT8 is LOC_DIFFERENT10.
northeast of LOC_DIFFERENT8 is LOC_DIFFERENT11.
north of LOC_DIFFERENT8 is LOC_DIFFERENT2.

[ LOC_DIFFERENT9 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southeast of LOC_DIFFERENT9 is LOC_DIFFERENT1.
northeast of LOC_DIFFERENT9 is LOC_DIFFERENT3.
south of LOC_DIFFERENT9 is LOC_DIFFERENT4.
down of LOC_DIFFERENT9 is LOC_DIFFERENT5.
up of LOC_DIFFERENT9 is LOC_DIFFERENT6.
northwest of LOC_DIFFERENT9 is LOC_DIFFERENT7.
north of LOC_DIFFERENT9 is LOC_DIFFERENT8.
southwest of LOC_DIFFERENT9 is LOC_DIFFERENT10.
east of LOC_DIFFERENT9 is LOC_DIFFERENT11.
west of LOC_DIFFERENT9 is LOC_DIFFERENT2.

[ LOC_DIFFERENT10 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
down of LOC_DIFFERENT10 is LOC_DIFFERENT1.
east of LOC_DIFFERENT10 is LOC_DIFFERENT3.
northeast of LOC_DIFFERENT10 is LOC_DIFFERENT4.
up of LOC_DIFFERENT10 is LOC_DIFFERENT5.
west of LOC_DIFFERENT10 is LOC_DIFFERENT6.
north of LOC_DIFFERENT10 is LOC_DIFFERENT7.
south of LOC_DIFFERENT10 is LOC_DIFFERENT8.
southeast of LOC_DIFFERENT10 is LOC_DIFFERENT9.
southwest of LOC_DIFFERENT10 is LOC_DIFFERENT11.
northwest of LOC_DIFFERENT10 is LOC_DIFFERENT2.

[ LOC_DIFFERENT11 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southwest of LOC_DIFFERENT11 is LOC_DIFFERENT1.
northwest of LOC_DIFFERENT11 is LOC_DIFFERENT3.
east of LOC_DIFFERENT11 is LOC_DIFFERENT4.
west of LOC_DIFFERENT11 is LOC_DIFFERENT5.
north of LOC_DIFFERENT11 is LOC_DIFFERENT6.
down of LOC_DIFFERENT11 is LOC_DIFFERENT7.
southeast of LOC_DIFFERENT11 is LOC_DIFFERENT8.
up of LOC_DIFFERENT11 is LOC_DIFFERENT9.
south of LOC_DIFFERENT11 is LOC_DIFFERENT10.
northeast of LOC_DIFFERENT11 is LOC_DIFFERENT2.

[ LOC_DEADEND13 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_DEADEND13 is LOC_BADDIRECTION.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_ROUGHHEWN ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_ROUGHHEWN is LOC_DEADEND13.
south of LOC_ROUGHHEWN is LOC_LARGE.

[ LOC_BADDIRECTION ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_LARGE ]
[ action summary: goto=2, speak=1 ]
[ direct map (goto) rules ]
west of LOC_LARGE is LOC_ROUGHHEWN.
north of LOC_LARGE is LOC_STOREROOM.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_STOREROOM ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOREST1 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST1 is LOC_START.
west of LOC_FOREST1 is LOC_FOREST13.
north of LOC_FOREST1 is LOC_FOREST2.
south of LOC_FOREST1 is LOC_FOREST3.

[ LOC_FOREST2 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST2 is LOC_FOREST1.
west of LOC_FOREST2 is LOC_FOREST19.
north of LOC_FOREST2 is LOC_FOREST3.
south of LOC_FOREST2 is LOC_FOREST18.

[ LOC_FOREST3 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_FOREST3 is LOC_FOREST2.
south of LOC_FOREST3 is LOC_FOREST1.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOREST4 ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_FOREST5 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_FOREST5 is LOC_FOREST7.
south of LOC_FOREST5 is LOC_FOREST6.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOREST6 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST6 is LOC_FOREST5.
west of LOC_FOREST6 is LOC_FOREST7.
north of LOC_FOREST6 is LOC_VALLEY.
south of LOC_FOREST6 is LOC_SLIT.

[ LOC_FOREST7 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST7 is LOC_FOREST5.
west of LOC_FOREST7 is LOC_FOREST6.
north of LOC_FOREST7 is LOC_GRATE.
south of LOC_FOREST7 is LOC_FOREST8.

[ LOC_FOREST8 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST8 is LOC_FOREST9.
west of LOC_FOREST8 is LOC_FOREST11.
north of LOC_FOREST8 is LOC_FOREST22.
south of LOC_FOREST8 is LOC_FOREST7.

[ LOC_FOREST9 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST9 is LOC_FOREST11.
west of LOC_FOREST9 is LOC_FOREST8.
north of LOC_FOREST9 is LOC_FOREST10.
south of LOC_FOREST9 is LOC_GRATE.

[ LOC_FOREST10 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST10 is LOC_SLIT.
west of LOC_FOREST10 is LOC_FOREST11.
north of LOC_FOREST10 is LOC_FOREST9.
south of LOC_FOREST10 is LOC_GRATE.

[ LOC_FOREST11 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST11 is LOC_FOREST10.
west of LOC_FOREST11 is LOC_FOREST8.
north of LOC_FOREST11 is LOC_FOREST22.
south of LOC_FOREST11 is LOC_FOREST9.

[ LOC_FOREST12 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST12 is LOC_FOREST13.
west of LOC_FOREST12 is LOC_FOREST14.
north of LOC_FOREST12 is LOC_FOREST22.
south of LOC_FOREST12 is LOC_VALLEY.

[ LOC_FOREST13 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST13 is LOC_FOREST1.
west of LOC_FOREST13 is LOC_FOREST12.
north of LOC_FOREST13 is LOC_FOREST20.
south of LOC_FOREST13 is LOC_HILL.

[ LOC_FOREST14 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST14 is LOC_ROADEND.
west of LOC_FOREST14 is LOC_FOREST16.
north of LOC_FOREST14 is LOC_FOREST15.
south of LOC_FOREST14 is LOC_FOREST12.

[ LOC_FOREST15 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST15 is LOC_FOREST16.
west of LOC_FOREST15 is LOC_FOREST22.
north of LOC_FOREST15 is LOC_ROADEND.
south of LOC_FOREST15 is LOC_FOREST14.

[ LOC_FOREST16 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_FOREST16 is LOC_FOREST14.
south of LOC_FOREST16 is LOC_FOREST15.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOREST17 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_FOREST17 is LOC_FOREST18.
north of LOC_FOREST17 is LOC_CLIFF.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOREST18 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST18 is LOC_FOREST19.
west of LOC_FOREST18 is LOC_FOREST17.
north of LOC_FOREST18 is LOC_FOREST2.
south of LOC_FOREST18 is LOC_FOREST21.

[ LOC_FOREST19 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST19 is LOC_FOREST2.
west of LOC_FOREST19 is LOC_FOREST18.
north of LOC_FOREST19 is LOC_CLIFF.
south of LOC_FOREST19 is LOC_FOREST20.

[ LOC_FOREST20 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST20 is LOC_HILL.
west of LOC_FOREST20 is LOC_FOREST21.
north of LOC_FOREST20 is LOC_FOREST19.
south of LOC_FOREST20 is LOC_FOREST13.

[ LOC_FOREST21 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST21 is LOC_FOREST20.
west of LOC_FOREST21 is LOC_ROADEND.
north of LOC_FOREST21 is LOC_FOREST18.
south of LOC_FOREST21 is LOC_FOREST21.

[ LOC_FOREST22 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST22 is LOC_FOREST8.
west of LOC_FOREST22 is LOC_FOREST11.
north of LOC_FOREST22 is LOC_FOREST15.
south of LOC_FOREST22 is LOC_FOREST12.

[ LOC_LEDGE ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_RESBOTTOM ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_RESBOTTOM is LOC_RESNORTH.
south of LOC_RESBOTTOM is LOC_RESERVOIR.

[ LOC_RESNORTH ]
[ action summary: speak=1, goto=2 ]
[ direct map (goto) rules ]
south of LOC_RESNORTH is LOC_RESBOTTOM.

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_TREACHEROUS ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_STEEP ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_CLIFFBASE ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_CLIFFACE ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
down of LOC_CLIFFACE is LOC_CLIFFBASE.
up of LOC_CLIFFACE is LOC_FOOTSLIP.

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOTSLIP ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_CLIFFTOP ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_CLIFFLEDGE ]
[ action summary: goto=2 ]

[ non-direct travel rules emitted to dispatch table: 2 ]
[ LOC_REACHDEAD ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_GRUESOME ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF1 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF2 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF3 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF4 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF5 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]
[ LOC_FOOF6 ]
[ action summary: goto=1 ]

[ non-direct travel rules emitted to dispatch table: 1 ]

[ Non-direct dispatch metadata table ]
Table of Generated Travel Non-Direct Rules
rule-id (number) source-loc (text) action-kind (text) travel-category (text) target (text) verbs (text) forced (truth state) condition-kind (text) condition-arg-1 (text) condition-arg-2 (text) random-chance (number) is-magic-word (truth state) requires-handwritten (truth state) handwritten-reason (text)
1 "LOC_START" "goto" "goto_non_direct" "LOC_HILL" "ROAD WEST UPWAR" false "none" "<none>" "<none>" 0 false false "<none>"
2 "LOC_START" "goto" "goto_non_direct" "LOC_BUILDING" "ENTER BUILD INWAR EAST" false "none" "<none>" "<none>" 0 false false "<none>"
3 "LOC_START" "goto" "goto_non_direct" "LOC_VALLEY" "DOWNS GULLY STREA SOUTH DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
4 "LOC_START" "goto" "goto_non_direct" "LOC_FOREST1" "FORES NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
5 "LOC_START" "goto" "goto_non_direct" "LOC_GRATE" "DEPRE" false "none" "<none>" "<none>" 0 false false "<none>"
6 "LOC_HILL" "goto" "goto_non_direct" "LOC_START" "BUILD EAST" false "none" "<none>" "<none>" 0 false false "<none>"
7 "LOC_HILL" "goto" "goto_non_direct" "LOC_FOREST13" "SOUTH FORES" false "none" "<none>" "<none>" 0 false false "<none>"
8 "LOC_HILL" "speak" "speak" "WHICH_WAY" "DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
9 "LOC_BUILDING" "goto" "goto_non_direct" "LOC_START" "OUT OUTDO WEST" false "none" "<none>" "<none>" 0 false false "<none>"
10 "LOC_BUILDING" "goto" "goto_magic_word" "LOC_FOOF1" "XYZZY" false "none" "<none>" "<none>" 0 true false "<none>"
11 "LOC_BUILDING" "goto" "goto_magic_word" "LOC_FOOF3" "PLUGH" false "none" "<none>" "<none>" 0 true false "<none>"
12 "LOC_BUILDING" "goto" "goto_non_direct" "LOC_SEWER" "DOWNS STREA" false "none" "<none>" "<none>" 0 false false "<none>"
13 "LOC_VALLEY" "goto" "goto_non_direct" "LOC_START" "UPSTR BUILD NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
14 "LOC_VALLEY" "goto" "goto_non_direct" "LOC_FOREST6" "EAST FORES" false "none" "<none>" "<none>" 0 false false "<none>"
15 "LOC_VALLEY" "goto" "goto_non_direct" "LOC_SLIT" "DOWNS SOUTH DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
16 "LOC_VALLEY" "goto" "goto_non_direct" "LOC_GRATE" "DEPRE" false "none" "<none>" "<none>" 0 false false "<none>"
17 "LOC_VALLEY" "speak" "speak" "UPSTREAM_DOWNSTREAM" "STREA" false "none" "<none>" "<none>" 0 false false "<none>"
18 "LOC_ROADEND" "goto" "goto_non_direct" "LOC_HILL" "ROAD EAST UPWAR" false "none" "<none>" "<none>" 0 false false "<none>"
19 "LOC_ROADEND" "goto" "goto_non_direct" "LOC_START" "BUILD" false "none" "<none>" "<none>" 0 false false "<none>"
20 "LOC_ROADEND" "goto" "goto_non_direct" "LOC_FOREST14" "SOUTH FORES" false "none" "<none>" "<none>" 0 false false "<none>"
21 "LOC_CLIFF" "goto" "goto_non_direct" "LOC_FOREST17" "SOUTH FORES" false "none" "<none>" "<none>" 0 false false "<none>"
22 "LOC_CLIFF" "goto" "goto_non_direct" "LOC_NOMAKE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
23 "LOC_SLIT" "goto" "goto_non_direct" "LOC_START" "BUILD" false "none" "<none>" "<none>" 0 false false "<none>"
24 "LOC_SLIT" "goto" "goto_non_direct" "LOC_VALLEY" "UPSTR NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
25 "LOC_SLIT" "goto" "goto_non_direct" "LOC_FOREST6" "EAST FORES" false "none" "<none>" "<none>" 0 false false "<none>"
26 "LOC_SLIT" "goto" "goto_non_direct" "LOC_GRATE" "DOWNS BED SOUTH DEPRE" false "none" "<none>" "<none>" 0 false false "<none>"
27 "LOC_SLIT" "speak" "speak" "DONT_FIT" "SLIT STREA DOWN INWAR ENTER" false "none" "<none>" "<none>" 0 false false "<none>"
28 "LOC_GRATE" "goto" "goto_non_direct" "LOC_FOREST7" "EAST FORES" false "none" "<none>" "<none>" 0 false false "<none>"
29 "LOC_GRATE" "goto" "goto_non_direct" "LOC_START" "BUILD" false "none" "<none>" "<none>" 0 false false "<none>"
30 "LOC_GRATE" "goto" "goto_non_direct" "LOC_SLIT" "UPSTR GULLY NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
31 "LOC_GRATE" "goto" "goto_conditional" "LOC_BELOWGRATE" "ENTER INWAR DOWN" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
32 "LOC_GRATE" "speak" "speak" "GRATE_NOWAY" "ENTER" false "none" "<none>" "<none>" 0 false false "<none>"
33 "LOC_BELOWGRATE" "goto" "goto_conditional" "LOC_GRATE" "OUT UPWAR" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
34 "LOC_BELOWGRATE" "goto" "goto_non_direct" "LOC_COBBLE" "CRAWL COBBL INWAR WEST" false "none" "<none>" "<none>" 0 false false "<none>"
35 "LOC_BELOWGRATE" "goto" "goto_non_direct" "LOC_PITTOP" "PIT" false "none" "<none>" "<none>" 0 false false "<none>"
36 "LOC_BELOWGRATE" "goto" "goto_non_direct" "LOC_DEBRIS" "DEBRI" false "none" "<none>" "<none>" 0 false false "<none>"
37 "LOC_BELOWGRATE" "speak" "speak" "GRATE_NOWAY" "OUT" false "none" "<none>" "<none>" 0 false false "<none>"
38 "LOC_COBBLE" "goto" "goto_non_direct" "LOC_BELOWGRATE" "OUT SURFA EAST" false "none" "<none>" "<none>" 0 false false "<none>"
39 "LOC_COBBLE" "goto" "goto_non_direct" "LOC_DEBRIS" "INWAR DARK WEST DEBRI" false "none" "<none>" "<none>" 0 false false "<none>"
40 "LOC_COBBLE" "goto" "goto_non_direct" "LOC_PITTOP" "PIT" false "none" "<none>" "<none>" 0 false false "<none>"
41 "LOC_DEBRIS" "goto" "goto_conditional" "LOC_GRATE" "DEPRE" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
42 "LOC_DEBRIS" "goto" "goto_non_direct" "LOC_BELOWGRATE" "ENTRA" false "none" "<none>" "<none>" 0 false false "<none>"
43 "LOC_DEBRIS" "goto" "goto_non_direct" "LOC_COBBLE" "CRAWL COBBL PASSA LOW EAST" false "none" "<none>" "<none>" 0 false false "<none>"
44 "LOC_DEBRIS" "goto" "goto_non_direct" "LOC_AWKWARD" "CANYO INWAR UPWAR WEST" false "none" "<none>" "<none>" 0 false false "<none>"
45 "LOC_DEBRIS" "goto" "goto_magic_word" "LOC_FOOF2" "XYZZY" false "none" "<none>" "<none>" 0 true false "<none>"
46 "LOC_DEBRIS" "goto" "goto_non_direct" "LOC_PITTOP" "PIT" false "none" "<none>" "<none>" 0 false false "<none>"
47 "LOC_AWKWARD" "goto" "goto_conditional" "LOC_GRATE" "DEPRE" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
48 "LOC_AWKWARD" "goto" "goto_non_direct" "LOC_BELOWGRATE" "ENTRA" false "none" "<none>" "<none>" 0 false false "<none>"
49 "LOC_AWKWARD" "goto" "goto_non_direct" "LOC_DEBRIS" "DOWN EAST DEBRI" false "none" "<none>" "<none>" 0 false false "<none>"
50 "LOC_AWKWARD" "goto" "goto_non_direct" "LOC_BIRDCHAMBER" "INWAR UPWAR WEST" false "none" "<none>" "<none>" 0 false false "<none>"
51 "LOC_AWKWARD" "goto" "goto_non_direct" "LOC_PITTOP" "PIT" false "none" "<none>" "<none>" 0 false false "<none>"
52 "LOC_BIRDCHAMBER" "goto" "goto_conditional" "LOC_GRATE" "DEPRE" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
53 "LOC_BIRDCHAMBER" "goto" "goto_non_direct" "LOC_BELOWGRATE" "ENTRA" false "none" "<none>" "<none>" 0 false false "<none>"
54 "LOC_BIRDCHAMBER" "goto" "goto_non_direct" "LOC_DEBRIS" "DEBRI" false "none" "<none>" "<none>" 0 false false "<none>"
55 "LOC_BIRDCHAMBER" "goto" "goto_non_direct" "LOC_AWKWARD" "CANYO EAST" false "none" "<none>" "<none>" 0 false false "<none>"
56 "LOC_BIRDCHAMBER" "goto" "goto_non_direct" "LOC_PITTOP" "PASSA PIT WEST" false "none" "<none>" "<none>" 0 false false "<none>"
57 "LOC_PITTOP" "goto" "goto_conditional" "LOC_GRATE" "DEPRE" false "not" "GRATE" "GRATE_CLOSED" 0 false false "<none>"
58 "LOC_PITTOP" "goto" "goto_non_direct" "LOC_BELOWGRATE" "ENTRA" false "none" "<none>" "<none>" 0 false false "<none>"
59 "LOC_PITTOP" "goto" "goto_non_direct" "LOC_DEBRIS" "DEBRI" false "none" "<none>" "<none>" 0 false false "<none>"
60 "LOC_PITTOP" "goto" "goto_non_direct" "LOC_BIRDCHAMBER" "PASSA EAST" false "none" "<none>" "<none>" 0 false false "<none>"
61 "LOC_PITTOP" "goto" "goto_conditional" "LOC_NECKBROKE" "DOWN PIT STEPS" false "carry" "NUGGET" "<none>" 0 false false "<none>"
62 "LOC_PITTOP" "goto" "goto_non_direct" "LOC_CRACK" "CRACK WEST" false "none" "<none>" "<none>" 0 false false "<none>"
63 "LOC_MISTHALL" "goto" "goto_non_direct" "LOC_NUGGET" "LEFT SOUTH" false "none" "<none>" "<none>" 0 false false "<none>"
64 "LOC_MISTHALL" "goto" "goto_non_direct" "LOC_EASTBANK" "FORWA HALL WEST" false "none" "<none>" "<none>" 0 false false "<none>"
65 "LOC_MISTHALL" "goto" "goto_non_direct" "LOC_KINGHALL" "STAIR DOWN NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
66 "LOC_MISTHALL" "goto" "goto_conditional" "LOC_DOME" "UPWAR PIT STEPS DOME PASSA EAST" false "carry" "NUGGET" "<none>" 0 false false "<none>"
67 "LOC_MISTHALL" "goto" "goto_non_direct" "LOC_JUMBLE" "Y2" false "none" "<none>" "<none>" 0 false false "<none>"
68 "LOC_CRACK" "goto" "goto_forced" "LOC_PITTOP" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
69 "LOC_EASTBANK" "goto" "goto_non_direct" "LOC_MISTHALL" "HALL EAST" false "none" "<none>" "<none>" 0 false false "<none>"
70 "LOC_EASTBANK" "goto" "goto_conditional" "LOC_NOMAKE" "FORWA" false "not" "FISSURE" "BRIDGED" 0 false false "<none>"
71 "LOC_EASTBANK" "goto" "goto_non_direct" "LOC_WESTBANK" "OVER" false "none" "<none>" "<none>" 0 false false "<none>"
72 "LOC_EASTBANK" "speak" "speak_conditional" "CROSS_BRIDGE" "JUMP" false "not" "FISSURE" "UNBRIDGED" 0 false false "<none>"
73 "LOC_EASTBANK" "speak" "speak_conditional" "NO_CROSS" "OVER ACROS WEST CROSS" false "not" "FISSURE" "BRIDGED" 0 false false "<none>"
74 "LOC_NUGGET" "goto" "goto_non_direct" "LOC_MISTHALL" "HALL OUT NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
75 "LOC_KINGHALL" "goto" "goto_non_direct" "LOC_MISTHALL" "STAIR UPWAR EAST" false "none" "<none>" "<none>" 0 false false "<none>"
76 "LOC_KINGHALL" "goto" "goto_conditional" "LOC_FLOORHOLE" "NORTH RIGHT" false "not" "SNAKE" "SNAKE_BLOCKS" 0 false false "<none>"
77 "LOC_KINGHALL" "goto" "goto_conditional" "LOC_SOUTHSIDE" "SOUTH LEFT" false "not" "SNAKE" "SNAKE_BLOCKS" 0 false false "<none>"
78 "LOC_KINGHALL" "goto" "goto_conditional" "LOC_WESTSIDE" "WEST FORWA" false "not" "SNAKE" "SNAKE_BLOCKS" 0 false false "<none>"
79 "LOC_KINGHALL" "goto" "goto_random" "LOC_SECRET3" "SW" false "pct" "35" "<none>" 35 false false "<none>"
80 "LOC_KINGHALL" "goto" "goto_conditional" "LOC_SNAKEBLOCK" "SW" false "with" "SNAKE" "<none>" 0 false false "<none>"
81 "LOC_KINGHALL" "goto" "goto_non_direct" "LOC_SECRET3" "SECRE" false "none" "<none>" "<none>" 0 false false "<none>"
82 "LOC_NECKBROKE" "goto" "goto_forced" "LOC_NOWHERE" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
83 "LOC_NOMAKE" "goto" "goto_forced" "LOC_NOWHERE" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
84 "LOC_DOME" "goto" "goto_forced" "LOC_MISTHALL" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
85 "LOC_WESTEND" "goto" "goto_non_direct" "LOC_EASTEND" "EAST ACROS" false "none" "<none>" "<none>" 0 false false "<none>"
86 "LOC_WESTEND" "goto" "goto_non_direct" "LOC_SLAB" "WEST SLAB" false "none" "<none>" "<none>" 0 false false "<none>"
87 "LOC_WESTEND" "goto" "goto_non_direct" "LOC_WESTPIT" "DOWN PIT" false "none" "<none>" "<none>" 0 false false "<none>"
88 "LOC_WESTEND" "speak" "speak" "TOO_FAR" "HOLE" false "none" "<none>" "<none>" 0 false false "<none>"
89 "LOC_EASTPIT" "goto" "goto_non_direct" "LOC_EASTEND" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
90 "LOC_WESTPIT" "goto" "goto_non_direct" "LOC_WESTEND" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
91 "LOC_WESTPIT" "goto" "goto_conditional" "LOC_BUILDING1" "CLIMB" false "not" "PLANT" "PLANT_GROWN" 0 false false "<none>"
92 "LOC_WESTPIT" "goto" "goto_non_direct" "LOC_CLIMBSTALK" "CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
93 "LOC_CLIMBSTALK" "goto" "goto_forced" "LOC_NARROW" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
94 "LOC_WESTBANK" "goto" "goto_conditional" "LOC_NOMAKE" "FORWA" false "not" "FISSURE" "BRIDGED" 0 false false "<none>"
95 "LOC_WESTBANK" "goto" "goto_non_direct" "LOC_EASTBANK" "OVER" false "none" "<none>" "<none>" 0 false false "<none>"
96 "LOC_WESTBANK" "speak" "speak_conditional" "CROSS_BRIDGE" "JUMP" false "not" "FISSURE" "UNBRIDGED" 0 false false "<none>"
97 "LOC_WESTBANK" "speak" "speak_conditional" "NO_CROSS" "OVER ACROS EAST CROSS" false "not" "FISSURE" "BRIDGED" 0 false false "<none>"
98 "LOC_FLOORHOLE" "goto" "goto_non_direct" "LOC_KINGHALL" "HALL OUT SOUTH" false "none" "<none>" "<none>" 0 false false "<none>"
99 "LOC_FLOORHOLE" "goto" "goto_non_direct" "LOC_Y2" "NORTH Y2" false "none" "<none>" "<none>" 0 false false "<none>"
100 "LOC_FLOORHOLE" "goto" "goto_non_direct" "LOC_BROKEN" "DOWN HOLE" false "none" "<none>" "<none>" 0 false false "<none>"
101 "LOC_SOUTHSIDE" "goto" "goto_non_direct" "LOC_KINGHALL" "HALL OUT NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
102 "LOC_WESTSIDE" "goto" "goto_non_direct" "LOC_KINGHALL" "HALL OUT EAST" false "none" "<none>" "<none>" 0 false false "<none>"
103 "LOC_WESTSIDE" "goto" "goto_non_direct" "LOC_CROSSOVER" "WEST UPWAR" false "none" "<none>" "<none>" 0 false false "<none>"
104 "LOC_BUILDING1" "goto" "goto_forced" "LOC_NOCLIMB" "<forced>" true "not" "PLANT" "PLANT_BELLOWING" 0 false false "<none>"
105 "LOC_BUILDING1" "goto" "goto_forced" "LOC_PLANTTOP" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
106 "LOC_SNAKEBLOCK" "goto" "goto_forced" "LOC_KINGHALL" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
107 "LOC_Y2" "goto" "goto_magic_word" "LOC_FOOF4" "PLUGH" false "none" "<none>" "<none>" 0 true false "<none>"
108 "LOC_Y2" "goto" "goto_non_direct" "LOC_JUMBLE" "EAST WALL BROKE" false "none" "<none>" "<none>" 0 false false "<none>"
109 "LOC_Y2" "goto" "goto_non_direct" "LOC_FOOF5" "PLOVE" false "none" "<none>" "<none>" 0 false false "<none>"
110 "LOC_Y2" "special" "special_conditional" "2" "PLOVE" false "carry" "EMERALD" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
111 "LOC_JUMBLE" "goto" "goto_non_direct" "LOC_Y2" "DOWN Y2" false "none" "<none>" "<none>" 0 false false "<none>"
112 "LOC_WINDOW1" "goto" "goto_non_direct" "LOC_Y2" "EAST Y2" false "none" "<none>" "<none>" 0 false false "<none>"
113 "LOC_WINDOW1" "goto" "goto_non_direct" "LOC_NECKBROKE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
114 "LOC_BROKEN" "goto" "goto_non_direct" "LOC_SMALLPITBRINK" "EAST CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
115 "LOC_BROKEN" "goto" "goto_non_direct" "LOC_FLOORHOLE" "UPWAR HOLE" false "none" "<none>" "<none>" 0 false false "<none>"
116 "LOC_BROKEN" "goto" "goto_non_direct" "LOC_BEDQUILT" "BEDQU" false "none" "<none>" "<none>" 0 false false "<none>"
117 "LOC_SMALLPITBRINK" "goto" "goto_non_direct" "LOC_BROKEN" "WEST CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
118 "LOC_SMALLPITBRINK" "goto" "goto_non_direct" "LOC_SMALLPIT" "DOWN PIT CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
119 "LOC_SMALLPIT" "goto" "goto_non_direct" "LOC_SMALLPITBRINK" "CLIMB UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
120 "LOC_SMALLPIT" "speak" "speak" "DONT_FIT" "SLIT STREA DOWN UPSTR DOWNS ENTER INWAR" false "none" "<none>" "<none>" 0 false false "<none>"
121 "LOC_DUSTY" "goto" "goto_non_direct" "LOC_BROKEN" "EAST PASSA" false "none" "<none>" "<none>" 0 false false "<none>"
122 "LOC_DUSTY" "goto" "goto_non_direct" "LOC_COMPLEX" "DOWN HOLE FLOOR" false "none" "<none>" "<none>" 0 false false "<none>"
123 "LOC_DUSTY" "goto" "goto_non_direct" "LOC_BEDQUILT" "BEDQU" false "none" "<none>" "<none>" 0 false false "<none>"
124 "LOC_PARALLEL1" "goto" "goto_forced" "LOC_MISTWEST" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
125 "LOC_MISTWEST" "goto" "goto_non_direct" "LOC_ALIKE1" "SOUTH UPWAR PASSA CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
126 "LOC_MISTWEST" "goto" "goto_non_direct" "LOC_LONGEAST" "WEST CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
127 "LOC_ALIKE4" "goto" "goto_non_direct" "LOC_ALIKE14" "UPWAR DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
128 "LOC_MAZEEND1" "goto" "goto_non_direct" "LOC_ALIKE4" "WEST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
129 "LOC_MAZEEND2" "goto" "goto_non_direct" "LOC_ALIKE4" "EAST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
130 "LOC_MAZEEND3" "goto" "goto_non_direct" "LOC_ALIKE3" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
131 "LOC_MAZEEND4" "goto" "goto_non_direct" "LOC_ALIKE9" "WEST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
132 "LOC_MAZEEND5" "goto" "goto_non_direct" "LOC_ALIKE10" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
133 "LOC_PITBRINK" "goto" "goto_non_direct" "LOC_BIRDCHAMBER" "DOWN CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
134 "LOC_MAZEEND6" "goto" "goto_non_direct" "LOC_PITBRINK" "EAST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
135 "LOC_PARALLEL2" "goto" "goto_forced" "LOC_WESTBANK" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
136 "LOC_LONGEAST" "goto" "goto_non_direct" "LOC_MISTWEST" "EAST UPWAR CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
137 "LOC_LONGEAST" "goto" "goto_non_direct" "LOC_CROSSOVER" "NORTH DOWN HOLE" false "none" "<none>" "<none>" 0 false false "<none>"
138 "LOC_LONGWEST" "goto" "goto_conditional" "LOC_DIFFERENT1" "SOUTH" false "nodwarves" "<none>" "<none>" 0 false true "dwarf-avoidance predicate is implemented in hand-written dwarf logic"
139 "LOC_DEADEND7" "goto" "goto_non_direct" "LOC_CROSSOVER" "SOUTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
140 "LOC_COMPLEX" "goto" "goto_non_direct" "LOC_DUSTY" "UPWAR CLIMB ROOM" false "none" "<none>" "<none>" 0 false false "<none>"
141 "LOC_COMPLEX" "goto" "goto_non_direct" "LOC_BEDQUILT" "WEST BEDQU" false "none" "<none>" "<none>" 0 false false "<none>"
142 "LOC_COMPLEX" "goto" "goto_non_direct" "LOC_SHELLROOM" "NORTH SHELL" false "none" "<none>" "<none>" 0 false false "<none>"
143 "LOC_BEDQUILT" "goto" "goto_non_direct" "LOC_SLAB" "SLAB" false "none" "<none>" "<none>" 0 false false "<none>"
144 "LOC_BEDQUILT" "goto" "goto_random" "LOC_SECRET2" "UPWAR" false "pct" "70" "<none>" 70 false false "<none>"
145 "LOC_BEDQUILT" "goto" "goto_random" "LOC_LOWROOM" "NORTH" false "pct" "75" "<none>" 75 false false "<none>"
146 "LOC_BEDQUILT" "speak" "speak_conditional" "FUTILE_CRAWL" "SOUTH" false "pct" "65" "<none>" 0 false false "<none>"
147 "LOC_BEDQUILT" "speak" "speak_conditional" "FUTILE_CRAWL" "UPWAR" false "pct" "60" "<none>" 0 false false "<none>"
148 "LOC_BEDQUILT" "speak" "speak_conditional" "FUTILE_CRAWL" "NORTH" false "pct" "50" "<none>" 0 false false "<none>"
149 "LOC_BEDQUILT" "speak" "speak_conditional" "FUTILE_CRAWL" "DOWN" false "pct" "65" "<none>" 0 false false "<none>"
150 "LOC_SWISSCHEESE" "goto" "goto_non_direct" "LOC_TALL" "CANYO" false "none" "<none>" "<none>" 0 false false "<none>"
151 "LOC_SWISSCHEESE" "goto" "goto_non_direct" "LOC_ORIENTAL" "ORIEN" false "none" "<none>" "<none>" 0 false false "<none>"
152 "LOC_SWISSCHEESE" "speak" "speak_conditional" "FUTILE_CRAWL" "SOUTH" false "pct" "80" "<none>" 0 false false "<none>"
153 "LOC_SWISSCHEESE" "speak" "speak_conditional" "FUTILE_CRAWL" "NW" false "pct" "50" "<none>" 0 false false "<none>"
154 "LOC_EASTEND" "goto" "goto_non_direct" "LOC_WESTEND" "WEST ACROS" false "none" "<none>" "<none>" 0 false false "<none>"
155 "LOC_EASTEND" "goto" "goto_non_direct" "LOC_EASTPIT" "DOWN PIT" false "none" "<none>" "<none>" 0 false false "<none>"
156 "LOC_SLAB" "goto" "goto_non_direct" "LOC_SECRET1" "UPWAR CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
157 "LOC_SECRET1" "goto" "goto_non_direct" "LOC_SLAB" "DOWN SLAB" false "none" "<none>" "<none>" 0 false false "<none>"
158 "LOC_SECRET1" "goto" "goto_conditional" "LOC_SECRET5" "SOUTH" false "not" "DRAGON" "DRAGON_BARS" 0 false false "<none>"
159 "LOC_SECRET1" "goto" "goto_non_direct" "LOC_RESERVOIR" "RESER" false "none" "<none>" "<none>" 0 false false "<none>"
160 "LOC_SECRET2" "goto" "goto_non_direct" "LOC_BEDQUILT" "DOWN PASSA" false "none" "<none>" "<none>" 0 false false "<none>"
161 "LOC_LOWROOM" "goto" "goto_non_direct" "LOC_BEDQUILT" "BEDQU" false "none" "<none>" "<none>" 0 false false "<none>"
162 "LOC_LOWROOM" "goto" "goto_non_direct" "LOC_ORIENTAL" "SE ORIEN" false "none" "<none>" "<none>" 0 false false "<none>"
163 "LOC_DEADCRAWL" "goto" "goto_non_direct" "LOC_LOWROOM" "SOUTH CRAWL OUT" false "none" "<none>" "<none>" 0 false false "<none>"
164 "LOC_SECRET3" "goto" "goto_conditional" "LOC_SECRET5" "WEST" false "not" "DRAGON" "DRAGON_BARS" 0 false false "<none>"
165 "LOC_TALL" "goto" "goto_non_direct" "LOC_SWISSCHEESE" "NORTH CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
166 "LOC_SEWER" "goto" "goto_forced" "LOC_BUILDING" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
167 "LOC_MAZEEND8" "goto" "goto_non_direct" "LOC_ALIKE11" "WEST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
168 "LOC_MAZEEND9" "goto" "goto_non_direct" "LOC_ALIKE3" "SOUTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
169 "LOC_MAZEEND10" "goto" "goto_non_direct" "LOC_ALIKE12" "EAST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
170 "LOC_MAZEEND11" "goto" "goto_non_direct" "LOC_ALIKE8" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
171 "LOC_ALIKE14" "goto" "goto_non_direct" "LOC_ALIKE4" "UPWAR DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
172 "LOC_NARROW" "goto" "goto_non_direct" "LOC_WESTPIT" "DOWN CLIMB EAST" false "none" "<none>" "<none>" 0 false false "<none>"
173 "LOC_NARROW" "goto" "goto_non_direct" "LOC_NECKBROKE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
174 "LOC_NARROW" "goto" "goto_non_direct" "LOC_GIANTROOM" "WEST GIANT" false "none" "<none>" "<none>" 0 false false "<none>"
175 "LOC_NOCLIMB" "goto" "goto_forced" "LOC_WESTPIT" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
176 "LOC_PLANTTOP" "goto" "goto_forced" "LOC_WESTEND" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
177 "LOC_INCLINE" "goto" "goto_non_direct" "LOC_WATERFALL" "NORTH CAVER PASSA" false "none" "<none>" "<none>" 0 false false "<none>"
178 "LOC_INCLINE" "goto" "goto_non_direct" "LOC_LOWROOM" "DOWN CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
179 "LOC_CAVEIN" "goto" "goto_non_direct" "LOC_GIANTROOM" "SOUTH GIANT OUT" false "none" "<none>" "<none>" 0 false false "<none>"
180 "LOC_IMMENSE" "goto" "goto_non_direct" "LOC_GIANTROOM" "SOUTH GIANT PASSA" false "none" "<none>" "<none>" 0 false false "<none>"
181 "LOC_IMMENSE" "goto" "goto_conditional" "LOC_WATERFALL" "NORTH ENTER CAVER" false "not" "DOOR" "DOOR_RUSTED" 0 false false "<none>"
182 "LOC_IMMENSE" "speak" "speak" "RUSTY_DOOR" "NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
183 "LOC_WATERFALL" "goto" "goto_non_direct" "LOC_IMMENSE" "SOUTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
184 "LOC_WATERFALL" "goto" "goto_non_direct" "LOC_GIANTROOM" "GIANT" false "none" "<none>" "<none>" 0 false false "<none>"
185 "LOC_SOFTROOM" "goto" "goto_non_direct" "LOC_SWISSCHEESE" "WEST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
186 "LOC_ORIENTAL" "goto" "goto_non_direct" "LOC_LOWROOM" "WEST CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
187 "LOC_ORIENTAL" "goto" "goto_non_direct" "LOC_MISTY" "UPWAR NORTH CAVER" false "none" "<none>" "<none>" 0 false false "<none>"
188 "LOC_MISTY" "goto" "goto_non_direct" "LOC_ORIENTAL" "SOUTH ORIEN" false "none" "<none>" "<none>" 0 false false "<none>"
189 "LOC_ALCOVE" "goto" "goto_non_direct" "LOC_MISTY" "NW CAVER" false "none" "<none>" "<none>" 0 false false "<none>"
190 "LOC_ALCOVE" "special" "special" "1" "EAST PASSA" false "none" "<none>" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
191 "LOC_PLOVER" "goto" "goto_non_direct" "LOC_FOOF6" "PLOVE" false "none" "<none>" "<none>" 0 false false "<none>"
192 "LOC_PLOVER" "goto" "goto_non_direct" "LOC_DARKROOM" "NE DARK" false "none" "<none>" "<none>" 0 false false "<none>"
193 "LOC_PLOVER" "special" "special" "1" "WEST PASSA OUT" false "none" "<none>" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
194 "LOC_PLOVER" "special" "special_conditional" "2" "PLOVE" false "carry" "EMERALD" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
195 "LOC_DARKROOM" "goto" "goto_non_direct" "LOC_PLOVER" "SOUTH PLOVE OUT" false "none" "<none>" "<none>" 0 false false "<none>"
196 "LOC_ARCHED" "goto" "goto_non_direct" "LOC_SHELLROOM" "DOWN SHELL OUT" false "none" "<none>" "<none>" 0 false false "<none>"
197 "LOC_SHELLROOM" "goto" "goto_non_direct" "LOC_ARCHED" "UPWAR HALL" false "none" "<none>" "<none>" 0 false false "<none>"
198 "LOC_SHELLROOM" "speak" "speak_conditional" "CLAM_BLOCKER" "SOUTH" false "carry" "CLAM" "<none>" 0 false false "<none>"
199 "LOC_SHELLROOM" "speak" "speak_conditional" "OYSTER_BLOCKER" "SOUTH" false "carry" "OYSTER" "<none>" 0 false false "<none>"
200 "LOC_SLOPING1" "goto" "goto_non_direct" "LOC_SHELLROOM" "UPWAR SHELL" false "none" "<none>" "<none>" 0 false false "<none>"
201 "LOC_CULDESAC" "goto" "goto_non_direct" "LOC_SLOPING1" "UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
202 "LOC_CULDESAC" "goto" "goto_non_direct" "LOC_SHELLROOM" "SHELL" false "none" "<none>" "<none>" 0 false false "<none>"
203 "LOC_WITTSEND" "speak" "speak_conditional" "FUTILE_CRAWL" "EAST NORTH SOUTH NE SE SW NW UPWAR DOWN" false "pct" "95" "<none>" 0 false false "<none>"
204 "LOC_WITTSEND" "speak" "speak" "WAY_BLOCKED" "WEST" false "none" "<none>" "<none>" 0 false false "<none>"
205 "LOC_MIRRORCANYON" "goto" "goto_non_direct" "LOC_RESERVOIR" "NORTH RESER" false "none" "<none>" "<none>" 0 false false "<none>"
206 "LOC_WINDOW2" "goto" "goto_non_direct" "LOC_NECKBROKE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
207 "LOC_TOPSTALACTITE" "goto" "goto_random" "LOC_ALIKE6" "DOWN JUMP CLIMB" false "pct" "40" "<none>" 40 false false "<none>"
208 "LOC_TOPSTALACTITE" "goto" "goto_random" "LOC_ALIKE9" "DOWN" false "pct" "50" "<none>" 50 false false "<none>"
209 "LOC_RESERVOIR" "goto" "goto_non_direct" "LOC_MIRRORCANYON" "SOUTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
210 "LOC_RESERVOIR" "speak" "speak_conditional" "BAD_DIRECTION" "NORTH ACROS CROSS" false "not" "RESER" "WATERS_PARTED" 0 false false "<none>"
211 "LOC_SW" "speak" "speak" "GRATE_NOWAY" "DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
212 "LOC_SWCHASM" "goto" "goto_conditional" "LOC_NOMAKE" "JUMP" false "not" "CHASM" "TROLL_BRIDGE" 0 false false "<none>"
213 "LOC_SWCHASM" "speak" "speak_conditional" "TROLL_BLOCKS" "OVER ACROS CROSS NE" false "with" "TROLL" "<none>" 0 false false "<none>"
214 "LOC_SWCHASM" "speak" "speak_conditional" "BRIDGE_GONE" "OVER" false "not" "CHASM" "TROLL_BRIDGE" 0 false false "<none>"
215 "LOC_SWCHASM" "speak" "speak" "CROSS_BRIDGE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
216 "LOC_SWCHASM" "special" "special" "3" "OVER" false "none" "<none>" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
217 "LOC_SECRET4" "goto" "goto_non_direct" "LOC_SECRET1" "NORTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
218 "LOC_SECRET4" "speak" "speak" "NASTY_DRAGON" "EAST FORWA" false "none" "<none>" "<none>" 0 false false "<none>"
219 "LOC_SECRET6" "goto" "goto_non_direct" "LOC_SECRET3" "EAST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
220 "LOC_SECRET6" "speak" "speak" "NASTY_DRAGON" "NORTH FORWA" false "none" "<none>" "<none>" 0 false false "<none>"
221 "LOC_NECHASM" "goto" "goto_non_direct" "LOC_FORK" "FORK" false "none" "<none>" "<none>" 0 false false "<none>"
222 "LOC_NECHASM" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
223 "LOC_NECHASM" "goto" "goto_non_direct" "LOC_BARRENFRONT" "BARRE" false "none" "<none>" "<none>" 0 false false "<none>"
224 "LOC_NECHASM" "speak" "speak_conditional" "TROLL_BLOCKS" "OVER ACROS CROSS SW" false "with" "TROLL" "<none>" 0 false false "<none>"
225 "LOC_NECHASM" "speak" "speak" "CROSS_BRIDGE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
226 "LOC_NECHASM" "special" "special" "3" "OVER" false "none" "<none>" "<none>" 0 false true "special travel token requires hand-authored special-case movement logic"
227 "LOC_CORRIDOR" "goto" "goto_non_direct" "LOC_FORK" "EAST FORK" false "none" "<none>" "<none>" 0 false false "<none>"
228 "LOC_CORRIDOR" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
229 "LOC_CORRIDOR" "goto" "goto_non_direct" "LOC_BARRENFRONT" "BARRE" false "none" "<none>" "<none>" 0 false false "<none>"
230 "LOC_FORK" "goto" "goto_non_direct" "LOC_WARMWALLS" "NE LEFT" false "none" "<none>" "<none>" 0 false false "<none>"
231 "LOC_FORK" "goto" "goto_non_direct" "LOC_LIMESTONE" "SE RIGHT DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
232 "LOC_FORK" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
233 "LOC_FORK" "goto" "goto_non_direct" "LOC_BARRENFRONT" "BARRE" false "none" "<none>" "<none>" 0 false false "<none>"
234 "LOC_WARMWALLS" "goto" "goto_non_direct" "LOC_FORK" "SOUTH FORK" false "none" "<none>" "<none>" 0 false false "<none>"
235 "LOC_WARMWALLS" "goto" "goto_non_direct" "LOC_BREATHTAKING" "NORTH VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
236 "LOC_WARMWALLS" "goto" "goto_non_direct" "LOC_BOULDERS2" "EAST CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
237 "LOC_BREATHTAKING" "goto" "goto_non_direct" "LOC_WARMWALLS" "SOUTH PASSA OUT" false "none" "<none>" "<none>" 0 false false "<none>"
238 "LOC_BREATHTAKING" "goto" "goto_non_direct" "LOC_FORK" "FORK" false "none" "<none>" "<none>" 0 false false "<none>"
239 "LOC_BREATHTAKING" "goto" "goto_non_direct" "LOC_GRUESOME" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
240 "LOC_BREATHTAKING" "speak" "speak" "RIDICULOUS_ATTEMPT" "DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
241 "LOC_BOULDERS2" "goto" "goto_non_direct" "LOC_WARMWALLS" "WEST OUT CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
242 "LOC_BOULDERS2" "goto" "goto_non_direct" "LOC_FORK" "FORK" false "none" "<none>" "<none>" 0 false false "<none>"
243 "LOC_BOULDERS2" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
244 "LOC_LIMESTONE" "goto" "goto_non_direct" "LOC_FORK" "NORTH UPWAR FORK" false "none" "<none>" "<none>" 0 false false "<none>"
245 "LOC_LIMESTONE" "goto" "goto_non_direct" "LOC_BARRENFRONT" "SOUTH DOWN BARRE" false "none" "<none>" "<none>" 0 false false "<none>"
246 "LOC_LIMESTONE" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
247 "LOC_BARRENFRONT" "goto" "goto_non_direct" "LOC_LIMESTONE" "WEST UPWAR" false "none" "<none>" "<none>" 0 false false "<none>"
248 "LOC_BARRENFRONT" "goto" "goto_non_direct" "LOC_FORK" "FORK" false "none" "<none>" "<none>" 0 false false "<none>"
249 "LOC_BARRENFRONT" "goto" "goto_non_direct" "LOC_BARRENROOM" "EAST INWAR BARRE ENTER" false "none" "<none>" "<none>" 0 false false "<none>"
250 "LOC_BARRENFRONT" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
251 "LOC_BARRENROOM" "goto" "goto_non_direct" "LOC_BARRENFRONT" "WEST OUT" false "none" "<none>" "<none>" 0 false false "<none>"
252 "LOC_BARRENROOM" "goto" "goto_non_direct" "LOC_FORK" "FORK" false "none" "<none>" "<none>" 0 false false "<none>"
253 "LOC_BARRENROOM" "goto" "goto_non_direct" "LOC_BREATHTAKING" "VIEW" false "none" "<none>" "<none>" 0 false false "<none>"
254 "LOC_DEADEND13" "goto" "goto_non_direct" "LOC_DIFFERENT2" "NORTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
255 "LOC_DEADEND13" "goto" "goto_conditional" "LOC_ROUGHHEWN" "SOUTH" false "not" "VEND" "VEND_BLOCKS" 0 false false "<none>"
256 "LOC_BADDIRECTION" "goto" "goto_forced" "LOC_DEADEND13" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
257 "LOC_LARGE" "speak" "speak_conditional" "OGRE_SNARL" "NORTH" false "with" "OGRE" "<none>" 0 false false "<none>"
258 "LOC_STOREROOM" "goto" "goto_non_direct" "LOC_LARGE" "SOUTH OUT" false "none" "<none>" "<none>" 0 false false "<none>"
259 "LOC_FOREST3" "goto" "goto_non_direct" "LOC_FOREST4" "EAST WEST" false "none" "<none>" "<none>" 0 false false "<none>"
260 "LOC_FOREST4" "goto" "goto_non_direct" "LOC_FOREST3" "EAST NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
261 "LOC_FOREST4" "goto" "goto_non_direct" "LOC_FOREST5" "WEST SOUTH" false "none" "<none>" "<none>" 0 false false "<none>"
262 "LOC_FOREST5" "goto" "goto_non_direct" "LOC_FOREST4" "EAST NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
263 "LOC_FOREST16" "goto" "goto_non_direct" "LOC_FOREST17" "EAST NORTH" false "none" "<none>" "<none>" 0 false false "<none>"
264 "LOC_FOREST17" "goto" "goto_non_direct" "LOC_FOREST16" "WEST SOUTH" false "none" "<none>" "<none>" 0 false false "<none>"
265 "LOC_LEDGE" "goto" "goto_non_direct" "LOC_NOMAKE" "JUMP" false "none" "<none>" "<none>" 0 false false "<none>"
266 "LOC_RESNORTH" "goto" "goto_non_direct" "LOC_TREACHEROUS" "NW UPWAR OUT" false "none" "<none>" "<none>" 0 false false "<none>"
267 "LOC_RESNORTH" "speak" "speak_conditional" "BAD_DIRECTION" "SOUTH ACROS CROSS" false "not" "RESER" "WATERS_PARTED" 0 false false "<none>"
268 "LOC_TREACHEROUS" "goto" "goto_non_direct" "LOC_STEEP" "UPWAR NW" false "none" "<none>" "<none>" 0 false false "<none>"
269 "LOC_TREACHEROUS" "goto" "goto_non_direct" "LOC_RESNORTH" "DOWN SE" false "none" "<none>" "<none>" 0 false false "<none>"
270 "LOC_STEEP" "goto" "goto_non_direct" "LOC_TREACHEROUS" "DOWN SE" false "none" "<none>" "<none>" 0 false false "<none>"
271 "LOC_STEEP" "goto" "goto_non_direct" "LOC_CLIFFBASE" "UPWAR NW" false "none" "<none>" "<none>" 0 false false "<none>"
272 "LOC_CLIFFBASE" "goto" "goto_non_direct" "LOC_STEEP" "DOWN SE" false "none" "<none>" "<none>" 0 false false "<none>"
273 "LOC_CLIFFBASE" "goto" "goto_non_direct" "LOC_CLIFFACE" "UPWAR CLIMB" false "none" "<none>" "<none>" 0 false false "<none>"
274 "LOC_CLIFFACE" "goto" "goto_conditional" "LOC_CLIFFTOP" "UPWAR" false "carry" "RABBITFOOT" "<none>" 0 false false "<none>"
275 "LOC_FOOTSLIP" "goto" "goto_forced" "LOC_NOWHERE" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
276 "LOC_CLIFFTOP" "goto" "goto_forced" "LOC_CLIFFLEDGE" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
277 "LOC_CLIFFLEDGE" "goto" "goto_non_direct" "LOC_CLIFFACE" "CLIMB DOWN" false "none" "<none>" "<none>" 0 false false "<none>"
278 "LOC_CLIFFLEDGE" "goto" "goto_non_direct" "LOC_REACHDEAD" "NE CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
279 "LOC_REACHDEAD" "goto" "goto_non_direct" "LOC_CLIFFLEDGE" "SW OUT CRAWL" false "none" "<none>" "<none>" 0 false false "<none>"
280 "LOC_GRUESOME" "goto" "goto_forced" "LOC_NOWHERE" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
281 "LOC_FOOF1" "goto" "goto_forced" "LOC_DEBRIS" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
282 "LOC_FOOF2" "goto" "goto_forced" "LOC_BUILDING" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
283 "LOC_FOOF3" "goto" "goto_forced" "LOC_Y2" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
284 "LOC_FOOF4" "goto" "goto_forced" "LOC_BUILDING" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
285 "LOC_FOOF5" "goto" "goto_forced" "LOC_PLOVER" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"
286 "LOC_FOOF6" "goto" "goto_forced" "LOC_Y2" "<forced>" true "none" "<none>" "<none>" 0 false false "<none>"

[ generation summary ]
[ direct_map_rules=337 ]
[ direct_map_locations=106 ]
[ total_travel_rules=623 ]
[ non_direct_rules=286 ]
[ resolved_by_generation=616 ]
[ unresolved_rules=7 ]
[ unresolved_rule_ids=[110, 138, 190, 193, 194, 216, 226] ]
[ travel category counts ]
[ goto_conditional=22 ]
[ goto_forced=23 ]
[ goto_magic_word=4 ]
[ goto_non_direct=192 ]
[ goto_random=5 ]
[ speak=15 ]
[ speak_conditional=19 ]
[ special=4 ]
[ special_conditional=2 ]