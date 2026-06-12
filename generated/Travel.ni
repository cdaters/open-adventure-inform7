[ Generated Travel ]

[ action taxonomy ]
[ goto: direct destination transition ]
[ speak: terminal message label ]
[ special: special movement case token ]
[ conditional: travel rule includes a cond field ]
[ random: conditional is [pct, N] ]
[ forced: verbs list is empty ]
[ unknown: any non-standard action type ]
[ direct map rule: goto+no cond+no forced+single mapped direction ]
[ non-direct travel rules are intentionally left as placeholders ]

[ LOC_START ]
[ action summary: goto=5 ]
[ goto rules ]
[ goto -> LOC_HILL | verbs=ROAD WEST UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BUILDING | verbs=ENTER BUILD INWAR EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_VALLEY | verbs=DOWNS GULLY STREA SOUTH DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST1 | verbs=FORES NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_HILL ]
[ action summary: goto=4, speak=1 ]
[ direct map (goto) rules ]
west of LOC_HILL is LOC_ROADEND.
[ goto -> LOC_ROADEND | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_HILL is LOC_FOREST20.
[ goto -> LOC_FOREST20 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_START | verbs=BUILD EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST13 | verbs=SOUTH FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> WHICH_WAY | verbs=DOWN | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_BUILDING ]
[ action summary: goto=4 ]
[ goto rules ]
[ goto -> LOC_START | verbs=OUT OUTDO WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOOF1 | verbs=XYZZY | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=magic-word travel ]
[ goto -> LOC_FOOF3 | verbs=PLUGH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=magic-word travel ]
[ goto -> LOC_SEWER | verbs=DOWNS STREA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_VALLEY ]
[ action summary: goto=5, speak=1 ]
[ direct map (goto) rules ]
west of LOC_VALLEY is LOC_FOREST12.
[ goto -> LOC_FOREST12 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_START | verbs=UPSTR BUILD NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST6 | verbs=EAST FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SLIT | verbs=DOWNS SOUTH DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> UPSTREAM_DOWNSTREAM | verbs=STREA | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_ROADEND ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_ROADEND is LOC_FOREST15.
[ goto -> LOC_FOREST15 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ROADEND is LOC_FOREST21.
[ goto -> LOC_FOREST21 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_HILL | verbs=ROAD EAST UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_START | verbs=BUILD | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST14 | verbs=SOUTH FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CLIFF ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_CLIFF is LOC_FOREST19.
[ goto -> LOC_FOREST19 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST17 | verbs=SOUTH FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_NOMAKE | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SLIT ]
[ action summary: goto=5, speak=1 ]
[ direct map (goto) rules ]
west of LOC_SLIT is LOC_FOREST10.
[ goto -> LOC_FOREST10 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_START | verbs=BUILD | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_VALLEY | verbs=UPSTR NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST6 | verbs=EAST FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GRATE | verbs=DOWNS BED SOUTH DEPRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> DONT_FIT | verbs=SLIT STREA DOWN INWAR ENTER | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_GRATE ]
[ action summary: goto=6, speak=1 ]
[ direct map (goto) rules ]
south of LOC_GRATE is LOC_FOREST10.
[ goto -> LOC_FOREST10 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_GRATE is LOC_FOREST9.
[ goto -> LOC_FOREST9 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST7 | verbs=EAST FORES | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_START | verbs=BUILD | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SLIT | verbs=UPSTR GULLY NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BELOWGRATE | verbs=ENTER INWAR DOWN | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ speak rules ]
[ speak -> GRATE_NOWAY | verbs=ENTER | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_BELOWGRATE ]
[ action summary: goto=4, speak=1 ]
[ goto rules ]
[ goto -> LOC_GRATE | verbs=OUT UPWAR | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_COBBLE | verbs=CRAWL COBBL INWAR WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_PITTOP | verbs=PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DEBRIS | verbs=DEBRI | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> GRATE_NOWAY | verbs=OUT | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_COBBLE ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_BELOWGRATE | verbs=OUT SURFA EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DEBRIS | verbs=INWAR DARK WEST DEBRI | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_PITTOP | verbs=PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_DEBRIS ]
[ action summary: goto=6 ]
[ goto rules ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_BELOWGRATE | verbs=ENTRA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_COBBLE | verbs=CRAWL COBBL PASSA LOW EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_AWKWARD | verbs=CANYO INWAR UPWAR WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOOF2 | verbs=XYZZY | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=magic-word travel ]
[ goto -> LOC_PITTOP | verbs=PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_AWKWARD ]
[ action summary: goto=5 ]
[ goto rules ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_BELOWGRATE | verbs=ENTRA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DEBRIS | verbs=DOWN EAST DEBRI | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BIRDCHAMBER | verbs=INWAR UPWAR WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_PITTOP | verbs=PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BIRDCHAMBER ]
[ action summary: goto=5 ]
[ goto rules ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_BELOWGRATE | verbs=ENTRA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DEBRIS | verbs=DEBRI | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_AWKWARD | verbs=CANYO EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_PITTOP | verbs=PASSA PIT WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_PITTOP ]
[ action summary: goto=7 ]
[ direct map (goto) rules ]
down of LOC_PITTOP is LOC_MISTHALL.
[ goto -> LOC_MISTHALL | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_GRATE | verbs=DEPRE | forced=no | conditional=yes | random=no | condition=not, GRATE, GRATE_CLOSED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_BELOWGRATE | verbs=ENTRA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DEBRIS | verbs=DEBRI | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BIRDCHAMBER | verbs=PASSA EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_NECKBROKE | verbs=DOWN PIT STEPS | forced=no | conditional=yes | random=no | condition=carry, NUGGET | status=placeholder | reason=conditional travel ]
[ goto -> LOC_CRACK | verbs=CRACK WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MISTHALL ]
[ action summary: goto=6 ]
[ direct map (goto) rules ]
up of LOC_MISTHALL is LOC_PITTOP.
[ goto -> LOC_PITTOP | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_NUGGET | verbs=LEFT SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_EASTBANK | verbs=FORWA HALL WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_KINGHALL | verbs=STAIR DOWN NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DOME | verbs=UPWAR PIT STEPS DOME PASSA EAST | forced=no | conditional=yes | random=no | condition=carry, NUGGET | status=placeholder | reason=conditional travel ]
[ goto -> LOC_JUMBLE | verbs=Y2 | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CRACK ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_PITTOP | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_EASTBANK ]
[ action summary: goto=3, speak=2 ]
[ goto rules ]
[ goto -> LOC_MISTHALL | verbs=HALL EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_NOMAKE | verbs=FORWA | forced=no | conditional=yes | random=no | condition=not, FISSURE, BRIDGED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_WESTBANK | verbs=OVER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> CROSS_BRIDGE | verbs=JUMP | forced=no | conditional=yes | condition=not, FISSURE, UNBRIDGED | status=placeholder | reason=non-direct ]
[ speak -> NO_CROSS | verbs=OVER ACROS WEST CROSS | forced=no | conditional=yes | condition=not, FISSURE, BRIDGED | status=placeholder | reason=non-direct ]


[ LOC_NUGGET ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_MISTHALL | verbs=HALL OUT NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_KINGHALL ]
[ action summary: goto=8 ]
[ direct map (goto) rules ]
north of LOC_KINGHALL is LOC_SNAKEBLOCK.
[ goto -> LOC_SNAKEBLOCK | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_MISTHALL | verbs=STAIR UPWAR EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FLOORHOLE | verbs=NORTH RIGHT | forced=no | conditional=yes | random=no | condition=not, SNAKE, SNAKE_BLOCKS | status=placeholder | reason=conditional travel ]
[ goto -> LOC_SOUTHSIDE | verbs=SOUTH LEFT | forced=no | conditional=yes | random=no | condition=not, SNAKE, SNAKE_BLOCKS | status=placeholder | reason=conditional travel ]
[ goto -> LOC_WESTSIDE | verbs=WEST FORWA | forced=no | conditional=yes | random=no | condition=not, SNAKE, SNAKE_BLOCKS | status=placeholder | reason=conditional travel ]
[ goto -> LOC_SECRET3 | verbs=SW | forced=no | conditional=yes | random=yes | condition=pct, 35 | status=placeholder | reason=conditional travel ]
[ goto -> LOC_SNAKEBLOCK | verbs=SW | forced=no | conditional=yes | random=no | condition=with, SNAKE | status=placeholder | reason=conditional travel ]
[ goto -> LOC_SECRET3 | verbs=SECRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_NECKBROKE ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NOWHERE | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_NOMAKE ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NOWHERE | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_DOME ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_MISTHALL | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_WESTEND ]
[ action summary: goto=3, speak=1 ]
[ goto rules ]
[ goto -> LOC_EASTEND | verbs=EAST ACROS | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SLAB | verbs=WEST SLAB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_WESTPIT | verbs=DOWN PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> TOO_FAR | verbs=HOLE | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_EASTPIT ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_EASTEND | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_WESTPIT ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_WESTEND | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BUILDING1 | verbs=CLIMB | forced=no | conditional=yes | random=no | condition=not, PLANT, PLANT_GROWN | status=placeholder | reason=conditional travel ]
[ goto -> LOC_CLIMBSTALK | verbs=CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CLIMBSTALK ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NARROW | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_WESTBANK ]
[ action summary: speak=2, goto=4 ]
[ direct map (goto) rules ]
north of LOC_WESTBANK is LOC_PARALLEL1.
[ goto -> LOC_PARALLEL1 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_WESTBANK is LOC_MISTWEST.
[ goto -> LOC_MISTWEST | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_NOMAKE | verbs=FORWA | forced=no | conditional=yes | random=no | condition=not, FISSURE, BRIDGED | status=placeholder | reason=conditional travel ]
[ goto -> LOC_EASTBANK | verbs=OVER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> CROSS_BRIDGE | verbs=JUMP | forced=no | conditional=yes | condition=not, FISSURE, UNBRIDGED | status=placeholder | reason=non-direct ]
[ speak -> NO_CROSS | verbs=OVER ACROS EAST CROSS | forced=no | conditional=yes | condition=not, FISSURE, BRIDGED | status=placeholder | reason=non-direct ]


[ LOC_FLOORHOLE ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_KINGHALL | verbs=HALL OUT SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_Y2 | verbs=NORTH Y2 | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BROKEN | verbs=DOWN HOLE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SOUTHSIDE ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_KINGHALL | verbs=HALL OUT NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_WESTSIDE ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_KINGHALL | verbs=HALL OUT EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_CROSSOVER | verbs=WEST UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BUILDING1 ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_NOCLIMB | verbs=<forced> | forced=yes | conditional=yes | random=no | condition=not, PLANT, PLANT_BELLOWING | status=placeholder | reason=forced move ]
[ goto -> LOC_PLANTTOP | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_SNAKEBLOCK ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_KINGHALL | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_Y2 ]
[ action summary: goto=5, special=1 ]
[ direct map (goto) rules ]
south of LOC_Y2 is LOC_FLOORHOLE.
[ goto -> LOC_FLOORHOLE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_Y2 is LOC_WINDOW1.
[ goto -> LOC_WINDOW1 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOOF4 | verbs=PLUGH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=magic-word travel ]
[ goto -> LOC_JUMBLE | verbs=EAST WALL BROKE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOOF5 | verbs=PLOVE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ special rules ]
[ special -> 2 | verbs=PLOVE | forced=no | conditional=yes | condition=carry, EMERALD | status=placeholder | reason=non-direct ]


[ LOC_JUMBLE ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
up of LOC_JUMBLE is LOC_MISTHALL.
[ goto -> LOC_MISTHALL | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_Y2 | verbs=DOWN Y2 | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_WINDOW1 ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_Y2 | verbs=EAST Y2 | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_NECKBROKE | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BROKEN ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_BROKEN is LOC_DUSTY.
[ goto -> LOC_DUSTY | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SMALLPITBRINK | verbs=EAST CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FLOORHOLE | verbs=UPWAR HOLE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BEDQUILT | verbs=BEDQU | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SMALLPITBRINK ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_BROKEN | verbs=WEST CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SMALLPIT | verbs=DOWN PIT CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SMALLPIT ]
[ action summary: goto=1, speak=1 ]
[ goto rules ]
[ goto -> LOC_SMALLPITBRINK | verbs=CLIMB UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> DONT_FIT | verbs=SLIT STREA DOWN UPSTR DOWNS ENTER INWAR | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_DUSTY ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_BROKEN | verbs=EAST PASSA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_COMPLEX | verbs=DOWN HOLE FLOOR | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BEDQUILT | verbs=BEDQU | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_PARALLEL1 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_MISTWEST | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_MISTWEST ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_MISTWEST is LOC_WESTBANK.
[ goto -> LOC_WESTBANK | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_MISTWEST is LOC_PARALLEL2.
[ goto -> LOC_PARALLEL2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_ALIKE1 | verbs=SOUTH UPWAR PASSA CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_LONGEAST | verbs=WEST CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALIKE1 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
up of LOC_ALIKE1 is LOC_MISTWEST.
[ goto -> LOC_MISTWEST | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE1 is LOC_ALIKE1.
[ goto -> LOC_ALIKE1 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE1 is LOC_ALIKE2.
[ goto -> LOC_ALIKE2 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE1 is LOC_ALIKE4.
[ goto -> LOC_ALIKE4 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE1 is LOC_ALIKE11.
[ goto -> LOC_ALIKE11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE2 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_ALIKE2 is LOC_ALIKE1.
[ goto -> LOC_ALIKE1 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE2 is LOC_ALIKE3.
[ goto -> LOC_ALIKE3 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE2 is LOC_ALIKE4.
[ goto -> LOC_ALIKE4 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE3 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_ALIKE3 is LOC_ALIKE2.
[ goto -> LOC_ALIKE2 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_ALIKE3 is LOC_MAZEEND3.
[ goto -> LOC_MAZEEND3 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE3 is LOC_ALIKE6.
[ goto -> LOC_ALIKE6 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE3 is LOC_MAZEEND9.
[ goto -> LOC_MAZEEND9 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE4 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_ALIKE4 is LOC_ALIKE1.
[ goto -> LOC_ALIKE1 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE4 is LOC_ALIKE2.
[ goto -> LOC_ALIKE2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE4 is LOC_MAZEEND1.
[ goto -> LOC_MAZEEND1 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE4 is LOC_MAZEEND2.
[ goto -> LOC_MAZEEND2 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_ALIKE14 | verbs=UPWAR DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND1 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE4 | verbs=WEST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND2 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE4 | verbs=EAST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND3 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE3 | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALIKE5 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
east of LOC_ALIKE5 is LOC_ALIKE6.
[ goto -> LOC_ALIKE6 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE5 is LOC_ALIKE7.
[ goto -> LOC_ALIKE7 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE6 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_ALIKE6 is LOC_ALIKE3.
[ goto -> LOC_ALIKE3 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE6 is LOC_ALIKE5.
[ goto -> LOC_ALIKE5 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_ALIKE6 is LOC_ALIKE7.
[ goto -> LOC_ALIKE7 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE6 is LOC_ALIKE8.
[ goto -> LOC_ALIKE8 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE7 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_ALIKE7 is LOC_ALIKE5.
[ goto -> LOC_ALIKE5 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_ALIKE7 is LOC_ALIKE6.
[ goto -> LOC_ALIKE6 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE7 is LOC_ALIKE8.
[ goto -> LOC_ALIKE8 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE7 is LOC_ALIKE9.
[ goto -> LOC_ALIKE9 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE8 ]
[ action summary: goto=6 ]
[ direct map (goto) rules ]
west of LOC_ALIKE8 is LOC_ALIKE6.
[ goto -> LOC_ALIKE6 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE8 is LOC_ALIKE7.
[ goto -> LOC_ALIKE7 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE8 is LOC_ALIKE8.
[ goto -> LOC_ALIKE8 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_ALIKE8 is LOC_ALIKE9.
[ goto -> LOC_ALIKE9 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE8 is LOC_ALIKE10.
[ goto -> LOC_ALIKE10 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_ALIKE8 is LOC_MAZEEND11.
[ goto -> LOC_MAZEEND11 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE9 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_ALIKE9 is LOC_ALIKE7.
[ goto -> LOC_ALIKE7 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE9 is LOC_ALIKE8.
[ goto -> LOC_ALIKE8 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE9 is LOC_MAZEEND4.
[ goto -> LOC_MAZEEND4 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_MAZEEND4 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE9 | verbs=WEST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALIKE10 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_ALIKE10 is LOC_ALIKE8.
[ goto -> LOC_ALIKE8 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_ALIKE10 is LOC_ALIKE10.
[ goto -> LOC_ALIKE10 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_ALIKE10 is LOC_MAZEEND5.
[ goto -> LOC_MAZEEND5 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE10 is LOC_PITBRINK.
[ goto -> LOC_PITBRINK | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_MAZEEND5 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE10 | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_PITBRINK ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_PITBRINK is LOC_ALIKE10.
[ goto -> LOC_ALIKE10 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_PITBRINK is LOC_MAZEEND6.
[ goto -> LOC_MAZEEND6 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_PITBRINK is LOC_ALIKE12.
[ goto -> LOC_ALIKE12 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_PITBRINK is LOC_ALIKE13.
[ goto -> LOC_ALIKE13 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_BIRDCHAMBER | verbs=DOWN CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND6 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_PITBRINK | verbs=EAST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_PARALLEL2 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_WESTBANK | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_LONGEAST ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_LONGEAST is LOC_LONGWEST.
[ goto -> LOC_LONGWEST | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_MISTWEST | verbs=EAST UPWAR CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_CROSSOVER | verbs=NORTH DOWN HOLE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_LONGWEST ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_LONGWEST is LOC_LONGEAST.
[ goto -> LOC_LONGEAST | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_LONGWEST is LOC_CROSSOVER.
[ goto -> LOC_CROSSOVER | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_DIFFERENT1 | verbs=SOUTH | forced=no | conditional=yes | random=no | condition=nodwarves | status=placeholder | reason=conditional travel ]

[ LOC_CROSSOVER ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_CROSSOVER is LOC_LONGEAST.
[ goto -> LOC_LONGEAST | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_CROSSOVER is LOC_DEADEND7.
[ goto -> LOC_DEADEND7 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_CROSSOVER is LOC_WESTSIDE.
[ goto -> LOC_WESTSIDE | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_CROSSOVER is LOC_LONGWEST.
[ goto -> LOC_LONGWEST | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DEADEND7 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_CROSSOVER | verbs=SOUTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_COMPLEX ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_COMPLEX is LOC_ANTEROOM.
[ goto -> LOC_ANTEROOM | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_DUSTY | verbs=UPWAR CLIMB ROOM | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BEDQUILT | verbs=WEST BEDQU | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SHELLROOM | verbs=NORTH SHELL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BEDQUILT ]
[ action summary: goto=8, speak=4 ]
[ direct map (goto) rules ]
east of LOC_BEDQUILT is LOC_COMPLEX.
[ goto -> LOC_COMPLEX | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_BEDQUILT is LOC_SWISSCHEESE.
[ goto -> LOC_SWISSCHEESE | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_BEDQUILT is LOC_DUSTY.
[ goto -> LOC_DUSTY | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_BEDQUILT is LOC_THREEJUNCTION.
[ goto -> LOC_THREEJUNCTION | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_BEDQUILT is LOC_ANTEROOM.
[ goto -> LOC_ANTEROOM | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SLAB | verbs=SLAB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SECRET2 | verbs=UPWAR | forced=no | conditional=yes | random=yes | condition=pct, 70 | status=placeholder | reason=conditional travel ]
[ goto -> LOC_LOWROOM | verbs=NORTH | forced=no | conditional=yes | random=yes | condition=pct, 75 | status=placeholder | reason=conditional travel ]
[ speak rules ]
[ speak -> FUTILE_CRAWL | verbs=SOUTH | forced=no | conditional=yes | condition=pct, 65 | status=placeholder | reason=non-direct ]
[ speak -> FUTILE_CRAWL | verbs=UPWAR | forced=no | conditional=yes | condition=pct, 60 | status=placeholder | reason=non-direct ]
[ speak -> FUTILE_CRAWL | verbs=NORTH | forced=no | conditional=yes | condition=pct, 50 | status=placeholder | reason=non-direct ]
[ speak -> FUTILE_CRAWL | verbs=DOWN | forced=no | conditional=yes | condition=pct, 65 | status=placeholder | reason=non-direct ]


[ LOC_SWISSCHEESE ]
[ action summary: goto=5, speak=2 ]
[ direct map (goto) rules ]
northeast of LOC_SWISSCHEESE is LOC_BEDQUILT.
[ goto -> LOC_BEDQUILT | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_SWISSCHEESE is LOC_EASTEND.
[ goto -> LOC_EASTEND | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_SWISSCHEESE is LOC_SOFTROOM.
[ goto -> LOC_SOFTROOM | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_TALL | verbs=CANYO | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_ORIENTAL | verbs=ORIEN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> FUTILE_CRAWL | verbs=SOUTH | forced=no | conditional=yes | condition=pct, 80 | status=placeholder | reason=non-direct ]
[ speak -> FUTILE_CRAWL | verbs=NW | forced=no | conditional=yes | condition=pct, 50 | status=placeholder | reason=non-direct ]


[ LOC_EASTEND ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_EASTEND is LOC_SWISSCHEESE.
[ goto -> LOC_SWISSCHEESE | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_WESTEND | verbs=WEST ACROS | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_EASTPIT | verbs=DOWN PIT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SLAB ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_SLAB is LOC_WESTEND.
[ goto -> LOC_WESTEND | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_SLAB is LOC_BEDQUILT.
[ goto -> LOC_BEDQUILT | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SECRET1 | verbs=UPWAR CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SECRET1 ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
south of LOC_SECRET1 is LOC_SECRET4.
[ goto -> LOC_SECRET4 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_SECRET1 is LOC_MIRRORCANYON.
[ goto -> LOC_MIRRORCANYON | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SLAB | verbs=DOWN SLAB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SECRET5 | verbs=SOUTH | forced=no | conditional=yes | random=no | condition=not, DRAGON, DRAGON_BARS | status=placeholder | reason=conditional travel ]
[ goto -> LOC_RESERVOIR | verbs=RESER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SECRET2 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_SECRET2 is LOC_THREEJUNCTION.
[ goto -> LOC_THREEJUNCTION | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_SECRET2 is LOC_TOPSTALACTITE.
[ goto -> LOC_TOPSTALACTITE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_BEDQUILT | verbs=DOWN PASSA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_THREEJUNCTION ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
southeast of LOC_THREEJUNCTION is LOC_BEDQUILT.
[ goto -> LOC_BEDQUILT | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_THREEJUNCTION is LOC_SECRET2.
[ goto -> LOC_SECRET2 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_THREEJUNCTION is LOC_WINDOW2.
[ goto -> LOC_WINDOW2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_LOWROOM ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
southwest of LOC_LOWROOM is LOC_WINDING.
[ goto -> LOC_WINDING | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_LOWROOM is LOC_DEADCRAWL.
[ goto -> LOC_DEADCRAWL | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_BEDQUILT | verbs=BEDQU | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_ORIENTAL | verbs=SE ORIEN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_DEADCRAWL ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_LOWROOM | verbs=SOUTH CRAWL OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SECRET3 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_SECRET3 is LOC_KINGHALL.
[ goto -> LOC_KINGHALL | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_SECRET3 is LOC_SECRET6.
[ goto -> LOC_SECRET6 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_SECRET3 is LOC_WIDEPLACE.
[ goto -> LOC_WIDEPLACE | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SECRET5 | verbs=WEST | forced=no | conditional=yes | random=no | condition=not, DRAGON, DRAGON_BARS | status=placeholder | reason=conditional travel ]

[ LOC_WIDEPLACE ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
south of LOC_WIDEPLACE is LOC_TIGHTPLACE.
[ goto -> LOC_TIGHTPLACE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_WIDEPLACE is LOC_TALL.
[ goto -> LOC_TALL | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_TIGHTPLACE ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
north of LOC_TIGHTPLACE is LOC_WIDEPLACE.
[ goto -> LOC_WIDEPLACE | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_TALL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_TALL is LOC_WIDEPLACE.
[ goto -> LOC_WIDEPLACE | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_TALL is LOC_BOULDERS1.
[ goto -> LOC_BOULDERS1 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SWISSCHEESE | verbs=NORTH CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BOULDERS1 ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
south of LOC_BOULDERS1 is LOC_TALL.
[ goto -> LOC_TALL | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_SEWER ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_BUILDING | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_ALIKE11 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
north of LOC_ALIKE11 is LOC_ALIKE1.
[ goto -> LOC_ALIKE1 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE11 is LOC_ALIKE11.
[ goto -> LOC_ALIKE11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ALIKE11 is LOC_ALIKE11.
[ goto -> LOC_ALIKE11 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE11 is LOC_MAZEEND8.
[ goto -> LOC_MAZEEND8 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_MAZEEND8 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE11 | verbs=WEST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND9 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE3 | verbs=SOUTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALIKE12 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_ALIKE12 is LOC_PITBRINK.
[ goto -> LOC_PITBRINK | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ALIKE12 is LOC_ALIKE13.
[ goto -> LOC_ALIKE13 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE12 is LOC_MAZEEND10.
[ goto -> LOC_MAZEEND10 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_ALIKE13 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_ALIKE13 is LOC_PITBRINK.
[ goto -> LOC_PITBRINK | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ALIKE13 is LOC_ALIKE12.
[ goto -> LOC_ALIKE12 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_ALIKE13 is LOC_MAZEEND12.
[ goto -> LOC_MAZEEND12 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_MAZEEND10 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE12 | verbs=EAST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MAZEEND11 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE8 | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALIKE14 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_ALIKE4 | verbs=UPWAR DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_NARROW ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_WESTPIT | verbs=DOWN CLIMB EAST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_NECKBROKE | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GIANTROOM | verbs=WEST GIANT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_NOCLIMB ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_WESTPIT | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_PLANTTOP ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_WESTEND | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_INCLINE ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_WATERFALL | verbs=NORTH CAVER PASSA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_LOWROOM | verbs=DOWN CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_GIANTROOM ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_GIANTROOM is LOC_NARROW.
[ goto -> LOC_NARROW | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_GIANTROOM is LOC_CAVEIN.
[ goto -> LOC_CAVEIN | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_GIANTROOM is LOC_IMMENSE.
[ goto -> LOC_IMMENSE | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_CAVEIN ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_GIANTROOM | verbs=SOUTH GIANT OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_IMMENSE ]
[ action summary: goto=2, speak=1 ]
[ goto rules ]
[ goto -> LOC_GIANTROOM | verbs=SOUTH GIANT PASSA | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_WATERFALL | verbs=NORTH ENTER CAVER | forced=no | conditional=yes | random=no | condition=not, DOOR, DOOR_RUSTED | status=placeholder | reason=conditional travel ]
[ speak rules ]
[ speak -> RUSTY_DOOR | verbs=NORTH | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_WATERFALL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_WATERFALL is LOC_INCLINE.
[ goto -> LOC_INCLINE | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_IMMENSE | verbs=SOUTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GIANTROOM | verbs=GIANT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SOFTROOM ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_SWISSCHEESE | verbs=WEST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ORIENTAL ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
southeast of LOC_ORIENTAL is LOC_SWISSCHEESE.
[ goto -> LOC_SWISSCHEESE | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_LOWROOM | verbs=WEST CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_MISTY | verbs=UPWAR NORTH CAVER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_MISTY ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
west of LOC_MISTY is LOC_ALCOVE.
[ goto -> LOC_ALCOVE | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_ORIENTAL | verbs=SOUTH ORIEN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ALCOVE ]
[ action summary: goto=2, special=1 ]
[ direct map (goto) rules ]
east of LOC_ALCOVE is LOC_PLOVER.
[ goto -> LOC_PLOVER | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_MISTY | verbs=NW CAVER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ special rules ]
[ special -> 1 | verbs=EAST PASSA | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_PLOVER ]
[ action summary: special=2, goto=3 ]
[ direct map (goto) rules ]
west of LOC_PLOVER is LOC_ALCOVE.
[ goto -> LOC_ALCOVE | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOOF6 | verbs=PLOVE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_DARKROOM | verbs=NE DARK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ special rules ]
[ special -> 1 | verbs=WEST PASSA OUT | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]
[ special -> 2 | verbs=PLOVE | forced=no | conditional=yes | condition=carry, EMERALD | status=placeholder | reason=non-direct ]


[ LOC_DARKROOM ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_PLOVER | verbs=SOUTH PLOVE OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ARCHED ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_SHELLROOM | verbs=DOWN SHELL OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_SHELLROOM ]
[ action summary: goto=3, speak=2 ]
[ direct map (goto) rules ]
down of LOC_SHELLROOM is LOC_SLOPING1.
[ goto -> LOC_SLOPING1 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_SHELLROOM is LOC_COMPLEX.
[ goto -> LOC_COMPLEX | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_ARCHED | verbs=UPWAR HALL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> CLAM_BLOCKER | verbs=SOUTH | forced=no | conditional=yes | condition=carry, CLAM | status=placeholder | reason=non-direct ]
[ speak -> OYSTER_BLOCKER | verbs=SOUTH | forced=no | conditional=yes | condition=carry, OYSTER | status=placeholder | reason=non-direct ]


[ LOC_SLOPING1 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
down of LOC_SLOPING1 is LOC_CULDESAC.
[ goto -> LOC_CULDESAC | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_SHELLROOM | verbs=UPWAR SHELL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CULDESAC ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_SLOPING1 | verbs=UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_SHELLROOM | verbs=SHELL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_ANTEROOM ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
up of LOC_ANTEROOM is LOC_COMPLEX.
[ goto -> LOC_COMPLEX | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_ANTEROOM is LOC_BEDQUILT.
[ goto -> LOC_BEDQUILT | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_ANTEROOM is LOC_WITTSEND.
[ goto -> LOC_WITTSEND | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT1 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
south of LOC_DIFFERENT1 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT1 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT1 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT1 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT1 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT1 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT1 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT1 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT1 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT1 is LOC_LONGWEST.
[ goto -> LOC_LONGWEST | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_WITTSEND ]
[ action summary: speak=2, goto=1 ]
[ direct map (goto) rules ]
east of LOC_WITTSEND is LOC_ANTEROOM.
[ goto -> LOC_ANTEROOM | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ speak rules ]
[ speak -> FUTILE_CRAWL | verbs=EAST NORTH SOUTH NE SE SW NW UPWAR DOWN | forced=no | conditional=yes | condition=pct, 95 | status=placeholder | reason=non-direct ]
[ speak -> WAY_BLOCKED | verbs=WEST | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_MIRRORCANYON ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
south of LOC_MIRRORCANYON is LOC_SECRET1.
[ goto -> LOC_SECRET1 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_RESERVOIR | verbs=NORTH RESER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_WINDOW2 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
west of LOC_WINDOW2 is LOC_THREEJUNCTION.
[ goto -> LOC_THREEJUNCTION | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_NECKBROKE | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_TOPSTALACTITE ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
north of LOC_TOPSTALACTITE is LOC_SECRET2.
[ goto -> LOC_SECRET2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_TOPSTALACTITE is LOC_ALIKE4.
[ goto -> LOC_ALIKE4 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_ALIKE6 | verbs=DOWN JUMP CLIMB | forced=no | conditional=yes | random=yes | condition=pct, 40 | status=placeholder | reason=conditional travel ]
[ goto -> LOC_ALIKE9 | verbs=DOWN | forced=no | conditional=yes | random=yes | condition=pct, 50 | status=placeholder | reason=conditional travel ]

[ LOC_DIFFERENT2 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southwest of LOC_DIFFERENT2 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT2 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT2 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT2 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT2 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT2 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT2 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT2 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT2 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT2 is LOC_DEADEND13.
[ goto -> LOC_DEADEND13 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_RESERVOIR ]
[ action summary: goto=2, speak=1 ]
[ direct map (goto) rules ]
north of LOC_RESERVOIR is LOC_RESBOTTOM.
[ goto -> LOC_RESBOTTOM | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_MIRRORCANYON | verbs=SOUTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> BAD_DIRECTION | verbs=NORTH ACROS CROSS | forced=no | conditional=yes | condition=not, RESER, WATERS_PARTED | status=placeholder | reason=non-direct ]


[ LOC_MAZEEND12 ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
southeast of LOC_MAZEEND12 is LOC_ALIKE13.
[ goto -> LOC_ALIKE13 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_NE ]
[ action summary: goto=1 ]
[ direct map (goto) rules ]
southwest of LOC_NE is LOC_SW.
[ goto -> LOC_SW | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_SW ]
[ action summary: goto=1, speak=1 ]
[ direct map (goto) rules ]
northeast of LOC_SW is LOC_NE.
[ goto -> LOC_NE | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ speak rules ]
[ speak -> GRATE_NOWAY | verbs=DOWN | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_SWCHASM ]
[ action summary: goto=2, speak=3, special=1 ]
[ direct map (goto) rules ]
southwest of LOC_SWCHASM is LOC_WINDING.
[ goto -> LOC_WINDING | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_NOMAKE | verbs=JUMP | forced=no | conditional=yes | random=no | condition=not, CHASM, TROLL_BRIDGE | status=placeholder | reason=conditional travel ]
[ speak rules ]
[ speak -> TROLL_BLOCKS | verbs=OVER ACROS CROSS NE | forced=no | conditional=yes | condition=with, TROLL | status=placeholder | reason=non-direct ]
[ speak -> BRIDGE_GONE | verbs=OVER | forced=no | conditional=yes | condition=not, CHASM, TROLL_BRIDGE | status=placeholder | reason=non-direct ]
[ speak -> CROSS_BRIDGE | verbs=JUMP | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]
[ special rules ]
[ special -> 3 | verbs=OVER | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]



[ LOC_WINDING ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
down of LOC_WINDING is LOC_LOWROOM.
[ goto -> LOC_LOWROOM | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_WINDING is LOC_SWCHASM.
[ goto -> LOC_SWCHASM | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_SECRET4 ]
[ action summary: goto=1, speak=1 ]
[ goto rules ]
[ goto -> LOC_SECRET1 | verbs=NORTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> NASTY_DRAGON | verbs=EAST FORWA | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_SECRET5 ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_SECRET5 is LOC_SECRET1.
[ goto -> LOC_SECRET1 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_SECRET5 is LOC_SECRET3.
[ goto -> LOC_SECRET3 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_SECRET6 ]
[ action summary: goto=1, speak=1 ]
[ goto rules ]
[ goto -> LOC_SECRET3 | verbs=EAST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> NASTY_DRAGON | verbs=NORTH FORWA | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_NECHASM ]
[ action summary: goto=4, speak=2, special=1 ]
[ direct map (goto) rules ]
northeast of LOC_NECHASM is LOC_CORRIDOR.
[ goto -> LOC_CORRIDOR | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FORK | verbs=FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BARRENFRONT | verbs=BARRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> TROLL_BLOCKS | verbs=OVER ACROS CROSS SW | forced=no | conditional=yes | condition=with, TROLL | status=placeholder | reason=non-direct ]
[ speak -> CROSS_BRIDGE | verbs=JUMP | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]
[ special rules ]
[ special -> 3 | verbs=OVER | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]



[ LOC_CORRIDOR ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
west of LOC_CORRIDOR is LOC_NECHASM.
[ goto -> LOC_NECHASM | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FORK | verbs=EAST FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BARRENFRONT | verbs=BARRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FORK ]
[ action summary: goto=5 ]
[ direct map (goto) rules ]
west of LOC_FORK is LOC_CORRIDOR.
[ goto -> LOC_CORRIDOR | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_WARMWALLS | verbs=NE LEFT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_LIMESTONE | verbs=SE RIGHT DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BARRENFRONT | verbs=BARRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_WARMWALLS ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_FORK | verbs=SOUTH FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=NORTH VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BOULDERS2 | verbs=EAST CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BREATHTAKING ]
[ action summary: goto=3, speak=1 ]
[ goto rules ]
[ goto -> LOC_WARMWALLS | verbs=SOUTH PASSA OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FORK | verbs=FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_GRUESOME | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> RIDICULOUS_ATTEMPT | verbs=DOWN | forced=no | conditional=no | condition=<none> | status=placeholder | reason=non-direct ]


[ LOC_BOULDERS2 ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_WARMWALLS | verbs=WEST OUT CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FORK | verbs=FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_LIMESTONE ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_FORK | verbs=NORTH UPWAR FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BARRENFRONT | verbs=SOUTH DOWN BARRE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BARRENFRONT ]
[ action summary: goto=4 ]
[ goto rules ]
[ goto -> LOC_LIMESTONE | verbs=WEST UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FORK | verbs=FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BARRENROOM | verbs=EAST INWAR BARRE ENTER | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_BARRENROOM ]
[ action summary: goto=3 ]
[ goto rules ]
[ goto -> LOC_BARRENFRONT | verbs=WEST OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FORK | verbs=FORK | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_BREATHTAKING | verbs=VIEW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_DIFFERENT3 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
west of LOC_DIFFERENT3 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT3 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT3 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT3 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT3 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT3 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT3 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT3 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT3 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT3 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT4 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
northwest of LOC_DIFFERENT4 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT4 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT4 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT4 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT4 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT4 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT4 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT4 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT4 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT4 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT5 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
up of LOC_DIFFERENT5 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT5 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT5 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT5 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT5 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT5 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT5 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT5 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT5 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT5 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT6 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
northeast of LOC_DIFFERENT6 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT6 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT6 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT6 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT6 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT6 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT6 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT6 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT6 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT6 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT7 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
north of LOC_DIFFERENT7 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT7 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT7 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT7 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT7 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT7 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT7 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT7 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT7 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT7 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT8 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
east of LOC_DIFFERENT8 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT8 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT8 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT8 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT8 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT8 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT8 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT8 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT8 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT8 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT9 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southeast of LOC_DIFFERENT9 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT9 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT9 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT9 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT9 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT9 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT9 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT9 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT9 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT9 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT10 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
down of LOC_DIFFERENT10 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT10 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT10 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT10 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT10 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT10 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT10 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT10 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southwest of LOC_DIFFERENT10 is LOC_DIFFERENT11.
[ goto -> LOC_DIFFERENT11 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT10 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DIFFERENT11 ]
[ action summary: goto=10 ]
[ direct map (goto) rules ]
southwest of LOC_DIFFERENT11 is LOC_DIFFERENT1.
[ goto -> LOC_DIFFERENT1 | verbs=SW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northwest of LOC_DIFFERENT11 is LOC_DIFFERENT3.
[ goto -> LOC_DIFFERENT3 | verbs=NW | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
east of LOC_DIFFERENT11 is LOC_DIFFERENT4.
[ goto -> LOC_DIFFERENT4 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_DIFFERENT11 is LOC_DIFFERENT5.
[ goto -> LOC_DIFFERENT5 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_DIFFERENT11 is LOC_DIFFERENT6.
[ goto -> LOC_DIFFERENT6 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
down of LOC_DIFFERENT11 is LOC_DIFFERENT7.
[ goto -> LOC_DIFFERENT7 | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
southeast of LOC_DIFFERENT11 is LOC_DIFFERENT8.
[ goto -> LOC_DIFFERENT8 | verbs=SE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_DIFFERENT11 is LOC_DIFFERENT9.
[ goto -> LOC_DIFFERENT9 | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_DIFFERENT11 is LOC_DIFFERENT10.
[ goto -> LOC_DIFFERENT10 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
northeast of LOC_DIFFERENT11 is LOC_DIFFERENT2.
[ goto -> LOC_DIFFERENT2 | verbs=NE | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_DEADEND13 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
south of LOC_DEADEND13 is LOC_BADDIRECTION.
[ goto -> LOC_BADDIRECTION | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_DIFFERENT2 | verbs=NORTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_ROUGHHEWN | verbs=SOUTH | forced=no | conditional=yes | random=no | condition=not, VEND, VEND_BLOCKS | status=placeholder | reason=conditional travel ]

[ LOC_ROUGHHEWN ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_ROUGHHEWN is LOC_DEADEND13.
[ goto -> LOC_DEADEND13 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_ROUGHHEWN is LOC_LARGE.
[ goto -> LOC_LARGE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_BADDIRECTION ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_DEADEND13 | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_LARGE ]
[ action summary: goto=2, speak=1 ]
[ direct map (goto) rules ]
west of LOC_LARGE is LOC_ROUGHHEWN.
[ goto -> LOC_ROUGHHEWN | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_LARGE is LOC_STOREROOM.
[ goto -> LOC_STOREROOM | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ speak rules ]
[ speak -> OGRE_SNARL | verbs=NORTH | forced=no | conditional=yes | condition=with, OGRE | status=placeholder | reason=non-direct ]


[ LOC_STOREROOM ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_LARGE | verbs=SOUTH OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST1 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST1 is LOC_START.
[ goto -> LOC_START | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST1 is LOC_FOREST13.
[ goto -> LOC_FOREST13 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST1 is LOC_FOREST2.
[ goto -> LOC_FOREST2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST1 is LOC_FOREST3.
[ goto -> LOC_FOREST3 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST2 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST2 is LOC_FOREST1.
[ goto -> LOC_FOREST1 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST2 is LOC_FOREST19.
[ goto -> LOC_FOREST19 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST2 is LOC_FOREST3.
[ goto -> LOC_FOREST3 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST2 is LOC_FOREST18.
[ goto -> LOC_FOREST18 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST3 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
north of LOC_FOREST3 is LOC_FOREST2.
[ goto -> LOC_FOREST2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST3 is LOC_FOREST1.
[ goto -> LOC_FOREST1 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST4 | verbs=EAST WEST | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST4 ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_FOREST3 | verbs=EAST NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_FOREST5 | verbs=WEST SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST5 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_FOREST5 is LOC_FOREST7.
[ goto -> LOC_FOREST7 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST5 is LOC_FOREST6.
[ goto -> LOC_FOREST6 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST4 | verbs=EAST NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST6 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST6 is LOC_FOREST5.
[ goto -> LOC_FOREST5 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST6 is LOC_FOREST7.
[ goto -> LOC_FOREST7 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST6 is LOC_VALLEY.
[ goto -> LOC_VALLEY | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST6 is LOC_SLIT.
[ goto -> LOC_SLIT | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST7 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST7 is LOC_FOREST5.
[ goto -> LOC_FOREST5 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST7 is LOC_FOREST6.
[ goto -> LOC_FOREST6 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST7 is LOC_GRATE.
[ goto -> LOC_GRATE | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST7 is LOC_FOREST8.
[ goto -> LOC_FOREST8 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST8 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST8 is LOC_FOREST9.
[ goto -> LOC_FOREST9 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST8 is LOC_FOREST11.
[ goto -> LOC_FOREST11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST8 is LOC_FOREST22.
[ goto -> LOC_FOREST22 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST8 is LOC_FOREST7.
[ goto -> LOC_FOREST7 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST9 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST9 is LOC_FOREST11.
[ goto -> LOC_FOREST11 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST9 is LOC_FOREST8.
[ goto -> LOC_FOREST8 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST9 is LOC_FOREST10.
[ goto -> LOC_FOREST10 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST9 is LOC_GRATE.
[ goto -> LOC_GRATE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST10 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST10 is LOC_SLIT.
[ goto -> LOC_SLIT | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST10 is LOC_FOREST11.
[ goto -> LOC_FOREST11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST10 is LOC_FOREST9.
[ goto -> LOC_FOREST9 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST10 is LOC_GRATE.
[ goto -> LOC_GRATE | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST11 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST11 is LOC_FOREST10.
[ goto -> LOC_FOREST10 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST11 is LOC_FOREST8.
[ goto -> LOC_FOREST8 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST11 is LOC_FOREST22.
[ goto -> LOC_FOREST22 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST11 is LOC_FOREST9.
[ goto -> LOC_FOREST9 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST12 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST12 is LOC_FOREST13.
[ goto -> LOC_FOREST13 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST12 is LOC_FOREST14.
[ goto -> LOC_FOREST14 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST12 is LOC_FOREST22.
[ goto -> LOC_FOREST22 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST12 is LOC_VALLEY.
[ goto -> LOC_VALLEY | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST13 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST13 is LOC_FOREST1.
[ goto -> LOC_FOREST1 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST13 is LOC_FOREST12.
[ goto -> LOC_FOREST12 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST13 is LOC_FOREST20.
[ goto -> LOC_FOREST20 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST13 is LOC_HILL.
[ goto -> LOC_HILL | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST14 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST14 is LOC_ROADEND.
[ goto -> LOC_ROADEND | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST14 is LOC_FOREST16.
[ goto -> LOC_FOREST16 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST14 is LOC_FOREST15.
[ goto -> LOC_FOREST15 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST14 is LOC_FOREST12.
[ goto -> LOC_FOREST12 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST15 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST15 is LOC_FOREST16.
[ goto -> LOC_FOREST16 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST15 is LOC_FOREST22.
[ goto -> LOC_FOREST22 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST15 is LOC_ROADEND.
[ goto -> LOC_ROADEND | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST15 is LOC_FOREST14.
[ goto -> LOC_FOREST14 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST16 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
west of LOC_FOREST16 is LOC_FOREST14.
[ goto -> LOC_FOREST14 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST16 is LOC_FOREST15.
[ goto -> LOC_FOREST15 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST17 | verbs=EAST NORTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST17 ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
east of LOC_FOREST17 is LOC_FOREST18.
[ goto -> LOC_FOREST18 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST17 is LOC_CLIFF.
[ goto -> LOC_CLIFF | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_FOREST16 | verbs=WEST SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_FOREST18 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST18 is LOC_FOREST19.
[ goto -> LOC_FOREST19 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST18 is LOC_FOREST17.
[ goto -> LOC_FOREST17 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST18 is LOC_FOREST2.
[ goto -> LOC_FOREST2 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST18 is LOC_FOREST21.
[ goto -> LOC_FOREST21 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST19 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST19 is LOC_FOREST2.
[ goto -> LOC_FOREST2 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST19 is LOC_FOREST18.
[ goto -> LOC_FOREST18 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST19 is LOC_CLIFF.
[ goto -> LOC_CLIFF | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST19 is LOC_FOREST20.
[ goto -> LOC_FOREST20 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST20 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST20 is LOC_HILL.
[ goto -> LOC_HILL | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST20 is LOC_FOREST21.
[ goto -> LOC_FOREST21 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST20 is LOC_FOREST19.
[ goto -> LOC_FOREST19 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST20 is LOC_FOREST13.
[ goto -> LOC_FOREST13 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST21 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST21 is LOC_FOREST20.
[ goto -> LOC_FOREST20 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST21 is LOC_ROADEND.
[ goto -> LOC_ROADEND | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST21 is LOC_FOREST18.
[ goto -> LOC_FOREST18 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST21 is LOC_FOREST21.
[ goto -> LOC_FOREST21 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_FOREST22 ]
[ action summary: goto=4 ]
[ direct map (goto) rules ]
east of LOC_FOREST22 is LOC_FOREST8.
[ goto -> LOC_FOREST8 | verbs=EAST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
west of LOC_FOREST22 is LOC_FOREST11.
[ goto -> LOC_FOREST11 | verbs=WEST | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
north of LOC_FOREST22 is LOC_FOREST15.
[ goto -> LOC_FOREST15 | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_FOREST22 is LOC_FOREST12.
[ goto -> LOC_FOREST12 | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_LEDGE ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NOMAKE | verbs=JUMP | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_RESBOTTOM ]
[ action summary: goto=2 ]
[ direct map (goto) rules ]
north of LOC_RESBOTTOM is LOC_RESNORTH.
[ goto -> LOC_RESNORTH | verbs=NORTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
south of LOC_RESBOTTOM is LOC_RESERVOIR.
[ goto -> LOC_RESERVOIR | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]

[ LOC_RESNORTH ]
[ action summary: speak=1, goto=2 ]
[ direct map (goto) rules ]
south of LOC_RESNORTH is LOC_RESBOTTOM.
[ goto -> LOC_RESBOTTOM | verbs=SOUTH | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_TREACHEROUS | verbs=NW UPWAR OUT | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ speak rules ]
[ speak -> BAD_DIRECTION | verbs=SOUTH ACROS CROSS | forced=no | conditional=yes | condition=not, RESER, WATERS_PARTED | status=placeholder | reason=non-direct ]


[ LOC_TREACHEROUS ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_STEEP | verbs=UPWAR NW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_RESNORTH | verbs=DOWN SE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_STEEP ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_TREACHEROUS | verbs=DOWN SE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_CLIFFBASE | verbs=UPWAR NW | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CLIFFBASE ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_STEEP | verbs=DOWN SE | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_CLIFFACE | verbs=UPWAR CLIMB | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_CLIFFACE ]
[ action summary: goto=3 ]
[ direct map (goto) rules ]
down of LOC_CLIFFACE is LOC_CLIFFBASE.
[ goto -> LOC_CLIFFBASE | verbs=DOWN | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
up of LOC_CLIFFACE is LOC_FOOTSLIP.
[ goto -> LOC_FOOTSLIP | verbs=UPWAR | forced=no | conditional=no | random=no | condition=<none> | status=direct_map | reason=direct adjacency ]
[ goto rules ]
[ goto -> LOC_CLIFFTOP | verbs=UPWAR | forced=no | conditional=yes | random=no | condition=carry, RABBITFOOT | status=placeholder | reason=conditional travel ]

[ LOC_FOOTSLIP ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NOWHERE | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_CLIFFTOP ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_CLIFFLEDGE | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_CLIFFLEDGE ]
[ action summary: goto=2 ]
[ goto rules ]
[ goto -> LOC_CLIFFACE | verbs=CLIMB DOWN | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]
[ goto -> LOC_REACHDEAD | verbs=NE CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_REACHDEAD ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_CLIFFLEDGE | verbs=SW OUT CRAWL | forced=no | conditional=no | random=no | condition=<none> | status=placeholder | reason=non-mappable or ambiguous direction ]

[ LOC_GRUESOME ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_NOWHERE | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF1 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_DEBRIS | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF2 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_BUILDING | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF3 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_Y2 | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF4 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_BUILDING | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF5 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_PLOVER | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ LOC_FOOF6 ]
[ action summary: goto=1 ]
[ goto rules ]
[ goto -> LOC_Y2 | verbs=<forced> | forced=yes | conditional=no | random=no | condition=<none> | status=placeholder | reason=forced move ]

[ generation summary ]
[ direct_map_rules=337 ]
[ direct_map_locations=106 ]
[ total_travel_rules=623 ]
[ placeholder_rules=286 ]