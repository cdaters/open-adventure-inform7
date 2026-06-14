"Open Adventure" by Eric S Raymond.

[
Open Adventure Inform 7 Edition

Original Adventure created by William Crowther (1975-1976).

Expanded and enhanced by Don Woods (1977).

Open Adventure is the author-approved open-source release and
restoration maintained by Eric S. Raymond and contributors.

This Inform 7 10.1.2 implementation is maintained by Craig Daters.

Portions of this source are generated automatically from the
Open Adventure adventure.yaml world model. Generated files should
not be edited directly; changes should instead be made in the
YAML source or in the generator scripts.

The canonical sources for this project are:

    Open Adventure (C implementation)
    adventure.yaml world database
    Inform 7 implementation source

Project goals:

    * Preserve Open Adventure gameplay.
    * Remain faithful to the Open Adventure world model.
    * Produce a modern Inform 7 implementation targeting Z-Machine
      version 8 and TerpVault distribution.

]

Release along with the source text.
Use scoring.

[ Generated from adventure.yaml ]
[ Rooms ]

LOC_NOWHERE is a room.

LOC_START is a room.
The description of LOC_START is "You are standing at the end of a road before a small brick building.
Around you is a forest.  A small stream flows out of the building and
down a gully.".
The printed name of LOC_START is "You're in front of building.".

LOC_HILL is a room.
The description of LOC_HILL is "You have walked up a hill, still in the forest.  The road slopes back
down the other side of the hill.  There is a building in the distance.".
The printed name of LOC_HILL is "You're at hill in road.".

LOC_BUILDING is a room.
The description of LOC_BUILDING is "You are inside a building, a well house for a large spring.".
The printed name of LOC_BUILDING is "You're inside building.".

LOC_VALLEY is a room.
The description of LOC_VALLEY is "You are in a valley in the forest beside a stream tumbling along a
rocky bed.".
The printed name of LOC_VALLEY is "You're in valley.".

LOC_ROADEND is a room.
The description of LOC_ROADEND is "The road, which approaches from the east, ends here amid the trees.".
The printed name of LOC_ROADEND is "You're at end of road.".

LOC_CLIFF is a room.
The description of LOC_CLIFF is "The forest thins out here to reveal a steep cliff.  There is no way
down, but a small ledge can be seen to the west across the chasm.".
The printed name of LOC_CLIFF is "You're at cliff.".

LOC_SLIT is a room.
The description of LOC_SLIT is "At your feet all the water of the stream splashes into a 2-inch slit
in the rock.  Downstream the streambed is bare rock.".
The printed name of LOC_SLIT is "You're at slit in streambed.".

LOC_GRATE is a room.
The description of LOC_GRATE is "You are in a 20-foot depression floored with bare dirt.  Set into the
dirt is a strong steel grate mounted in concrete.  A dry streambed
leads into the depression.".
The printed name of LOC_GRATE is "You're outside grate.".

LOC_BELOWGRATE is a room.
The description of LOC_BELOWGRATE is "You are in a small chamber beneath a 3x3 steel grate to the surface.
A low crawl over cobbles leads inward to the west.".
The printed name of LOC_BELOWGRATE is "You're below the grate.".

LOC_COBBLE is a room.
The description of LOC_COBBLE is "You are crawling over cobbles in a low passage.  There is a dim light
at the east end of the passage.".
The printed name of LOC_COBBLE is "You're in cobble crawl.".

LOC_DEBRIS is a room.
The description of LOC_DEBRIS is "You are in a debris room filled with stuff washed in from the surface.
A low wide passage with cobbles becomes plugged with mud and debris
here, but an awkward canyon leads upward and west.  In the mud someone
has scrawled, 'MAGIC WORD XYZZY'.".
The printed name of LOC_DEBRIS is "You're in debris room.".

LOC_AWKWARD is a room.
The description of LOC_AWKWARD is "You are in an awkward sloping east/west canyon.".

LOC_BIRDCHAMBER is a room.
The description of LOC_BIRDCHAMBER is "You are in a splendid chamber thirty feet high.  The walls are frozen
rivers of orange stone.  An awkward canyon and a good passage exit
from east and west sides of the chamber.".
The printed name of LOC_BIRDCHAMBER is "You're in bird chamber.".

LOC_PITTOP is a room.
The description of LOC_PITTOP is "At your feet is a small pit breathing traces of white mist.  An east
passage ends here except for a small crack leading on.".
The printed name of LOC_PITTOP is "You're at top of small pit.".

LOC_MISTHALL is a room.
The description of LOC_MISTHALL is "You are at one end of a vast hall stretching forward out of sight to
the west.  There are openings to either side.  Nearby, a wide stone
staircase leads downward.  The hall is filled with wisps of white mist
swaying to and fro almost as if alive.  A cold wind blows up the
staircase.  There is a passage at the top of a dome behind you.".
The printed name of LOC_MISTHALL is "You're in Hall of Mists.".

LOC_CRACK is a room.
The description of LOC_CRACK is "The crack is far too small for you to follow.  At its widest it is
barely wide enough to admit your foot.".

LOC_EASTBANK is a room.
The description of LOC_EASTBANK is "You are on the east bank of a fissure slicing clear across the hall.
The mist is quite thick here, and the fissure is too wide to jump.".
The printed name of LOC_EASTBANK is "You're on east bank of fissure.".

LOC_NUGGET is a room.
The description of LOC_NUGGET is "This is a low room with a crude note on the wall.  The note says,
'You won't get it up the steps'.".
The printed name of LOC_NUGGET is "You're in nugget-of-gold room.".

LOC_KINGHALL is a room.
The description of LOC_KINGHALL is "You are in the Hall of the Mountain King, with passages off in all
directions.".
The printed name of LOC_KINGHALL is "You're in Hall of Mt King.".

LOC_NECKBROKE is a room.
The description of LOC_NECKBROKE is "You are at the bottom of the pit with a broken neck.".

LOC_NOMAKE is a room.
The description of LOC_NOMAKE is "You didn't make it.".

LOC_DOME is a room.
The description of LOC_DOME is "The dome is unclimbable.".

LOC_WESTEND is a room.
The description of LOC_WESTEND is "You are at the west end of the Twopit Room.  There is a large hole in
the wall above the pit at this end of the room.".
The printed name of LOC_WESTEND is "You're at west end of Twopit Room.".

LOC_EASTPIT is a room.
The description of LOC_EASTPIT is "You are at the bottom of the eastern pit in the Twopit Room.  There is
a small pool of oil in one corner of the pit.".
The printed name of LOC_EASTPIT is "You're in east pit.".

LOC_WESTPIT is a room.
The description of LOC_WESTPIT is "You are at the bottom of the western pit in the Twopit Room.  There is
a large hole in the wall about 25 feet above you.".
The printed name of LOC_WESTPIT is "You're in west pit.".

LOC_CLIMBSTALK is a room.
The description of LOC_CLIMBSTALK is "You clamber up the plant and scurry through the hole at the top.".

LOC_WESTBANK is a room.
The description of LOC_WESTBANK is "You are on the west side of the fissure in the Hall of Mists.".
The printed name of LOC_WESTBANK is "You're on west bank of fissure.".

LOC_FLOORHOLE is a room.
The description of LOC_FLOORHOLE is "You are in a low n/s passage at a hole in the floor.  The hole goes
down to an e/w passage.".
The printed name of LOC_FLOORHOLE is "You're in n/s passage above e/w passage.".

LOC_SOUTHSIDE is a room.
The description of LOC_SOUTHSIDE is "You are in the south side chamber.".

LOC_WESTSIDE is a room.
The description of LOC_WESTSIDE is "You are in the west side chamber of the Hall of the Mountain King.
A passage continues west and up here.".
The printed name of LOC_WESTSIDE is "You're in the west side chamber.".

LOC_BUILDING1 is a room.

LOC_SNAKEBLOCK is a room.
The description of LOC_SNAKEBLOCK is "You can't get by the snake.".

LOC_Y2 is a room.
The description of LOC_Y2 is "You are in a large room, with a passage to the south, a passage to the
west, and a wall of broken rock to the east.  There is a large 'Y2' on
a rock in the room's center.".
The printed name of LOC_Y2 is "You're at 'Y2'.".

LOC_JUMBLE is a room.
The description of LOC_JUMBLE is "You are in a jumble of rock, with cracks everywhere.".

LOC_WINDOW1 is a room.
The description of LOC_WINDOW1 is "You're at a low window overlooking a huge pit, which extends up out of
sight.  A floor is indistinctly visible over 50 feet below.  Traces of
white mist cover the floor of the pit, becoming thicker to the right.
Marks in the dust around the window would seem to indicate that
someone has been here recently.  Directly across the pit from you and
25 feet away there is a similar window looking into a lighted room.  A
shadowy figure can be seen there peering back at you.".
The printed name of LOC_WINDOW1 is "You're at window on pit.".

LOC_BROKEN is a room.
The description of LOC_BROKEN is "You are in a dirty broken passage.  To the east is a crawl.  To the
west is a large passage.  Above you is a hole to another passage.".
The printed name of LOC_BROKEN is "You're in dirty passage.".

LOC_SMALLPITBRINK is a room.
The description of LOC_SMALLPITBRINK is "You are on the brink of a small clean climbable pit.  A crawl leads
west.".
The printed name of LOC_SMALLPITBRINK is "You're at brink of small pit.".

LOC_SMALLPIT is a room.
The description of LOC_SMALLPIT is "You are in the bottom of a small pit with a little stream, which
enters and exits through tiny slits.".
The printed name of LOC_SMALLPIT is "You're at bottom of pit with stream.".

LOC_DUSTY is a room.
The description of LOC_DUSTY is "You are in a large room full of dusty rocks.  There is a big hole in
the floor.  There are cracks everywhere, and a passage leading east.".
The printed name of LOC_DUSTY is "You're in dusty rock room.".

LOC_PARALLEL1 is a room.
The description of LOC_PARALLEL1 is "You have crawled through a very low wide passage parallel to and north
of the Hall of Mists.".

LOC_MISTWEST is a room.
The description of LOC_MISTWEST is "You are at the west end of the Hall of Mists.  A low wide crawl
continues west and another goes north.  To the south is a little
passage 6 feet off the floor.".
The printed name of LOC_MISTWEST is "You're at west end of Hall of Mists.".

LOC_ALIKE1 is a room.
The description of LOC_ALIKE1 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE2 is a room.
The description of LOC_ALIKE2 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE3 is a room.
The description of LOC_ALIKE3 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE4 is a room.
The description of LOC_ALIKE4 is "You are in a maze of twisty little passages, all alike.".

LOC_MAZEEND1 is a room.
The description of LOC_MAZEEND1 is "Dead end".

LOC_MAZEEND2 is a room.
The description of LOC_MAZEEND2 is "Dead end".

LOC_MAZEEND3 is a room.
The description of LOC_MAZEEND3 is "Dead end".

LOC_ALIKE5 is a room.
The description of LOC_ALIKE5 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE6 is a room.
The description of LOC_ALIKE6 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE7 is a room.
The description of LOC_ALIKE7 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE8 is a room.
The description of LOC_ALIKE8 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE9 is a room.
The description of LOC_ALIKE9 is "You are in a maze of twisty little passages, all alike.".

LOC_MAZEEND4 is a room.
The description of LOC_MAZEEND4 is "Dead end".

LOC_ALIKE10 is a room.
The description of LOC_ALIKE10 is "You are in a maze of twisty little passages, all alike.".

LOC_MAZEEND5 is a room.
The description of LOC_MAZEEND5 is "Dead end".

LOC_PITBRINK is a room.
The description of LOC_PITBRINK is "You are on the brink of a thirty foot pit with a massive orange column
down one wall.  You could climb down here but you could not get back
up.  The maze continues at this level.".
The printed name of LOC_PITBRINK is "You're at brink of pit.".

LOC_MAZEEND6 is a room.
The description of LOC_MAZEEND6 is "Dead end".

LOC_PARALLEL2 is a room.
The description of LOC_PARALLEL2 is "You have crawled through a very low wide passage parallel to and north
of the Hall of Mists.".

LOC_LONGEAST is a room.
The description of LOC_LONGEAST is "You are at the east end of a very long hall apparently without side
chambers.  To the east a low wide crawl slants up.  To the north a
round two foot hole slants down.".
The printed name of LOC_LONGEAST is "You're at east end of long hall.".

LOC_LONGWEST is a room.
The description of LOC_LONGWEST is "You are at the west end of a very long featureless hall.  The hall
joins up with a narrow north/south passage.".
The printed name of LOC_LONGWEST is "You're at west end of long hall.".

LOC_CROSSOVER is a room.
The description of LOC_CROSSOVER is "You are at a crossover of a high n/s passage and a low e/w one.".

LOC_DEADEND7 is a room.
The description of LOC_DEADEND7 is "Dead end".

LOC_COMPLEX is a room.
The description of LOC_COMPLEX is "You are at a complex junction.  A low hands and knees passage from the
north joins a higher crawl from the east to make a walking passage
going west.  There is also a large room above.  The air is damp here.".
The printed name of LOC_COMPLEX is "You're at complex junction.".

LOC_BEDQUILT is a room.
The description of LOC_BEDQUILT is "You are in Bedquilt, a long east/west passage with holes everywhere.
To explore at random select north, south, up, or down.".
The printed name of LOC_BEDQUILT is "You're in Bedquilt.".

LOC_SWISSCHEESE is a room.
The description of LOC_SWISSCHEESE is "You are in a room whose walls resemble Swiss cheese.  Obvious passages
go west, east, ne, and nw.  Part of the room is occupied by a large
bedrock block.".
The printed name of LOC_SWISSCHEESE is "You're in Swiss Cheese Room.".

LOC_EASTEND is a room.
The description of LOC_EASTEND is "You are at the east end of the Twopit Room.  The floor here is
littered with thin rock slabs, which make it easy to descend the pits.
There is a path here bypassing the pits to connect passages from east
and west.  There are holes all over, but the only big one is on the
wall directly over the west pit where you can't get to it.".
The printed name of LOC_EASTEND is "You're at east end of Twopit Room.".

LOC_SLAB is a room.
The description of LOC_SLAB is "You are in a large low circular chamber whose floor is an immense slab
fallen from the ceiling (Slab Room).  East and west there once were
large passages, but they are now filled with boulders.  Low small
passages go north and south, and the south one quickly bends west
around the boulders.".
The printed name of LOC_SLAB is "You're in Slab Room.".

LOC_SECRET1 is a room.
The description of LOC_SECRET1 is "You are in a secret n/s canyon above a large room.".

LOC_SECRET2 is a room.
The description of LOC_SECRET2 is "You are in a secret n/s canyon above a sizable passage.".

LOC_THREEJUNCTION is a room.
The description of LOC_THREEJUNCTION is "You are in a secret canyon at a junction of three canyons, bearing
north, south, and se.  The north one is as tall as the other two
combined.".
The printed name of LOC_THREEJUNCTION is "You're at junction of three secret canyons.".

LOC_LOWROOM is a room.
The description of LOC_LOWROOM is "You are in a large low room.  Crawls lead north, se, and sw.".
The printed name of LOC_LOWROOM is "You're in large low room.".

LOC_DEADCRAWL is a room.
The description of LOC_DEADCRAWL is "Dead end crawl.".

LOC_SECRET3 is a room.
The description of LOC_SECRET3 is "You are in a secret canyon which here runs e/w.  It crosses over a
very tight canyon 15 feet below.  If you go down you may not be able
to get back up.".
The printed name of LOC_SECRET3 is "You're in secret e/w canyon above tight canyon.".

LOC_WIDEPLACE is a room.
The description of LOC_WIDEPLACE is "You are at a wide place in a very tight n/s canyon.".

LOC_TIGHTPLACE is a room.
The description of LOC_TIGHTPLACE is "The canyon here becomes too tight to go further south.".

LOC_TALL is a room.
The description of LOC_TALL is "You are in a tall e/w canyon.  A low tight crawl goes 3 feet north and
seems to open up.".

LOC_BOULDERS1 is a room.
The description of LOC_BOULDERS1 is "The canyon runs into a mass of boulders -- dead end.".

LOC_SEWER is a room.
The description of LOC_SEWER is "The stream flows out through a pair of 1 foot diameter sewer pipes.
It would be advisable to use the exit.".

LOC_ALIKE11 is a room.
The description of LOC_ALIKE11 is "You are in a maze of twisty little passages, all alike.".

LOC_MAZEEND8 is a room.
The description of LOC_MAZEEND8 is "Dead end".

LOC_MAZEEND9 is a room.
The description of LOC_MAZEEND9 is "Dead end".

LOC_ALIKE12 is a room.
The description of LOC_ALIKE12 is "You are in a maze of twisty little passages, all alike.".

LOC_ALIKE13 is a room.
The description of LOC_ALIKE13 is "You are in a maze of twisty little passages, all alike.".

LOC_MAZEEND10 is a room.
The description of LOC_MAZEEND10 is "Dead end".

LOC_MAZEEND11 is a room.
The description of LOC_MAZEEND11 is "Dead end".

LOC_ALIKE14 is a room.
The description of LOC_ALIKE14 is "You are in a maze of twisty little passages, all alike.".

LOC_NARROW is a room.
The description of LOC_NARROW is "You are in a long, narrow corridor stretching out of sight to the
west.  At the eastern end is a hole through which you can see a
profusion of leaves.".
The printed name of LOC_NARROW is "You're in narrow corridor.".

LOC_NOCLIMB is a room.
The description of LOC_NOCLIMB is "There is nothing here to climb.  Use 'up' or 'out' to leave the pit.".

LOC_PLANTTOP is a room.
The description of LOC_PLANTTOP is "You have climbed up the plant and out of the pit.".

LOC_INCLINE is a room.
The description of LOC_INCLINE is "You are at the top of a steep incline above a large room.  You could
climb down here, but you would not be able to climb up.  There is a
passage leading back to the north.".
The printed name of LOC_INCLINE is "You're at steep incline above large room.".

LOC_GIANTROOM is a room.
The description of LOC_GIANTROOM is "You are in the Giant Room.  The ceiling here is too high up for your
lamp to show it.  Cavernous passages lead east, north, and south.  On
the west wall is scrawled the inscription, 'FEE FIE FOE FOO' [bracket]sic[close bracket].".
The printed name of LOC_GIANTROOM is "You're in Giant Room.".

LOC_CAVEIN is a room.
The description of LOC_CAVEIN is "The passage here is blocked by a recent cave-in.".

LOC_IMMENSE is a room.
The description of LOC_IMMENSE is "You are at one end of an immense north/south passage.".

LOC_WATERFALL is a room.
The description of LOC_WATERFALL is "You are in a magnificent cavern with a rushing stream, which cascades
over a sparkling waterfall into a roaring whirlpool which disappears
through a hole in the floor.  Passages exit to the south and west.".
The printed name of LOC_WATERFALL is "You're in cavern with waterfall.".

LOC_SOFTROOM is a room.
The description of LOC_SOFTROOM is "You are in the Soft Room.  The walls are covered with heavy curtains,
the floor with a thick pile carpet.  Moss covers the ceiling.".
The printed name of LOC_SOFTROOM is "You're in Soft Room.".

LOC_ORIENTAL is a room.
The description of LOC_ORIENTAL is "This is the Oriental Room.  Ancient oriental cave drawings cover the
walls.  A gently sloping passage leads upward to the north, another
passage leads se, and a hands and knees crawl leads west.".
The printed name of LOC_ORIENTAL is "You're in Oriental Room.".

LOC_MISTY is a room.
The description of LOC_MISTY is "You are following a wide path around the outer edge of a large cavern.
Far below, through a heavy white mist, strange splashing noises can be
heard.  The mist rises up through a fissure in the ceiling.  The path
exits to the south and west.".
The printed name of LOC_MISTY is "You're in misty cavern.".

LOC_ALCOVE is a room.
The description of LOC_ALCOVE is "You are in an alcove.  A small nw path seems to widen after a short
distance.  An extremely tight tunnel leads east.  It looks like a very
tight squeeze.  An eerie light can be seen at the other end.".
The printed name of LOC_ALCOVE is "You're in alcove.".

LOC_PLOVER is a room.
The description of LOC_PLOVER is "You're in a small chamber lit by an eerie green light.  An extremely
narrow tunnel exits to the west.  A dark corridor leads ne.".
The printed name of LOC_PLOVER is "You're in Plover Room.".

LOC_DARKROOM is a room.
The description of LOC_DARKROOM is "You're in the dark-room.  A corridor leading south is the only exit.".
The printed name of LOC_DARKROOM is "You're in dark-room.".

LOC_ARCHED is a room.
The description of LOC_ARCHED is "You are in an arched hall.  A coral passage once continued up and east
from here, but is now blocked by debris.  The air smells of sea water.".
The printed name of LOC_ARCHED is "You're in arched hall.".

LOC_SHELLROOM is a room.
The description of LOC_SHELLROOM is "You're in a large room carved out of sedimentary rock.  The floor and
walls are littered with bits of shells embedded in the stone.  A
shallow passage proceeds downward, and a somewhat steeper one leads
up.  A low hands and knees passage enters from the south.".
The printed name of LOC_SHELLROOM is "You're in Shell Room.".

LOC_SLOPING1 is a room.
The description of LOC_SLOPING1 is "You are in a long sloping corridor with ragged sharp walls.".

LOC_CULDESAC is a room.
The description of LOC_CULDESAC is "You are in a cul-de-sac about eight feet across.".

LOC_ANTEROOM is a room.
The description of LOC_ANTEROOM is "You are in an anteroom leading to a large passage to the east.  Small
passages go west and up.  The remnants of recent digging are evident.
A sign in midair here says 'Cave under construction beyond this point.
Proceed at own risk.  [bracket]Witt Construction Company[close bracket]'".
The printed name of LOC_ANTEROOM is "You're in anteroom.".

LOC_DIFFERENT1 is a room.
The description of LOC_DIFFERENT1 is "You are in a maze of twisty little passages, all different.".

LOC_WITTSEND is a room.
The description of LOC_WITTSEND is "You are at Witt's End.  Passages lead off in *ALL* directions.".
The printed name of LOC_WITTSEND is "You're at Witt's End.".

LOC_MIRRORCANYON is a room.
The description of LOC_MIRRORCANYON is "You are in a north/south canyon about 25 feet across.  The floor is
covered by white mist seeping in from the north.  The walls extend
upward for well over 100 feet.  Suspended from some unseen point far
above you, an enormous two-sided mirror is hanging parallel to and
midway between the canyon walls.  (The mirror is obviously provided
for the use of the dwarves who, as you know, are extremely vain.)  A
small window can be seen in either wall, some fifty feet up.".
The printed name of LOC_MIRRORCANYON is "You're in Mirror Canyon.".

LOC_WINDOW2 is a room.
The description of LOC_WINDOW2 is "You're at a low window overlooking a huge pit, which extends up out of
sight.  A floor is indistinctly visible over 50 feet below.  Traces of
white mist cover the floor of the pit, becoming thicker to the left.
Marks in the dust around the window would seem to indicate that
someone has been here recently.  Directly across the pit from you and
25 feet away there is a similar window looking into a lighted room.  A
shadowy figure can be seen there peering back at you.".
The printed name of LOC_WINDOW2 is "You're at window on pit.".

LOC_TOPSTALACTITE is a room.
The description of LOC_TOPSTALACTITE is "A large stalactite extends from the roof and almost reaches the floor
below.  You could climb down it, and jump from it to the floor, but
having done so you would be unable to reach it to climb back up.".
The printed name of LOC_TOPSTALACTITE is "You're at top of stalactite.".

LOC_DIFFERENT2 is a room.
The description of LOC_DIFFERENT2 is "You are in a little maze of twisting passages, all different.".

LOC_RESERVOIR is a room.
The description of LOC_RESERVOIR is "You are at the edge of a large underground reservoir.  An opaque cloud
of white mist fills the room and rises rapidly upward.  The lake is
fed by a stream, which tumbles out of a hole in the wall about 10 feet
overhead and splashes noisily into the water somewhere within the
mist.  There is a passage going back toward the south.".
The printed name of LOC_RESERVOIR is "You're at reservoir.".

LOC_MAZEEND12 is a room.
The description of LOC_MAZEEND12 is "Dead end".

LOC_NE is a room.
The description of LOC_NE is "You are at the northeast end of an immense room, even larger than the
Giant Room.  It appears to be a repository for the 'Adventure'
program.  Massive torches far overhead bathe the room with smoky
yellow light.  Scattered about you can be seen a pile of bottles (all
of them empty), a nursery of young beanstalks murmuring quietly, a bed
of oysters, a bundle of black rods with rusty stars on their ends, and
a collection of brass lanterns.  Off to one side a great many dwarves
are sleeping on the floor, snoring loudly.  A notice nearby reads: 'Do
not disturb the dwarves!'  An immense mirror is hanging against one
wall, and stretches to the other end of the room, where various other
sundry objects can be glimpsed dimly in the distance.".
The printed name of LOC_NE is "You're at ne end.".

LOC_SW is a room.
The description of LOC_SW is "You are at the southwest end of the repository.  To one side is a pit
full of fierce green snakes.  On the other side is a row of small
wicker cages, each of which contains a little sulking bird.  In one
corner is a bundle of black rods with rusty marks on their ends.  A
large number of velvet pillows are scattered about on the floor.  A
vast mirror stretches off to the northeast.  At your feet is a large
steel grate, next to which is a sign that reads, 'Treasure Vault.
Keys in main office.'".
The printed name of LOC_SW is "You're at sw end.".

LOC_SWCHASM is a room.
The description of LOC_SWCHASM is "You are on one side of a large, deep chasm.  A heavy white mist rising
up from below obscures all view of the far side.  A sw path leads away
from the chasm into a winding corridor.".
The printed name of LOC_SWCHASM is "You're on sw side of chasm.".

LOC_WINDING is a room.
The description of LOC_WINDING is "You are in a long winding corridor sloping out of sight in both
directions.".
The printed name of LOC_WINDING is "You're in sloping corridor.".

LOC_SECRET4 is a room.
The description of LOC_SECRET4 is "You are in a secret canyon which exits to the north and east.".

LOC_SECRET5 is a room.
The description of LOC_SECRET5 is "You are in a secret canyon which exits to the north and east.".

LOC_SECRET6 is a room.
The description of LOC_SECRET6 is "You are in a secret canyon which exits to the north and east.".

LOC_NECHASM is a room.
The description of LOC_NECHASM is "You are on the far side of the chasm.  A ne path leads away from the
chasm on this side.".
The printed name of LOC_NECHASM is "You're on ne side of chasm.".

LOC_CORRIDOR is a room.
The description of LOC_CORRIDOR is "You're in a long east/west corridor.  A faint rumbling noise can be
heard in the distance.".
The printed name of LOC_CORRIDOR is "You're in corridor.".

LOC_FORK is a room.
The description of LOC_FORK is "The path forks here.  The left fork leads northeast.  A dull rumbling
seems to get louder in that direction.  The right fork leads southeast
down a gentle slope.  The main corridor enters from the west.".
The printed name of LOC_FORK is "You're at fork in path.".

LOC_WARMWALLS is a room.
The description of LOC_WARMWALLS is "The walls are quite warm here.  From the north can be heard a steady
roar, so loud that the entire cave seems to be trembling.  Another
passage leads south, and a low crawl goes east.".
The printed name of LOC_WARMWALLS is "You're at junction with warm walls.".

LOC_BREATHTAKING is a room.
The description of LOC_BREATHTAKING is "You are on the edge of a breath-taking view.  Far below you is an
active volcano, from which great gouts of molten lava come surging
out, cascading back down into the depths.  The glowing rock fills the
farthest reaches of the cavern with a blood-red glare, giving every-
thing an eerie, macabre appearance.  The air is filled with flickering
sparks of ash and a heavy smell of brimstone.  The walls are hot to
the touch, and the thundering of the volcano drowns out all other
sounds.  Embedded in the jagged roof far overhead are myriad twisted
formations composed of pure white alabaster, which scatter the murky
light into sinister apparitions upon the walls.  To one side is a deep
gorge, filled with a bizarre chaos of tortured rock which seems to
have been crafted by the devil himself.  An immense river of fire
crashes out from the depths of the volcano, burns its way through the
gorge, and plummets into a bottomless pit far off to your left.  To
the right, an immense geyser of blistering steam erupts continuously
from a barren island in the center of a sulfurous lake, which bubbles
ominously.  The far right wall is aflame with an incandescence of its
own, which lends an additional infernal splendor to the already
hellish scene.  A dark, foreboding passage exits to the south.".
The printed name of LOC_BREATHTAKING is "You're at breath-taking view.".

LOC_BOULDERS2 is a room.
The description of LOC_BOULDERS2 is "You are in a small chamber filled with large boulders.  The walls are
very warm, causing the air in the room to be almost stifling from the
heat.  The only exit is a crawl heading west, through which is coming
a low rumbling.".
The printed name of LOC_BOULDERS2 is "You're in Chamber of Boulders.".

LOC_LIMESTONE is a room.
The description of LOC_LIMESTONE is "You are walking along a gently sloping north/south passage lined with
oddly shaped limestone formations.".
The printed name of LOC_LIMESTONE is "You're in limestone passage.".

LOC_BARRENFRONT is a room.
The description of LOC_BARRENFRONT is "You are standing at the entrance to a large, barren room.  A notice
above the entrance reads:  'Caution!  Bear in room!'".
The printed name of LOC_BARRENFRONT is "You're in front of Barren Room.".

LOC_BARRENROOM is a room.
The description of LOC_BARRENROOM is "You are inside a barren room.  The center of the room is completely
empty except for some dust.  Marks in the dust lead away toward the
far end of the room.  The only exit is the way you came in.".
The printed name of LOC_BARRENROOM is "You're in Barren Room.".

LOC_DIFFERENT3 is a room.
The description of LOC_DIFFERENT3 is "You are in a maze of twisting little passages, all different.".

LOC_DIFFERENT4 is a room.
The description of LOC_DIFFERENT4 is "You are in a little maze of twisty passages, all different.".

LOC_DIFFERENT5 is a room.
The description of LOC_DIFFERENT5 is "You are in a twisting maze of little passages, all different.".

LOC_DIFFERENT6 is a room.
The description of LOC_DIFFERENT6 is "You are in a twisting little maze of passages, all different.".

LOC_DIFFERENT7 is a room.
The description of LOC_DIFFERENT7 is "You are in a twisty little maze of passages, all different.".

LOC_DIFFERENT8 is a room.
The description of LOC_DIFFERENT8 is "You are in a twisty maze of little passages, all different.".

LOC_DIFFERENT9 is a room.
The description of LOC_DIFFERENT9 is "You are in a little twisty maze of passages, all different.".

LOC_DIFFERENT10 is a room.
The description of LOC_DIFFERENT10 is "You are in a maze of little twisting passages, all different.".

LOC_DIFFERENT11 is a room.
The description of LOC_DIFFERENT11 is "You are in a maze of little twisty passages, all different.".

LOC_DEADEND13 is a room.
The description of LOC_DEADEND13 is "Dead end".

LOC_ROUGHHEWN is a room.
The description of LOC_ROUGHHEWN is "You are in a long, rough-hewn, north/south corridor.".

LOC_BADDIRECTION is a room.
The description of LOC_BADDIRECTION is "There is no way to go that direction.".

LOC_LARGE is a room.
The description of LOC_LARGE is "You are in a large chamber with passages to the west and north.".

LOC_STOREROOM is a room.
The description of LOC_STOREROOM is "You are in the ogre's storeroom.  The only exit is to the south.".

LOC_FOREST1 is a room.
The description of LOC_FOREST1 is "You are wandering aimlessly through the forest.".

LOC_FOREST2 is a room.
The description of LOC_FOREST2 is "You are wandering aimlessly through the forest.".

LOC_FOREST3 is a room.
The description of LOC_FOREST3 is "You are wandering aimlessly through the forest.".

LOC_FOREST4 is a room.
The description of LOC_FOREST4 is "You are wandering aimlessly through the forest.".

LOC_FOREST5 is a room.
The description of LOC_FOREST5 is "You are wandering aimlessly through the forest.".

LOC_FOREST6 is a room.
The description of LOC_FOREST6 is "You are wandering aimlessly through the forest.".

LOC_FOREST7 is a room.
The description of LOC_FOREST7 is "You are wandering aimlessly through the forest.".

LOC_FOREST8 is a room.
The description of LOC_FOREST8 is "You are wandering aimlessly through the forest.".

LOC_FOREST9 is a room.
The description of LOC_FOREST9 is "You are wandering aimlessly through the forest.".

LOC_FOREST10 is a room.
The description of LOC_FOREST10 is "You are wandering aimlessly through the forest.".

LOC_FOREST11 is a room.
The description of LOC_FOREST11 is "You are wandering aimlessly through the forest.".

LOC_FOREST12 is a room.
The description of LOC_FOREST12 is "You are wandering aimlessly through the forest.".

LOC_FOREST13 is a room.
The description of LOC_FOREST13 is "You are wandering aimlessly through the forest.".

LOC_FOREST14 is a room.
The description of LOC_FOREST14 is "You are wandering aimlessly through the forest.".

LOC_FOREST15 is a room.
The description of LOC_FOREST15 is "You are wandering aimlessly through the forest.".

LOC_FOREST16 is a room.
The description of LOC_FOREST16 is "You are wandering aimlessly through the forest.".

LOC_FOREST17 is a room.
The description of LOC_FOREST17 is "You are wandering aimlessly through the forest.".

LOC_FOREST18 is a room.
The description of LOC_FOREST18 is "You are wandering aimlessly through the forest.".

LOC_FOREST19 is a room.
The description of LOC_FOREST19 is "You are wandering aimlessly through the forest.".

LOC_FOREST20 is a room.
The description of LOC_FOREST20 is "You are wandering aimlessly through the forest.".

LOC_FOREST21 is a room.
The description of LOC_FOREST21 is "You are wandering aimlessly through the forest.".

LOC_FOREST22 is a room.
The description of LOC_FOREST22 is "You are wandering aimlessly through the forest.".

LOC_LEDGE is a room.
The description of LOC_LEDGE is "You are on a small ledge on one face of a sheer cliff.  There are no
paths away from the ledge.  Across the chasm is a small clearing
surrounded by forest.".
The printed name of LOC_LEDGE is "You're on ledge.".

LOC_RESBOTTOM is a room.
The description of LOC_RESBOTTOM is "You are walking across the bottom of the reservoir.  Walls of water
rear up on either side.  The roar of the water cascading past is
nearly deafening, and the mist is so thick you can barely see.".
The printed name of LOC_RESBOTTOM is "You're at bottom of reservoir.".

LOC_RESNORTH is a room.
The description of LOC_RESNORTH is "You are at the northern edge of the reservoir.  A northwest passage
leads sharply up from here.".
The printed name of LOC_RESNORTH is "You're north of reservoir.".

LOC_TREACHEROUS is a room.
The description of LOC_TREACHEROUS is "You are scrambling along a treacherously steep, rocky passage.".

LOC_STEEP is a room.
The description of LOC_STEEP is "You are on a very steep incline, which widens at it goes upward.".

LOC_CLIFFBASE is a room.
The description of LOC_CLIFFBASE is "You are at the base of a nearly vertical cliff.  There are some
slim footholds which would enable you to climb up, but it looks
extremely dangerous.  Here at the base of the cliff lie the remains
of several earlier adventurers who apparently failed to make it.".
The printed name of LOC_CLIFFBASE is "You're at base of cliff.".

LOC_CLIFFACE is a room.
The description of LOC_CLIFFACE is "You are climbing along a nearly vertical cliff.".

LOC_FOOTSLIP is a room.
The description of LOC_FOOTSLIP is "Just as you reach the top, your foot slips on a loose rock and you
tumble several hundred feet to join the other unlucky adventurers.".

LOC_CLIFFTOP is a room.
The description of LOC_CLIFFTOP is "Just as you reach the top, your foot slips on a loose rock and you
make one last desperate grab.  Your luck holds, as does your grip.
With an enormous heave, you lift yourself to the ledge above.".

LOC_CLIFFLEDGE is a room.
The description of LOC_CLIFFLEDGE is "You are on a small ledge at the top of a nearly vertical cliff.
There is a low crawl leading off to the northeast.".
The printed name of LOC_CLIFFLEDGE is "You're at top of cliff.".

LOC_REACHDEAD is a room.
The description of LOC_REACHDEAD is "You have reached a dead end.".

LOC_GRUESOME is a room.
The description of LOC_GRUESOME is "There is now one more gruesome aspect to the spectacular vista.".

LOC_FOOF1 is a room.
The description of LOC_FOOF1 is ">>Foof!<<".

LOC_FOOF2 is a room.
The description of LOC_FOOF2 is ">>Foof!<<".

LOC_FOOF3 is a room.
The description of LOC_FOOF3 is ">>Foof!<<".

LOC_FOOF4 is a room.
The description of LOC_FOOF4 is ">>Foof!<<".

LOC_FOOF5 is a room.
The description of LOC_FOOF5 is ">>Foof!<<".

LOC_FOOF6 is a room.
The description of LOC_FOOF6 is ">>Foof!<<".

To decide what text is the OpenAdventure canonical room id of (candidate-room - room):
	if candidate-room is LOC_NOWHERE:
		decide on "LOC_NOWHERE";
	if candidate-room is LOC_START:
		decide on "LOC_START";
	if candidate-room is LOC_HILL:
		decide on "LOC_HILL";
	if candidate-room is LOC_BUILDING:
		decide on "LOC_BUILDING";
	if candidate-room is LOC_VALLEY:
		decide on "LOC_VALLEY";
	if candidate-room is LOC_ROADEND:
		decide on "LOC_ROADEND";
	if candidate-room is LOC_CLIFF:
		decide on "LOC_CLIFF";
	if candidate-room is LOC_SLIT:
		decide on "LOC_SLIT";
	if candidate-room is LOC_GRATE:
		decide on "LOC_GRATE";
	if candidate-room is LOC_BELOWGRATE:
		decide on "LOC_BELOWGRATE";
	if candidate-room is LOC_COBBLE:
		decide on "LOC_COBBLE";
	if candidate-room is LOC_DEBRIS:
		decide on "LOC_DEBRIS";
	if candidate-room is LOC_AWKWARD:
		decide on "LOC_AWKWARD";
	if candidate-room is LOC_BIRDCHAMBER:
		decide on "LOC_BIRDCHAMBER";
	if candidate-room is LOC_PITTOP:
		decide on "LOC_PITTOP";
	if candidate-room is LOC_MISTHALL:
		decide on "LOC_MISTHALL";
	if candidate-room is LOC_CRACK:
		decide on "LOC_CRACK";
	if candidate-room is LOC_EASTBANK:
		decide on "LOC_EASTBANK";
	if candidate-room is LOC_NUGGET:
		decide on "LOC_NUGGET";
	if candidate-room is LOC_KINGHALL:
		decide on "LOC_KINGHALL";
	if candidate-room is LOC_NECKBROKE:
		decide on "LOC_NECKBROKE";
	if candidate-room is LOC_NOMAKE:
		decide on "LOC_NOMAKE";
	if candidate-room is LOC_DOME:
		decide on "LOC_DOME";
	if candidate-room is LOC_WESTEND:
		decide on "LOC_WESTEND";
	if candidate-room is LOC_EASTPIT:
		decide on "LOC_EASTPIT";
	if candidate-room is LOC_WESTPIT:
		decide on "LOC_WESTPIT";
	if candidate-room is LOC_CLIMBSTALK:
		decide on "LOC_CLIMBSTALK";
	if candidate-room is LOC_WESTBANK:
		decide on "LOC_WESTBANK";
	if candidate-room is LOC_FLOORHOLE:
		decide on "LOC_FLOORHOLE";
	if candidate-room is LOC_SOUTHSIDE:
		decide on "LOC_SOUTHSIDE";
	if candidate-room is LOC_WESTSIDE:
		decide on "LOC_WESTSIDE";
	if candidate-room is LOC_BUILDING1:
		decide on "LOC_BUILDING1";
	if candidate-room is LOC_SNAKEBLOCK:
		decide on "LOC_SNAKEBLOCK";
	if candidate-room is LOC_Y2:
		decide on "LOC_Y2";
	if candidate-room is LOC_JUMBLE:
		decide on "LOC_JUMBLE";
	if candidate-room is LOC_WINDOW1:
		decide on "LOC_WINDOW1";
	if candidate-room is LOC_BROKEN:
		decide on "LOC_BROKEN";
	if candidate-room is LOC_SMALLPITBRINK:
		decide on "LOC_SMALLPITBRINK";
	if candidate-room is LOC_SMALLPIT:
		decide on "LOC_SMALLPIT";
	if candidate-room is LOC_DUSTY:
		decide on "LOC_DUSTY";
	if candidate-room is LOC_PARALLEL1:
		decide on "LOC_PARALLEL1";
	if candidate-room is LOC_MISTWEST:
		decide on "LOC_MISTWEST";
	if candidate-room is LOC_ALIKE1:
		decide on "LOC_ALIKE1";
	if candidate-room is LOC_ALIKE2:
		decide on "LOC_ALIKE2";
	if candidate-room is LOC_ALIKE3:
		decide on "LOC_ALIKE3";
	if candidate-room is LOC_ALIKE4:
		decide on "LOC_ALIKE4";
	if candidate-room is LOC_MAZEEND1:
		decide on "LOC_MAZEEND1";
	if candidate-room is LOC_MAZEEND2:
		decide on "LOC_MAZEEND2";
	if candidate-room is LOC_MAZEEND3:
		decide on "LOC_MAZEEND3";
	if candidate-room is LOC_ALIKE5:
		decide on "LOC_ALIKE5";
	if candidate-room is LOC_ALIKE6:
		decide on "LOC_ALIKE6";
	if candidate-room is LOC_ALIKE7:
		decide on "LOC_ALIKE7";
	if candidate-room is LOC_ALIKE8:
		decide on "LOC_ALIKE8";
	if candidate-room is LOC_ALIKE9:
		decide on "LOC_ALIKE9";
	if candidate-room is LOC_MAZEEND4:
		decide on "LOC_MAZEEND4";
	if candidate-room is LOC_ALIKE10:
		decide on "LOC_ALIKE10";
	if candidate-room is LOC_MAZEEND5:
		decide on "LOC_MAZEEND5";
	if candidate-room is LOC_PITBRINK:
		decide on "LOC_PITBRINK";
	if candidate-room is LOC_MAZEEND6:
		decide on "LOC_MAZEEND6";
	if candidate-room is LOC_PARALLEL2:
		decide on "LOC_PARALLEL2";
	if candidate-room is LOC_LONGEAST:
		decide on "LOC_LONGEAST";
	if candidate-room is LOC_LONGWEST:
		decide on "LOC_LONGWEST";
	if candidate-room is LOC_CROSSOVER:
		decide on "LOC_CROSSOVER";
	if candidate-room is LOC_DEADEND7:
		decide on "LOC_DEADEND7";
	if candidate-room is LOC_COMPLEX:
		decide on "LOC_COMPLEX";
	if candidate-room is LOC_BEDQUILT:
		decide on "LOC_BEDQUILT";
	if candidate-room is LOC_SWISSCHEESE:
		decide on "LOC_SWISSCHEESE";
	if candidate-room is LOC_EASTEND:
		decide on "LOC_EASTEND";
	if candidate-room is LOC_SLAB:
		decide on "LOC_SLAB";
	if candidate-room is LOC_SECRET1:
		decide on "LOC_SECRET1";
	if candidate-room is LOC_SECRET2:
		decide on "LOC_SECRET2";
	if candidate-room is LOC_THREEJUNCTION:
		decide on "LOC_THREEJUNCTION";
	if candidate-room is LOC_LOWROOM:
		decide on "LOC_LOWROOM";
	if candidate-room is LOC_DEADCRAWL:
		decide on "LOC_DEADCRAWL";
	if candidate-room is LOC_SECRET3:
		decide on "LOC_SECRET3";
	if candidate-room is LOC_WIDEPLACE:
		decide on "LOC_WIDEPLACE";
	if candidate-room is LOC_TIGHTPLACE:
		decide on "LOC_TIGHTPLACE";
	if candidate-room is LOC_TALL:
		decide on "LOC_TALL";
	if candidate-room is LOC_BOULDERS1:
		decide on "LOC_BOULDERS1";
	if candidate-room is LOC_SEWER:
		decide on "LOC_SEWER";
	if candidate-room is LOC_ALIKE11:
		decide on "LOC_ALIKE11";
	if candidate-room is LOC_MAZEEND8:
		decide on "LOC_MAZEEND8";
	if candidate-room is LOC_MAZEEND9:
		decide on "LOC_MAZEEND9";
	if candidate-room is LOC_ALIKE12:
		decide on "LOC_ALIKE12";
	if candidate-room is LOC_ALIKE13:
		decide on "LOC_ALIKE13";
	if candidate-room is LOC_MAZEEND10:
		decide on "LOC_MAZEEND10";
	if candidate-room is LOC_MAZEEND11:
		decide on "LOC_MAZEEND11";
	if candidate-room is LOC_ALIKE14:
		decide on "LOC_ALIKE14";
	if candidate-room is LOC_NARROW:
		decide on "LOC_NARROW";
	if candidate-room is LOC_NOCLIMB:
		decide on "LOC_NOCLIMB";
	if candidate-room is LOC_PLANTTOP:
		decide on "LOC_PLANTTOP";
	if candidate-room is LOC_INCLINE:
		decide on "LOC_INCLINE";
	if candidate-room is LOC_GIANTROOM:
		decide on "LOC_GIANTROOM";
	if candidate-room is LOC_CAVEIN:
		decide on "LOC_CAVEIN";
	if candidate-room is LOC_IMMENSE:
		decide on "LOC_IMMENSE";
	if candidate-room is LOC_WATERFALL:
		decide on "LOC_WATERFALL";
	if candidate-room is LOC_SOFTROOM:
		decide on "LOC_SOFTROOM";
	if candidate-room is LOC_ORIENTAL:
		decide on "LOC_ORIENTAL";
	if candidate-room is LOC_MISTY:
		decide on "LOC_MISTY";
	if candidate-room is LOC_ALCOVE:
		decide on "LOC_ALCOVE";
	if candidate-room is LOC_PLOVER:
		decide on "LOC_PLOVER";
	if candidate-room is LOC_DARKROOM:
		decide on "LOC_DARKROOM";
	if candidate-room is LOC_ARCHED:
		decide on "LOC_ARCHED";
	if candidate-room is LOC_SHELLROOM:
		decide on "LOC_SHELLROOM";
	if candidate-room is LOC_SLOPING1:
		decide on "LOC_SLOPING1";
	if candidate-room is LOC_CULDESAC:
		decide on "LOC_CULDESAC";
	if candidate-room is LOC_ANTEROOM:
		decide on "LOC_ANTEROOM";
	if candidate-room is LOC_DIFFERENT1:
		decide on "LOC_DIFFERENT1";
	if candidate-room is LOC_WITTSEND:
		decide on "LOC_WITTSEND";
	if candidate-room is LOC_MIRRORCANYON:
		decide on "LOC_MIRRORCANYON";
	if candidate-room is LOC_WINDOW2:
		decide on "LOC_WINDOW2";
	if candidate-room is LOC_TOPSTALACTITE:
		decide on "LOC_TOPSTALACTITE";
	if candidate-room is LOC_DIFFERENT2:
		decide on "LOC_DIFFERENT2";
	if candidate-room is LOC_RESERVOIR:
		decide on "LOC_RESERVOIR";
	if candidate-room is LOC_MAZEEND12:
		decide on "LOC_MAZEEND12";
	if candidate-room is LOC_NE:
		decide on "LOC_NE";
	if candidate-room is LOC_SW:
		decide on "LOC_SW";
	if candidate-room is LOC_SWCHASM:
		decide on "LOC_SWCHASM";
	if candidate-room is LOC_WINDING:
		decide on "LOC_WINDING";
	if candidate-room is LOC_SECRET4:
		decide on "LOC_SECRET4";
	if candidate-room is LOC_SECRET5:
		decide on "LOC_SECRET5";
	if candidate-room is LOC_SECRET6:
		decide on "LOC_SECRET6";
	if candidate-room is LOC_NECHASM:
		decide on "LOC_NECHASM";
	if candidate-room is LOC_CORRIDOR:
		decide on "LOC_CORRIDOR";
	if candidate-room is LOC_FORK:
		decide on "LOC_FORK";
	if candidate-room is LOC_WARMWALLS:
		decide on "LOC_WARMWALLS";
	if candidate-room is LOC_BREATHTAKING:
		decide on "LOC_BREATHTAKING";
	if candidate-room is LOC_BOULDERS2:
		decide on "LOC_BOULDERS2";
	if candidate-room is LOC_LIMESTONE:
		decide on "LOC_LIMESTONE";
	if candidate-room is LOC_BARRENFRONT:
		decide on "LOC_BARRENFRONT";
	if candidate-room is LOC_BARRENROOM:
		decide on "LOC_BARRENROOM";
	if candidate-room is LOC_DIFFERENT3:
		decide on "LOC_DIFFERENT3";
	if candidate-room is LOC_DIFFERENT4:
		decide on "LOC_DIFFERENT4";
	if candidate-room is LOC_DIFFERENT5:
		decide on "LOC_DIFFERENT5";
	if candidate-room is LOC_DIFFERENT6:
		decide on "LOC_DIFFERENT6";
	if candidate-room is LOC_DIFFERENT7:
		decide on "LOC_DIFFERENT7";
	if candidate-room is LOC_DIFFERENT8:
		decide on "LOC_DIFFERENT8";
	if candidate-room is LOC_DIFFERENT9:
		decide on "LOC_DIFFERENT9";
	if candidate-room is LOC_DIFFERENT10:
		decide on "LOC_DIFFERENT10";
	if candidate-room is LOC_DIFFERENT11:
		decide on "LOC_DIFFERENT11";
	if candidate-room is LOC_DEADEND13:
		decide on "LOC_DEADEND13";
	if candidate-room is LOC_ROUGHHEWN:
		decide on "LOC_ROUGHHEWN";
	if candidate-room is LOC_BADDIRECTION:
		decide on "LOC_BADDIRECTION";
	if candidate-room is LOC_LARGE:
		decide on "LOC_LARGE";
	if candidate-room is LOC_STOREROOM:
		decide on "LOC_STOREROOM";
	if candidate-room is LOC_FOREST1:
		decide on "LOC_FOREST1";
	if candidate-room is LOC_FOREST2:
		decide on "LOC_FOREST2";
	if candidate-room is LOC_FOREST3:
		decide on "LOC_FOREST3";
	if candidate-room is LOC_FOREST4:
		decide on "LOC_FOREST4";
	if candidate-room is LOC_FOREST5:
		decide on "LOC_FOREST5";
	if candidate-room is LOC_FOREST6:
		decide on "LOC_FOREST6";
	if candidate-room is LOC_FOREST7:
		decide on "LOC_FOREST7";
	if candidate-room is LOC_FOREST8:
		decide on "LOC_FOREST8";
	if candidate-room is LOC_FOREST9:
		decide on "LOC_FOREST9";
	if candidate-room is LOC_FOREST10:
		decide on "LOC_FOREST10";
	if candidate-room is LOC_FOREST11:
		decide on "LOC_FOREST11";
	if candidate-room is LOC_FOREST12:
		decide on "LOC_FOREST12";
	if candidate-room is LOC_FOREST13:
		decide on "LOC_FOREST13";
	if candidate-room is LOC_FOREST14:
		decide on "LOC_FOREST14";
	if candidate-room is LOC_FOREST15:
		decide on "LOC_FOREST15";
	if candidate-room is LOC_FOREST16:
		decide on "LOC_FOREST16";
	if candidate-room is LOC_FOREST17:
		decide on "LOC_FOREST17";
	if candidate-room is LOC_FOREST18:
		decide on "LOC_FOREST18";
	if candidate-room is LOC_FOREST19:
		decide on "LOC_FOREST19";
	if candidate-room is LOC_FOREST20:
		decide on "LOC_FOREST20";
	if candidate-room is LOC_FOREST21:
		decide on "LOC_FOREST21";
	if candidate-room is LOC_FOREST22:
		decide on "LOC_FOREST22";
	if candidate-room is LOC_LEDGE:
		decide on "LOC_LEDGE";
	if candidate-room is LOC_RESBOTTOM:
		decide on "LOC_RESBOTTOM";
	if candidate-room is LOC_RESNORTH:
		decide on "LOC_RESNORTH";
	if candidate-room is LOC_TREACHEROUS:
		decide on "LOC_TREACHEROUS";
	if candidate-room is LOC_STEEP:
		decide on "LOC_STEEP";
	if candidate-room is LOC_CLIFFBASE:
		decide on "LOC_CLIFFBASE";
	if candidate-room is LOC_CLIFFACE:
		decide on "LOC_CLIFFACE";
	if candidate-room is LOC_FOOTSLIP:
		decide on "LOC_FOOTSLIP";
	if candidate-room is LOC_CLIFFTOP:
		decide on "LOC_CLIFFTOP";
	if candidate-room is LOC_CLIFFLEDGE:
		decide on "LOC_CLIFFLEDGE";
	if candidate-room is LOC_REACHDEAD:
		decide on "LOC_REACHDEAD";
	if candidate-room is LOC_GRUESOME:
		decide on "LOC_GRUESOME";
	if candidate-room is LOC_FOOF1:
		decide on "LOC_FOOF1";
	if candidate-room is LOC_FOOF2:
		decide on "LOC_FOOF2";
	if candidate-room is LOC_FOOF3:
		decide on "LOC_FOOF3";
	if candidate-room is LOC_FOOF4:
		decide on "LOC_FOOF4";
	if candidate-room is LOC_FOOF5:
		decide on "LOC_FOOF5";
	if candidate-room is LOC_FOOF6:
		decide on "LOC_FOOF6";
	decide on the normalized adventure id from the printed name of candidate-room.
[ Generated Objects ]
[ Object role taxonomy ]
[ treasure: object with adventure.yaml treasure: true ]
[ portable: movable items (default unless special-cased) ]
[ scenery: static environmental objects ]
[ puzzle: mutable objects with states/changes/sounds/texts ]
[ infrastructure: immovable support objects in the physical model ]
[ creature: active actor entities ]
[ unknown: unrepresentable/placeholder entries ]

[ role summary ]
[ unknown=1 | treasure=20 | portable=17 | scenery=5 | puzzle=16 | infrastructure=4 | creature=7 ]

[ Role: treasure ]
[ NUGGET ]
[ role=treasure ]
[ initial_location=LOC_NUGGET ]
[ vocabulary=gold, nugge ]
[ inventory=Large gold nugget ]
NUGGET is a thing.
The description of NUGGET is "There is a large sparkling nugget of gold here!".
NUGGET is in LOC_NUGGET.
[ scoring_candidate: true ]

[ OBJ_51 ]
[ role=treasure ]
[ initial_location=LOC_WESTBANK ]
[ vocabulary=diamo ]
[ inventory=Several diamonds ]
OBJ_51 is a thing.
The description of OBJ_51 is "There are diamonds here!".
OBJ_51 is in LOC_WESTBANK.
[ scoring_candidate: true ]

[ OBJ_52 ]
[ role=treasure ]
[ initial_location=LOC_FLOORHOLE ]
[ vocabulary=silve, bars ]
[ inventory=Bars of silver ]
OBJ_52 is a thing.
The description of OBJ_52 is "There are bars of silver here!".
OBJ_52 is in LOC_FLOORHOLE.
[ scoring_candidate: true ]

[ OBJ_53 ]
[ role=treasure ]
[ initial_location=LOC_SOUTHSIDE ]
[ vocabulary=jewel ]
[ inventory=Precious jewelry ]
OBJ_53 is a thing.
The description of OBJ_53 is "There is precious jewelry here!".
OBJ_53 is in LOC_SOUTHSIDE.
[ scoring_candidate: true ]

[ COINS ]
[ role=treasure ]
[ initial_location=LOC_WESTSIDE ]
[ vocabulary=coins ]
[ inventory=Rare coins ]
COINS is a thing.
The description of COINS is "There are many coins here!".
COINS is in LOC_WESTSIDE.
[ scoring_candidate: true ]

[ CHEST ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=chest, box, treas ]
[ inventory=Treasure chest ]
CHEST is a thing.
The description of CHEST is "The pirate's treasure chest is here!".
[ scoring_candidate: true ]

[ EGGS ]
[ role=treasure ]
[ initial_location=LOC_GIANTROOM ]
[ vocabulary=eggs, egg, nest ]
[ inventory=Golden eggs ]
[ states=EGGS_HERE, EGGS_VANISHED, EGGS_DONE ]
EGGS is a thing.
The description of EGGS is "There is a large nest here, full of golden eggs!".
EGGS is in LOC_GIANTROOM.
[ scoring_candidate: true ]

[ TRIDENT ]
[ role=treasure ]
[ initial_location=LOC_WATERFALL ]
[ vocabulary=tride ]
[ inventory=Jeweled trident ]
TRIDENT is a thing.
The description of TRIDENT is "There is a jewel-encrusted trident here!".
TRIDENT is in LOC_WATERFALL.
[ scoring_candidate: true ]

[ VASE ]
[ role=treasure ]
[ initial_location=LOC_ORIENTAL ]
[ vocabulary=vase, ming, shard, potte ]
[ inventory=Ming vase ]
[ states=VASE_WHOLE, VASE_DROPPED, VASE_BROKEN ]
[ changes=The vase is now resting, delicately, on a velvet pillow., The ming vase drops with a delicate crash., You have taken the vase and hurled it delicately to the ground. ]
VASE is a thing.
The description of VASE is "There is a delicate, precious, ming vase here!".
VASE is in LOC_ORIENTAL.
[ scoring_candidate: true ]

[ EMERALD ]
[ role=treasure ]
[ initial_location=LOC_PLOVER ]
[ vocabulary=emera ]
[ inventory=Egg-sized emerald ]
EMERALD is a thing.
The description of EMERALD is "There is an emerald here the size of a plover's egg!".
EMERALD is in LOC_PLOVER.
[ scoring_candidate: true ]

[ PYRAMID ]
[ role=treasure ]
[ initial_location=LOC_DARKROOM ]
[ vocabulary=plati, pyram ]
[ inventory=Platinum pyramid ]
PYRAMID is a thing.
The description of PYRAMID is "There is a platinum pyramid here, 8 inches on a side!".
PYRAMID is in LOC_DARKROOM.
[ scoring_candidate: true ]

[ PEARL ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=pearl ]
[ inventory=Glistening pearl ]
PEARL is a thing.
The description of PEARL is "Off to one side lies a glistening pearl!".
[ scoring_candidate: true ]

[ RUG ]
[ role=treasure ]
[ initial_location=LOC_SECRET4 ]
[ alternate_locations=LOC_SECRET6 ]
[ vocabulary=rug, persi ]
[ inventory=Persian rug ]
[ states=RUG_FLOOR, RUG_DRAGON, RUG_HOVER ]
RUG is a thing.
The description of RUG is "There is a Persian rug spread out on the floor!".
RUG is in LOC_SECRET4.
[ scoring_candidate: true ]

[ OBJ_63 ]
[ role=treasure ]
[ initial_location=LOC_BOULDERS2 ]
[ vocabulary=spice ]
[ inventory=Rare spices ]
OBJ_63 is a thing.
The description of OBJ_63 is "There are rare spices here!".
OBJ_63 is in LOC_BOULDERS2.
[ scoring_candidate: true ]

[ CHAIN ]
[ role=treasure ]
[ initial_location=LOC_BARRENROOM ]
[ vocabulary=chain ]
[ inventory=Golden chain ]
[ states=CHAIN_HEAP, CHAINING_BEAR, CHAIN_FIXED ]
CHAIN is a thing.
The description of CHAIN is "There is a golden chain lying in a heap on the floor!".
CHAIN is in LOC_BARRENROOM.
[ scoring_candidate: true ]

[ RUBY ]
[ role=treasure ]
[ initial_location=LOC_STOREROOM ]
[ vocabulary=ruby ]
[ inventory=Giant ruby ]
RUBY is a thing.
The description of RUBY is "There is an enormous ruby here!".
RUBY is in LOC_STOREROOM.
[ scoring_candidate: true ]

[ JADE ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=jade, neckl ]
[ inventory=Jade necklace ]
JADE is a thing.
The description of JADE is "A precious jade necklace has been dropped here!".
[ scoring_candidate: true ]

[ AMBER ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=amber, gemst ]
[ inventory=Amber gemstone ]
[ states=AMBER_IN_URN, AMBER_IN_ROCK ]
AMBER is a thing.
The description of AMBER is "There is a rare amber gemstone here!".
[ scoring_candidate: true ]

[ SAPPH ]
[ role=treasure ]
[ initial_location=LOC_LEDGE ]
[ vocabulary=sapph ]
[ inventory=Star sapphire ]
SAPPH is a thing.
The description of SAPPH is "A brilliant blue star sapphire is here!".
SAPPH is in LOC_LEDGE.
[ scoring_candidate: true ]

[ OBJ_69 ]
[ role=treasure ]
[ initial_location=LOC_REACHDEAD ]
[ vocabulary=ebony, statu ]
[ inventory=Ebony statuette ]
OBJ_69 is a thing.
The description of OBJ_69 is "There is a richly-carved ebony statuette here!".
OBJ_69 is in LOC_REACHDEAD.
[ scoring_candidate: true ]

[ Role: portable ]
[ KEYS ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=keys, key ]
[ inventory=Set of keys ]
KEYS is a thing.
The description of KEYS is "There are some keys on the ground here.".
KEYS is in LOC_BUILDING.

[ LAMP ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=lamp, lante ]
[ inventory=Brass lantern ]
[ states=LAMP_DARK, LAMP_BRIGHT ]
[ changes=Your lamp is now off., Your lamp is now on. ]
LAMP is a thing.
The description of LAMP is "There is a shiny brass lamp nearby.".
LAMP is in LOC_BUILDING.

[ CAGE ]
[ role=portable ]
[ initial_location=LOC_COBBLE ]
[ vocabulary=cage ]
[ inventory=Wicker cage ]
CAGE is a thing.
The description of CAGE is "There is a small wicker cage discarded nearby.".
CAGE is in LOC_COBBLE.

[ ROD ]
[ role=portable ]
[ initial_location=LOC_DEBRIS ]
[ vocabulary=rod ]
[ inventory=Black rod ]
ROD is a thing.
The description of ROD is "A three foot black rod with a rusty star on an end lies nearby.".
ROD is in LOC_DEBRIS.

[ ROD2 ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=rod ]
[ inventory=Black rod ]
ROD2 is a thing.
The description of ROD2 is "A three foot black rod with a rusty mark on an end lies nearby.".

[ BIRD ]
[ role=portable ]
[ initial_location=LOC_BIRDCHAMBER ]
[ vocabulary=bird ]
[ inventory=Little bird in cage ]
[ states=BIRD_UNCAGED, BIRD_CAGED, BIRD_FOREST_UNCAGED ]
[ sounds=The bird's singing is quite melodious., The bird does not seem inclined to sing while in the cage., It almost seems as though the bird is trying to tell you something., To your surprise, you can understand the bird's chirping; it is\nsinging about the joys of its forest home., The bird does not seem inclined to sing while in the cage., The bird is singing to you in gratitude for your having returned it to\nits home.  In return, it informs you of a magic word which it thinks\nyou may find useful somewhere near the Hall of Mists.  The magic word\nchanges frequently, but for now the bird believes it is '%s'.  You\nthank the bird for this information, and it flies off into the forest. ]
BIRD is a thing.
The description of BIRD is "A cheerful little bird is sitting here singing.".
BIRD is in LOC_BIRDCHAMBER.

[ PILLOW ]
[ role=portable ]
[ initial_location=LOC_SOFTROOM ]
[ vocabulary=pillo, velve ]
[ inventory=Velvet pillow ]
PILLOW is a thing.
The description of PILLOW is "A small velvet pillow lies on the floor.".
PILLOW is in LOC_SOFTROOM.

[ OYSTER ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=oyste ]
[ inventory=Giant oyster  >GROAN!< ]
[ sounds=Even though it's an oyster, the critter's as tight-mouthed as a clam., It says the same thing it did before.  Hm, maybe it's a pun? ]
OYSTER is a thing.
The description of OYSTER is "There is an enormous oyster here with its shell tightly closed.".

[ MAGAZINE ]
[ role=portable ]
[ initial_location=LOC_ANTEROOM ]
[ vocabulary=magaz, issue, spelu, "spel ]
[ inventory='Spelunker Today' ]
[ texts=I'm afraid the magazine is written in dwarvish.  But penciled on one\ncover you see, 'Please leave the magazines at the construction site.' ]
MAGAZINE is a thing.
The description of MAGAZINE is "There are a few recent issues of 'Spelunker Today' magazine here.".
MAGAZINE is in LOC_ANTEROOM.

[ KNIFE ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=knife, knive ]
KNIFE is a thing.

[ FOOD ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=food, ratio ]
[ inventory=Tasty food ]
FOOD is a thing.
The description of FOOD is "There is food here.".
FOOD is in LOC_BUILDING.

[ BOTTLE ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=bottl, jar ]
[ inventory=Small bottle ]
[ states=WATER_BOTTLE, EMPTY_BOTTLE, OIL_BOTTLE ]
[ changes=Your bottle is now full of water., The bottle of water is now empty., Your bottle is now full of oil. ]
BOTTLE is a thing.
The description of BOTTLE is "There is a bottle of water here.".
BOTTLE is in LOC_BUILDING.

[ WATER ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=water, h2o ]
[ inventory=Water in the bottle ]
WATER is a thing.

[ OIL ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=oil ]
[ inventory=Oil in the bottle ]
OIL is a thing.

[ AXE ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=axe ]
[ inventory=Dwarf's axe ]
[ states=AXE_HERE, AXE_LOST ]
[ changes=The axe misses and lands near the bear where you can't get at it. ]
AXE is a thing.
The description of AXE is "There is a little axe here.".

[ BATTERY ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=batte ]
[ inventory=Batteries ]
[ states=FRESH_BATTERIES, DEAD_BATTERIES ]
BATTERY is a thing.
The description of BATTERY is "There are fresh batteries here.".

[ RABBITFOOT ]
[ role=portable ]
[ initial_location=LOC_FOREST22 ]
[ vocabulary=appen, lepor ]
[ inventory=Leporine appendage ]
RABBITFOOT is a thing.
The description of RABBITFOOT is "Your keen eye spots a severed leporine appendage lying on the ground.".
RABBITFOOT is in LOC_FOREST22.

[ Role: scenery ]
[ CLAM ]
[ role=scenery ]
[ initial_location=LOC_SHELLROOM ]
[ vocabulary=clam ]
[ inventory=Giant clam  >GRUNT!< ]
[ sounds=The clam is as tight-mouthed as a, er, clam. ]
CLAM is a scenery.
CLAM is fixed in place.
The description of CLAM is "There is an enormous clam here with its shell tightly closed.".
CLAM is in LOC_SHELLROOM.

[ OBJ_26 ]
[ role=scenery ]
[ initial_location=LOC_TOPSTALACTITE ]
[ vocabulary=stala ]
[ inventory=*stalactite ]
OBJ_26 is a scenery.
OBJ_26 is fixed in place.
OBJ_26 is in LOC_TOPSTALACTITE.

[ OBJ_27 ]
[ role=scenery ]
[ initial_location=LOC_WINDOW1 ]
[ alternate_locations=LOC_WINDOW2 ]
[ vocabulary=shado, figur, windo ]
[ inventory=*shadowy figure and/or window ]
OBJ_27 is a scenery.
OBJ_27 is fixed in place.
The description of OBJ_27 is "The shadowy figure seems to be trying to attract your attention.".
OBJ_27 is in LOC_WINDOW1.

[ OBJ_29 ]
[ role=scenery ]
[ initial_location=LOC_ORIENTAL ]
[ vocabulary=drawi ]
[ inventory=*cave drawings ]
OBJ_29 is a scenery.
OBJ_29 is fixed in place.
OBJ_29 is in LOC_ORIENTAL.

[ BLOOD ]
[ role=scenery ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=blood ]
[ inventory=*blood ]
BLOOD is a scenery.
BLOOD is fixed in place.

[ Role: puzzle ]
[ GRATE ]
[ role=puzzle ]
[ initial_location=LOC_GRATE ]
[ alternate_locations=LOC_BELOWGRATE ]
[ vocabulary=grate ]
[ inventory=*grate ]
[ states=GRATE_CLOSED, GRATE_OPEN ]
[ changes=The grate is now locked., The grate is now unlocked. ]
GRATE is a thing.
GRATE is fixed in place.
The description of GRATE is "The grate is locked.".
GRATE is in LOC_GRATE.

[ STEPS ]
[ role=puzzle ]
[ initial_location=LOC_PITTOP ]
[ alternate_locations=LOC_MISTHALL ]
[ vocabulary=steps ]
[ inventory=*steps ]
[ states=STEPS_DOWN, STEPS_UP ]
STEPS is a thing.
STEPS is fixed in place.
The description of STEPS is "Rough stone steps lead down the pit.".
STEPS is in LOC_PITTOP.

[ DOOR ]
[ role=puzzle ]
[ initial_location=LOC_IMMENSE ]
[ vocabulary=door ]
[ inventory=*rusty door ]
[ states=the door object_RUSTED, the door object_UNRUSTED ]
[ changes=The hinges are quite thoroughly rusted now and won't budge., The oil has freed up the hinges so that the door will now move,\nalthough it requires some effort. ]
The door object is a thing.
the door object is fixed in place.
The description of the door object is "The way north is barred by a massive, rusty, iron door.".
the door object is in LOC_IMMENSE.

[ FISSURE ]
[ role=puzzle ]
[ initial_location=LOC_EASTBANK ]
[ alternate_locations=LOC_WESTBANK ]
[ vocabulary=fissu ]
[ inventory=*fissure ]
[ states=UNBRIDGED, BRIDGED ]
[ changes=The crystal bridge has vanished!, A crystal bridge now spans the fissure. ]
FISSURE is a thing.
FISSURE is fixed in place.
The description of FISSURE is "A crystal bridge spans the fissure.".
FISSURE is in LOC_EASTBANK.

[ OBJ_13 ]
[ role=puzzle ]
[ initial_location=LOC_DARKROOM ]
[ vocabulary=table ]
[ inventory=*stone tablet ]
[ texts='Congratulations on bringing light into the dark-room!' ]
OBJ_13 is a thing.
OBJ_13 is fixed in place.
The description of OBJ_13 is "A massive stone tablet embedded in the wall reads:\n'Congratulations on bringing light into the dark-room!'".
OBJ_13 is in LOC_DARKROOM.

[ MIRROR ]
[ role=puzzle ]
[ initial_location=LOC_MIRRORCANYON ]
[ vocabulary=mirro ]
[ inventory=*mirror ]
[ states=MIRROR_UNBROKEN, MIRROR_BROKEN ]
[ changes=You strike the mirror a resounding blow, whereupon it shatters into a\nmyriad tiny fragments. ]
MIRROR is a thing.
MIRROR is fixed in place.
MIRROR is in LOC_MIRRORCANYON.

[ PLANT ]
[ role=puzzle ]
[ initial_location=LOC_WESTPIT ]
[ vocabulary=plant, beans ]
[ inventory=*plant ]
[ states=PLANT_THIRSTY, PLANT_BELLOWING, PLANT_GROWN ]
[ changes=You've over-watered the plant!  It's shriveling up!  And now . . ., The plant spurts into furious growth for a few seconds., The plant grows explosively, almost filling the bottom of the pit. ]
[ sounds=The plant continues to ask plaintively for water., The plant continues to demand water., The plant now maintains a contented silence. ]
PLANT is a thing.
PLANT is fixed in place.
The description of PLANT is "There is a tiny little plant in the pit, murmuring 'water, water, ...'".
PLANT is in LOC_WESTPIT.

[ CHASM ]
[ role=puzzle ]
[ initial_location=LOC_SWCHASM ]
[ alternate_locations=LOC_NECHASM ]
[ vocabulary=chasm ]
[ inventory=*chasm ]
[ states=TROLL_BRIDGE, BRIDGE_WRECKED ]
[ changes=Just as you reach the other side, the bridge buckles beneath the\nweight of the bear, which was still following you around.  You\nscrabble desperately for support, but as the bridge collapses you\nstumble back and fall into the chasm. ]
CHASM is a thing.
CHASM is fixed in place.
The description of CHASM is "A rickety wooden bridge extends across the chasm, vanishing into the\nmist.  A notice posted on the bridge reads, 'Stop! Pay troll!'".
CHASM is in LOC_SWCHASM.

[ MESSAG ]
[ role=puzzle ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=messa ]
[ inventory=*message in second maze ]
[ texts='This is not the maze where the pirate leaves his treasure chest.' ]
MESSAG is a thing.
MESSAG is fixed in place.
The description of MESSAG is "There is a message scrawled in the dust in a flowery script, reading:\n'This is not the maze where the pirate leaves his treasure chest.'".

[ VEND ]
[ role=puzzle ]
[ initial_location=LOC_DEADEND13 ]
[ vocabulary=machi, vendi ]
[ inventory=*vending machine ]
[ states=VEND_BLOCKS, VEND_UNBLOCKS ]
[ changes=The vending machine swings back to block the passage., As you strike the vending machine, it pivots backward along with a\nsection of wall, revealing a dark passage leading south. ]
[ texts='Drop coins here to receive fresh batteries.', 'Drop coins here to receive fresh batteries.' ]
VEND is a thing.
VEND is fixed in place.
The description of VEND is "There is a massive and somewhat battered vending machine here.  The\ninstructions on it read: 'Drop coins here to receive fresh batteries.'".
VEND is in LOC_DEADEND13.

[ URN ]
[ role=puzzle ]
[ initial_location=LOC_CLIFF ]
[ vocabulary=urn ]
[ inventory=*urn ]
[ states=URN_EMPTY, URN_DARK, URN_LIT ]
[ changes=The urn is empty and will not light., The urn is now dark., The urn is now lit. ]
URN is a thing.
URN is fixed in place.
The description of URN is "A small urn is embedded in the rock.".
URN is in LOC_CLIFF.

[ CAVITY ]
[ role=puzzle ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=cavit ]
[ inventory=*cavity ]
[ states=CAVITY_FULL, CAVITY_EMPTY ]
CAVITY is a thing.
CAVITY is fixed in place.
The description of CAVITY is "There is a small urn-shaped cavity in the rock.".

[ RESER ]
[ role=puzzle ]
[ initial_location=LOC_RESERVOIR ]
[ alternate_locations=LOC_RESNORTH ]
[ vocabulary=reser ]
[ inventory=*reservoir ]
[ states=WATERS_UNPARTED, WATERS_PARTED ]
[ changes=The waters crash together again., The waters have parted to form a narrow path across the reservoir. ]
RESER is a thing.
RESER is fixed in place.
The description of RESER is "The waters have parted to form a narrow path across the reservoir.".
RESER is in LOC_RESERVOIR.

[ OBJ_47 ]
[ role=puzzle ]
[ initial_location=LOC_DEBRIS ]
[ vocabulary=mud ]
[ inventory=*mud ]
[ texts='MAGIC WORD XYZZY' ]
OBJ_47 is a thing.
OBJ_47 is fixed in place.
OBJ_47 is in LOC_DEBRIS.

[ OBJ_48 ]
[ role=puzzle ]
[ initial_location=LOC_NUGGET ]
[ vocabulary=note ]
[ inventory=*note ]
[ texts='You won't get it up the steps' ]
OBJ_48 is a thing.
OBJ_48 is fixed in place.
OBJ_48 is in LOC_NUGGET.

[ SIGN ]
[ role=puzzle ]
[ initial_location=LOC_ANTEROOM ]
[ vocabulary=sign ]
[ inventory=*sign ]
[ states=INGAME_SIGN, ENDGAME_SIGN ]
[ texts=Cave under construction beyond this point.\n           Proceed at own risk.\n       [Witt Construction Company], 'Treasure Vault.  Keys in main office.' ]
SIGN is a thing.
SIGN is fixed in place.
SIGN is in LOC_ANTEROOM.

[ Role: infrastructure ]
[ PLANT2 ]
[ role=infrastructure ]
[ initial_location=LOC_WESTEND ]
[ alternate_locations=LOC_EASTEND ]
[ vocabulary=plant ]
[ inventory=*phony plant ]
PLANT2 is a thing.
PLANT2 is fixed in place.
The description of PLANT2 is "The top of a 12-foot-tall beanstalk is poking out of the west pit.".
PLANT2 is in LOC_WESTEND.

[ OBJ_30 ]
[ role=infrastructure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=pirat, genie, djinn ]
[ inventory=*pirate/genie ]
OBJ_30 is a thing.
OBJ_30 is fixed in place.

[ VOLCANO ]
[ role=infrastructure ]
[ initial_location=LOC_BREATHTAKING ]
[ vocabulary=volca, geyse ]
[ inventory=*volcano and/or geyser ]
VOLCANO is a thing.
VOLCANO is fixed in place.
VOLCANO is in LOC_BREATHTAKING.

[ OBJ_40 ]
[ role=infrastructure ]
[ initial_location=LOC_SOFTROOM ]
[ vocabulary=carpe, moss ]
[ inventory=*carpet and/or moss and/or curtains ]
OBJ_40 is a thing.
OBJ_40 is fixed in place.
OBJ_40 is in LOC_SOFTROOM.

[ Role: creature ]
[ SNAKE ]
[ role=creature ]
[ initial_location=LOC_KINGHALL ]
[ vocabulary=snake ]
[ inventory=*snake ]
[ states=SNAKE_BLOCKS, SNAKE_CHASED ]
[ sounds=The snake is hissing venomously. ]
SNAKE is a thing.
SNAKE is fixed in place.
The description of SNAKE is "A huge green fierce snake bars the way!".
SNAKE is in LOC_KINGHALL.

[ DWARF ]
[ role=creature ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=dwarf, dwarv ]
DWARF is a thing.
DWARF is fixed in place.

[ DRAGON ]
[ role=creature ]
[ initial_location=LOC_SECRET4 ]
[ alternate_locations=LOC_SECRET6 ]
[ vocabulary=drago ]
[ inventory=*dragon ]
[ states=DRAGON_BARS, DRAGON_DEAD, DRAGON_BLOODLESS ]
[ changes=Congratulations!  You have just vanquished a dragon with your bare\nhands!  (Unbelievable, isn't it?), Your head buzzes strangely for a moment. ]
[ sounds=The dragon's ominous hissing does not bode well for you., The dragon is, not surprisingly, silent., The dragon is, not surprisingly, silent. ]
DRAGON is a thing.
DRAGON is fixed in place.
The description of DRAGON is "A huge green fierce dragon bars the way!".
DRAGON is in LOC_SECRET4.

[ TROLL ]
[ role=creature ]
[ initial_location=LOC_SWCHASM ]
[ alternate_locations=LOC_NECHASM ]
[ vocabulary=troll ]
[ inventory=*troll ]
[ states=TROLL_UNPAID, TROLL_PAIDONCE, TROLL_GONE ]
[ changes=The bear lumbers toward the troll, who lets out a startled shriek and\nscurries away.  The bear soon gives up the pursuit and wanders back. ]
[ sounds=The troll sounds quite adamant in his demand for a treasure., The troll sounds quite adamant in his demand for a treasure. ]
TROLL is a thing.
TROLL is fixed in place.
The description of TROLL is "A burly troll stands by the bridge and insists you throw him a\ntreasure before you may cross.".
TROLL is in LOC_SWCHASM.

[ TROLL2 ]
[ role=creature ]
[ initial_location=LOC_NOWHERE ]
[ alternate_locations=LOC_NOWHERE ]
[ vocabulary=troll ]
[ inventory=*phony troll ]
TROLL2 is a thing.
TROLL2 is fixed in place.
The description of TROLL2 is "The troll is nowhere to be seen.".

[ BEAR ]
[ role=creature ]
[ initial_location=LOC_BARRENROOM ]
[ vocabulary=bear ]
[ states=UNTAMED_BEAR, SITTING_BEAR, CONTENTED_BEAR, BEAR_DEAD ]
[ changes=The bear eagerly wolfs down your food, after which he seems to calm\ndown considerably and even becomes rather friendly. ]
BEAR is a thing.
BEAR is fixed in place.
The description of BEAR is "There is a ferocious cave bear eyeing you from the far end of the room!".
BEAR is in LOC_BARRENROOM.

[ OGRE ]
[ role=creature ]
[ initial_location=LOC_LARGE ]
[ vocabulary=ogre ]
[ inventory=*ogre ]
[ sounds=The ogre is apparently the strong, silent type. ]
OGRE is a thing.
OGRE is fixed in place.
The description of OGRE is "A formidable ogre bars the northern exit.".
OGRE is in LOC_LARGE.

[ Role: unknown ]
[ NO_OBJECT ]
[ role=unknown ]
[ vocabulary= ]
[ unsupported placeholder entry ]
[ Generated Vocabulary ]
[ Adventure vocabulary is canonical: source/adventure.yaml ]
[ Taxonomy ]
[ motion: movement-trigger words ]
[ action: command-verb words ]
[ object: object noun words ]
[ magic: tokens that trigger magic-like behavior ]
[ abbreviation: compact input forms preserved from classic parser ]
[ historical_shortcut: one-char/legacy convenience token from classic Adventure ]

[ section summaries ]
[ motions: entries=76 unique_tokens=105 ]
[ actions: entries=58 unique_tokens=119 ]
[ objects: entries=70 unique_tokens=100 ]
[ total_unique_vocabulary=321 motion_words=105 action_words=119 object_words=100 magic_words=9 ]
[ abbreviations=22 historical_shortcuts=18 ]
[ noaction_actions=16 oldstyle_false_actions=3 oldstyle_false_motions=1 ]

[ direction-like motion words ]
[ above←UP, ascen←UP, d←DOWN, desce←DOWN, down←DOWN, downw←DOWN, e←EAST, east←EAST, exit←OUTSIDE, in←INSIDE, insid←INSIDE, inwar←INSIDE, leave←OUTSIDE, n←NORTH, ne←NE, north←NORTH, nw←NW, out←OUTSIDE, outsi←OUTSIDE, s←SOUTH, se←SE, south←SOUTH, sw←SW, u←UP, up←UP, upwar←UP, w←WEST, west←WEST ]
[ location-like motion words ]
[ acros←MOT_42, awkwa←MOT_26, back←BACK, barre←MOT_40, bed←MOT_16, bedqu←BEDQUILT, broke←MOT_54, build←MOT_12, canyo←MOT_25, cave←CAVE, caver←CAVERN, climb←MOT_56, cobbl←MOT_18, conti←FORWARD, crack←MOT_33, crawl←CRAWL, cross←CROSS, dark←MOT_22, debri←MOT_51, depre←DEPRESSION, descr←LOOK, dome←MOT_35, downs←MOT_5, enter←ENTER, entra←ENTRANCE, exami←LOOK, floor←MOT_58, fores←MOT_6, fork←MOT_15, forwa←FORWARD, giant←MOT_27, gully←MOT_13, hall←MOT_38, hill←MOT_2, hole←MOT_52, house←MOT_12, jump←MOT_39, l←LOOK, left←LEFT, look←LOOK, low←MOT_24, main←OFFICE, nowhe←NUL, null←NUL, offic←OFFICE, onwar←FORWARD, orien←ORIENTAL, outdo←MOT_32, over←MOT_41, passa←MOT_23, pit←MOT_31, plove←PLOVER, plugh←PLUGH, reser←RESERVOIR, retre←BACK, retur←BACK, right←RIGHT, road←MOT_2, room←MOT_59, secre←MOT_66, shell←SHELLROOM, slab←MOT_61, slabr←MOT_61, slit←MOT_60, stair←MOT_10, steps←MOT_34, strea←STREAM, surfa←MOT_20, touch←LOOK, tunne←MOT_23, upstr←MOT_4, valle←MOT_9, view←MOT_28, wall←MOT_53, x←LOOK, xyzzy←XYZZY, y2←MOT_55 ]
[ magic words ]
[ abra, abrac, hocus, opens, plugh, pocus, sesam, shaza, xyzzy ]
[ abbreviations ]
[ ?, d, e, g, go, i, in, l, n, ne, no, nw, on, s, se, sw, u, up, w, x, y2, z ]
[ historical shortcuts ]
[ ?, d, e, g, i, in, l, n, ne, nw, out, s, se, sw, u, w, x, z ]
[ token collisions across motion/action/object ]
[ conti: action/motion ]
[ reser: motion/object ]
[ steps: motion/object ]
[ irregular entries ]
[ motion_no_words=HERE, MOT_0 ]
[ action_no_words=ACT_NULL, ACT_UNKNOWN ]

[ action classification notes ]
[ message_only_actions=THANKYOU, INVALIDMAGIC, HELP, NO, TREE, DIG, LOST, MIST, FBOMB, STOP, INFO, SWIM, WIZARD, YES, NEWS, ACT_VERSION ]
[ oldstyle_false_actions=CARRY, NOTHING, INVENTORY ]
[ oldstyle_false_motions=LOOK ]

[ modern parser equivalents ]
[ These can be generated as convenience aliases once parser wiring exists. ]
[ CARRY: I7 take/get ]
[ DROP: I7 drop ]
[ FEE: I7 say word without gameplay effect ]
[ FIE: I7 say word without gameplay effect ]
[ FOE: I7 say word without gameplay effect ]
[ FOO: I7 say word without gameplay effect ]
[ FUM: I7 say word without gameplay effect ]
[ GO: I7 go/walk/travel ]
[ INVENTORY: I7 inventory ]
[ LOCK: I7 close/lock ]
[ LOOK: I7 look/examine ]
[ READ: I7 read ]
[ RESUME: I7 restore/restart command ]
[ SAVE: I7 save command ]
[ SAY: I7 say ]
[ UNLOCK: I7 open/lock ]

[ special parser handling required ]
[ location-like motion tokens ]
[ non-direction tokens should be routed to a generated travel dispatcher ]
[ shared tokens between sections require disambiguation context ]
[ invalid magic and version/info/news/help/no/yes/wiz commands are message-only ]
[ synonym groups ]
[ motion groups=17 ]
[ MOT_2: road | hill ]
[ FORWARD: forwa | conti | onwar ]
[ BACK: back | retur | retre ]
[ OUTSIDE: out | outsi | exit | leave ]
[ MOT_12: build | house ]
[ INSIDE: inwar | insid | in ]
[ NUL: null | nowhe ]
[ MOT_23: passa | tunne ]
[ UP: upwar | up | u | above | ascen ]
[ DOWN: d | downw | down | desce ]
[ EAST: east | e ]
[ WEST: west | w ]
[ NORTH: north | n ]
[ SOUTH: south | s ]
[ LOOK: l | x | look | exami | touch | descr ]
[ MOT_61: slab | slabr ]
[ OFFICE: main | offic ]
[ action groups=27 ]
[ CARRY: g | carry | take | keep | catch | steal | captu | get | tote | snarf ]
[ DROP: drop | relea | free | disca | dump ]
[ SAY: say | chant | sing | utter | mumbl ]
[ UNLOCK: unloc | open ]
[ NOTHING: z | nothi ]
[ LOCK: lock | close ]
[ LIGHT: light | on ]
[ EXTINGUISH: extin | off ]
[ WAVE: wave | shake | swing ]
[ TAME: calm | placa | tame ]
[ GO: walk | run | trave | go | proce | conti | explo | follo | turn ]
[ ATTACK: attac | kill | fight | hit | strik | slay ]
[ EAT: eat | devou ]
[ THROW: throw | toss ]
[ FIND: find | where ]
[ INVENTORY: i | inven ]
[ BLAST: blast | deton | ignit | blowu ]
[ READ: read | perus ]
[ BREAK: break | shatt | smash ]
[ WAKE: wake | distu ]
[ SAVE: suspe | pause | save ]
[ RESUME: resum | resta ]
[ INVALIDMAGIC: sesam | opens | abra | abrac | shaza | hocus | pocus ]
[ HELP: help | ? ]
[ TREE: tree | trees ]
[ DIG: dig | excav ]
[ INFO: info | infor ]
[ object groups=26 ]
[ KEYS: keys | key ]
[ LAMP: lamp | lante ]
[ PILLOW: pillo | velve ]
[ MAGAZINE: magaz | issue | spelu | 'spel ]
[ DWARF: dwarf | dwarv ]
[ KNIFE: knife | knive ]
[ FOOD: food | ratio ]
[ BOTTLE: bottl | jar ]
[ WATER: water | h2o ]
[ PLANT: plant | beans ]
[ OBJ_27: shado | figur | windo ]
[ OBJ_30: pirat | genie | djinn ]
[ VOLCANO: volca | geyse ]
[ VEND: machi | vendi ]
[ OBJ_40: carpe | moss ]
[ RABBITFOOT: appen | lepor ]
[ NUGGET: gold | nugge ]
[ OBJ_52: silve | bars ]
[ CHEST: chest | box | treas ]
[ EGGS: eggs | egg | nest ]
[ VASE: vase | ming | shard | potte ]
[ PYRAMID: plati | pyram ]
[ RUG: rug | persi ]
[ JADE: jade | neckl ]
[ AMBER: amber | gemst ]
[ OBJ_69: ebony | statu ]

[ motion vocabulary ]
[ MOT_0 | travel | words=<none> ]
[ HERE | travel | words=<none> ]
[ MOT_2 | travel | words=road, hill ]
[ synonym group: MOT_2 = road | hill ]
[ ENTER | travel | words=enter ]
[ MOT_4 | travel | words=upstr ]
[ MOT_5 | travel | words=downs ]
[ MOT_6 | travel | words=fores ]
[ FORWARD | travel | words=forwa, conti, onwar ]
[ synonym group: FORWARD = forwa | conti | onwar ]
[ BACK | travel | words=back, retur, retre ]
[ synonym group: BACK = back | retur | retre ]
[ MOT_9 | travel | words=valle ]
[ MOT_10 | travel | words=stair ]
[ OUTSIDE | direction | words=out, outsi, exit, leave ]
[ synonym group: OUTSIDE = out | outsi | exit | leave ]
[ MOT_12 | travel | words=build, house ]
[ synonym group: MOT_12 = build | house ]
[ MOT_13 | travel | words=gully ]
[ STREAM | travel | words=strea ]
[ MOT_15 | travel | words=fork ]
[ MOT_16 | travel | words=bed ]
[ CRAWL | travel | words=crawl ]
[ MOT_18 | travel | words=cobbl ]
[ INSIDE | direction | words=inwar, insid, in ]
[ synonym group: INSIDE = inwar | insid | in ]
[ MOT_20 | travel | words=surfa ]
[ NUL | travel | words=null, nowhe ]
[ synonym group: NUL = null | nowhe ]
[ MOT_22 | travel | words=dark ]
[ MOT_23 | travel | words=passa, tunne ]
[ synonym group: MOT_23 = passa | tunne ]
[ MOT_24 | travel | words=low ]
[ MOT_25 | travel | words=canyo ]
[ MOT_26 | travel | words=awkwa ]
[ MOT_27 | travel | words=giant ]
[ MOT_28 | travel | words=view ]
[ UP | direction | words=upwar, up, u, above, ascen ]
[ synonym group: UP = upwar | up | u | above | ascen ]
[ DOWN | direction | words=d, downw, down, desce ]
[ synonym group: DOWN = d | downw | down | desce ]
[ MOT_31 | travel | words=pit ]
[ MOT_32 | travel | words=outdo ]
[ MOT_33 | travel | words=crack ]
[ MOT_34 | travel | words=steps ]
[ MOT_35 | travel | words=dome ]
[ LEFT | travel | words=left ]
[ RIGHT | travel | words=right ]
[ MOT_38 | travel | words=hall ]
[ MOT_39 | travel | words=jump ]
[ MOT_40 | travel | words=barre ]
[ MOT_41 | travel | words=over ]
[ MOT_42 | travel | words=acros ]
[ EAST | direction | words=east, e ]
[ synonym group: EAST = east | e ]
[ WEST | direction | words=west, w ]
[ synonym group: WEST = west | w ]
[ NORTH | direction | words=north, n ]
[ synonym group: NORTH = north | n ]
[ SOUTH | direction | words=south, s ]
[ synonym group: SOUTH = south | s ]
[ NE | direction | words=ne ]
[ SE | direction | words=se ]
[ SW | direction | words=sw ]
[ NW | direction | words=nw ]
[ MOT_51 | travel | words=debri ]
[ MOT_52 | travel | words=hole ]
[ MOT_53 | travel | words=wall ]
[ MOT_54 | travel | words=broke ]
[ MOT_55 | travel | words=y2 ]
[ MOT_56 | travel | words=climb ]
[ LOOK | travel | words=l, x, look, exami, touch, descr ]
[ synonym group: LOOK = l | x | look | exami | touch | descr ]
[ MOT_58 | travel | words=floor ]
[ MOT_59 | travel | words=room ]
[ MOT_60 | travel | words=slit ]
[ MOT_61 | travel | words=slab, slabr ]
[ synonym group: MOT_61 = slab | slabr ]
[ XYZZY | magic | words=xyzzy ]
[ DEPRESSION | travel | words=depre ]
[ ENTRANCE | travel | words=entra ]
[ PLUGH | magic | words=plugh ]
[ MOT_66 | travel | words=secre ]
[ CAVE | travel | words=cave ]
[ CROSS | travel | words=cross ]
[ BEDQUILT | travel | words=bedqu ]
[ PLOVER | travel | words=plove ]
[ ORIENTAL | travel | words=orien ]
[ CAVERN | travel | words=caver ]
[ SHELLROOM | travel | words=shell ]
[ RESERVOIR | travel | words=reser ]
[ OFFICE | travel | words=main, offic ]
[ synonym group: OFFICE = main | offic ]

[ action vocabulary ]
[ ACT_NULL | command | words=<none> | no_flags ]
[ CARRY | command | words=g, carry, take, keep, catch, steal, captu, get, tote, snarf | oldstyle=false; i7_equivalent=I7 take/get ]
[ synonym group: CARRY = g | carry | take | keep | catch | steal | captu | get | tote | snarf ]
[ DROP | command | words=drop, relea, free, disca, dump | i7_equivalent=I7 drop ]
[ synonym group: DROP = drop | relea | free | disca | dump ]
[ SAY | command | words=say, chant, sing, utter, mumbl | i7_equivalent=I7 say ]
[ synonym group: SAY = say | chant | sing | utter | mumbl ]
[ UNLOCK | command | words=unloc, open | i7_equivalent=I7 open/lock ]
[ synonym group: UNLOCK = unloc | open ]
[ NOTHING | command | words=z, nothi | oldstyle=false ]
[ synonym group: NOTHING = z | nothi ]
[ LOCK | command | words=lock, close | i7_equivalent=I7 close/lock ]
[ synonym group: LOCK = lock | close ]
[ LIGHT | command | words=light, on | no_flags ]
[ synonym group: LIGHT = light | on ]
[ EXTINGUISH | command | words=extin, off | no_flags ]
[ synonym group: EXTINGUISH = extin | off ]
[ WAVE | command | words=wave, shake, swing | no_flags ]
[ synonym group: WAVE = wave | shake | swing ]
[ TAME | command | words=calm, placa, tame | no_flags ]
[ synonym group: TAME = calm | placa | tame ]
[ GO | command | words=walk, run, trave, go, proce, conti, explo, follo, turn | i7_equivalent=I7 go/walk/travel ]
[ synonym group: GO = walk | run | trave | go | proce | conti | explo | follo | turn ]
[ ATTACK | command | words=attac, kill, fight, hit, strik, slay | no_flags ]
[ synonym group: ATTACK = attac | kill | fight | hit | strik | slay ]
[ POUR | command | words=pour | no_flags ]
[ EAT | command | words=eat, devou | no_flags ]
[ synonym group: EAT = eat | devou ]
[ DRINK | command | words=drink | no_flags ]
[ RUB | command | words=rub | no_flags ]
[ THROW | command | words=throw, toss | no_flags ]
[ synonym group: THROW = throw | toss ]
[ QUIT | command | words=quit | no_flags ]
[ FIND | command | words=find, where | no_flags ]
[ synonym group: FIND = find | where ]
[ INVENTORY | command | words=i, inven | oldstyle=false; i7_equivalent=I7 inventory ]
[ synonym group: INVENTORY = i | inven ]
[ FEED | command | words=feed | no_flags ]
[ FILL | command | words=fill | no_flags ]
[ BLAST | command | words=blast, deton, ignit, blowu | no_flags ]
[ synonym group: BLAST = blast | deton | ignit | blowu ]
[ SCORE | command | words=score | no_flags ]
[ FEE | command | words=fee | i7_equivalent=I7 say word without gameplay effect ]
[ FIE | command | words=fie | i7_equivalent=I7 say word without gameplay effect ]
[ FOE | command | words=foe | i7_equivalent=I7 say word without gameplay effect ]
[ FOO | command | words=foo | i7_equivalent=I7 say word without gameplay effect ]
[ FUM | command | words=fum | i7_equivalent=I7 say word without gameplay effect ]
[ BRIEF | command | words=brief | no_flags ]
[ READ | command | words=read, perus | i7_equivalent=I7 read ]
[ synonym group: READ = read | perus ]
[ BREAK | command | words=break, shatt, smash | no_flags ]
[ synonym group: BREAK = break | shatt | smash ]
[ WAKE | command | words=wake, distu | no_flags ]
[ synonym group: WAKE = wake | distu ]
[ SAVE | command | words=suspe, pause, save | i7_equivalent=I7 save command ]
[ synonym group: SAVE = suspe | pause | save ]
[ RESUME | command | words=resum, resta | i7_equivalent=I7 restore/restart command ]
[ synonym group: RESUME = resum | resta ]
[ FLY | command | words=fly | no_flags ]
[ LISTEN | command | words=liste | no_flags ]
[ PART | command | words=z'zzz | no_flags ]
[ SEED | command | words=seed | no_flags ]
[ WASTE | command | words=waste | no_flags ]
[ ACT_UNKNOWN | command | words=<none> | no_flags ]
[ THANKYOU | command | words=thank | noaction ]
[ INVALIDMAGIC | magic | words=sesam, opens, abra, abrac, shaza, hocus, pocus | noaction ]
[ synonym group: INVALIDMAGIC = sesam | opens | abra | abrac | shaza | hocus | pocus ]
[ HELP | command | words=help, ? | noaction ]
[ synonym group: HELP = help | ? ]
[ NO | command | words=no | noaction ]
[ TREE | command | words=tree, trees | noaction ]
[ synonym group: TREE = tree | trees ]
[ DIG | command | words=dig, excav | noaction ]
[ synonym group: DIG = dig | excav ]
[ LOST | command | words=lost | noaction ]
[ MIST | command | words=mist | noaction ]
[ FBOMB | command | words=fuck | noaction ]
[ STOP | command | words=stop | noaction ]
[ INFO | command | words=info, infor | noaction ]
[ synonym group: INFO = info | infor ]
[ SWIM | command | words=swim | noaction ]
[ WIZARD | command | words=wizar | noaction ]
[ YES | command | words=yes | noaction ]
[ NEWS | command | words=news | noaction ]
[ ACT_VERSION | command | words=versi | noaction ]

[ object vocabulary ]
[ NO_OBJECT | object_name | words=<none> ]
[ KEYS | object_name | words=keys, key ]
[ synonym group: KEYS = keys | key ]
[ LAMP | object_name | words=lamp, lante ]
[ synonym group: LAMP = lamp | lante ]
[ GRATE | object_name | words=grate ]
[ CAGE | object_name | words=cage ]
[ ROD | object_name | words=rod ]
[ ROD2 | object_name | words=rod ]
[ STEPS | object_name | words=steps ]
[ BIRD | object_name | words=bird ]
[ DOOR | object_name | words=door ]
[ PILLOW | object_name | words=pillo, velve ]
[ synonym group: PILLOW = pillo | velve ]
[ SNAKE | object_name | words=snake ]
[ FISSURE | object_name | words=fissu ]
[ OBJ_13 | object_name | words=table ]
[ CLAM | object_name | words=clam ]
[ OYSTER | object_name | words=oyste ]
[ MAGAZINE | object_name | words=magaz, issue, spelu, 'spel ]
[ synonym group: MAGAZINE = magaz | issue | spelu | 'spel ]
[ DWARF | object_name | words=dwarf, dwarv ]
[ synonym group: DWARF = dwarf | dwarv ]
[ KNIFE | object_name | words=knife, knive ]
[ synonym group: KNIFE = knife | knive ]
[ FOOD | object_name | words=food, ratio ]
[ synonym group: FOOD = food | ratio ]
[ BOTTLE | object_name | words=bottl, jar ]
[ synonym group: BOTTLE = bottl | jar ]
[ WATER | object_name | words=water, h2o ]
[ synonym group: WATER = water | h2o ]
[ OIL | object_name | words=oil ]
[ MIRROR | object_name | words=mirro ]
[ PLANT | object_name | words=plant, beans ]
[ synonym group: PLANT = plant | beans ]
[ PLANT2 | object_name | words=plant ]
[ OBJ_26 | object_name | words=stala ]
[ OBJ_27 | object_name | words=shado, figur, windo ]
[ synonym group: OBJ_27 = shado | figur | windo ]
[ AXE | object_name | words=axe ]
[ OBJ_29 | object_name | words=drawi ]
[ OBJ_30 | object_name | words=pirat, genie, djinn ]
[ synonym group: OBJ_30 = pirat | genie | djinn ]
[ DRAGON | object_name | words=drago ]
[ CHASM | object_name | words=chasm ]
[ TROLL | object_name | words=troll ]
[ TROLL2 | object_name | words=troll ]
[ BEAR | object_name | words=bear ]
[ MESSAG | object_name | words=messa ]
[ VOLCANO | object_name | words=volca, geyse ]
[ synonym group: VOLCANO = volca | geyse ]
[ VEND | object_name | words=machi, vendi ]
[ synonym group: VEND = machi | vendi ]
[ BATTERY | object_name | words=batte ]
[ OBJ_40 | object_name | words=carpe, moss ]
[ synonym group: OBJ_40 = carpe | moss ]
[ OGRE | object_name | words=ogre ]
[ URN | object_name | words=urn ]
[ CAVITY | object_name | words=cavit ]
[ BLOOD | object_name | words=blood ]
[ RESER | object_name | words=reser ]
[ RABBITFOOT | object_name | words=appen, lepor ]
[ synonym group: RABBITFOOT = appen | lepor ]
[ OBJ_47 | object_name | words=mud ]
[ OBJ_48 | object_name | words=note ]
[ SIGN | object_name | words=sign ]
[ NUGGET | object_name | words=gold, nugge ]
[ synonym group: NUGGET = gold | nugge ]
[ OBJ_51 | object_name | words=diamo ]
[ OBJ_52 | object_name | words=silve, bars ]
[ synonym group: OBJ_52 = silve | bars ]
[ OBJ_53 | object_name | words=jewel ]
[ COINS | object_name | words=coins ]
[ CHEST | object_name | words=chest, box, treas ]
[ synonym group: CHEST = chest | box | treas ]
[ EGGS | object_name | words=eggs, egg, nest ]
[ synonym group: EGGS = eggs | egg | nest ]
[ TRIDENT | object_name | words=tride ]
[ VASE | object_name | words=vase, ming, shard, potte ]
[ synonym group: VASE = vase | ming | shard | potte ]
[ EMERALD | object_name | words=emera ]
[ PYRAMID | object_name | words=plati, pyram ]
[ synonym group: PYRAMID = plati | pyram ]
[ PEARL | object_name | words=pearl ]
[ RUG | object_name | words=rug, persi ]
[ synonym group: RUG = rug | persi ]
[ OBJ_63 | object_name | words=spice ]
[ CHAIN | object_name | words=chain ]
[ RUBY | object_name | words=ruby ]
[ JADE | object_name | words=jade, neckl ]
[ synonym group: JADE = jade | neckl ]
[ AMBER | object_name | words=amber, gemst ]
[ synonym group: AMBER = amber | gemst ]
[ SAPPH | object_name | words=sapph ]
[ OBJ_69 | object_name | words=ebony, statu ]
[ synonym group: OBJ_69 = ebony | statu ]

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

Table of Generated Travel Non-Direct Rules
rule-id	source-loc	action-kind	travel-category	target	verbs	forced	condition-kind	condition-arg-1	condition-arg-2	random-chance	is-magic-word	requires-handwritten	handwritten-reason
1	"LOC_START"	"goto"	"goto_non_direct"	"LOC_HILL"	"ROAD WEST UPWAR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
2	"LOC_START"	"goto"	"goto_non_direct"	"LOC_BUILDING"	"ENTER BUILD INWAR EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
3	"LOC_START"	"goto"	"goto_non_direct"	"LOC_VALLEY"	"DOWNS GULLY STREA SOUTH DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
4	"LOC_START"	"goto"	"goto_non_direct"	"LOC_FOREST1"	"FORES NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
5	"LOC_START"	"goto"	"goto_non_direct"	"LOC_GRATE"	"DEPRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
6	"LOC_HILL"	"goto"	"goto_non_direct"	"LOC_START"	"BUILD EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
7	"LOC_HILL"	"goto"	"goto_non_direct"	"LOC_FOREST13"	"SOUTH FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
8	"LOC_HILL"	"speak"	"speak"	"WHICH_WAY"	"DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
9	"LOC_BUILDING"	"goto"	"goto_non_direct"	"LOC_START"	"OUT OUTDO WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
10	"LOC_BUILDING"	"goto"	"goto_magic_word"	"LOC_FOOF1"	"XYZZY"	false	"none"	"<none>"	"<none>"	0	true	false	"<none>"
11	"LOC_BUILDING"	"goto"	"goto_magic_word"	"LOC_FOOF3"	"PLUGH"	false	"none"	"<none>"	"<none>"	0	true	false	"<none>"
12	"LOC_BUILDING"	"goto"	"goto_non_direct"	"LOC_SEWER"	"DOWNS STREA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
13	"LOC_VALLEY"	"goto"	"goto_non_direct"	"LOC_START"	"UPSTR BUILD NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
14	"LOC_VALLEY"	"goto"	"goto_non_direct"	"LOC_FOREST6"	"EAST FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
15	"LOC_VALLEY"	"goto"	"goto_non_direct"	"LOC_SLIT"	"DOWNS SOUTH DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
16	"LOC_VALLEY"	"goto"	"goto_non_direct"	"LOC_GRATE"	"DEPRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
17	"LOC_VALLEY"	"speak"	"speak"	"UPSTREAM_DOWNSTREAM"	"STREA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
18	"LOC_ROADEND"	"goto"	"goto_non_direct"	"LOC_HILL"	"ROAD EAST UPWAR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
19	"LOC_ROADEND"	"goto"	"goto_non_direct"	"LOC_START"	"BUILD"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
20	"LOC_ROADEND"	"goto"	"goto_non_direct"	"LOC_FOREST14"	"SOUTH FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
21	"LOC_CLIFF"	"goto"	"goto_non_direct"	"LOC_FOREST17"	"SOUTH FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
22	"LOC_CLIFF"	"goto"	"goto_non_direct"	"LOC_NOMAKE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
23	"LOC_SLIT"	"goto"	"goto_non_direct"	"LOC_START"	"BUILD"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
24	"LOC_SLIT"	"goto"	"goto_non_direct"	"LOC_VALLEY"	"UPSTR NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
25	"LOC_SLIT"	"goto"	"goto_non_direct"	"LOC_FOREST6"	"EAST FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
26	"LOC_SLIT"	"goto"	"goto_non_direct"	"LOC_GRATE"	"DOWNS BED SOUTH DEPRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
27	"LOC_SLIT"	"speak"	"speak"	"DONT_FIT"	"SLIT STREA DOWN INWAR ENTER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
28	"LOC_GRATE"	"goto"	"goto_non_direct"	"LOC_FOREST7"	"EAST FORES"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
29	"LOC_GRATE"	"goto"	"goto_non_direct"	"LOC_START"	"BUILD"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
30	"LOC_GRATE"	"goto"	"goto_non_direct"	"LOC_SLIT"	"UPSTR GULLY NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
31	"LOC_GRATE"	"goto"	"goto_conditional"	"LOC_BELOWGRATE"	"ENTER INWAR DOWN"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
32	"LOC_GRATE"	"speak"	"speak"	"GRATE_NOWAY"	"ENTER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
33	"LOC_BELOWGRATE"	"goto"	"goto_conditional"	"LOC_GRATE"	"OUT UPWAR"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
34	"LOC_BELOWGRATE"	"goto"	"goto_non_direct"	"LOC_COBBLE"	"CRAWL COBBL INWAR WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
35	"LOC_BELOWGRATE"	"goto"	"goto_non_direct"	"LOC_PITTOP"	"PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
36	"LOC_BELOWGRATE"	"goto"	"goto_non_direct"	"LOC_DEBRIS"	"DEBRI"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
37	"LOC_BELOWGRATE"	"speak"	"speak"	"GRATE_NOWAY"	"OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
38	"LOC_COBBLE"	"goto"	"goto_non_direct"	"LOC_BELOWGRATE"	"OUT SURFA EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
39	"LOC_COBBLE"	"goto"	"goto_non_direct"	"LOC_DEBRIS"	"INWAR DARK WEST DEBRI"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
40	"LOC_COBBLE"	"goto"	"goto_non_direct"	"LOC_PITTOP"	"PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
41	"LOC_DEBRIS"	"goto"	"goto_conditional"	"LOC_GRATE"	"DEPRE"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
42	"LOC_DEBRIS"	"goto"	"goto_non_direct"	"LOC_BELOWGRATE"	"ENTRA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
43	"LOC_DEBRIS"	"goto"	"goto_non_direct"	"LOC_COBBLE"	"CRAWL COBBL PASSA LOW EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
44	"LOC_DEBRIS"	"goto"	"goto_non_direct"	"LOC_AWKWARD"	"CANYO INWAR UPWAR WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
45	"LOC_DEBRIS"	"goto"	"goto_magic_word"	"LOC_FOOF2"	"XYZZY"	false	"none"	"<none>"	"<none>"	0	true	false	"<none>"
46	"LOC_DEBRIS"	"goto"	"goto_non_direct"	"LOC_PITTOP"	"PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
47	"LOC_AWKWARD"	"goto"	"goto_conditional"	"LOC_GRATE"	"DEPRE"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
48	"LOC_AWKWARD"	"goto"	"goto_non_direct"	"LOC_BELOWGRATE"	"ENTRA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
49	"LOC_AWKWARD"	"goto"	"goto_non_direct"	"LOC_DEBRIS"	"DOWN EAST DEBRI"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
50	"LOC_AWKWARD"	"goto"	"goto_non_direct"	"LOC_BIRDCHAMBER"	"INWAR UPWAR WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
51	"LOC_AWKWARD"	"goto"	"goto_non_direct"	"LOC_PITTOP"	"PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
52	"LOC_BIRDCHAMBER"	"goto"	"goto_conditional"	"LOC_GRATE"	"DEPRE"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
53	"LOC_BIRDCHAMBER"	"goto"	"goto_non_direct"	"LOC_BELOWGRATE"	"ENTRA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
54	"LOC_BIRDCHAMBER"	"goto"	"goto_non_direct"	"LOC_DEBRIS"	"DEBRI"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
55	"LOC_BIRDCHAMBER"	"goto"	"goto_non_direct"	"LOC_AWKWARD"	"CANYO EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
56	"LOC_BIRDCHAMBER"	"goto"	"goto_non_direct"	"LOC_PITTOP"	"PASSA PIT WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
57	"LOC_PITTOP"	"goto"	"goto_conditional"	"LOC_GRATE"	"DEPRE"	false	"not"	"GRATE"	"GRATE_CLOSED"	0	false	false	"<none>"
58	"LOC_PITTOP"	"goto"	"goto_non_direct"	"LOC_BELOWGRATE"	"ENTRA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
59	"LOC_PITTOP"	"goto"	"goto_non_direct"	"LOC_DEBRIS"	"DEBRI"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
60	"LOC_PITTOP"	"goto"	"goto_non_direct"	"LOC_BIRDCHAMBER"	"PASSA EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
61	"LOC_PITTOP"	"goto"	"goto_conditional"	"LOC_NECKBROKE"	"DOWN PIT STEPS"	false	"carry"	"NUGGET"	"<none>"	0	false	false	"<none>"
62	"LOC_PITTOP"	"goto"	"goto_non_direct"	"LOC_CRACK"	"CRACK WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
63	"LOC_MISTHALL"	"goto"	"goto_non_direct"	"LOC_NUGGET"	"LEFT SOUTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
64	"LOC_MISTHALL"	"goto"	"goto_non_direct"	"LOC_EASTBANK"	"FORWA HALL WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
65	"LOC_MISTHALL"	"goto"	"goto_non_direct"	"LOC_KINGHALL"	"STAIR DOWN NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
66	"LOC_MISTHALL"	"goto"	"goto_conditional"	"LOC_DOME"	"UPWAR PIT STEPS DOME PASSA EAST"	false	"carry"	"NUGGET"	"<none>"	0	false	false	"<none>"
67	"LOC_MISTHALL"	"goto"	"goto_non_direct"	"LOC_JUMBLE"	"Y2"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
68	"LOC_CRACK"	"goto"	"goto_forced"	"LOC_PITTOP"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
69	"LOC_EASTBANK"	"goto"	"goto_non_direct"	"LOC_MISTHALL"	"HALL EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
70	"LOC_EASTBANK"	"goto"	"goto_conditional"	"LOC_NOMAKE"	"FORWA"	false	"not"	"FISSURE"	"BRIDGED"	0	false	false	"<none>"
71	"LOC_EASTBANK"	"goto"	"goto_non_direct"	"LOC_WESTBANK"	"OVER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
72	"LOC_EASTBANK"	"speak"	"speak_conditional"	"CROSS_BRIDGE"	"JUMP"	false	"not"	"FISSURE"	"UNBRIDGED"	0	false	false	"<none>"
73	"LOC_EASTBANK"	"speak"	"speak_conditional"	"NO_CROSS"	"OVER ACROS WEST CROSS"	false	"not"	"FISSURE"	"BRIDGED"	0	false	false	"<none>"
74	"LOC_NUGGET"	"goto"	"goto_non_direct"	"LOC_MISTHALL"	"HALL OUT NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
75	"LOC_KINGHALL"	"goto"	"goto_non_direct"	"LOC_MISTHALL"	"STAIR UPWAR EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
76	"LOC_KINGHALL"	"goto"	"goto_conditional"	"LOC_FLOORHOLE"	"NORTH RIGHT"	false	"not"	"SNAKE"	"SNAKE_BLOCKS"	0	false	false	"<none>"
77	"LOC_KINGHALL"	"goto"	"goto_conditional"	"LOC_SOUTHSIDE"	"SOUTH LEFT"	false	"not"	"SNAKE"	"SNAKE_BLOCKS"	0	false	false	"<none>"
78	"LOC_KINGHALL"	"goto"	"goto_conditional"	"LOC_WESTSIDE"	"WEST FORWA"	false	"not"	"SNAKE"	"SNAKE_BLOCKS"	0	false	false	"<none>"
79	"LOC_KINGHALL"	"goto"	"goto_random"	"LOC_SECRET3"	"SW"	false	"pct"	"35"	"<none>"	35	false	false	"<none>"
80	"LOC_KINGHALL"	"goto"	"goto_conditional"	"LOC_SNAKEBLOCK"	"SW"	false	"with"	"SNAKE"	"<none>"	0	false	false	"<none>"
81	"LOC_KINGHALL"	"goto"	"goto_non_direct"	"LOC_SECRET3"	"SECRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
82	"LOC_NECKBROKE"	"goto"	"goto_forced"	"LOC_NOWHERE"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
83	"LOC_NOMAKE"	"goto"	"goto_forced"	"LOC_NOWHERE"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
84	"LOC_DOME"	"goto"	"goto_forced"	"LOC_MISTHALL"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
85	"LOC_WESTEND"	"goto"	"goto_non_direct"	"LOC_EASTEND"	"EAST ACROS"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
86	"LOC_WESTEND"	"goto"	"goto_non_direct"	"LOC_SLAB"	"WEST SLAB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
87	"LOC_WESTEND"	"goto"	"goto_non_direct"	"LOC_WESTPIT"	"DOWN PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
88	"LOC_WESTEND"	"speak"	"speak"	"TOO_FAR"	"HOLE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
89	"LOC_EASTPIT"	"goto"	"goto_non_direct"	"LOC_EASTEND"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
90	"LOC_WESTPIT"	"goto"	"goto_non_direct"	"LOC_WESTEND"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
91	"LOC_WESTPIT"	"goto"	"goto_conditional"	"LOC_BUILDING1"	"CLIMB"	false	"not"	"PLANT"	"PLANT_GROWN"	0	false	false	"<none>"
92	"LOC_WESTPIT"	"goto"	"goto_non_direct"	"LOC_CLIMBSTALK"	"CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
93	"LOC_CLIMBSTALK"	"goto"	"goto_forced"	"LOC_NARROW"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
94	"LOC_WESTBANK"	"goto"	"goto_conditional"	"LOC_NOMAKE"	"FORWA"	false	"not"	"FISSURE"	"BRIDGED"	0	false	false	"<none>"
95	"LOC_WESTBANK"	"goto"	"goto_non_direct"	"LOC_EASTBANK"	"OVER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
96	"LOC_WESTBANK"	"speak"	"speak_conditional"	"CROSS_BRIDGE"	"JUMP"	false	"not"	"FISSURE"	"UNBRIDGED"	0	false	false	"<none>"
97	"LOC_WESTBANK"	"speak"	"speak_conditional"	"NO_CROSS"	"OVER ACROS EAST CROSS"	false	"not"	"FISSURE"	"BRIDGED"	0	false	false	"<none>"
98	"LOC_FLOORHOLE"	"goto"	"goto_non_direct"	"LOC_KINGHALL"	"HALL OUT SOUTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
99	"LOC_FLOORHOLE"	"goto"	"goto_non_direct"	"LOC_Y2"	"NORTH Y2"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
100	"LOC_FLOORHOLE"	"goto"	"goto_non_direct"	"LOC_BROKEN"	"DOWN HOLE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
101	"LOC_SOUTHSIDE"	"goto"	"goto_non_direct"	"LOC_KINGHALL"	"HALL OUT NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
102	"LOC_WESTSIDE"	"goto"	"goto_non_direct"	"LOC_KINGHALL"	"HALL OUT EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
103	"LOC_WESTSIDE"	"goto"	"goto_non_direct"	"LOC_CROSSOVER"	"WEST UPWAR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
104	"LOC_BUILDING1"	"goto"	"goto_forced"	"LOC_NOCLIMB"	"<forced>"	true	"not"	"PLANT"	"PLANT_BELLOWING"	0	false	false	"<none>"
105	"LOC_BUILDING1"	"goto"	"goto_forced"	"LOC_PLANTTOP"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
106	"LOC_SNAKEBLOCK"	"goto"	"goto_forced"	"LOC_KINGHALL"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
107	"LOC_Y2"	"goto"	"goto_magic_word"	"LOC_FOOF4"	"PLUGH"	false	"none"	"<none>"	"<none>"	0	true	false	"<none>"
108	"LOC_Y2"	"goto"	"goto_non_direct"	"LOC_JUMBLE"	"EAST WALL BROKE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
109	"LOC_Y2"	"goto"	"goto_non_direct"	"LOC_FOOF5"	"PLOVE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
110	"LOC_Y2"	"special"	"special_conditional"	"2"	"PLOVE"	false	"carry"	"EMERALD"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
111	"LOC_JUMBLE"	"goto"	"goto_non_direct"	"LOC_Y2"	"DOWN Y2"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
112	"LOC_WINDOW1"	"goto"	"goto_non_direct"	"LOC_Y2"	"EAST Y2"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
113	"LOC_WINDOW1"	"goto"	"goto_non_direct"	"LOC_NECKBROKE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
114	"LOC_BROKEN"	"goto"	"goto_non_direct"	"LOC_SMALLPITBRINK"	"EAST CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
115	"LOC_BROKEN"	"goto"	"goto_non_direct"	"LOC_FLOORHOLE"	"UPWAR HOLE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
116	"LOC_BROKEN"	"goto"	"goto_non_direct"	"LOC_BEDQUILT"	"BEDQU"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
117	"LOC_SMALLPITBRINK"	"goto"	"goto_non_direct"	"LOC_BROKEN"	"WEST CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
118	"LOC_SMALLPITBRINK"	"goto"	"goto_non_direct"	"LOC_SMALLPIT"	"DOWN PIT CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
119	"LOC_SMALLPIT"	"goto"	"goto_non_direct"	"LOC_SMALLPITBRINK"	"CLIMB UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
120	"LOC_SMALLPIT"	"speak"	"speak"	"DONT_FIT"	"SLIT STREA DOWN UPSTR DOWNS ENTER INWAR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
121	"LOC_DUSTY"	"goto"	"goto_non_direct"	"LOC_BROKEN"	"EAST PASSA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
122	"LOC_DUSTY"	"goto"	"goto_non_direct"	"LOC_COMPLEX"	"DOWN HOLE FLOOR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
123	"LOC_DUSTY"	"goto"	"goto_non_direct"	"LOC_BEDQUILT"	"BEDQU"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
124	"LOC_PARALLEL1"	"goto"	"goto_forced"	"LOC_MISTWEST"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
125	"LOC_MISTWEST"	"goto"	"goto_non_direct"	"LOC_ALIKE1"	"SOUTH UPWAR PASSA CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
126	"LOC_MISTWEST"	"goto"	"goto_non_direct"	"LOC_LONGEAST"	"WEST CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
127	"LOC_ALIKE4"	"goto"	"goto_non_direct"	"LOC_ALIKE14"	"UPWAR DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
128	"LOC_MAZEEND1"	"goto"	"goto_non_direct"	"LOC_ALIKE4"	"WEST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
129	"LOC_MAZEEND2"	"goto"	"goto_non_direct"	"LOC_ALIKE4"	"EAST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
130	"LOC_MAZEEND3"	"goto"	"goto_non_direct"	"LOC_ALIKE3"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
131	"LOC_MAZEEND4"	"goto"	"goto_non_direct"	"LOC_ALIKE9"	"WEST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
132	"LOC_MAZEEND5"	"goto"	"goto_non_direct"	"LOC_ALIKE10"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
133	"LOC_PITBRINK"	"goto"	"goto_non_direct"	"LOC_BIRDCHAMBER"	"DOWN CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
134	"LOC_MAZEEND6"	"goto"	"goto_non_direct"	"LOC_PITBRINK"	"EAST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
135	"LOC_PARALLEL2"	"goto"	"goto_forced"	"LOC_WESTBANK"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
136	"LOC_LONGEAST"	"goto"	"goto_non_direct"	"LOC_MISTWEST"	"EAST UPWAR CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
137	"LOC_LONGEAST"	"goto"	"goto_non_direct"	"LOC_CROSSOVER"	"NORTH DOWN HOLE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
138	"LOC_LONGWEST"	"goto"	"goto_conditional"	"LOC_DIFFERENT1"	"SOUTH"	false	"nodwarves"	"<none>"	"<none>"	0	false	true	"dwarf-avoidance predicate is implemented in hand-written dwarf logic"
139	"LOC_DEADEND7"	"goto"	"goto_non_direct"	"LOC_CROSSOVER"	"SOUTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
140	"LOC_COMPLEX"	"goto"	"goto_non_direct"	"LOC_DUSTY"	"UPWAR CLIMB ROOM"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
141	"LOC_COMPLEX"	"goto"	"goto_non_direct"	"LOC_BEDQUILT"	"WEST BEDQU"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
142	"LOC_COMPLEX"	"goto"	"goto_non_direct"	"LOC_SHELLROOM"	"NORTH SHELL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
143	"LOC_BEDQUILT"	"goto"	"goto_non_direct"	"LOC_SLAB"	"SLAB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
144	"LOC_BEDQUILT"	"goto"	"goto_random"	"LOC_SECRET2"	"UPWAR"	false	"pct"	"70"	"<none>"	70	false	false	"<none>"
145	"LOC_BEDQUILT"	"goto"	"goto_random"	"LOC_LOWROOM"	"NORTH"	false	"pct"	"75"	"<none>"	75	false	false	"<none>"
146	"LOC_BEDQUILT"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"SOUTH"	false	"pct"	"65"	"<none>"	65	false	false	"<none>"
147	"LOC_BEDQUILT"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"UPWAR"	false	"pct"	"60"	"<none>"	60	false	false	"<none>"
148	"LOC_BEDQUILT"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"NORTH"	false	"pct"	"50"	"<none>"	50	false	false	"<none>"
149	"LOC_BEDQUILT"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"DOWN"	false	"pct"	"65"	"<none>"	65	false	false	"<none>"
150	"LOC_SWISSCHEESE"	"goto"	"goto_non_direct"	"LOC_TALL"	"CANYO"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
151	"LOC_SWISSCHEESE"	"goto"	"goto_non_direct"	"LOC_ORIENTAL"	"ORIEN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
152	"LOC_SWISSCHEESE"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"SOUTH"	false	"pct"	"80"	"<none>"	80	false	false	"<none>"
153	"LOC_SWISSCHEESE"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"NW"	false	"pct"	"50"	"<none>"	50	false	false	"<none>"
154	"LOC_EASTEND"	"goto"	"goto_non_direct"	"LOC_WESTEND"	"WEST ACROS"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
155	"LOC_EASTEND"	"goto"	"goto_non_direct"	"LOC_EASTPIT"	"DOWN PIT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
156	"LOC_SLAB"	"goto"	"goto_non_direct"	"LOC_SECRET1"	"UPWAR CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
157	"LOC_SECRET1"	"goto"	"goto_non_direct"	"LOC_SLAB"	"DOWN SLAB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
158	"LOC_SECRET1"	"goto"	"goto_conditional"	"LOC_SECRET5"	"SOUTH"	false	"not"	"DRAGON"	"DRAGON_BARS"	0	false	false	"<none>"
159	"LOC_SECRET1"	"goto"	"goto_non_direct"	"LOC_RESERVOIR"	"RESER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
160	"LOC_SECRET2"	"goto"	"goto_non_direct"	"LOC_BEDQUILT"	"DOWN PASSA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
161	"LOC_LOWROOM"	"goto"	"goto_non_direct"	"LOC_BEDQUILT"	"BEDQU"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
162	"LOC_LOWROOM"	"goto"	"goto_non_direct"	"LOC_ORIENTAL"	"SE ORIEN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
163	"LOC_DEADCRAWL"	"goto"	"goto_non_direct"	"LOC_LOWROOM"	"SOUTH CRAWL OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
164	"LOC_SECRET3"	"goto"	"goto_conditional"	"LOC_SECRET5"	"WEST"	false	"not"	"DRAGON"	"DRAGON_BARS"	0	false	false	"<none>"
165	"LOC_TALL"	"goto"	"goto_non_direct"	"LOC_SWISSCHEESE"	"NORTH CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
166	"LOC_SEWER"	"goto"	"goto_forced"	"LOC_BUILDING"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
167	"LOC_MAZEEND8"	"goto"	"goto_non_direct"	"LOC_ALIKE11"	"WEST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
168	"LOC_MAZEEND9"	"goto"	"goto_non_direct"	"LOC_ALIKE3"	"SOUTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
169	"LOC_MAZEEND10"	"goto"	"goto_non_direct"	"LOC_ALIKE12"	"EAST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
170	"LOC_MAZEEND11"	"goto"	"goto_non_direct"	"LOC_ALIKE8"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
171	"LOC_ALIKE14"	"goto"	"goto_non_direct"	"LOC_ALIKE4"	"UPWAR DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
172	"LOC_NARROW"	"goto"	"goto_non_direct"	"LOC_WESTPIT"	"DOWN CLIMB EAST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
173	"LOC_NARROW"	"goto"	"goto_non_direct"	"LOC_NECKBROKE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
174	"LOC_NARROW"	"goto"	"goto_non_direct"	"LOC_GIANTROOM"	"WEST GIANT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
175	"LOC_NOCLIMB"	"goto"	"goto_forced"	"LOC_WESTPIT"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
176	"LOC_PLANTTOP"	"goto"	"goto_forced"	"LOC_WESTEND"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
177	"LOC_INCLINE"	"goto"	"goto_non_direct"	"LOC_WATERFALL"	"NORTH CAVER PASSA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
178	"LOC_INCLINE"	"goto"	"goto_non_direct"	"LOC_LOWROOM"	"DOWN CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
179	"LOC_CAVEIN"	"goto"	"goto_non_direct"	"LOC_GIANTROOM"	"SOUTH GIANT OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
180	"LOC_IMMENSE"	"goto"	"goto_non_direct"	"LOC_GIANTROOM"	"SOUTH GIANT PASSA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
181	"LOC_IMMENSE"	"goto"	"goto_conditional"	"LOC_WATERFALL"	"NORTH ENTER CAVER"	false	"not"	"DOOR"	"DOOR_RUSTED"	0	false	false	"<none>"
182	"LOC_IMMENSE"	"speak"	"speak"	"RUSTY_DOOR"	"NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
183	"LOC_WATERFALL"	"goto"	"goto_non_direct"	"LOC_IMMENSE"	"SOUTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
184	"LOC_WATERFALL"	"goto"	"goto_non_direct"	"LOC_GIANTROOM"	"GIANT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
185	"LOC_SOFTROOM"	"goto"	"goto_non_direct"	"LOC_SWISSCHEESE"	"WEST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
186	"LOC_ORIENTAL"	"goto"	"goto_non_direct"	"LOC_LOWROOM"	"WEST CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
187	"LOC_ORIENTAL"	"goto"	"goto_non_direct"	"LOC_MISTY"	"UPWAR NORTH CAVER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
188	"LOC_MISTY"	"goto"	"goto_non_direct"	"LOC_ORIENTAL"	"SOUTH ORIEN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
189	"LOC_ALCOVE"	"goto"	"goto_non_direct"	"LOC_MISTY"	"NW CAVER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
190	"LOC_ALCOVE"	"special"	"special"	"1"	"EAST PASSA"	false	"none"	"<none>"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
191	"LOC_PLOVER"	"goto"	"goto_non_direct"	"LOC_FOOF6"	"PLOVE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
192	"LOC_PLOVER"	"goto"	"goto_non_direct"	"LOC_DARKROOM"	"NE DARK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
193	"LOC_PLOVER"	"special"	"special"	"1"	"WEST PASSA OUT"	false	"none"	"<none>"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
194	"LOC_PLOVER"	"special"	"special_conditional"	"2"	"PLOVE"	false	"carry"	"EMERALD"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
195	"LOC_DARKROOM"	"goto"	"goto_non_direct"	"LOC_PLOVER"	"SOUTH PLOVE OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
196	"LOC_ARCHED"	"goto"	"goto_non_direct"	"LOC_SHELLROOM"	"DOWN SHELL OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
197	"LOC_SHELLROOM"	"goto"	"goto_non_direct"	"LOC_ARCHED"	"UPWAR HALL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
198	"LOC_SHELLROOM"	"speak"	"speak_conditional"	"CLAM_BLOCKER"	"SOUTH"	false	"carry"	"CLAM"	"<none>"	0	false	false	"<none>"
199	"LOC_SHELLROOM"	"speak"	"speak_conditional"	"OYSTER_BLOCKER"	"SOUTH"	false	"carry"	"OYSTER"	"<none>"	0	false	false	"<none>"
200	"LOC_SLOPING1"	"goto"	"goto_non_direct"	"LOC_SHELLROOM"	"UPWAR SHELL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
201	"LOC_CULDESAC"	"goto"	"goto_non_direct"	"LOC_SLOPING1"	"UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
202	"LOC_CULDESAC"	"goto"	"goto_non_direct"	"LOC_SHELLROOM"	"SHELL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
203	"LOC_WITTSEND"	"speak"	"speak_conditional"	"FUTILE_CRAWL"	"EAST NORTH SOUTH NE SE SW NW UPWAR DOWN"	false	"pct"	"95"	"<none>"	95	false	false	"<none>"
204	"LOC_WITTSEND"	"speak"	"speak"	"WAY_BLOCKED"	"WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
205	"LOC_MIRRORCANYON"	"goto"	"goto_non_direct"	"LOC_RESERVOIR"	"NORTH RESER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
206	"LOC_WINDOW2"	"goto"	"goto_non_direct"	"LOC_NECKBROKE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
207	"LOC_TOPSTALACTITE"	"goto"	"goto_random"	"LOC_ALIKE6"	"DOWN JUMP CLIMB"	false	"pct"	"40"	"<none>"	40	false	false	"<none>"
208	"LOC_TOPSTALACTITE"	"goto"	"goto_random"	"LOC_ALIKE9"	"DOWN"	false	"pct"	"50"	"<none>"	50	false	false	"<none>"
209	"LOC_RESERVOIR"	"goto"	"goto_non_direct"	"LOC_MIRRORCANYON"	"SOUTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
210	"LOC_RESERVOIR"	"speak"	"speak_conditional"	"BAD_DIRECTION"	"NORTH ACROS CROSS"	false	"not"	"RESER"	"WATERS_PARTED"	0	false	false	"<none>"
211	"LOC_SW"	"speak"	"speak"	"GRATE_NOWAY"	"DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
212	"LOC_SWCHASM"	"goto"	"goto_conditional"	"LOC_NOMAKE"	"JUMP"	false	"not"	"CHASM"	"TROLL_BRIDGE"	0	false	false	"<none>"
213	"LOC_SWCHASM"	"speak"	"speak_conditional"	"TROLL_BLOCKS"	"OVER ACROS CROSS NE"	false	"with"	"TROLL"	"<none>"	0	false	false	"<none>"
214	"LOC_SWCHASM"	"speak"	"speak_conditional"	"BRIDGE_GONE"	"OVER"	false	"not"	"CHASM"	"TROLL_BRIDGE"	0	false	false	"<none>"
215	"LOC_SWCHASM"	"speak"	"speak"	"CROSS_BRIDGE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
216	"LOC_SWCHASM"	"special"	"special"	"3"	"OVER"	false	"none"	"<none>"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
217	"LOC_SECRET4"	"goto"	"goto_non_direct"	"LOC_SECRET1"	"NORTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
218	"LOC_SECRET4"	"speak"	"speak"	"NASTY_DRAGON"	"EAST FORWA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
219	"LOC_SECRET6"	"goto"	"goto_non_direct"	"LOC_SECRET3"	"EAST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
220	"LOC_SECRET6"	"speak"	"speak"	"NASTY_DRAGON"	"NORTH FORWA"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
221	"LOC_NECHASM"	"goto"	"goto_non_direct"	"LOC_FORK"	"FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
222	"LOC_NECHASM"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
223	"LOC_NECHASM"	"goto"	"goto_non_direct"	"LOC_BARRENFRONT"	"BARRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
224	"LOC_NECHASM"	"speak"	"speak_conditional"	"TROLL_BLOCKS"	"OVER ACROS CROSS SW"	false	"with"	"TROLL"	"<none>"	0	false	false	"<none>"
225	"LOC_NECHASM"	"speak"	"speak"	"CROSS_BRIDGE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
226	"LOC_NECHASM"	"special"	"special"	"3"	"OVER"	false	"none"	"<none>"	"<none>"	0	false	true	"special travel token requires hand-authored special-case movement logic"
227	"LOC_CORRIDOR"	"goto"	"goto_non_direct"	"LOC_FORK"	"EAST FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
228	"LOC_CORRIDOR"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
229	"LOC_CORRIDOR"	"goto"	"goto_non_direct"	"LOC_BARRENFRONT"	"BARRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
230	"LOC_FORK"	"goto"	"goto_non_direct"	"LOC_WARMWALLS"	"NE LEFT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
231	"LOC_FORK"	"goto"	"goto_non_direct"	"LOC_LIMESTONE"	"SE RIGHT DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
232	"LOC_FORK"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
233	"LOC_FORK"	"goto"	"goto_non_direct"	"LOC_BARRENFRONT"	"BARRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
234	"LOC_WARMWALLS"	"goto"	"goto_non_direct"	"LOC_FORK"	"SOUTH FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
235	"LOC_WARMWALLS"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"NORTH VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
236	"LOC_WARMWALLS"	"goto"	"goto_non_direct"	"LOC_BOULDERS2"	"EAST CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
237	"LOC_BREATHTAKING"	"goto"	"goto_non_direct"	"LOC_WARMWALLS"	"SOUTH PASSA OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
238	"LOC_BREATHTAKING"	"goto"	"goto_non_direct"	"LOC_FORK"	"FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
239	"LOC_BREATHTAKING"	"goto"	"goto_non_direct"	"LOC_GRUESOME"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
240	"LOC_BREATHTAKING"	"speak"	"speak"	"RIDICULOUS_ATTEMPT"	"DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
241	"LOC_BOULDERS2"	"goto"	"goto_non_direct"	"LOC_WARMWALLS"	"WEST OUT CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
242	"LOC_BOULDERS2"	"goto"	"goto_non_direct"	"LOC_FORK"	"FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
243	"LOC_BOULDERS2"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
244	"LOC_LIMESTONE"	"goto"	"goto_non_direct"	"LOC_FORK"	"NORTH UPWAR FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
245	"LOC_LIMESTONE"	"goto"	"goto_non_direct"	"LOC_BARRENFRONT"	"SOUTH DOWN BARRE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
246	"LOC_LIMESTONE"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
247	"LOC_BARRENFRONT"	"goto"	"goto_non_direct"	"LOC_LIMESTONE"	"WEST UPWAR"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
248	"LOC_BARRENFRONT"	"goto"	"goto_non_direct"	"LOC_FORK"	"FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
249	"LOC_BARRENFRONT"	"goto"	"goto_non_direct"	"LOC_BARRENROOM"	"EAST INWAR BARRE ENTER"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
250	"LOC_BARRENFRONT"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
251	"LOC_BARRENROOM"	"goto"	"goto_non_direct"	"LOC_BARRENFRONT"	"WEST OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
252	"LOC_BARRENROOM"	"goto"	"goto_non_direct"	"LOC_FORK"	"FORK"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
253	"LOC_BARRENROOM"	"goto"	"goto_non_direct"	"LOC_BREATHTAKING"	"VIEW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
254	"LOC_DEADEND13"	"goto"	"goto_non_direct"	"LOC_DIFFERENT2"	"NORTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
255	"LOC_DEADEND13"	"goto"	"goto_conditional"	"LOC_ROUGHHEWN"	"SOUTH"	false	"not"	"VEND"	"VEND_BLOCKS"	0	false	false	"<none>"
256	"LOC_BADDIRECTION"	"goto"	"goto_forced"	"LOC_DEADEND13"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
257	"LOC_LARGE"	"speak"	"speak_conditional"	"OGRE_SNARL"	"NORTH"	false	"with"	"OGRE"	"<none>"	0	false	false	"<none>"
258	"LOC_STOREROOM"	"goto"	"goto_non_direct"	"LOC_LARGE"	"SOUTH OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
259	"LOC_FOREST3"	"goto"	"goto_non_direct"	"LOC_FOREST4"	"EAST WEST"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
260	"LOC_FOREST4"	"goto"	"goto_non_direct"	"LOC_FOREST3"	"EAST NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
261	"LOC_FOREST4"	"goto"	"goto_non_direct"	"LOC_FOREST5"	"WEST SOUTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
262	"LOC_FOREST5"	"goto"	"goto_non_direct"	"LOC_FOREST4"	"EAST NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
263	"LOC_FOREST16"	"goto"	"goto_non_direct"	"LOC_FOREST17"	"EAST NORTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
264	"LOC_FOREST17"	"goto"	"goto_non_direct"	"LOC_FOREST16"	"WEST SOUTH"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
265	"LOC_LEDGE"	"goto"	"goto_non_direct"	"LOC_NOMAKE"	"JUMP"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
266	"LOC_RESNORTH"	"goto"	"goto_non_direct"	"LOC_TREACHEROUS"	"NW UPWAR OUT"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
267	"LOC_RESNORTH"	"speak"	"speak_conditional"	"BAD_DIRECTION"	"SOUTH ACROS CROSS"	false	"not"	"RESER"	"WATERS_PARTED"	0	false	false	"<none>"
268	"LOC_TREACHEROUS"	"goto"	"goto_non_direct"	"LOC_STEEP"	"UPWAR NW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
269	"LOC_TREACHEROUS"	"goto"	"goto_non_direct"	"LOC_RESNORTH"	"DOWN SE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
270	"LOC_STEEP"	"goto"	"goto_non_direct"	"LOC_TREACHEROUS"	"DOWN SE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
271	"LOC_STEEP"	"goto"	"goto_non_direct"	"LOC_CLIFFBASE"	"UPWAR NW"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
272	"LOC_CLIFFBASE"	"goto"	"goto_non_direct"	"LOC_STEEP"	"DOWN SE"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
273	"LOC_CLIFFBASE"	"goto"	"goto_non_direct"	"LOC_CLIFFACE"	"UPWAR CLIMB"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
274	"LOC_CLIFFACE"	"goto"	"goto_conditional"	"LOC_CLIFFTOP"	"UPWAR"	false	"carry"	"RABBITFOOT"	"<none>"	0	false	false	"<none>"
275	"LOC_FOOTSLIP"	"goto"	"goto_forced"	"LOC_NOWHERE"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
276	"LOC_CLIFFTOP"	"goto"	"goto_forced"	"LOC_CLIFFLEDGE"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
277	"LOC_CLIFFLEDGE"	"goto"	"goto_non_direct"	"LOC_CLIFFACE"	"CLIMB DOWN"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
278	"LOC_CLIFFLEDGE"	"goto"	"goto_non_direct"	"LOC_REACHDEAD"	"NE CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
279	"LOC_REACHDEAD"	"goto"	"goto_non_direct"	"LOC_CLIFFLEDGE"	"SW OUT CRAWL"	false	"none"	"<none>"	"<none>"	0	false	false	"<none>"
280	"LOC_GRUESOME"	"goto"	"goto_forced"	"LOC_NOWHERE"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
281	"LOC_FOOF1"	"goto"	"goto_forced"	"LOC_DEBRIS"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
282	"LOC_FOOF2"	"goto"	"goto_forced"	"LOC_BUILDING"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
283	"LOC_FOOF3"	"goto"	"goto_forced"	"LOC_Y2"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
284	"LOC_FOOF4"	"goto"	"goto_forced"	"LOC_BUILDING"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
285	"LOC_FOOF5"	"goto"	"goto_forced"	"LOC_PLOVER"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
286	"LOC_FOOF6"	"goto"	"goto_forced"	"LOC_Y2"	"<forced>"	true	"none"	"<none>"	"<none>"	0	false	false	"<none>"
[	generation	summary	]
[	direct_map_rules=337	]
[	direct_map_locations=106	]
[	total_travel_rules=623	]
[	non_direct_rules=286	]
[	resolved_by_generation=616	]
[	unresolved_rules=7	]
[	unresolved_rule_ids=[110,	138,	190,	193,	194,	216,	226]	]
[	travel	category	counts	]
[	goto_conditional=22	]
[	goto_forced=23	]
[	goto_magic_word=4	]
[	goto_non_direct=192	]
[	goto_random=5	]
[	speak=15	]
[	speak_conditional=19	]
[	special=4	]
[	special_conditional=2	]

[ Open Adventure Runtime State ]

Section 1 - Core runtime state

The player is in LOC_START.

The openadventure-framework-ready is a truth state that varies.
The openadventure-framework-ready is false.

The openadventure-turn-counter is a number that varies.
The openadventure-turn-counter is 0.

The openadventure-tick-counter is a number that varies.
The openadventure-tick-counter is 0.

The openadventure-current-travel-rule-id is a number that varies.
The openadventure-current-travel-rule-id is 0.

The openadventure-active-source-loc is a text that varies.
The openadventure-active-source-loc is "".

The openadventure-active-verb-token is a text that varies.
The openadventure-active-verb-token is "".

The openadventure-active-travel-result is a text that varies.
The openadventure-active-travel-result is "".

Section 2 - Gameplay flags and global booleans

The openadventure-framework-has-pending-travel is a truth state that varies.
The openadventure-framework-has-pending-travel is false.

The openadventure-framework-in-lookup is a truth state that varies.
The openadventure-framework-in-lookup is false.

The openadventure-dwarves-movement-guard-enabled is a truth state that varies.
The openadventure-dwarves-movement-guard-enabled is false.

The openadventure-subsystem-loading is a truth state that varies.
The openadventure-subsystem-loading is false.

The openadventure-seeded-replay-mode is a truth state that varies.
The openadventure-seeded-replay-mode is false.

The openadventure-upstream-replay-mode is a truth state that varies.
The openadventure-upstream-replay-mode is false.

Section 3 - Gameplay-subsystem feature flags

The openadventure-subsystem-dwarves is a truth state that varies.
The openadventure-subsystem-dwarves is false.

The openadventure-subsystem-pirate is a truth state that varies.
The openadventure-subsystem-pirate is false.

The openadventure-subsystem-dragon is a truth state that varies.
The openadventure-subsystem-dragon is false.

The openadventure-subsystem-troll is a truth state that varies.
The openadventure-subsystem-troll is false.

The openadventure-subsystem-bear is a truth state that varies.
The openadventure-subsystem-bear is false.

The openadventure-subsystem-treasure-scoring is a truth state that varies.
The openadventure-subsystem-treasure-scoring is false.

The openadventure-subsystem-cave-closing is a truth state that varies.
The openadventure-subsystem-cave-closing is false.

The openadventure-subsystem-endgame is a truth state that varies.
The openadventure-subsystem-endgame is false.

The openadventure-subsystem-reincarnation is a truth state that varies.
The openadventure-subsystem-reincarnation is false.

The openadventure-subsystem-information is a truth state that varies.
The openadventure-subsystem-information is false.

Section 4 - Data binding for IDs and per-object state

A thing has a text called adventure-id.

A room has a text called adventure-id.

A thing has a text called adventure-state.

Section 5 - Scoring scaffolding

The openadventure-score-total is a number that varies.
The openadventure-score-total is 0.

The openadventure-score-maximum is a number that varies.
The openadventure-score-maximum is 430.

The openadventure-score-delta is a number that varies.
The openadventure-score-delta is 0.

The openadventure-score-event-reason is a text that varies.
The openadventure-score-event-reason is "".

The openadventure-score-event-source is a text that varies.
The openadventure-score-event-source is "".

The openadventure-score-manual-adjustment is a number that varies.
The openadventure-score-manual-adjustment is 0.

The openadventure-death-count is a number that varies.
The openadventure-death-count is 0.

The openadventure-treasures-found-count is a number that varies.
The openadventure-treasures-found-count is 0.

The openadventure-treasures-deposited-count is a number that varies.
The openadventure-treasures-deposited-count is 0.

The openadventure-deep-cave-score-earned is a truth state that varies.
The openadventure-deep-cave-score-earned is false.

The openadventure-cave-closing-score-earned is a truth state that varies.
The openadventure-cave-closing-score-earned is false.

The openadventure-cave-closed-score-earned is a truth state that varies.
The openadventure-cave-closed-score-earned is false.

The openadventure-endgame-bonus-score is a number that varies.
The openadventure-endgame-bonus-score is 0.

The openadventure-quit-bonus-earned is a truth state that varies.
The openadventure-quit-bonus-earned is false.

Table of Open Adventure Treasure Scores
scoring-treasure	discovery-points	deposit-points	treasure-found	treasure-deposited
NUGGET	2	10	false	false
OBJ_51	2	10	false	false
OBJ_52	2	10	false	false
OBJ_53	2	10	false	false
COINS	2	10	false	false
CHEST	2	12	false	false
EGGS	2	14	false	false
TRIDENT	2	14	false	false
VASE	2	14	false	false
EMERALD	2	14	false	false
PYRAMID	2	14	false	false
PEARL	2	14	false	false
RUG	2	14	false	false
OBJ_63	2	14	false	false
CHAIN	2	14	false	false
RUBY	2	14	false	false
JADE	2	14	false	false
AMBER	2	14	false	false
SAPPH	2	14	false	false
OBJ_69	2	14	false	false

Section 6 - Reincarnation runtime state

The openadventure-reincarnation-limit is a number that varies.
The openadventure-reincarnation-limit is 3.

The openadventure-last-safe-room is a room that varies.
The openadventure-last-safe-room is LOC_START.

The openadventure-death-location is a room that varies.
The openadventure-death-location is LOC_NOWHERE.

The openadventure-last-death-cause is a text that varies.
The openadventure-last-death-cause is "".

The openadventure-reincarnation-in-progress is a truth state that varies.
The openadventure-reincarnation-in-progress is false.

The openadventure-reincarnation-last-result is a text that varies.
The openadventure-reincarnation-last-result is "".

The openadventure-cave-closing-active is a truth state that varies.
The openadventure-cave-closing-active is false.

Section 7 - Cave closing runtime state

The openadventure-cave-clock1 is a number that varies.
The openadventure-cave-clock1 is 30.

The openadventure-cave-clock2 is a number that varies.
The openadventure-cave-clock2 is 50.

The openadventure-cave-panic-clock is a number that varies.
The openadventure-cave-panic-clock is 15.

The openadventure-cave-closed-active is a truth state that varies.
The openadventure-cave-closed-active is false.

The openadventure-cave-panic-active is a truth state that varies.
The openadventure-cave-panic-active is false.

The openadventure-cave-closing-last-event is a text that varies.
The openadventure-cave-closing-last-event is "".

The openadventure-cave-last-clock-turn is a number that varies.
The openadventure-cave-last-clock-turn is -1.

Section 8 - Bear runtime state

The openadventure-bear-is-following is a truth state that varies.
The openadventure-bear-is-following is false.

The openadventure-bear-guards-axe is a truth state that varies.
The openadventure-bear-guards-axe is false.

The openadventure-bear-last-event is a text that varies.
The openadventure-bear-last-event is "".

Section 9 - Dragon runtime state

The openadventure-dragon-last-event is a text that varies.
The openadventure-dragon-last-event is "".

The openadventure-dragon-room-transformed is a truth state that varies.
The openadventure-dragon-room-transformed is false.

The openadventure-dragon-blood-drunk is a truth state that varies.
The openadventure-dragon-blood-drunk is false.

Section 10 - Dwarf runtime state

The openadventure-dwarves-travel-in-progress is a truth state that varies.
The openadventure-dwarves-travel-in-progress is false.

The openadventure-dwarf-activity-level is a number that varies.
The openadventure-dwarf-activity-level is 0.

The openadventure-dwarf-movement-pass is a truth state that varies.
The openadventure-dwarf-movement-pass is false.

The openadventure-nodwarves-mode is a truth state that varies.
The openadventure-nodwarves-mode is false.

The openadventure-dwarf-kill-count is a number that varies.
The openadventure-dwarf-kill-count is 0.

Table of Open Adventure Dwarf Actors
dwarf-index	dwarf-location	dwarf-prior-location	dwarf-seen	dwarf-alive
1	LOC_NOWHERE	LOC_NOWHERE	false	true
2	LOC_NOWHERE	LOC_NOWHERE	false	true
3	LOC_NOWHERE	LOC_NOWHERE	false	true
4	LOC_NOWHERE	LOC_NOWHERE	false	true
5	LOC_NOWHERE	LOC_NOWHERE	false	true
6	LOC_NOWHERE	LOC_NOWHERE	false	true

Section 11 - Pirate runtime state

The openadventure-pirate-chest-location is a room that varies.
The openadventure-pirate-chest-location is LOC_MAZEEND12.

The openadventure-pirate-message-location is a room that varies.
The openadventure-pirate-message-location is LOC_DEADEND13.

The openadventure-pirate-chest-placed is a truth state that varies.
The openadventure-pirate-chest-placed is false.

The openadventure-pirate-chest-found is a truth state that varies.
The openadventure-pirate-chest-found is false.

The openadventure-pirate-has-stolen is a truth state that varies.
The openadventure-pirate-has-stolen is false.

The openadventure-pirate-force-chest-ready is a truth state that varies.
The openadventure-pirate-force-chest-ready is false.

The openadventure-pirate-last-theft-count is a number that varies.
The openadventure-pirate-last-theft-count is 0.

Table of Open Adventure Pirate Treasures
pirate-treasure
NUGGET
OBJ_51
OBJ_52
OBJ_53
COINS
CHEST
EGGS
TRIDENT
VASE
EMERALD
PYRAMID
PEARL
RUG
OBJ_63
CHAIN
RUBY
JADE
AMBER
SAPPH
OBJ_69

Section 12 - Endgame runtime state

The openadventure-endgame-complete is a truth state that varies.
The openadventure-endgame-complete is false.

The openadventure-endgame-last-outcome is a text that varies.
The openadventure-endgame-last-outcome is "".

The openadventure-endgame-final-bonus is a number that varies.
The openadventure-endgame-final-bonus is 0.

The openadventure-repository-ready is a truth state that varies.
The openadventure-repository-ready is false.

Section 13 - Information runtime state

The openadventure-information-startup-presented is a truth state that varies.
The openadventure-information-startup-presented is false.

The openadventure-information-last-section is a text that varies.
The openadventure-information-last-section is "".

Section 6 - Utility

This section contains ID normalization helpers and project bootstrapping.

To decide what text is the normalized adventure id from (token - text):
	let normalized-id be token;
	replace the text " " in normalized-id with "_";
	decide on normalized-id.

Section 7 - Runtime dispatch scratch state

The openadventure-runtime-check-result is a truth state that varies.
The openadventure-runtime-check-result is false.

To initialize framework IDs:
	now openadventure-framework-in-lookup is true;
	repeat with candidate-room running through the rooms:
		now adventure-id of candidate-room is the OpenAdventure canonical room id of candidate-room;
	repeat with candidate-thing running through the things:
		now adventure-id of candidate-thing is the normalized adventure id from the printed name of candidate-thing;
	now openadventure-framework-in-lookup is false.

[ Open Adventure Predicate Framework ]

Section 1 - Inventory predicates

To decide whether (item - thing) is carried by the player:
	if the holder of item is the player:
		decide yes;
	decide no.

To decide whether (id - text) is carried by the player:
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			decide no;
	decide no.

To decide whether (item - thing) is with the player:
	if item is carried by the player:
		decide yes;
	if item is in the location of the player:
		decide yes;
	decide no.

To decide whether (id - text) is with the player:
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			if candidate is in the location of the player:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			if candidate is in the location of the player:
				decide yes;
			decide no;
	decide no.

To decide whether (id - text) has state (state-text - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if adventure-state of candidate is state-text:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if adventure-state of candidate is state-text:
				decide yes;
			decide no;
	decide no.

Section 2 - Travel condition predicates

To decide whether condition (condition-kind - text) with arg1 (arg1 - text) and arg2 (arg2 - text) chance (chance - number) holds in source location (source-room - room):
	if condition-kind is "":
		decide yes;
	if condition-kind is "none":
		decide yes;
	if condition-kind is "unsupported":
		decide no;
	else if condition-kind is "carry":
		if arg1 is carried by the player:
			decide yes;
		decide no;
	else if condition-kind is "with":
		if arg1 is with the player:
			decide yes;
		decide no;
	else if condition-kind is "not":
		if arg1 is "<none>" or arg2 is "<none>":
			decide yes;
		if arg1 has state arg2:
			decide no;
		decide yes;
	else if condition-kind is "pct":
		if a random chance of chance in 100 succeeds:
			decide yes;
		decide no;
	else if condition-kind is "nodwarves":
		[ nodwarves is a route-exclusion marker for dwarf movement. Player travel
		  normally treats the condition as satisfied. ]
		if openadventure-nodwarves-mode is true:
			if openadventure nodwarves traversal from source-location openadventure-active-source-loc to destination-location openadventure-active-travel-result:
				decide yes;
			decide no;
		decide yes;
	decide no.

Section 3 - ID resolution helpers

To decide what text is normalized token in verb list (text-value - text):
	decide on the normalized adventure id from text-value.

To decide what thing is the object for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	decide on nothing.

To decide what room is the room for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through rooms:
		if the OpenAdventure canonical room id of candidate is normalized-id:
			decide on candidate;
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	decide on LOC_NOWHERE.

[ Open Adventure Plover Subsystem ]

Section 1 - Plover travel helper predicates

To decide whether oa-plover-tunnel-allows-passage (source-id - text):
	let carried-count be the number of things carried by the player;
	if carried-count is 0:
		decide yes;
	if carried-count is 1:
		if "EMERALD" is carried by the player:
			decide yes;
	decide no.

To say plover tunnel capacity message:
	say "Something you're carrying won't fit through the tunnel with you. [line break]You'd best take inventory and drop something.";

Section 2 - Plover special handlers

To oa-handle-plover-passage-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	if oa-plover-tunnel-allows-passage source-id:
		now openadventure-runtime-check-result is true;
	else:
		say "[plover tunnel capacity message]";
		now openadventure-runtime-check-result is false;
	if source-id is "LOC_ALCOVE":
		oa-dispatch-openadventure-goto source-id to "LOC_PLOVER" with verb-token verb-token;
		if openadventure-runtime-check-result is true:
			now openadventure-runtime-check-result is true;
	if source-id is "LOC_PLOVER":
		oa-dispatch-openadventure-goto source-id to "LOC_ALCOVE" with verb-token verb-token;
	if openadventure-runtime-check-result is true:
		now openadventure-runtime-check-result is true;
	else:
		now openadventure-runtime-check-result is false.

To oa-handle-plover-emerald-drop-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	let plover-emerald be the object for adventure-id "EMERALD";
	let fallback-id be "";
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
	if plover-emerald is carried by the player:
		move plover-emerald to source-room;
	if source-id is "LOC_Y2":
		now fallback-id is "LOC_FOOF5";
	else if source-id is "LOC_PLOVER":
		now fallback-id is "LOC_FOOF6";
	else:
		now openadventure-runtime-check-result is false;
	if fallback-id is "":
		now openadventure-runtime-check-result is false;
	oa-dispatch-openadventure-goto source-id to fallback-id with verb-token verb-token;

[ Open Adventure Troll / Bridge Subsystem ]

Section 1 - Troll and chasm state defaults

To decide what room is openadventure troll-bridge destination from (source-room - room):
	if source-room is LOC_SWCHASM:
		decide on LOC_NECHASM;
	if source-room is LOC_NECHASM:
		decide on LOC_SWCHASM;
	decide on LOC_NOWHERE.

To say openadventure troll bridge paid-once block message:
	say "The troll steps out from beneath the bridge and blocks your way.";

To say openadventure troll bridge bear-collapse message:
	say "Just as you reach the other side, the bridge buckles beneath the weight of the bear, which was still following you around. You scrabble desperately for support, but as the bridge collapses you stumble back and fall into the chasm.";

When play begins:
	enable subsystem troll;
	if adventure-state of CHASM is "":
		now adventure-state of CHASM is "TROLL_BRIDGE";
	if adventure-state of TROLL is "":
		now adventure-state of TROLL is "TROLL_UNPAID";
	if adventure-state of BEAR is "":
		now adventure-state of BEAR is "UNTAMED_BEAR";

Section 2 - Troll bridge travel integration

To oa-handle-troll-bridge-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	let destination-room be openadventure troll-bridge destination from source-room;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	if destination-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	if adventure-state of TROLL is "TROLL_PAIDONCE":
		say "[openadventure troll bridge paid-once block message]";
		now adventure-state of TROLL is "TROLL_UNPAID";
		now openadventure-runtime-check-result is true;
		stop;
	if adventure-state of TROLL is "TROLL_UNPAID":
		now adventure-state of TROLL is "TROLL_PAIDONCE";
	let destination-id be adventure-id of destination-room;
	oa-dispatch-openadventure-goto source-id to destination-id with verb-token verb-token;
	if openadventure-runtime-check-result is false:
		now openadventure-runtime-check-result is false;
		stop;
	if BEAR is carried by the player, openadventure-handle-troll-bridge-bear-collapse destination-room.

To openadventure-handle-troll-bridge-bear-collapse (destination-room - room):
	now adventure-state of CHASM is "BRIDGE_WRECKED";
	now adventure-state of TROLL is "TROLL_GONE";
	move BEAR to destination-room;
	now BEAR is fixed in place;
	now adventure-state of BEAR is "BEAR_DEAD";
	say "[openadventure troll bridge bear-collapse message]";
	handle openadventure death caused by "bear_bridge";
	now openadventure-runtime-check-result is true;
	stop.

[ Open Adventure Bear Subsystem ]

Section 1 - Parser Surface

Feeding is an action applying to one thing.
Understand "feed [something]" as feeding.

Freeing is an action applying to one thing.
Understand "free [something]" as freeing.
Understand "release [something]" as freeing.

Section 2 - Messages

To say openadventure bear feeding message:
	say "The bear eagerly wolfs down your food, after which he seems to calm down considerably and even becomes rather friendly."

To say openadventure bear hands message:
	say "With what?  Your bare hands?  Against *HIS* bear hands??"

To say openadventure bear confused message:
	say "The bear is confused; he only wants to be your friend."

To say openadventure already dead message:
	say "For crying out loud, the poor thing is already dead!"

To say openadventure bear chained message:
	say "The bear is still chained to the wall."

To say openadventure bear blocks message:
	say "There is no way to get past the bear to unlock the chain, which is probably just as well."

To say openadventure still locked message:
	say "The chain is still locked."

To say openadventure chain unlocked message:
	say "The chain is now unlocked."

To say openadventure chain locked message:
	say "The chain is now locked."

To say openadventure no locksite message:
	say "There is nothing here to which the chain can be locked."

To say openadventure bear follows message:
	say "OK, the bear's now following you around."

To say openadventure bear wanders message:
	say "The bear wanders away from you."

To say openadventure bear scares troll message:
	say "The bear lumbers toward the troll, who lets out a startled shriek and scurries away.  The bear soon gives up the pursuit and wanders back."

To say openadventure axe near bear message:
	say "The axe misses and lands near the bear where you can't get at it."

To say openadventure axe guarded by bear message:
	say "No chance.  It's lying beside the ferocious bear, quite within harm's way."

Section 3 - State Helpers

To initialize openadventure bear subsystem:
	enable subsystem bear;
	now openadventure-bear-is-following is false;
	now openadventure-bear-guards-axe is false;
	now openadventure-bear-last-event is "";
	if adventure-state of BEAR is "":
		now adventure-state of BEAR is "UNTAMED_BEAR";
	if adventure-state of CHAIN is "":
		now adventure-state of CHAIN is "CHAINING_BEAR";
	now BEAR is fixed in place;
	now CHAIN is fixed in place.

To decide whether openadventure bear is friendly:
	if adventure-state of BEAR is "SITTING_BEAR":
		decide yes;
	if adventure-state of BEAR is "CONTENTED_BEAR":
		decide yes;
	decide no.

To decide whether openadventure bear is tame and unchained:
	if adventure-state of BEAR is "CONTENTED_BEAR" and adventure-state of CHAIN is "CHAIN_HEAP":
		decide yes;
	decide no.

To decide whether openadventure troll is present for bear in (current-room - room):
	if adventure-state of TROLL is "TROLL_GONE":
		decide no;
	if current-room is LOC_SWCHASM:
		decide yes;
	if current-room is LOC_NECHASM:
		decide yes;
	if TROLL is in current-room:
		decide yes;
	decide no.

To openadventure bear chases troll from (current-room - room):
	now adventure-state of TROLL is "TROLL_GONE";
	move TROLL to LOC_NOWHERE;
	move TROLL2 to LOC_SWCHASM;
	now adventure-state of CHASM is "TROLL_BRIDGE";
	move BEAR to current-room;
	now openadventure-bear-is-following is false;
	now openadventure-bear-last-event is "troll_chased";
	say "[openadventure bear scares troll message]".

Section 4 - Bear Food and Combat

To feed openadventure bear:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
		stop;
	if adventure-state of BEAR is "UNTAMED_BEAR":
		if FOOD is carried by the player or FOOD is in the location of the player:
			move FOOD to LOC_NOWHERE;
			now AXE is portable;
			now adventure-state of AXE is "AXE_HERE";
			now openadventure-bear-guards-axe is false;
			now adventure-state of BEAR is "SITTING_BEAR";
			now openadventure-bear-last-event is "fed";
			say "[openadventure bear feeding message]";
		otherwise:
			say "There is nothing here to eat.";
		stop;
	say "The bear doesn't seem very interested in your offer."

Instead of feeding BEAR:
	feed openadventure bear.

Instead of feeding FOOD:
	if BEAR is in the location of the player:
		feed openadventure bear;
	otherwise:
		say "There is nothing here to eat."

Instead of freeing BEAR:
	if BEAR is carried by the player or openadventure-bear-is-following is true:
		if openadventure troll is present for bear in the location of the player:
			openadventure bear chases troll from the location of the player;
		otherwise:
			move BEAR to the location of the player;
			now openadventure-bear-is-following is false;
			now openadventure-bear-last-event is "dropped";
			say "[openadventure bear wanders message]";
	otherwise:
		unlock openadventure bear chain.

Instead of freeing CHAIN:
	unlock openadventure bear chain.

Instead of giving FOOD to BEAR:
	feed openadventure bear.

Instead of throwing FOOD at BEAR:
	feed openadventure bear.

Instead of attacking BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if openadventure bear is friendly:
		say "[openadventure bear confused message]";
	otherwise:
		say "[openadventure bear hands message]".

Instead of throwing AXE at BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if openadventure bear is friendly:
		say "[openadventure bear confused message]";
	otherwise:
		move AXE to the location of the player;
		now AXE is fixed in place;
		now adventure-state of AXE is "AXE_LOST";
		now openadventure-bear-guards-axe is true;
		now openadventure-bear-last-event is "axe_lost";
		say "[openadventure axe near bear message]".

Instead of taking AXE when openadventure-bear-guards-axe is true:
	say "[openadventure axe guarded by bear message]".

Section 5 - Chain and Following

To unlock openadventure bear chain:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop;
	if adventure-state of BEAR is "UNTAMED_BEAR":
		say "[openadventure bear blocks message]";
		stop;
	if adventure-state of CHAIN is "CHAIN_HEAP":
		say "It was already unlocked.";
		stop;
	now adventure-state of CHAIN is "CHAIN_HEAP";
	now CHAIN is portable;
	if adventure-state of BEAR is not "BEAR_DEAD":
		now adventure-state of BEAR is "CONTENTED_BEAR";
		now BEAR is portable;
	now openadventure-bear-last-event is "chain_unlocked";
	say "[openadventure chain unlocked message]".

To lock openadventure bear chain:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop;
	if adventure-state of CHAIN is not "CHAIN_HEAP":
		say "It was already locked.";
		stop;
	if the location of the player is not LOC_BARRENROOM:
		say "[openadventure no locksite message]";
		stop;
	now adventure-state of CHAIN is "CHAIN_FIXED";
	if CHAIN is carried by the player:
		move CHAIN to the location of the player;
	now CHAIN is fixed in place;
	now openadventure-bear-last-event is "chain_locked";
	say "[openadventure chain locked message]".

Instead of opening CHAIN:
	unlock openadventure bear chain.

Instead of unlocking CHAIN with KEYS:
	unlock openadventure bear chain.

Instead of closing CHAIN:
	lock openadventure bear chain.

Instead of locking CHAIN with KEYS:
	lock openadventure bear chain.

Oaunlockingbearchain is an action applying to nothing.
Understand "unlock chain" as oaunlockingbearchain.
Understand "open chain" as oaunlockingbearchain.

Carry out oaunlockingbearchain:
	unlock openadventure bear chain.

Oalockingbearchain is an action applying to nothing.
Understand "lock chain" as oalockingbearchain.
Understand "close chain" as oalockingbearchain.

Carry out oalockingbearchain:
	lock openadventure bear chain.

Instead of taking CHAIN:
	if adventure-state of CHAIN is "CHAIN_HEAP":
		continue the action;
	if adventure-state of BEAR is not "UNTAMED_BEAR":
		say "[openadventure still locked message]";
	otherwise:
		say "Surely you're joking!"

Instead of taking BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if not openadventure bear is friendly:
		say "Surely you're joking!";
	else if adventure-state of CHAIN is not "CHAIN_HEAP":
		say "[openadventure bear chained message]";
	otherwise:
		now BEAR is portable;
		move BEAR to the player;
		now openadventure-bear-is-following is true;
		now openadventure-bear-last-event is "following";
		say "[openadventure bear follows message]".

Instead of dropping BEAR:
	if BEAR is not carried by the player:
		say "What?";
	else if openadventure troll is present for bear in the location of the player:
		openadventure bear chases troll from the location of the player;
	otherwise:
		move BEAR to the location of the player;
		now openadventure-bear-is-following is false;
		now openadventure-bear-last-event is "dropped";
		say "[openadventure bear wanders message]".

Section 6 - Runtime Hooks

To run openadventure bear post-travel hooks for destination (target - room):
	if BEAR is carried by the player:
		now openadventure-bear-is-following is true;
	else if openadventure-bear-is-following is true:
		move BEAR to target.

When play begins:
	initialize openadventure bear subsystem.

[ Open Adventure Dwarf Subsystem ]

Section 1 - Messages

To say openadventure dwarf block message:
	say "A little dwarf with a big knife blocks your way!"

To say openadventure dwarf encountered message:
	say "A little dwarf just walked around a corner, saw you, threw a little axe at you which missed, cursed, and ran away;"

To say openadventure dwarf-single message:
	say "There is a threatening little dwarf in the room with you!"

To say openadventure dwarf-pack message (pack-size - number):
	say "There are [pack-size] threatening little dwarves in the room with you!"

To say openadventure dwarf knife-message:
	say "One sharp nasty knife is thrown at you!"

To say openadventure thrown-knives-message (thrown-count - number):
	say "[thrown-count] of them throw knives at you!"

To say openadventure multi-hit-message (hit-count - number):
	if hit-count is 1:
		say "One of them gets you!";
	otherwise:
		say "[hit-count] of them get you!"

To say openadventure miss-message:
	say "None of them hits you!"

To say openadventure single-hit-message:
	say "It gets you!"

To say openadventure miss-single-message:
	say "It misses!"

To say openadventure you-killed-dwarf-message:
	say "You killed a little dwarf."

To say openadventure dwarf dodges-message:
	say "You attack a little dwarf, but he dodges out of the way;"

Section 2 - Cave and route predicates

To decide if openadventure deep cave membership of (candidate-room - room):
	if candidate-room is LOC_NOWHERE:
		decide no;
	if candidate-room is LOC_START:
		decide no;
	if candidate-room is LOC_HILL:
		decide no;
	if candidate-room is LOC_BUILDING:
		decide no;
	if candidate-room is LOC_VALLEY:
		decide no;
	if candidate-room is LOC_ROADEND:
		decide no;
	if candidate-room is LOC_CLIFF:
		decide no;
	if candidate-room is LOC_SLIT:
		decide no;
	if candidate-room is LOC_GRATE:
		decide no;
	if candidate-room is LOC_BELOWGRATE:
		decide no;
	if candidate-room is LOC_COBBLE:
		decide no;
	if candidate-room is LOC_DEBRIS:
		decide no;
	if candidate-room is LOC_AWKWARD:
		decide no;
	if candidate-room is LOC_BIRDCHAMBER:
		decide no;
	if candidate-room is LOC_PITTOP:
		decide no;
	if candidate-room is LOC_LEDGE:
		decide no;
	if candidate-room is LOC_FOOF1:
		decide no;
	if candidate-room is LOC_FOOF2:
		decide no;
	if candidate-room is LOC_FOOF4:
		decide no;
	decide yes.

To decide whether openadventure-dwarf-route is forbidden between (source-id - text) and (destination-id - text):
	if source-id is "LOC_LONGWEST" and destination-id is "LOC_DIFFERENT1":
		decide yes;
	decide no.

To decide whether openadventure-dwarf-route is forbidden from (source-room - room) to (destination-room - room):
	if source-room is LOC_LONGWEST and destination-room is LOC_DIFFERENT1:
		decide yes;
	decide no.

To decide whether openadventure nodwarves traversal from source-location (source-id - text) to destination-location (destination-id - text):
	if openadventure-nodwarves-mode is false:
		decide yes;
	if openadventure-dwarf-route is forbidden between source-id and destination-id:
		decide no;
	decide yes.

Section 3 - Actor state

To decide what room is the starting room for dwarf index (dwarf-idx - number):
	if dwarf-idx is 1:
		decide on LOC_KINGHALL;
	if dwarf-idx is 2:
		decide on LOC_WESTBANK;
	if dwarf-idx is 3:
		decide on LOC_Y2;
	if dwarf-idx is 4:
		decide on LOC_ALIKE3;
	if dwarf-idx is 5:
		decide on LOC_COMPLEX;
	if dwarf-idx is 6:
		decide on LOC_MAZEEND12;
	decide on LOC_NOWHERE.

To initialize openadventure dwarf actors:
	repeat through the Table of Open Adventure Dwarf Actors:
		now dwarf-location entry is starting room for dwarf index dwarf-index entry;
		now dwarf-prior-location entry is LOC_NOWHERE;
		now dwarf-seen entry is false;
		now dwarf-alive entry is true;
	now openadventure-dwarf-kill-count is 0;
	move DWARF to LOC_NOWHERE.

To decide whether an openadventure visible dwarf is present:
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is the location of the player:
			decide yes;
	decide no.

To kill one openadventure visible dwarf:
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is the location of the player:
			now dwarf-alive entry is false;
			now dwarf-location entry is LOC_NOWHERE;
			now dwarf-prior-location entry is LOC_NOWHERE;
			now dwarf-seen entry is false;
			increase openadventure-dwarf-kill-count by 1;
			stop.

Section 4 - Travel gates and encounter flow

To enable openadventure dwarf movement pass:
	now openadventure-dwarf-movement-pass is true.

To disable openadventure dwarf movement pass:
	now openadventure-dwarf-movement-pass is false.

To decide whether openadventure-dwarf-blocks-travel from (source-room - room) to (destination-room - room):
	if openadventure-seeded-replay-mode is true:
		decide no;
	if source-room is LOC_NOWHERE:
		decide no;
	if destination-room is LOC_NOWHERE:
		decide no;
	if not openadventure deep cave membership of source-room:
		decide no;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is source-room and dwarf-prior-location entry is destination-room:
			say "[openadventure dwarf block message]";
			decide yes;
	decide no.

To begin openadventure dwarf first encounter in (current-room - room):
	if not openadventure deep cave membership of current-room:
		stop;
	if a random chance of 95 in 100 succeeds:
		stop;
	now openadventure-dwarf-activity-level is 2;
	let survivors-to-kill be 0;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if survivors-to-kill is 2:
			next;
		if a random chance of 50 in 100 succeeds:
			increase survivors-to-kill by 1;
			increase openadventure-dwarf-kill-count by 1;
			now dwarf-alive entry is false;
			now dwarf-location entry is LOC_NOWHERE;
			now dwarf-prior-location entry is LOC_NOWHERE;
			now dwarf-seen entry is false;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-location entry is current-room:
			now dwarf-location entry is LOC_NUGGET;
			now dwarf-prior-location entry is LOC_NUGGET;
			now dwarf-seen entry is false;
	say "[openadventure dwarf encountered message]";
	move DWARF to LOC_NOWHERE;
	move AXE to current-room.

To openadventure-run-dwarf-round in (current-room - room):
	let visible-dwarves be 0;
	let attackers be 0;
	let hitters be 0;
	let hit-chance be 0;
	if openadventure-dwarf-activity-level < 2:
		stop;
	if openadventure-dwarves-travel-in-progress is true:
		stop;
	now openadventure-dwarves-travel-in-progress is true;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-location entry is LOC_NOWHERE:
			next;
		if dwarf-seen entry is true:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			increase visible-dwarves by 1;
			increase attackers by 1;
		else if dwarf-location entry is current-room or dwarf-prior-location entry is current-room:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
			increase visible-dwarves by 1;
		else if openadventure deep cave membership of current-room and a random chance of 1 in 8 succeeds:
			if openadventure-dwarf-route is forbidden from dwarf-location entry to current-room:
				next;
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
			increase visible-dwarves by 1;
	run openadventure pirate post-dwarf-round in current-room with dwarf-count visible-dwarves;
	if visible-dwarves is 0:
		move DWARF to LOC_NOWHERE;
		now openadventure-dwarves-travel-in-progress is false;
		stop;
	move DWARF to current-room;
	if visible-dwarves is 1:
		say "[openadventure dwarf-single message]";
	otherwise:
		say "[openadventure dwarf-pack message visible-dwarves]";
	if attackers is 0:
		now openadventure-dwarves-travel-in-progress is false;
		stop;
	if openadventure-dwarf-activity-level is 2:
		now openadventure-dwarf-activity-level is 3;
	now hit-chance is 95 * (openadventure-dwarf-activity-level - 2);
	if openadventure-seeded-replay-mode is true:
		now hit-chance is 0;
	if attackers > 1:
		say "[openadventure thrown-knives-message attackers]";
	otherwise:
		say "[openadventure dwarf knife-message]";
	repeat with N running from 1 to attackers:
		if a random chance of hit-chance in 100 succeeds:
			increase hitters by 1;
	if attackers > 1:
		if hitters is 0:
			say "[openadventure miss-message]";
		otherwise:
			say "[openadventure multi-hit-message hitters]";
	otherwise:
		if hitters is 0:
			say "[openadventure miss-single-message]";
		otherwise:
			say "[openadventure single-hit-message]";
	if hitters > 0:
		now openadventure-dwarves-travel-in-progress is false;
		handle openadventure death caused by "dwarf_knife";
	now openadventure-dwarves-travel-in-progress is false.

To run openadventure dwarves post-travel hooks for source (source-room - room) destination (destination-room - room) verb (verb-token - text):
	if source-room is LOC_NOWHERE:
		stop;
	if destination-room is LOC_NOWHERE:
		stop;
	if openadventure-subsystem-dwarves is false:
		stop;
	enable openadventure dwarf movement pass;
	if openadventure-dwarf-activity-level is 0 and openadventure deep cave membership of destination-room:
		now openadventure-dwarf-activity-level is 1;
		disable openadventure dwarf movement pass;
		stop;
	if openadventure-upstream-replay-mode is true:
		run openadventure upstream replay pirate hooks in destination-room;
		disable openadventure dwarf movement pass;
		stop;
	if openadventure-seeded-replay-mode is true and adventure-state of LAMP is not "LAMP_BRIGHT":
		disable openadventure dwarf movement pass;
		stop;
	if openadventure-dwarf-activity-level is 1:
		begin openadventure dwarf first encounter in destination-room;
	else:
		openadventure-run-dwarf-round in destination-room;
	disable openadventure dwarf movement pass.

Section 5 - Parser behavior

Instead of attacking DWARF:
	if an openadventure visible dwarf is present:
		if openadventure-seeded-replay-mode is true:
			kill one openadventure visible dwarf;
			say "[openadventure you-killed-dwarf-message]";
			if an openadventure visible dwarf is present:
				move DWARF to the location of the player;
			otherwise:
				move DWARF to LOC_NOWHERE;
		else if a random chance of 6 in 10 succeeds:
			kill one openadventure visible dwarf;
			say "[openadventure you-killed-dwarf-message]";
			if an openadventure visible dwarf is present:
				move DWARF to the location of the player;
			otherwise:
				move DWARF to LOC_NOWHERE;
		otherwise:
			say "[openadventure dwarf dodges-message]";
	otherwise:
		say "There is nothing here to attack."

Instead of attacking AXE:
	if an openadventure visible dwarf is present:
		try attacking DWARF;
	otherwise:
		continue the action.

When play begins:
	enable subsystem dwarves;
	initialize openadventure dwarf actors;
	now openadventure-dwarf-activity-level is 0.

[ Open Adventure Pirate Subsystem ]

Section 1 - Messages

The initial appearance of CHEST is "The pirate's treasure chest is here!"

To say openadventure pirate rustles message:
	say "There are faint rustling noises from the darkness behind you."

To say openadventure pirate pounces message:
	say "Out from the shadows behind you pounces a bearded pirate!  [quotation mark]Har, har,[quotation mark] he chortles, [quotation mark]I'll just take all this booty and hide it away with me chest deep in the maze![quotation mark]  He snatches your treasure and vanishes into the gloom."

To say openadventure pirate spotted message:
	say "There are faint rustling noises from the darkness behind you.  As you turn toward them, the beam of your lamp falls across a bearded pirate.  He is carrying a large chest.  [quotation mark]Shiver me timbers![quotation mark] he cries, [quotation mark]I've been spotted!  I'd best hie meself off to the maze to hide me chest![quotation mark] With that, he vanishes into the gloom."

Section 2 - Room and treasure predicates

To decide whether openadventure pirate forbidden room is (candidate-room - room):
	if candidate-room is LOC_MAZEEND1:
		decide yes;
	if candidate-room is LOC_MAZEEND2:
		decide yes;
	if candidate-room is LOC_MAZEEND3:
		decide yes;
	if candidate-room is LOC_MAZEEND4:
		decide yes;
	if candidate-room is LOC_MAZEEND5:
		decide yes;
	if candidate-room is LOC_MAZEEND6:
		decide yes;
	if candidate-room is LOC_MAZEEND9:
		decide yes;
	if candidate-room is LOC_MAZEEND10:
		decide yes;
	if candidate-room is LOC_MAZEEND11:
		decide yes;
	if candidate-room is LOC_NECHASM:
		decide yes;
	if candidate-room is LOC_CORRIDOR:
		decide yes;
	if candidate-room is LOC_FORK:
		decide yes;
	if candidate-room is LOC_WARMWALLS:
		decide yes;
	if candidate-room is LOC_BREATHTAKING:
		decide yes;
	if candidate-room is LOC_BOULDERS2:
		decide yes;
	if candidate-room is LOC_LIMESTONE:
		decide yes;
	if candidate-room is LOC_BARRENFRONT:
		decide yes;
	if candidate-room is LOC_BARRENROOM:
		decide yes;
	decide no.

To decide whether openadventure-pirate ignores pyramid in (current-room - room):
	if current-room is LOC_DARKROOM:
		decide yes;
	if current-room is LOC_PLOVER:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure (item - thing) is protected in (current-room - room):
	if item is PYRAMID and openadventure-pirate ignores pyramid in current-room:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure is nearby (item - thing) in (current-room - room):
	if openadventure-pirate treasure item is protected in current-room:
		decide no;
	if item is carried by the player:
		decide yes;
	if item is in current-room:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure is carried (item - thing) in (current-room - room):
	if openadventure-pirate treasure item is protected in current-room:
		decide no;
	if item is carried by the player:
		decide yes;
	decide no.

Section 3 - State transitions

To initialize openadventure pirate subsystem:
	enable subsystem pirate;
	now openadventure-pirate-chest-location is LOC_MAZEEND12;
	now openadventure-pirate-message-location is LOC_DEADEND13;
	now openadventure-pirate-chest-placed is false;
	now openadventure-pirate-chest-found is false;
	now openadventure-pirate-has-stolen is false;
	now openadventure-pirate-force-chest-ready is false;
	now openadventure-pirate-last-theft-count is 0;
	now adventure-state of CHEST is "PIRATE_CHEST_HIDDEN";
	move CHEST to LOC_NOWHERE;
	move MESSAG to LOC_NOWHERE;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-location entry is openadventure-pirate-chest-location;
			now dwarf-prior-location entry is openadventure-pirate-chest-location;
			now dwarf-seen entry is false;
			now dwarf-alive entry is true.

To place openadventure pirate chest:
	move CHEST to openadventure-pirate-chest-location;
	move MESSAG to openadventure-pirate-message-location;
	now openadventure-pirate-chest-placed is true;
	now adventure-state of CHEST is "PIRATE_CHEST_PLACED";
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-location entry is openadventure-pirate-chest-location;
			now dwarf-prior-location entry is openadventure-pirate-chest-location;
			now dwarf-seen entry is false.

To mark openadventure pirate chest found if appropriate in (current-room - room):
	if current-room is openadventure-pirate-chest-location and CHEST is in openadventure-pirate-chest-location:
		now openadventure-pirate-chest-found is true;
		now adventure-state of CHEST is "PIRATE_CHEST_FOUND";
		mark openadventure treasure CHEST as found for reason "pirate_chest_found".

To steal openadventure pirate booty in (current-room - room):
	now openadventure-pirate-last-theft-count is 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure loot is protected in current-room:
			next;
		if loot is carried by the player:
			mark openadventure treasure loot as found for reason "pirate_theft";
			move loot to openadventure-pirate-chest-location;
			increase openadventure-pirate-last-theft-count by 1;
		else if loot is in current-room:
			mark openadventure treasure loot as found for reason "pirate_theft";
			move loot to openadventure-pirate-chest-location;
			increase openadventure-pirate-last-theft-count by 1;
	if openadventure-pirate-last-theft-count > 0:
		now openadventure-pirate-has-stolen is true.

To decide whether openadventure upstream replay pirate pounce room is (current-room - room):
	if current-room is LOC_ALIKE2:
		decide yes;
	decide no.

To run openadventure upstream replay pirate hooks in (current-room - room):
	mark openadventure pirate chest found if appropriate in current-room;
	if openadventure-upstream-replay-mode is false:
		stop;
	if openadventure-pirate-chest-placed is true:
		stop;
	if not openadventure upstream replay pirate pounce room is current-room:
		stop;
	if openadventure-dwarf-activity-level < 2:
		now openadventure-dwarf-activity-level is 2;
	if not openadventure pirate is eligible in current-room:
		stop;
	let carried-treasures be 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure is carried loot in current-room:
			increase carried-treasures by 1;
	if carried-treasures > 0:
		place openadventure pirate chest;
		say "[openadventure pirate pounces message]";
		steal openadventure pirate booty in current-room.

Section 4 - Encounter resolution

To decide whether openadventure pirate is eligible in (current-room - room):
	if openadventure-subsystem-pirate is false:
		decide no;
	if openadventure-dwarf-activity-level < 2:
		decide no;
	if current-room is LOC_NOWHERE:
		decide no;
	if not openadventure deep cave membership of current-room:
		decide no;
	if openadventure pirate forbidden room is current-room:
		decide no;
	if current-room is openadventure-pirate-chest-location:
		decide no;
	if openadventure-pirate-chest-found is true:
		decide no;
	decide yes.

To decide whether openadventure pirate should appear in (current-room - room):
	if not openadventure pirate is eligible in current-room:
		decide no;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			if dwarf-alive entry is false:
				decide no;
			if dwarf-seen entry is true:
				decide yes;
			if dwarf-location entry is current-room:
				decide yes;
			if dwarf-prior-location entry is current-room:
				decide yes;
	if a random chance of 1 in 8 succeeds:
		decide yes;
	decide no.

To run openadventure pirate post-dwarf-round in (current-room - room) with dwarf-count (visible-dwarves - number):
	mark openadventure pirate chest found if appropriate in current-room;
	if not openadventure pirate should appear in current-room:
		stop;
	let nearby-treasures be 0;
	let carried-treasures be 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure is nearby loot in current-room:
			increase nearby-treasures by 1;
		if openadventure-pirate treasure is carried loot in current-room:
			increase carried-treasures by 1;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
	if nearby-treasures is 0 and openadventure-pirate-force-chest-ready is true and openadventure-pirate-chest-placed is false:
		say "[openadventure pirate spotted message]";
		place openadventure pirate chest;
		stop;
	if carried-treasures > 0:
		place openadventure pirate chest;
		say "[openadventure pirate pounces message]";
		steal openadventure pirate booty in current-room;
		stop;
	if a random chance of 20 in 100 succeeds:
		say "[openadventure pirate rustles message]".

When play begins:
	initialize openadventure pirate subsystem.

[ Open Adventure Treasure and Scoring Subsystem ]

The maximum score is 430.

Section 1 - Score Bookkeeping

To reset openadventure treasure score table:
	repeat through the Table of Open Adventure Treasure Scores:
		now treasure-found entry is false;
		now treasure-deposited entry is false;
	now openadventure-treasures-found-count is 0;
	now openadventure-treasures-deposited-count is 0.

To note openadventure score event delta (delta - number) reason (reason - text) source (source - text):
	now openadventure-score-delta is delta;
	now openadventure-score-event-reason is reason;
	now openadventure-score-event-source is source.

To record openadventure score delta (delta - number) for reason (reason - text) from source (source - text):
	increase openadventure-score-manual-adjustment by delta;
	note openadventure score event delta delta reason reason source source;
	update openadventure score total.

To initialize openadventure scoring subsystem:
	enable subsystem treasure-scoring;
	now openadventure-score-maximum is 430;
	now openadventure-score-total is 0;
	now openadventure-score-manual-adjustment is 0;
	now openadventure-death-count is 0;
	now openadventure-deep-cave-score-earned is false;
	now openadventure-cave-closing-score-earned is false;
	now openadventure-cave-closed-score-earned is false;
	now openadventure-endgame-bonus-score is 0;
	now openadventure-quit-bonus-earned is false;
	reset openadventure treasure score table;
	update openadventure treasure status;
	update openadventure score total.

Section 2 - Treasure Classification and State

To decide whether openadventure treasure table includes (item - thing):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			decide yes;
	decide no.

To decide whether openadventure treasure (item - thing) has been found:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-found entry is true:
				decide yes;
			decide no;
	decide no.

To decide whether openadventure treasure (item - thing) has been deposited:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-deposited entry is true:
				decide yes;
			decide no;
	decide no.

To decide whether openadventure treasure (item - thing) is discoverable now:
	if item is carried by the player:
		decide yes;
	if item is in the location of the player:
		decide yes;
	decide no.

To decide whether openadventure treasure (item - thing) is safely deposited:
	if item is in LOC_BUILDING:
		decide yes;
	decide no.

To mark openadventure treasure (item - thing) as found for reason (reason - text):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-found entry is false:
				now treasure-found entry is true;
				increase openadventure-treasures-found-count by 1;
				if item is CHEST:
					now openadventure-pirate-chest-found is true;
					now adventure-state of CHEST is "PIRATE_CHEST_FOUND";
				note openadventure score event delta discovery-points entry reason reason source "openadventure_scoring";
				update openadventure pirate chest readiness;
				update openadventure score total;
			stop.

To mark openadventure treasure (item - thing) as deposited for reason (reason - text):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-deposited entry is false:
				now treasure-deposited entry is true;
				increase openadventure-treasures-deposited-count by 1;
				note openadventure score event delta deposit-points entry reason reason source "openadventure_scoring";
				update openadventure score total;
			stop.

To update openadventure pirate chest readiness:
	let unfound-non-chest-treasures be 0;
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is CHEST:
			next;
		if treasure-found entry is false:
			increase unfound-non-chest-treasures by 1;
	if unfound-non-chest-treasures is 0 and openadventure-pirate-chest-found is false and openadventure-pirate-chest-placed is false:
		now openadventure-pirate-force-chest-ready is true.

To update openadventure treasure status:
	if openadventure-subsystem-treasure-scoring is false:
		stop;
	repeat through the Table of Open Adventure Treasure Scores:
		let item be scoring-treasure entry;
		if openadventure treasure item is discoverable now:
			mark openadventure treasure item as found for reason "treasure_discovered";
		if treasure-found entry is true and openadventure treasure item is safely deposited:
			mark openadventure treasure item as deposited for reason "treasure_deposited";
	update openadventure pirate chest readiness;
	update openadventure score total.

Section 3 - Score Computation

To update openadventure score total:
	let running-score be 0;
	repeat through the Table of Open Adventure Treasure Scores:
		if treasure-found entry is true:
			increase running-score by discovery-points entry;
		if treasure-deposited entry is true:
			increase running-score by deposit-points entry;
	increase running-score by (3 - openadventure-death-count) * 10;
	if openadventure-quit-bonus-earned is true:
		increase running-score by 4;
	if openadventure-deep-cave-score-earned is true:
		increase running-score by 25;
	if openadventure-cave-closing-score-earned is true:
		increase running-score by 25;
	if openadventure-cave-closed-score-earned is true:
		increase running-score by openadventure-endgame-bonus-score;
	if MAGAZINE is in LOC_WITTSEND:
		increase running-score by 1;
	increase running-score by 2;
	increase running-score by openadventure-score-manual-adjustment;
	now openadventure-score-total is running-score;
	now score is openadventure-score-total.

To record openadventure death penalty:
	if openadventure-death-count < 3:
		increase openadventure-death-count by 1;
		note openadventure score event delta -10 reason "death_penalty" source "openadventure_scoring";
	update openadventure score total.

To mark openadventure deep cave score reached:
	if openadventure-deep-cave-score-earned is false:
		now openadventure-deep-cave-score-earned is true;
		note openadventure score event delta 25 reason "deep_cave" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure cave closing score reached:
	if openadventure-cave-closing-score-earned is false:
		now openadventure-cave-closing-score-earned is true;
		note openadventure score event delta 25 reason "cave_closing" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure cave closed bonus (bonus - number):
	if openadventure-cave-closed-score-earned is false:
		now openadventure-cave-closed-score-earned is true;
		now openadventure-endgame-bonus-score is bonus;
		note openadventure score event delta bonus reason "cave_closed_bonus" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure quit bonus earned:
	if openadventure-quit-bonus-earned is false:
		now openadventure-quit-bonus-earned is true;
		note openadventure score event delta 4 reason "not_quitting" source "openadventure_scoring";
		update openadventure score total.

Section 4 - Runtime Hooks

To run openadventure scoring post-travel hooks for destination (target - room):
	if openadventure deep cave membership of target:
		mark openadventure deep cave score reached;
	update openadventure treasure status.

Every turn when openadventure-subsystem-treasure-scoring is true:
	update openadventure treasure status.

After looking when openadventure-subsystem-treasure-scoring is true:
	update openadventure treasure status.

Carry out requesting the score:
	update openadventure treasure status;
	update openadventure score total.

Report requesting the score:
	say "You have garnered [openadventure-score-total] out of a possible [openadventure-score-maximum] points, using [turn count] turn[if turn count is not 1]s[end if]." instead.

Section 5 - Ranking Hooks

To say openadventure ranking for score (points - number):
	if points <= 45:
		say "You are obviously a rank amateur.  Better luck next time.";
	else if points <= 120:
		say "Your score qualifies you as a novice class adventurer.";
	else if points <= 170:
		say "You have achieved the rating: [quotation mark]Experienced Adventurer[quotation mark].";
	else if points <= 250:
		say "You may now consider yourself a [quotation mark]Seasoned Adventurer[quotation mark].";
	else if points <= 320:
		say "You have reached [quotation mark]Junior Master[quotation mark] status.";
	else if points <= 375:
		say "Your score puts you in Master Adventurer Class C.";
	else if points <= 410:
		say "Your score puts you in Master Adventurer Class B.";
	else if points <= 426:
		say "Your score puts you in Master Adventurer Class A.";
	else if points <= 429:
		say "All of Adventuredom gives tribute to you, Adventurer Grandmaster!";
	otherwise:
		say "Adventuredom stands in awe -- you have now joined the ranks of the W O R L D   C H A M P I O N   A D V E N T U R E R S !"

When play begins:
	initialize openadventure scoring subsystem.

[ Open Adventure Death and Reincarnation Subsystem ]

Section 1 - Messages

To say openadventure death closing message:
	say "It looks as though you're dead.  Well, seeing as how it's so close to closing time anyway, I think we'll just call it a day."

To say openadventure obituary query for death number (death-number - number):
	if death-number is 1:
		say "Oh dear, you seem to have gotten yourself killed.  I might be able to[line break]help you out, but I've never really done this before.  Do you want me[line break]to try to reincarnate you?";
	else if death-number is 2:
		say "You clumsy oaf, you've done it again!  I don't know how long I can[line break]keep this up.  Do you want me to try reincarnating you again?";
	otherwise:
		say "Now you've really done it!  I'm out of orange smoke!  You don't expect[line break]me to do a decent reincarnation without any orange smoke, do you?"

To say openadventure obituary yes response for death number (death-number - number):
	if death-number is 1:
		say "All right.  But don't blame me if something goes wr......[line break]                    --- POOF!! ---[line break]You are engulfed in a cloud of orange smoke.  Coughing and gasping,[line break]you emerge from the smoke and find....";
	else if death-number is 2:
		say "Okay, now where did I put my orange smoke?....  >POOF!<[line break]Everything disappears in a dense cloud of orange smoke.";
	otherwise:
		say "Okay, if you're so smart, do it yourself!  I'm leaving!"

Section 2 - Lifecycle

To initialize openadventure reincarnation subsystem:
	enable subsystem reincarnation;
	now openadventure-reincarnation-limit is 3;
	now openadventure-last-safe-room is LOC_START;
	now openadventure-death-location is LOC_NOWHERE;
	now openadventure-last-death-cause is "";
	now openadventure-reincarnation-in-progress is false;
	now openadventure-reincarnation-last-result is "";
	now openadventure-cave-closing-active is false.

To mark openadventure last safe room (candidate-room - room):
	if candidate-room is not LOC_NOWHERE:
		now openadventure-last-safe-room is candidate-room.

Section 3 - Inventory Disposition

To decide what room is openadventure reincarnation drop room:
	if openadventure-death-location is not LOC_NOWHERE:
		decide on openadventure-death-location;
	if openadventure-last-safe-room is not LOC_NOWHERE:
		decide on openadventure-last-safe-room;
	decide on LOC_BUILDING.

To dispose of openadventure carried items after death:
	let drop-room be openadventure reincarnation drop room;
	move WATER to LOC_NOWHERE;
	move OIL to LOC_NOWHERE;
	repeat with item running through things:
		if item is carried by the player:
			if item is LAMP:
				move item to LOC_START;
				now adventure-state of LAMP is "LAMP_DARK";
			otherwise:
				move item to drop-room.

Section 4 - Death Flow

To resurrect openadventure player:
	dispose of openadventure carried items after death;
	move DWARF to LOC_NOWHERE;
	now openadventure-dwarves-travel-in-progress is false;
	now openadventure-reincarnation-last-result is "reincarnated";
	now openadventure-reincarnation-in-progress is false;
	mark openadventure last safe room LOC_BUILDING;
	move the player to LOC_BUILDING;
	update openadventure treasure status.

To end openadventure game after death:
	now openadventure-reincarnation-last-result is "ended";
	now openadventure-reincarnation-in-progress is false;
	update openadventure score total;
	end the story saying "You are dead."

To handle openadventure death caused by (cause - text):
	if openadventure-reincarnation-in-progress is true:
		stop;
	now openadventure-reincarnation-in-progress is true;
	now openadventure-last-death-cause is cause;
	now openadventure-death-location is the location of the player;
	if openadventure-death-location is LOC_NOWHERE:
		now openadventure-death-location is openadventure-last-safe-room;
	let death-number be openadventure-death-count + 1;
	record openadventure death penalty;
	if openadventure-cave-closing-active is true:
		say "[openadventure death closing message]";
		end openadventure game after death;
		stop;
	say "[openadventure obituary query for death number death-number][paragraph break]";
	if the player consents:
		say "[openadventure obituary yes response for death number death-number][paragraph break]";
		if death-number >= openadventure-reincarnation-limit:
			end openadventure game after death;
		otherwise:
			resurrect openadventure player;
	otherwise:
		say "OK[paragraph break]";
		end openadventure game after death.

When play begins:
	initialize openadventure reincarnation subsystem.

[ Open Adventure Dragon Subsystem ]

Section 1 - Parser Surface

Understand "strike [something]" as attacking.
Understand "slay [something]" as attacking.

Section 2 - Messages

To say openadventure dragon bare-hands query:
	say "With what?  Your bare hands?"

To say openadventure dragon nasty message:
	say "The dragon looks rather nasty.  You'd best not try to get by."

To say openadventure dragon scales message:
	say "The axe bounces harmlessly off the dragon's thick scales."

To say openadventure dragon bird burnt message:
	say "The little bird attacks the green dragon, and in an astounding flurry[line break]gets burnt to a cinder.  The ashes blow away."

To say openadventure dragon victory message:
	say "Congratulations!  You have just vanquished a dragon with your bare[line break]hands!  (Unbelievable, isn't it?)"

To say openadventure dragon already dead message:
	say "For crying out loud, the poor thing is already dead!"

To say openadventure dragon blood message:
	say "Your head buzzes strangely for a moment."

To say openadventure dragon rug blocked message:
	say "You can't be serious!"

To say openadventure dragon implacable message:
	say "The dragon is implacable."

Section 3 - State Helpers

To initialize openadventure dragon subsystem:
	enable subsystem dragon;
	now openadventure-dragon-last-event is "";
	now openadventure-dragon-room-transformed is false;
	now openadventure-dragon-blood-drunk is false;
	if adventure-state of DRAGON is "":
		now adventure-state of DRAGON is "DRAGON_BARS";
	if adventure-state of RUG is "":
		now adventure-state of RUG is "RUG_DRAGON";
	now DRAGON is fixed in place;
	now RUG is fixed in place;
	move BLOOD to LOC_NOWHERE.

To decide whether openadventure dragon is alive:
	if adventure-state of DRAGON is "DRAGON_BARS":
		decide yes;
	decide no.

To decide whether openadventure dragon is dead:
	if adventure-state of DRAGON is "DRAGON_DEAD":
		decide yes;
	if adventure-state of DRAGON is "DRAGON_BLOODLESS":
		decide yes;
	decide no.

To project openadventure living dragon into the current canyon side:
	if openadventure dragon is alive:
		if location is LOC_SECRET4 or location is LOC_SECRET6:
			move DRAGON to location;
			move RUG to location;
			now DRAGON is fixed in place;
			now RUG is fixed in place.

To transform openadventure dragon room:
	let source-room be the location of the player;
	now adventure-state of DRAGON is "DRAGON_DEAD";
	now adventure-state of RUG is "RUG_FLOOR";
	now RUG is portable;
	repeat with item running through things:
		if item is not the player:
			if item is in LOC_SECRET4 or item is in LOC_SECRET6:
				move item to LOC_SECRET5;
	move DRAGON to LOC_SECRET5;
	move RUG to LOC_SECRET5;
	move BLOOD to LOC_SECRET5;
	now openadventure-dragon-room-transformed is true;
	now openadventure-dragon-last-event is "dragon_killed";
	say "[openadventure dragon victory message][paragraph break]";
	move the player to LOC_SECRET5;
	if openadventure-framework-ready is true:
		run openadventure post-travel hooks for source source-room destination LOC_SECRET5 verb "ATTACK";
	otherwise:
		update openadventure treasure status;
	try looking.

Section 4 - Descriptions

Before looking when openadventure-subsystem-dragon is true:
	project openadventure living dragon into the current canyon side.

Rule for writing a paragraph about DRAGON:
	if openadventure dragon is alive:
		say "A huge green fierce dragon bars the way![paragraph break]";
	else if adventure-state of DRAGON is "DRAGON_DEAD":
		say "The blood-specked body of a huge green dead dragon lies to one side.[paragraph break]";
	else:
		say "The body of a huge green dead dragon is lying off to one side.[paragraph break]".

Rule for writing a paragraph about RUG:
	if openadventure dragon is alive:
		say "The dragon is sprawled out on a Persian rug!![paragraph break]";
	else if adventure-state of RUG is "RUG_FLOOR":
		say "There is a Persian rug spread out on the floor![paragraph break]";
	else:
		say "There is a Persian rug here, hovering in mid-air![paragraph break]".

Section 5 - Confrontation

Instead of attacking DRAGON:
	if openadventure dragon is alive:
		say "[openadventure dragon bare-hands query][paragraph break]";
		if the player consents:
			transform openadventure dragon room;
		otherwise:
			now openadventure-dragon-last-event is "dragon_spared";
			say "[openadventure dragon nasty message]";
	else:
		say "[openadventure dragon already dead message]".

Instead of throwing AXE at DRAGON:
	if openadventure dragon is alive:
		move AXE to the location of the player;
		now openadventure-dragon-last-event is "axe_bounced";
		say "[openadventure dragon scales message]";
	otherwise:
		say "[openadventure dragon already dead message]".

Instead of throwing BIRD at DRAGON:
	if openadventure dragon is alive:
		move BIRD to LOC_NOWHERE;
		now openadventure-dragon-last-event is "bird_burnt";
		say "[openadventure dragon bird burnt message]";
	otherwise:
		continue the action.

Instead of giving something to DRAGON:
	if openadventure dragon is alive:
		say "[openadventure dragon implacable message]";
	otherwise:
		say "[openadventure dragon already dead message]".

Instead of taking RUG when openadventure dragon is alive:
	say "[openadventure dragon rug blocked message]".

Instead of taking DRAGON:
	say "[openadventure dragon rug blocked message]".

Instead of taking BLOOD:
	say "There are only a few drops--not enough to carry."

Instead of drinking BLOOD:
	if openadventure dragon is dead:
		move BLOOD to LOC_NOWHERE;
		now adventure-state of DRAGON is "DRAGON_BLOODLESS";
		now openadventure-dragon-blood-drunk is true;
		now openadventure-dragon-last-event is "blood_drunk";
		say "[openadventure dragon blood message]";
	otherwise:
		say "There is nothing here to drink."

Section 6 - Runtime Hooks

To run openadventure dragon post-travel hooks for destination (target - room):
	if openadventure dragon is dead:
		now DRAGON is fixed in place;
		now RUG is portable;
	otherwise:
		project openadventure living dragon into the current canyon side;
	update openadventure treasure status.

When play begins:
	initialize openadventure dragon subsystem.

[ Open Adventure Cave Closing Subsystem ]

Section 1 - Messages

To say openadventure cave closing warning message:
	say "A sepulchral voice reverberating through the cave, says, [quotation mark]Cave closing[line break]soon.  All adventurers exit immediately through main office.[quotation mark]"

To say openadventure exit closed message:
	say "A mysterious recorded voice groans into life and announces:[line break]   [quotation mark]This exit is closed.  Please leave via main office.[quotation mark]"

To say openadventure cave closed message:
	say "The sepulchral voice intones, [quotation mark]The cave is now closed.[quotation mark]  As the echoes[line break]fade, there is a blinding flash of light (and a small puff of orange[line break]smoke). . . .    As your eyes refocus, you look around and find..."

Section 2 - State Helpers

To initialize openadventure cave closing subsystem:
	enable subsystem cave-closing;
	now openadventure-cave-clock1 is 30;
	now openadventure-cave-clock2 is 50;
	now openadventure-cave-panic-clock is 15;
	now openadventure-cave-closing-active is false;
	now openadventure-cave-closed-active is false;
	now openadventure-cave-panic-active is false;
	now openadventure-cave-closing-last-event is "";
	now openadventure-cave-last-clock-turn is -1;

To decide whether openadventure all treasures have been located:
	repeat through the Table of Open Adventure Treasure Scores:
		if treasure-found entry is false:
			decide no;
	decide yes.

To decide whether openadventure outside-room is (candidate-room - room):
	if candidate-room is LOC_START:
		decide yes;
	if candidate-room is LOC_HILL:
		decide yes;
	if candidate-room is LOC_BUILDING:
		decide yes;
	if candidate-room is LOC_VALLEY:
		decide yes;
	if candidate-room is LOC_ROADEND:
		decide yes;
	if candidate-room is LOC_CLIFF:
		decide yes;
	if candidate-room is LOC_SLIT:
		decide yes;
	if candidate-room is LOC_GRATE:
		decide yes;
	decide no.

To decide whether openadventure cave closing should tick in (current-room - room):
	if openadventure-cave-closed-active is true:
		decide no;
	if not openadventure all treasures have been located:
		decide no;
	if not openadventure deep cave membership of current-room:
		decide no;
	if current-room is LOC_Y2:
		decide no;
	decide yes.

Section 3 - Warning Phase

To start openadventure cave closing warning phase:
	if openadventure-cave-closing-active is true:
		stop;
	now adventure-state of GRATE is "GRATE_CLOSED";
	now adventure-state of FISSURE is "UNBRIDGED";
	repeat through the Table of Open Adventure Dwarf Actors:
		now dwarf-location entry is LOC_NOWHERE;
		now dwarf-prior-location entry is LOC_NOWHERE;
		now dwarf-seen entry is false;
		now dwarf-alive entry is false;
	move DWARF to LOC_NOWHERE;
	move TROLL to LOC_NOWHERE;
	move TROLL2 to LOC_SWCHASM;
	now adventure-state of TROLL is "TROLL_GONE";
	now adventure-state of CHASM is "TROLL_BRIDGE";
	if adventure-state of BEAR is not "BEAR_DEAD":
		move BEAR to LOC_NOWHERE;
	now adventure-state of CHAIN is "CHAIN_HEAP";
	now CHAIN is portable;
	now adventure-state of AXE is "AXE_HERE";
	now AXE is portable;
	now openadventure-bear-is-following is false;
	now openadventure-bear-guards-axe is false;
	now openadventure-cave-closing-active is true;
	now openadventure-cave-clock1 is -1;
	now openadventure-cave-closing-last-event is "warning";
	mark openadventure cave closing score reached;
	say "[openadventure cave closing warning message]".

To trigger openadventure cave closing panic:
	if openadventure-cave-panic-active is false:
		now openadventure-cave-clock2 is openadventure-cave-panic-clock;
	now openadventure-cave-panic-active is true;
	now openadventure-cave-closing-last-event is "panic".

Section 4 - Repository Transition

To dispose of openadventure carried items for cave closing:
	repeat with item running through things:
		if item is carried by the player:
			move item to LOC_NOWHERE.

To set up openadventure repository:
	move BOTTLE to LOC_NE;
	now adventure-state of BOTTLE is "EMPTY_BOTTLE";
	move PLANT to LOC_NE;
	now adventure-state of PLANT is "PLANT_THIRSTY";
	move OYSTER to LOC_NE;
	move LAMP to LOC_NE;
	now adventure-state of LAMP is "LAMP_DARK";
	move ROD to LOC_NE;
	move DWARF to LOC_NE;
	move GRATE to LOC_SW;
	move SIGN to LOC_SW;
	now adventure-state of SIGN is "ENDGAME_SIGN";
	move SNAKE to LOC_SW;
	now adventure-state of SNAKE is "SNAKE_CHASED";
	move BIRD to LOC_SW;
	now adventure-state of BIRD is "BIRD_CAGED";
	move CAGE to LOC_SW;
	move ROD2 to LOC_SW;
	move PILLOW to LOC_SW;
	move MIRROR to LOC_NE;
	now adventure-state of MIRROR is "MIRROR_UNBROKEN".

To close openadventure cave completely:
	if openadventure-cave-closed-active is true:
		stop;
	dispose of openadventure carried items for cave closing;
	set up openadventure repository;
	now openadventure-cave-closed-active is true;
	now openadventure-cave-closing-active is true;
	now openadventure-cave-closing-last-event is "closed";
	if openadventure-subsystem-endgame is true:
		initialize openadventure endgame repository;
	say "[openadventure cave closed message][paragraph break]";
	move the player to LOC_NE;
	if openadventure-framework-ready is true:
		run openadventure post-travel hooks for source LOC_NE destination LOC_NE verb "CAVE_CLOSED";
	otherwise:
		update openadventure treasure status;
	try looking.

Section 5 - Clock Runtime

To run openadventure cave closing clock for location (current-room - room):
	if openadventure-cave-last-clock-turn is turn count:
		stop;
	now openadventure-cave-last-clock-turn is turn count;
	if openadventure-cave-closed-active is true:
		stop;
	if openadventure-cave-closing-active is false:
		if openadventure cave closing should tick in current-room:
			decrease openadventure-cave-clock1 by 1;
			if openadventure-cave-clock1 <= 0:
				start openadventure cave closing warning phase;
		stop;
	decrease openadventure-cave-clock2 by 1;
	if openadventure-cave-clock2 <= 0:
		close openadventure cave completely.

To decide whether openadventure cave closing blocks travel from (source - room) to (target - room):
	if openadventure-cave-closing-active is false:
		decide no;
	if openadventure-cave-closed-active is true:
		decide no;
	if openadventure outside-room is target:
		say "[openadventure exit closed message]";
		trigger openadventure cave closing panic;
		decide yes;
	decide no.

To run openadventure cave closing post-travel hooks for destination (target - room):
	run openadventure cave closing clock for location target.

Before going to a room (called target-room) when openadventure-subsystem-cave-closing is true:
	if openadventure cave closing blocks travel from the location of the player to target-room:
		stop the action.

Every turn when openadventure-subsystem-cave-closing is true:
	run openadventure cave closing clock for location the location of the player.

When play begins:
	initialize openadventure cave closing subsystem.

[ Open Adventure Endgame Subsystem ]

Section 1 - Messages

To say openadventure requires dynamite message:
	say "Blasting requires dynamite."

To say openadventure endgame victory message:
	say "There is a loud explosion, and a twenty-foot hole appears in the far[line break]wall, burying the dwarves in the rubble.  You march through the hole[line break]and find yourself in the main office, where a cheering band of[line break]friendly elves carry the conquering adventurer off into the sunset."

To say openadventure endgame defeat message:
	say "There is a loud explosion, and a twenty-foot hole appears in the far[line break]wall, burying the snakes in the rubble.  A river of molten lava pours[line break]in through the hole, destroying everything in its path, including you!"

To say openadventure endgame splatter message:
	say "There is a loud explosion, and you are suddenly splashed across the[line break]walls of the room."

To say openadventure dwarves awaken message:
	say "The resulting ruckus has awakened the dwarves.  There are now several[line break]threatening little dwarves in the room with you!  Most of them throw[line break]knives at you!  All of them get you!"

To say openadventure prod dwarf message:
	say "You prod the nearest dwarf, who wakes up grumpily, takes one look at[line break]you, curses, and grabs for his axe."

To say openadventure mirror shatter message:
	say "You strike the mirror a resounding blow, whereupon it shatters into a[line break]myriad tiny fragments."

Section 2 - State Helpers

To initialize openadventure endgame subsystem:
	enable subsystem endgame;
	now openadventure-endgame-complete is false;
	now openadventure-endgame-last-outcome is "";
	now openadventure-endgame-final-bonus is 0;
	now openadventure-repository-ready is false.

To initialize openadventure endgame repository:
	now openadventure-repository-ready is true;
	now openadventure-endgame-last-outcome is "repository_ready".

To decide whether openadventure repository-room is (candidate-room - room):
	if candidate-room is LOC_NE:
		decide yes;
	if candidate-room is LOC_SW:
		decide yes;
	decide no.

To decide whether openadventure rusty-mark rod is available:
	if ROD2 is carried by the player:
		decide yes;
	if ROD2 is in LOC_NE:
		decide yes;
	if ROD2 is in LOC_SW:
		decide yes;
	if ROD2 is in the location of the player:
		decide yes;
	decide no.

To decide whether openadventure rusty-mark rod is here:
	if ROD2 is carried by the player:
		decide yes;
	if ROD2 is in the location of the player:
		decide yes;
	decide no.

Section 3 - Final Scoring and Termination

To complete openadventure endgame with outcome (outcome - text) bonus (bonus - number):
	if openadventure-endgame-complete is true:
		stop;
	now openadventure-endgame-complete is true;
	now openadventure-endgame-last-outcome is outcome;
	now openadventure-endgame-final-bonus is bonus;
	if openadventure-subsystem-treasure-scoring is true:
		mark openadventure cave closed bonus bonus;
		mark openadventure quit bonus earned;
		update openadventure score total;
		say "[paragraph break]You scored [openadventure-score-total] out of a possible [openadventure-score-maximum], using [turn count] turn[if turn count is not 1]s[end if].[paragraph break]";
		say "[openadventure ranking for score openadventure-score-total][paragraph break]";
	if outcome is "victory":
		end the story finally saying "The End.";
	otherwise:
		end the story saying "The End."

To awaken openadventure endgame dwarves:
	if openadventure-cave-closed-active is false:
		stop;
	say "[openadventure dwarves awaken message]";
	complete openadventure endgame with outcome "dwarves_awakened" bonus 10.

Section 4 - Blast Action

Blasting is an action applying to nothing.

Understand "blast" as blasting.
Understand "deton" as blasting.
Understand "detonate" as blasting.
Understand "ignite" as blasting.
Understand "blowu" as blasting.
Understand "blowup" as blasting.
Understand "blow up" as blasting.

Detonating is an action applying to one thing.

Understand "blast [something]" as detonating.
Understand "deton [something]" as detonating.
Understand "detonate [something]" as detonating.
Understand "ignite [something]" as detonating.
Understand "blowu [something]" as detonating.
Understand "blowup [something]" as detonating.
Understand "blow up [something]" as detonating.

Carry out blasting:
	if openadventure-cave-closed-active is false:
		say "[openadventure requires dynamite message]";
		stop;
	unless openadventure rusty-mark rod is available:
		say "[openadventure requires dynamite message]";
		stop;
	if openadventure rusty-mark rod is here:
		say "[openadventure endgame splatter message]";
		complete openadventure endgame with outcome "splatter" bonus 25;
		stop;
	if the location of the player is LOC_NE:
		say "[openadventure endgame defeat message]";
		complete openadventure endgame with outcome "defeat" bonus 30;
		stop;
	say "[openadventure endgame victory message]";
	complete openadventure endgame with outcome "victory" bonus 45.

Carry out detonating:
	try blasting.

Section 5 - Repository Disturbance

Understand "break [something]" as attacking.
Understand "shatter [something]" as attacking.
Understand "smash [something]" as attacking.
Understand "wake [something]" as waking.
Understand "wake up [something]" as waking.

Instead of attacking MIRROR when openadventure-cave-closed-active is true:
	now adventure-state of MIRROR is "MIRROR_BROKEN";
	say "[openadventure mirror shatter message][paragraph break]";
	awaken openadventure endgame dwarves.

Instead of attacking DWARF when openadventure-cave-closed-active is true:
	awaken openadventure endgame dwarves.

Instead of waking DWARF when openadventure-cave-closed-active is true:
	say "[openadventure prod dwarf message][paragraph break]";
	awaken openadventure endgame dwarves.

Section 6 - Runtime Hooks

To run openadventure endgame post-travel hooks for destination (target - room):
	if openadventure-cave-closed-active is true:
		if openadventure repository-room is target:
			now openadventure-repository-ready is true.

When play begins:
	initialize openadventure endgame subsystem.

[ Open Adventure Information Subsystem ]

Section 1 - Edition Constants

To say openadventure implementation version:
	say "Milestone 6B development build"

To say openadventure repository url:
	say "https://github.com/cdaters/open-adventure-inform7"

To say openadventure upstream url:
	say "http://www.catb.org/esr/open-adventure/"

Section 2 - Lifecycle

To initialize openadventure information subsystem:
	enable subsystem information;
	now openadventure-information-startup-presented is false;
	now openadventure-information-last-section is "".

To display openadventure startup presentation:
	if openadventure-information-startup-presented is true:
		stop;
	now openadventure-information-startup-presented is true;
	say "[line break]Welcome to Adventure![paragraph break](Please type HELP for instructions and information.)[paragraph break]".

Section 3 - Menu and Sections

To display openadventure help menu:
	now openadventure-information-last-section is "menu";
	say "There is information provided on the following:[paragraph break]";
	say "     Instructions for Playing[line break]";
	say "     Historical Background[line break]";
	say "     Open Adventure[line break]";
	say "     About this Edition[line break]";
	say "     Credits[line break]";
	say "     Version Information[paragraph break]";
	say "Type HELP INSTRUCTIONS, HELP HISTORY, HELP OPEN ADVENTURE, HELP EDITION, HELP CREDITS, or HELP VERSION.  ABOUT, INFO, NEWS, and VERSION are also available."

To display openadventure instructions:
	now openadventure-information-last-section is "instructions";
	say "I know of places, actions, and things.  Most of my vocabulary describes places and is used to move you there.  To move, try words like FOREST, BUILDING, DOWNSTREAM, ENTER, EAST, WEST, NORTH, SOUTH, UP, and DOWN.[paragraph break]";
	say "I know about a few special objects, like a black rod hidden in the cave.  These objects can be manipulated with action words.  Usually you will need to give both an action and an object, but sometimes I can infer the object from the verb alone.[paragraph break]";
	say "Some commands have short forms: I for INVENTORY, L for LOOK, and common compass abbreviations such as N, S, E, W, U, and D.  Cave passages turn often, so leaving one place to the north does not guarantee entering the next from the south.[paragraph break]";
	say "If you want to end your adventure early, type QUIT.  To see how well you are doing, type SCORE.  To get full credit for a treasure, leave it safely in the building; partial credit is awarded for finding it.[paragraph break]";
	say "Good luck!"

To display openadventure historical background:
	now openadventure-information-last-section is "history";
	say "Adventure began with William Crowther's cave exploration program, written after his work in the Mammoth Cave region and with caving language and geography at its heart.  Don Woods later found the program, contacted Crowther, and expanded it into the puzzle-rich game that became a landmark of interactive fiction.[paragraph break]";
	say "Graham Nelson's Advent.inf preserved this history with a long historical preface about Mammoth Cave, Stephen Bishop, Crowther's caving background, and Woods's expansion.  This edition keeps that spirit: the game is not only a fantasy cave, but also a descendant of real caving, early network culture, and the first widely shared adventure-game tradition."

To display openadventure open adventure information:
	now openadventure-information-last-section is "open-adventure";
	say "Open Adventure is Eric S. Raymond's author-approved open-source release of Crowther and Woods Adventure 2.5.  It preserves the 430-point game line while correcting bugs, maintaining reproducible tests, and documenting the game's history.[paragraph break]";
	say "This Inform 7 project treats the Open Adventure C implementation and its adventure.yaml world data as authoritative for gameplay behavior.  Upstream Open Adventure resources are available at [openadventure upstream url]."

To display openadventure edition information:
	now openadventure-information-last-section is "edition";
	say "This is Open Adventure in Inform 7, an Inform 7 10.1.2 reconstruction built from generated world data plus hand-written runtime subsystems for travel, scoring, hazards, cave closing, and endgame behavior.[paragraph break]";
	say "The implementation is maintained by Craig Daters and contributors.  The project repository is [openadventure repository url]."

To display openadventure credits:
	now openadventure-information-last-section is "credits";
	say "Original Adventure: William Crowther and Don Woods.[line break]";
	say "Open Adventure: Eric S. Raymond and contributors.[line break]";
	say "Inform 7 implementation: Craig Daters and contributors.[line break]";
	say "Inform lineage and reference material: Graham Nelson's Advent.inf and Chris Conley's Inform 7 Adventure port.[paragraph break]";
	say "This repository is distributed under the BSD 2-Clause License.  The Open Adventure reference distribution is also BSD 2-Clause licensed; its documentation includes CC-BY-4.0 material."

To display openadventure version information:
	now openadventure-information-last-section is "version";
	say "There is a puff of orange smoke; within it, fiery runes spell out:[paragraph break]";
	say "Open Adventure in Inform 7 - [openadventure implementation version][line break]";
	say "Story release: [release number][line break]";
	say "Build serial: development source build[line break]";
	say "Inform 7: 10.1.2 target source[line break]";
	say "Repository: [openadventure repository url][line break]";
	say "Open Adventure upstream: [openadventure upstream url]"

To display openadventure info:
	now openadventure-information-last-section is "info";
	say "For a summary of Open Adventure changes, type NEWS.  If you want to end your adventure early, type QUIT.  To suspend or resume an adventure, use the interpreter's SAVE and RESTORE support where available.  To see how well you are doing, type SCORE.[paragraph break]";
	say "To get full credit for a treasure, you must leave it safely in the building, though you get partial credit just for locating it.  You lose points for getting killed.  There are also points based on how much of the cave you have managed to explore.[paragraph break]";
	say "If you think you have found all the treasures, keep exploring for a while.  If nothing interesting happens, you have not found them all yet.  If something interesting does happen, it means you are getting a bonus and have an opportunity to collect more points in the Master's section."

To display openadventure news:
	now openadventure-information-last-section is "news";
	say "Open Adventure is an author-approved open-source release of Version 2.5.  Version 2.5 is essentially the Version II cave and hazard set, with a 430-point top score, more hints for obscure puzzles, bug fixes, and cosmetic corrections.[paragraph break]";
	say "The upstream Open Adventure news stream currently identifies release 1.21, dated 2026-03-22, as code hardening with ChatGPT 5.2, cppcheck, pylint, and spellchecking.[paragraph break]";
	say "This Inform 7 edition is a separate reconstruction.  Current implementation status is [openadventure implementation version]."

Section 4 - Commands

Oahelping is an action out of world applying to nothing.
Understand "help" as oahelping.

Carry out oahelping:
	display openadventure help menu.

Oainstructing is an action out of world applying to nothing.
Understand "instructions" as oainstructing.
Understand "instruction" as oainstructing.
Understand "help instructions" as oainstructing.
Understand "help instruction" as oainstructing.
Understand "help playing" as oainstructing.
Understand "help play" as oainstructing.

Carry out oainstructing:
	display openadventure instructions.

Oahistorying is an action out of world applying to nothing.
Understand "history" as oahistorying.
Understand "historical background" as oahistorying.
Understand "help history" as oahistorying.
Understand "help historical background" as oahistorying.

Carry out oahistorying:
	display openadventure historical background.

Oaopening is an action out of world applying to nothing.
Understand "open adventure" as oaopening.
Understand "help open adventure" as oaopening.
Understand "help open" as oaopening.

Carry out oaopening:
	display openadventure open adventure information.

Oaabouting is an action out of world applying to nothing.
Understand "about" as oaabouting.
Understand "about edition" as oaabouting.
Understand "help about" as oaabouting.
Understand "help edition" as oaabouting.
Understand "help about this edition" as oaabouting.

Carry out oaabouting:
	display openadventure edition information.

Oacrediting is an action out of world applying to nothing.
Understand "credits" as oacrediting.
Understand "credit" as oacrediting.
Understand "help credits" as oacrediting.
Understand "help credit" as oacrediting.

Carry out oacrediting:
	display openadventure credits.

Oaversioning is an action out of world applying to nothing.
Understand the command "version" as something new.
Understand "version" as oaversioning.
Understand "versi" as oaversioning.
Understand "help version" as oaversioning.
Understand "help version information" as oaversioning.

Carry out oaversioning:
	display openadventure version information.

Oainfoing is an action out of world applying to nothing.
Understand "info" as oainfoing.
Understand "infor" as oainfoing.

Carry out oainfoing:
	display openadventure info.

Oanewsing is an action out of world applying to nothing.
Understand "news" as oanewsing.

Carry out oanewsing:
	display openadventure news.

After reading a command when openadventure-subsystem-information is true:
	let T be text;
	let T be the player's command;
	replace the regular expression "^\s*\?" in T with "help";
	change the text of the player's command to T.

When play begins:
	initialize openadventure information subsystem;
	display openadventure startup presentation.

[ Open Adventure Runtime Framework ]

Section 1 - Framework lifecycle

The openadventure-subsystem-registration-locked is a truth state that varies.
The openadventure-subsystem-registration-locked is false.

The openadventure-foobar-stage is a number that varies.
The openadventure-foobar-stage is 0.

To set up OpenAdventure runtime framework:
	if openadventure-subsystem-registration-locked is false:
		initialize framework IDs;
		initialize OpenAdventure special object IDs;
		now openadventure-framework-ready is true;
		now openadventure-subsystem-registration-locked is true.

To initialize OpenAdventure special object IDs:
	now adventure-id of the door object is "DOOR";
	if adventure-state of the door object is "":
		now adventure-state of the door object is "DOOR_RUSTED";
	if adventure-state of GRATE is "":
		now adventure-state of GRATE is "GRATE_CLOSED";
	if adventure-state of PLANT is "":
		now adventure-state of PLANT is "PLANT_THIRSTY";
	if adventure-state of BOTTLE is "":
		now adventure-state of BOTTLE is "WATER_BOTTLE";
	if adventure-state of FISSURE is "":
		now adventure-state of FISSURE is "UNBRIDGED";
	if adventure-state of LAMP is "":
		now adventure-state of LAMP is "LAMP_DARK";
	if adventure-state of URN is "":
		now adventure-state of URN is "URN_EMPTY";
	if adventure-state of CAVITY is "":
		now adventure-state of CAVITY is "CAVITY_EMPTY";
	if adventure-state of RUG is "":
		now adventure-state of RUG is "RUG_FLOOR".

When play begins:
	set up OpenAdventure runtime framework.

Section 2 - Event hooks

To decide whether openadventure pre-travel hooks allow source (source - room) destination (target - room) verb (verb-token - text):
	if openadventure-subsystem-cave-closing is true:
		if openadventure cave closing blocks travel from source to target:
			decide no;
	if openadventure-subsystem-dwarves is true:
		if openadventure-dwarf-blocks-travel from source to target:
			decide no;
	decide yes.

To run openadventure post-travel hooks for source (source - room) destination (target - room) verb (verb-token - text):
	if openadventure-subsystem-reincarnation is true:
		mark openadventure last safe room target;
	if openadventure-subsystem-cave-closing is true:
		run openadventure cave closing post-travel hooks for destination target;
	if openadventure-subsystem-endgame is true:
		run openadventure endgame post-travel hooks for destination target;
	if openadventure-subsystem-dwarves is true:
		run openadventure dwarves post-travel hooks for source source destination target verb verb-token;
	if openadventure-subsystem-bear is true:
		run openadventure bear post-travel hooks for destination target;
	if openadventure-subsystem-dragon is true:
		run openadventure dragon post-travel hooks for destination target;
	if openadventure-subsystem-treasure-scoring is true:
		run openadventure scoring post-travel hooks for destination target;
	do nothing.

After going to a room (called target-room) from a room (called source-room):
	if openadventure-parser-dispatch-token is not "":
		continue the action;
	if openadventure-framework-has-pending-travel is true:
		continue the action;
	run openadventure post-travel hooks for source source-room destination target-room verb "".

To run openadventure inventory hooks for carried object (item - thing):
	do nothing.

To run openadventure inventory hooks for dropped object (item - thing):
	do nothing.

To run openadventure scoring hooks for delta (delta - number) reason (reason - text):
	now openadventure-score-delta is delta;
	now openadventure-score-event-reason is reason;
	now openadventure-score-event-source is "openadventure_runtime";
	if openadventure-subsystem-treasure-scoring is true:
		record openadventure score delta delta for reason reason from source "openadventure_runtime".

To run openadventure command hooks for action-verb (action-verb - text):
	do nothing.

Section 3 - Subsystem registration and dispatch gates

To enable subsystem dwarves:
	now openadventure-subsystem-dwarves is true.

To enable subsystem pirate:
	now openadventure-subsystem-pirate is true.

To enable subsystem dragon:
	now openadventure-subsystem-dragon is true.

To enable subsystem troll:
	now openadventure-subsystem-troll is true.

To enable subsystem bear:
	now openadventure-subsystem-bear is true.

To enable subsystem treasure-scoring:
	now openadventure-subsystem-treasure-scoring is true.

To enable subsystem cave-closing:
	now openadventure-subsystem-cave-closing is true.

To enable subsystem endgame:
	now openadventure-subsystem-endgame is true.

To enable subsystem reincarnation:
	now openadventure-subsystem-reincarnation is true.

To enable subsystem information:
	now openadventure-subsystem-information is true.

To decide whether subsystem dwarves currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem pirate currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem dragon currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem troll currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem bear currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem treasure-scoring currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem cave-closing currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem endgame currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

Section 4 - Travel predicate integration surface

To decide whether random-travel chance (chance - number) allows dispatch:
	if chance <= 0:
		decide no;
	if a random chance of chance in 100 succeeds:
		decide yes;
	decide no.

To oa-init-and-test-openadventure-travel-row (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	if openadventure-framework-ready is false:
		set up OpenAdventure runtime framework;
	now openadventure-active-source-loc is source-id;
	now openadventure-active-verb-token is verb-token;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-runtime-check-result is true.

To decide whether openadventure runtime is idle:
	if openadventure-framework-ready is true and openadventure-subsystem-registration-locked is true:
		decide yes;
	decide no.

To decide whether movement token (verb-token - text) is in token list (verb-list - text):
	let normalized-token be the normalized adventure id from verb-token;
	if verb-list is "<forced>":
		if normalized-token is "":
			decide yes;
		decide no;
	if normalized-token is the normalized adventure id from verb-list:
		decide yes;
	if normalized-token is "":
		decide no;
	let token-index be 1;
	while token-index <= number of words in verb-list:
		let candidate-token be the normalized adventure id from word number token-index in verb-list;
		if candidate-token is normalized-token:
			decide yes;
		increase token-index by 1;
	decide no.

To process openadventure forced travel from (source-room - room):
	let handled be false;
	now openadventure-runtime-check-result is false;
	if openadventure-framework-has-pending-travel is true:
		now openadventure-runtime-check-result is false;
		stop;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is adventure-id of source-room and forced entry is true:
				oa-init-and-test-openadventure-travel-row source-loc entry with verb-token "";
				if openadventure-runtime-check-result is true:
					now openadventure-active-travel-result is target entry;
					if condition condition-kind entry with arg1 condition-arg-1 entry and arg2 condition-arg-2 entry chance random-chance entry holds in source location source-room:
						if travel-category entry is "goto_random":
							if random-travel chance random-chance entry allows dispatch:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							else:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
						else:
							oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
						if openadventure-runtime-check-result is true:
							now handled is true;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-framework-has-pending-travel is false;
	now openadventure-runtime-check-result is true.

To oa-dispatch-openadventure-travel-entry (source-id - text) with rule-id (travel-rule-id - number) and category (travel-category - text) target (target-id - text):
	now openadventure-runtime-check-result is false;
	now openadventure-current-travel-rule-id is travel-rule-id;
	now openadventure-active-source-loc is source-id;
	now openadventure-active-travel-result is target-id;
	if travel-category is "goto" or travel-category is "goto_non_direct" or travel-category is "goto_conditional" or travel-category is "goto_forced" or travel-category is "goto_random" or travel-category is "goto_magic_word":
		oa-dispatch-openadventure-goto source-id to target-id with verb-token openadventure-active-verb-token;
	if travel-category is "speak" or travel-category is "speak_conditional":
		openadventure emit travel message target-id;
		now openadventure-runtime-check-result is true;
	if travel-category is "special" or travel-category is "special_conditional":
		oa-dispatch-openadventure-special target-id from source-id with verb-token openadventure-active-verb-token;
	if openadventure-runtime-check-result is true:
		now openadventure-framework-has-pending-travel is false.

To oa-dispatch-openadventure-goto (source-id - text) to (destination-id - text) with verb-token (verb-token - text):
	let source-room be the room for adventure-id source-id;
	let destination-room be the room for adventure-id destination-id;
	now openadventure-runtime-check-result is false;
	if destination-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is true;
		stop;
	if not openadventure pre-travel hooks allow source source-room destination destination-room verb verb-token:
		now openadventure-runtime-check-result is false;
		stop;
	move the player to destination-room;
	if destination-room is LOC_NECKBROKE or destination-room is LOC_NOMAKE or destination-room is LOC_FOOTSLIP or destination-room is LOC_GRUESOME:
		now openadventure-framework-has-pending-travel is false;
		now openadventure-runtime-check-result is true;
		if openadventure-subsystem-reincarnation is true:
			handle openadventure death caused by "fatal_travel";
		stop;
	run openadventure post-travel hooks for source source-room destination destination-room verb verb-token;
	now openadventure-framework-has-pending-travel is false;
	now openadventure-runtime-check-result is true;

To openadventure emit travel message (message-id - text):
	if message-id is "NO_MESSAGE":
		stop;
	if message-id is "<none>":
		stop;
	say "[message-id]";

To oa-dispatch-openadventure-special (special-id - text) from (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	if special-id is "1":
		oa-handle-plover-passage-special source-id with verb-token verb-token;
	if special-id is "2":
		oa-handle-plover-emerald-drop-special source-id with verb-token verb-token;
	if special-id is "3":
		oa-handle-troll-bridge-special source-id with verb-token verb-token;

To decide whether openadventure non-direct travel from (source-id - text) with verb token (verb-token - text):
	let handled be false;
	let source-room be the room for adventure-id source-id;
	if openadventure-framework-has-pending-travel is true:
		decide no;
	if source-room is LOC_NOWHERE:
		decide no;
	if openadventure-seeded-replay-mode is true and openadventure-upstream-replay-mode is false and source-id is "LOC_PITTOP":
		if movement token verb-token is in token list "DOWN PIT STEPS":
			oa-dispatch-openadventure-goto source-id to "LOC_NECKBROKE" with verb-token verb-token;
			decide yes;
	if openadventure-upstream-replay-mode is true and source-id is "LOC_KINGHALL":
		if movement token verb-token is in token list "SW":
			if SNAKE is not in LOC_KINGHALL:
				oa-dispatch-openadventure-goto source-id to "LOC_SECRET3" with verb-token verb-token;
				decide yes;
	if adventure-state of FISSURE is "BRIDGED":
		if source-id is "LOC_EASTBANK":
			if movement token verb-token is in token list "WEST CROSS ACROS OVER":
				oa-dispatch-openadventure-goto source-id to "LOC_WESTBANK" with verb-token verb-token;
				decide yes;
		if source-id is "LOC_WESTBANK":
			if movement token verb-token is in token list "EAST CROSS ACROS OVER":
				oa-dispatch-openadventure-goto source-id to "LOC_EASTBANK" with verb-token verb-token;
				decide yes;
	if source-id is "LOC_SWCHASM":
		if movement token verb-token is in token list "NE OVER ACROS CROSS":
			oa-handle-troll-bridge-special source-id with verb-token verb-token;
			decide yes;
	if source-id is "LOC_NECHASM":
		if movement token verb-token is in token list "SW OVER ACROS CROSS":
			oa-handle-troll-bridge-special source-id with verb-token verb-token;
			decide yes;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is source-id and forced entry is false:
				oa-init-and-test-openadventure-travel-row source-loc entry with verb-token verb-token;
				if openadventure-runtime-check-result is true:
					now openadventure-active-travel-result is target entry;
					if movement token verb-token is in token list verbs entry:
						if condition condition-kind entry with arg1 condition-arg-1 entry and arg2 condition-arg-2 entry chance random-chance entry holds in source location source-room:
							if travel-category entry is "goto_random":
								if random-travel chance random-chance entry allows dispatch:
									oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							else:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							if openadventure-runtime-check-result is true:
								now handled is true;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		decide no;
	now openadventure-framework-has-pending-travel is false;
	decide yes.

Section 5 - Parser command bridge

The openadventure-parser-dispatch-token is a text that varies.
The openadventure-parser-dispatch-token is "".

Oatraveling is an action applying to one topic.
Understand "openadventure-travel [text]" as oatraveling.

Oaseeding is an action out of world applying to one number.
Understand "seed [number]" as oaseeding.

Carry out oaseeding:
	seed the random-number generator with the number understood;
	now openadventure-seeded-replay-mode is true;
	say "Seed set to [the number understood].".

Oaupstreamreplay is an action out of world applying to nothing.
Understand "replay upstream" as oaupstreamreplay.

Carry out oaupstreamreplay:
	now openadventure-upstream-replay-mode is true;
	now openadventure-seeded-replay-mode is true;
	say "Upstream replay mode set.".

Oalighting is an action applying to nothing.
Understand "on" as oalighting.
Understand "lamp on" as oalighting.
Understand "lantern on" as oalighting.
Understand "light" as oalighting.
Understand "light lamp" as oalighting.
Understand "light lantern" as oalighting.
Understand "turn on lamp" as oalighting.
Understand "turn lamp on" as oalighting.
Understand "turn on lantern" as oalighting.
Understand "turn lantern on" as oalighting.

Carry out oalighting:
	if LAMP is not carried by the player and LAMP is not in the location of the player:
		say "You have no source of light.";
		stop the action;
	if adventure-state of LAMP is "LAMP_BRIGHT":
		say "Your lamp is now on.";
		stop the action;
	now adventure-state of LAMP is "LAMP_BRIGHT";
	say "Your lamp is now on.".

Oalightingurn is an action applying to nothing.
Understand "light urn" as oalightingurn.
Understand "turn on urn" as oalightingurn.

Carry out oalightingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is "URN_EMPTY":
		say "This dangerous act would achieve little.";
		stop the action;
	now adventure-state of URN is "URN_LIT";
	say "The urn is now lit.".

Oaextinguishing is an action applying to nothing.
Understand "off" as oaextinguishing.
Understand "lamp off" as oaextinguishing.
Understand "lantern off" as oaextinguishing.
Understand "extinguish" as oaextinguishing.
Understand "extinguish lamp" as oaextinguishing.
Understand "extinguish lantern" as oaextinguishing.
Understand "turn off lamp" as oaextinguishing.
Understand "turn lamp off" as oaextinguishing.
Understand "turn off lantern" as oaextinguishing.
Understand "turn lantern off" as oaextinguishing.

Carry out oaextinguishing:
	if LAMP is not carried by the player and LAMP is not in the location of the player:
		say "You have no source of light.";
		stop the action;
	if adventure-state of LAMP is "LAMP_DARK":
		say "Your lamp is now off.";
		stop the action;
	now adventure-state of LAMP is "LAMP_DARK";
	say "Your lamp is now off.".

After taking BOTTLE:
	if adventure-state of BOTTLE is "WATER_BOTTLE":
		move WATER to the player;
		move OIL to LOC_NOWHERE;
	else if adventure-state of BOTTLE is "OIL_BOTTLE":
		move OIL to the player;
		move WATER to LOC_NOWHERE.

After dropping BOTTLE:
	if adventure-state of BOTTLE is "WATER_BOTTLE":
		move WATER to LOC_NOWHERE;
		move OIL to LOC_NOWHERE;
	else if adventure-state of BOTTLE is "OIL_BOTTLE":
		move OIL to LOC_NOWHERE;
		move WATER to LOC_NOWHERE.

Understand "get [something]" as taking.
Understand "door" as the door object.
Understand "keys" or "key" as KEYS.
Understand "lamp" or "lantern" as LAMP.
Understand "cage" as CAGE.
Understand "rod" as ROD.
Understand "rusty rod" or "marked rod" as ROD2.
Understand "rod" as ROD2 when openadventure-cave-closed-active is true.
Understand "steps" as STEPS.
Understand "bird" as BIRD.
Understand "pillow" or "velvet" as PILLOW.
Understand "snake" as SNAKE.
Understand "fissure" as FISSURE.
Understand "tablet" or "table" as OBJ_13.
Understand "clam" as CLAM.
Understand "oyster" as OYSTER.
Understand "magazine" or "issue" or "spelunker" as MAGAZINE.
Understand "dwarf" or "dwarves" as DWARF.
Understand "knife" or "knives" as KNIFE.
Understand "food" or "rations" as FOOD.
Understand "bottle" or "jar" as BOTTLE.
Understand "water" or "h2o" as WATER.
Understand "oil" as OIL.
Understand "mirror" as MIRROR.
Understand "plant" or "beans" as PLANT.
Understand "axe" as AXE.
Understand "dragon" as DRAGON.
Understand "chasm" as CHASM.
Understand "troll" as TROLL.
Understand "bear" as BEAR.
Understand "volcano" or "geyser" as VOLCANO.
Understand "machine" or "vending" as VEND.
Understand "batteries" or "battery" as BATTERY.
Understand "ogre" as OGRE.
Understand "urn" as URN.
Understand "cavity" as CAVITY.
Understand "blood" as BLOOD.
Understand "reservoir" as RESER.
Understand "appendage" or "leporine" as RABBITFOOT.
Understand "mud" as OBJ_47.
Understand "note" as OBJ_48.
Understand "sign" as SIGN.
Understand "gold" or "nugget" as NUGGET.
Understand "diamond" or "diamonds" as OBJ_51.
Understand "silver" or "bars" or "bar" as OBJ_52.
Understand "jewelry" or "jewel" or "jewels" as OBJ_53.
Understand "coins" or "coin" as COINS.
Understand "chest" or "box" or "treasure" as CHEST.
Understand "eggs" or "egg" or "nest" as EGGS.
Understand "trident" as TRIDENT.
Understand "vase" or "ming" or "shards" or "pottery" as VASE.
Understand "emerald" as EMERALD.
Understand "platinum" or "pyramid" as PYRAMID.
Understand "pearl" as PEARL.
Understand "rug" or "persian" as RUG.
Understand "spices" or "spice" as OBJ_63.
Understand "chain" as CHAIN.
Understand "ruby" as RUBY.
Understand "jade" or "necklace" as JADE.
Understand "amber" or "gemstone" as AMBER.
Understand "sapphire" as SAPPH.
Understand "ebony" or "statuette" or "statue" as OBJ_69.

Oabareclimbing is an action applying to nothing.
Understand the command "climb" as something new.
Understand "climb" as oabareclimbing.

Carry out oabareclimbing:
	if openadventure non-direct travel from adventure-id of location with verb token "CLIMB":
		process openadventure forced travel from location;
	else:
		say "You can't go that way.".

Oabaretaking is an action applying to nothing.
Understand "take" as oabaretaking.

To decide what thing is the obvious OpenAdventure take target:
	let candidate be nothing;
	let matches be 0;
	repeat with item running through things in the location of the player:
		if item is not the player:
			if item is not scenery:
				if item is not fixed in place:
					now candidate is item;
					increase matches by 1;
	if matches is 1:
		decide on candidate;
	decide on nothing.

Carry out oabaretaking:
	let candidate be the obvious OpenAdventure take target;
	if candidate is not nothing:
		try taking candidate;
	otherwise:
		say "What do you want to take?".

Oabaredropping is an action applying to nothing.
Understand "drop" as oabaredropping.

To decide what thing is the obvious OpenAdventure drop target:
	let candidate be nothing;
	let matches be 0;
	repeat with item running through things carried by the player:
		now candidate is item;
		increase matches by 1;
	if matches is 1:
		decide on candidate;
	decide on nothing.

Carry out oabaredropping:
	let candidate be the obvious OpenAdventure drop target;
	if candidate is not nothing:
		try dropping candidate;
	otherwise:
		say "What do you want to drop?".

Instead of dropping BIRD:
	if BIRD is carried by the player:
		if SNAKE is in the location of the player:
			say "The little bird attacks the green snake, and in an astounding flurry drives the snake away.";
			move SNAKE to LOC_NOWHERE;
		move BIRD to the location of the player;
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "Dropped.";
	otherwise:
		say "You aren't carrying [the BIRD].".

Instead of freeing BIRD:
	if BIRD is carried by the player:
		move BIRD to the location of the player;
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "OK";
	otherwise if BIRD is in the location of the player:
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "OK";
	otherwise:
		say "You can't see any such thing.".

Oabareattacking is an action applying to nothing.
Understand "attack" as oabareattacking.
Understand "kill" as oabareattacking.
Understand "fight" as oabareattacking.
Understand "hit" as oabareattacking.
Understand "strike" as oabareattacking.

Carry out oabareattacking:
	if DRAGON is in the location of the player:
		try attacking DRAGON;
		stop the action;
	if BEAR is in the location of the player:
		try attacking BEAR;
		stop the action;
	if OGRE is in the location of the player:
		try attacking OGRE;
		stop the action;
	if an openadventure visible dwarf is present:
		try attacking DWARF;
		stop the action;
	if VEND is in the location of the player:
		try attacking VEND;
		stop the action;
	say "There is nothing here to attack.".

Instead of attacking VEND:
	if adventure-state of VEND is "VEND_UNBLOCKS":
		now adventure-state of VEND is "VEND_BLOCKS";
		say "The vending machine swings back to block the passage.";
	otherwise:
		now adventure-state of VEND is "VEND_UNBLOCKS";
		say "As you strike the vending machine, it pivots backward along with a section of wall, revealing a dark passage leading south.".

Instead of attacking OGRE:
	say "The ogre, who despite his bulk is quite agile, easily dodges your attack.  He seems almost amused by your puny effort.";
	if openadventure-upstream-replay-mode is true:
		say "[paragraph break]One sharp nasty knife is thrown at you![paragraph break]";
		move OGRE to LOC_NOWHERE;
		say "The ogre, distracted by your rush, is struck by the knife.  With a blood-curdling yell he turns and bounds after the dwarf, who flees in panic.  You are left alone in the room.".

Understand "shake [something]" as waving.
Understand "swing [something]" as waving.

Instead of waving ROD:
	if the noun is ROD:
		if location is LOC_PITTOP and (JADE is in LOC_NOWHERE or JADE is off-stage):
			if BIRD is in LOC_PITTOP or adventure-state of BIRD is "BIRD_UNCAGED":
				move JADE to LOC_PITTOP;
				say "The bird flies about agitatedly for a moment, then disappears through the crack.  It reappears shortly, carrying in its beak a jade necklace, which it drops at your feet.";
				stop the action;
		if FISSURE is in the location of the player or location is LOC_EASTBANK or location is LOC_WESTBANK:
			if adventure-state of FISSURE is "BRIDGED":
				now adventure-state of FISSURE is "UNBRIDGED";
				say "The crystal bridge has vanished!";
			otherwise:
				now adventure-state of FISSURE is "BRIDGED";
				say "A crystal bridge now spans the fissure.";
			stop the action;
		say "Nothing happens.";
		stop the action;

Oapouringwater is an action applying to one thing.
Understand "water [something]" as oapouringwater.

Oapouringoil is an action applying to one thing.
Understand "oil [something]" as oapouringoil.

To decide whether OpenAdventure bottle holds water:
	if adventure-state of BOTTLE is "" or adventure-state of BOTTLE is "WATER_BOTTLE":
		decide yes;
	if WATER is carried by the player:
		decide yes;
	decide no.

To decide whether OpenAdventure bottle holds oil:
	if adventure-state of BOTTLE is "OIL_BOTTLE":
		decide yes;
	if OIL is carried by the player:
		decide yes;
	decide no.

To empty OpenAdventure bottle:
	now adventure-state of BOTTLE is "EMPTY_BOTTLE";
	move WATER to LOC_NOWHERE;
	move OIL to LOC_NOWHERE.

To decide whether (item - thing) is an OpenAdventure scoring treasure:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			decide yes;
	decide no.

To decide whether (item - thing) is an OpenAdventure troll payment treasure:
	if item is NUGGET or item is OBJ_51 or item is OBJ_52 or item is OBJ_53 or item is COINS:
		decide yes;
	if item is CHEST or item is EGGS or item is TRIDENT or item is VASE or item is EMERALD:
		decide yes;
	if item is PYRAMID or item is PEARL or item is RUG or item is OBJ_63 or item is CHAIN:
		decide yes;
	if item is RUBY or item is JADE or item is AMBER or item is SAPPH or item is OBJ_69:
		decide yes;
	decide no.

To decide whether OpenAdventure troll is demanding payment:
	if adventure-state of TROLL is "TROLL_GONE":
		decide no;
	if location is LOC_SWCHASM:
		decide yes;
	if location is LOC_NECHASM:
		decide yes;
	if TROLL is in the location of the player:
		decide yes;
	decide no.

Carry out oapouringwater:
	if the noun is PLANT:
		if PLANT is not in the location of the player:
			say "There is no plant here.";
			stop the action;
		if BOTTLE is not carried by the player and WATER is not carried by the player:
			say "You have no water.";
			stop the action;
		if not OpenAdventure bottle holds water:
			say "You have no water.";
			stop the action;
		empty OpenAdventure bottle;
		if adventure-state of PLANT is "PLANT_BELLOWING":
			now adventure-state of PLANT is "PLANT_GROWN";
			say "The plant grows explosively, almost filling the bottom of the pit.";
		else if adventure-state of PLANT is "PLANT_GROWN":
			now adventure-state of PLANT is "PLANT_THIRSTY";
			say "You've over-watered the plant!  It's shriveling up!  And now . . .";
		otherwise:
			now adventure-state of PLANT is "PLANT_BELLOWING";
			say "The plant spurts into furious growth for a few seconds.";
		stop the action;
	if the noun is the door object:
		if the door object is not in the location of the player:
			say "There is no door here.";
			stop the action;
		empty OpenAdventure bottle;
		now adventure-state of the door object is "DOOR_RUSTED";
		say "The hinges are quite thoroughly rusted now and won't budge.";
		stop the action;
	say "The ground is wet.".

Carry out oapouringoil:
	if the noun is the door object:
		if the door object is not in the location of the player:
			say "There is no door here.";
			stop the action;
		if BOTTLE is not carried by the player and OIL is not carried by the player:
			say "You have no oil.";
			stop the action;
		if not OpenAdventure bottle holds oil:
			say "You have no oil.";
			stop the action;
		empty OpenAdventure bottle;
		now adventure-state of the door object is "DOOR_UNRUSTED";
		say "The oil has freed up the hinges so that the door will now move, although it requires some effort.";
		stop the action;
	if the noun is PLANT:
		say "The plant indignantly shakes the oil off its leaves and asks, 'Water?'";
		stop the action;
	say "The ground is wet.".

Oafillingurn is an action applying to nothing.
Understand "fill urn" as oafillingurn.
Understand "fill urn with oil" as oafillingurn.
Understand "pour oil in urn" as oafillingurn.
Understand "pour oil into urn" as oafillingurn.

Carry out oafillingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is not "URN_EMPTY":
		say "The urn is already full of oil.";
		stop the action;
	if openadventure-upstream-replay-mode is true and location is LOC_CLIFF and adventure-state of BOTTLE is "OIL_BOTTLE":
		empty OpenAdventure bottle;
		now adventure-state of URN is "URN_DARK";
		say "Your bottle is now empty and the urn is full of oil.";
		stop the action;
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player and OIL is not carried by the player and WATER is not carried by the player:
		say "There is nothing here with which to fill it.";
		stop the action;
	if OpenAdventure bottle holds oil:
		empty OpenAdventure bottle;
		now adventure-state of URN is "URN_DARK";
		say "Your bottle is now empty and the urn is full of oil.";
		stop the action;
	if OpenAdventure bottle holds water:
		empty OpenAdventure bottle;
		say "You empty the bottle into the urn, which promptly ejects the water with uncanny accuracy, squirting you directly between the eyes.";
		stop the action;
	say "There is nothing here with which to fill it.".

Oatakingwater is an action applying to nothing.
Understand "get water" as oatakingwater.
Understand "take water" as oatakingwater.

Carry out oatakingwater:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	now adventure-state of BOTTLE is "WATER_BOTTLE";
	move BOTTLE to the player;
	move WATER to the player;
	move OIL to LOC_NOWHERE;
	say "Your bottle is now full of water.".

Oafillingwater is an action applying to nothing.
Understand "fill bottle" as oafillingwater.
Understand "fill bottle with water" as oafillingwater.

Carry out oafillingwater:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is LOC_EASTPIT:
		now adventure-state of BOTTLE is "OIL_BOTTLE";
		move OIL to the player;
		move WATER to LOC_NOWHERE;
		say "Your bottle is now full of oil.";
		stop the action;
	now adventure-state of BOTTLE is "WATER_BOTTLE";
	move WATER to the player;
	move OIL to LOC_NOWHERE;
	say "Your bottle is now full of water.".

Oafillingoil is an action applying to nothing.
Understand "fill bottle with oil" as oafillingoil.

Carry out oafillingoil:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is not LOC_EASTPIT:
		say "There is no oil here.";
		stop the action;
	now adventure-state of BOTTLE is "OIL_BOTTLE";
	move OIL to the player;
	move WATER to LOC_NOWHERE;
	say "Your bottle is now full of oil.".

Oatakingoil is an action applying to nothing.
Understand "get oil" as oatakingoil.
Understand "take oil" as oatakingoil.

Carry out oatakingoil:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is not LOC_EASTPIT:
		say "There is no oil here.";
		stop the action;
	now adventure-state of BOTTLE is "OIL_BOTTLE";
	move BOTTLE to the player;
	move OIL to the player;
	move WATER to LOC_NOWHERE;
	say "Your bottle is now full of oil.".

To decide whether (item - thing) is an OpenAdventure cavity gemstone:
	if item is EMERALD or item is RUBY or item is AMBER or item is SAPPH:
		decide yes;
	decide no.

To handle OpenAdventure cavity gemstone drop for (item - thing):
	if adventure-state of CAVITY is "CAVITY_FULL":
		move item to the location of the player;
		say "Dropped.";
	otherwise:
		now adventure-state of CAVITY is "CAVITY_FULL";
		now adventure-state of item is "STATE_IN_CAVITY";
		move item to the location of the player;
		say "The gem fits easily into the cavity.";
		if RUG is in the location of the player:
			if item is EMERALD and adventure-state of RUG is not "RUG_HOVER":
				now adventure-state of RUG is "RUG_HOVER";
				say "[paragraph break]The Persian rug stiffens and rises a foot or so off the ground.";
			else if item is RUBY and adventure-state of RUG is "RUG_HOVER":
				now adventure-state of RUG is "RUG_FLOOR";
				say "[paragraph break]The Persian rug settles gently to the ground.";

Instead of dropping something (called gem) when CAVITY is in the location of the player:
	if gem is an OpenAdventure cavity gemstone:
		if gem is carried by the player:
			handle OpenAdventure cavity gemstone drop for gem;
		otherwise:
			say "You aren't carrying that.";
	otherwise:
		continue the action.

After taking something (called gem) when CAVITY is in the location of the player:
	if gem is an OpenAdventure cavity gemstone:
		if adventure-state of gem is "STATE_IN_CAVITY" or adventure-state of gem is "AMBER_IN_ROCK":
			now adventure-state of CAVITY is "CAVITY_EMPTY";
			now adventure-state of gem is "".

Oarubbingurn is an action applying to nothing.
Understand "rub urn" as oarubbingurn.

Carry out oarubbingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is "URN_LIT":
		move URN to LOC_NOWHERE;
		move CAVITY to the location of the player;
		move AMBER to the location of the player;
		now adventure-state of AMBER is "AMBER_IN_ROCK";
		now adventure-state of CAVITY is "CAVITY_FULL";
		say "As you rub the urn, there is a flash of light and a genie appears.[line break]His aspect is stern as he advises: [quotation mark]One who wouldst traffic in[line break]precious stones must first learn to recognize the signals thereof.[quotation mark][line break]He wrests the urn from the stone, leaving a small cavity.  Turning to[line break]face you again, he fixes you with a steely eye and intones: [quotation mark]Caution![quotation mark][line break]Genie and urn vanish in a cloud of amber smoke.  The smoke condenses[line break]to form a rare amber gemstone, resting in the cavity in the rock.";
		stop the action;
	say "Peculiar.  Nothing unexpected happens.".

Oaflying is an action applying to nothing.
Understand "fly" as oaflying.

Oaflyingthing is an action applying to one thing.
Understand "fly [something]" as oaflyingthing.

To perform OpenAdventure rug flight:
	let source-room be the location of the player;
	if RUG is not in the location of the player:
		say "Though you flap your arms furiously, it is to no avail.";
	else if adventure-state of RUG is not "RUG_HOVER":
		say "If you mean to use the Persian rug, it does not appear inclined to cooperate.";
	else if source-room is LOC_CLIFF:
		move RUG to LOC_LEDGE;
		move the player to LOC_LEDGE;
		say "You board the Persian rug, which promptly whisks you across the chasm.[line break]You have time for a fleeting glimpse of a two thousand foot drop to a[line break]mighty river; then you find yourself on the other side.[paragraph break]";
		run openadventure post-travel hooks for source source-room destination LOC_LEDGE verb "FLY";
		try looking;
	else if source-room is LOC_LEDGE:
		move RUG to LOC_CLIFF;
		move the player to LOC_CLIFF;
		say "The rug ferries you back across the chasm.[paragraph break]";
		run openadventure post-travel hooks for source source-room destination LOC_CLIFF verb "FLY";
		try looking;
	otherwise:
		say "Nothing happens.".

Carry out oaflying:
	perform OpenAdventure rug flight.

Carry out oaflyingthing:
	if the noun is not RUG:
		say "Nothing happens.";
		stop the action;
	perform OpenAdventure rug flight.

Oareservoirmagic is an action applying to nothing.
Understand "n'beh" as oareservoirmagic.
Understand "nbeh" as oareservoirmagic.
Understand "h'cfl" as oareservoirmagic.
Understand "hcfl" as oareservoirmagic.

Carry out oareservoirmagic:
	if location is LOC_RESERVOIR or location is LOC_RESBOTTOM:
		if adventure-state of RESER is "WATERS_PARTED":
			now adventure-state of RESER is "WATERS_UNPARTED";
			say "The waters crash together again.";
		otherwise:
			now adventure-state of RESER is "WATERS_PARTED";
			say "The waters have parted to form a narrow path across the reservoir.";
		stop the action;
	say "Nothing happens.".

Instead of opening CLAM:
	if location is not LOC_SHELLROOM:
		say "You can't see any such thing.";
		stop the action;
	if TRIDENT is not carried by the player and TRIDENT is not in the location of the player:
		say "You don't have anything strong enough to open the clam.";
		stop the action;
	if adventure-state of CLAM is "CLAM_OPENED":
		say "The oyster creaks open, revealing nothing but oyster inside.  It promptly snaps shut again.";
		stop the action;
	now adventure-state of CLAM is "CLAM_OPENED";
	move CLAM to LOC_NOWHERE;
	move OYSTER to LOC_SHELLROOM;
	now OYSTER is fixed in place;
	move PEARL to LOC_CULDESAC;
	say "A glistening pearl falls out of the clam and rolls away.  Goodness,[line break]this must really be an oyster.  (I never was very good at identifying[line break]bivalves.)  Whatever it is, it has now snapped shut again.".

Instead of opening OYSTER:
	if location is not LOC_SHELLROOM and location is not LOC_NE and location is not LOC_SW:
		say "You can't see any such thing.";
		stop the action;
	say "The oyster creaks open, revealing nothing but oyster inside.  It promptly snaps shut again.".

To perform OpenAdventure foobar word (stage - number):
	if stage is openadventure-foobar-stage + 1:
		now openadventure-foobar-stage is stage;
		if stage is 4:
			now openadventure-foobar-stage is 0;
			if EGGS is in LOC_GIANTROOM:
				say "Nothing happens.";
			otherwise if EGGS is in the location of the player:
				move EGGS to LOC_GIANTROOM;
				say "The nest of golden eggs has vanished!";
			otherwise:
				move EGGS to LOC_GIANTROOM;
				say "Done!";
		otherwise:
			say "OK";
		stop;
	now openadventure-foobar-stage is 0;
	say "Nothing happens.".

Oafeeing is an action applying to nothing.
Understand "fee" as oafeeing.
Carry out oafeeing:
	perform OpenAdventure foobar word 1.

Oafieing is an action applying to nothing.
Understand "fie" as oafieing.
Carry out oafieing:
	perform OpenAdventure foobar word 2.

Oafoeing is an action applying to nothing.
Understand "foe" as oafoeing.
Carry out oafoeing:
	perform OpenAdventure foobar word 3.

Oafooing is an action applying to nothing.
Understand "foo" as oafooing.
Carry out oafooing:
	perform OpenAdventure foobar word 4.

Oaopeninggrate is an action applying to nothing.
Understand "open grate" as oaopeninggrate.
Understand "unlock grate" as oaopeninggrate.
Understand "unlock grate with keys" as oaopeninggrate.

Carry out oaopeninggrate:
	if GRATE is not in the location of the player and location is not LOC_START and location is not LOC_VALLEY and location is not LOC_SLIT and location is not LOC_COBBLE and location is not LOC_DEBRIS and location is not LOC_AWKWARD and location is not LOC_BIRDCHAMBER and location is not LOC_PITTOP:
		say "There is no grate here.";
		stop the action;
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop the action;
	if openadventure-cave-closing-active is true:
		say "A mysterious recorded voice groans into life and announces: 'This exit is closed. Please leave via main office.'";
		stop the action;
	now adventure-state of GRATE is "GRATE_OPEN";
	say "The grate is now open.".

Oaclosinggrate is an action applying to nothing.
Understand "close grate" as oaclosinggrate.
Understand "lock grate" as oaclosinggrate.
Understand "lock grate with keys" as oaclosinggrate.

Carry out oaclosinggrate:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop the action;
	now adventure-state of GRATE is "GRATE_CLOSED";
	say "The grate is now closed.".

Oathrowing is an action applying to one thing.
Understand the command "throw" as something new.
Understand the command "toss" as something new.
Understand "throw [something]" as oathrowing.
Understand "toss [something]" as oathrowing.
Understand "throw [something] at [something]" as throwing it at.
Understand "toss [something] at [something]" as throwing it at.

Carry out oathrowing:
	if the noun is FOOD and BEAR is in the location of the player:
		try throwing FOOD at BEAR;
		stop the action;
	if the noun is an OpenAdventure troll payment treasure and OpenAdventure troll is demanding payment:
		if the noun is carried by the player:
			move the noun to LOC_NOWHERE;
			move TROLL to LOC_NOWHERE;
			move TROLL2 to LOC_SWCHASM;
			now adventure-state of TROLL is "TROLL_UNPAID";
			say "The troll catches your treasure and scurries away out of sight.";
		otherwise:
			say "You aren't carrying that.";
		stop the action;
	if the noun is AXE:
		if DRAGON is in the location of the player:
			try throwing AXE at DRAGON;
			stop the action;
		if BEAR is in the location of the player:
			try throwing AXE at BEAR;
			stop the action;
		if TROLL is in the location of the player:
			move AXE to the location of the player;
			say "The troll deftly catches the axe, examines it carefully, and tosses it back, declaring, 'Good workmanship, but it's not valuable enough.'";
			stop the action;
	if the noun is carried by the player:
		try dropping the noun;
	otherwise:
		say "You aren't carrying that.".

To decide what text is the OpenAdventure dispatch token for (raw-command - text):
	let command-token be raw-command;
	replace the regular expression "^\s+" in command-token with "";
	replace the regular expression "\s+$" in command-token with "";
	if command-token is "":
		decide on "";
	if the number of words in command-token is not 1:
		decide on "";
	if command-token is "l" or command-token is "look" or command-token is "x":
		decide on "";
	if command-token is "i" or command-token is "inven" or command-token is "inventory":
		decide on "";
	repeat through the Table of OpenAdventure Parser Travel Tokens:
		if parser-token entry is command-token:
			let mapped-token be dispatch-token entry;
			repeat through the Table of Generated Travel Non-Direct Rules:
				if source-loc entry is adventure-id of location and forced entry is false:
					if movement token mapped-token is in token list verbs entry:
						decide on mapped-token;
	decide on "".

To finish OpenAdventure direct direction fallback from (source-room - room) with verb-token (verb-token - text):
	if location is not source-room:
		run openadventure post-travel hooks for source source-room destination location verb verb-token.

To decide whether OpenAdventure direct direction fallback handles (verb-token - text):
	let source-room be the location;
	if verb-token is "NORTH":
		try going north;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SOUTH":
		try going south;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "EAST":
		try going east;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "WEST":
		try going west;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "UPWAR":
		try going up;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "DOWN":
		try going down;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "NE":
		try going northeast;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SE":
		try going southeast;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SW":
		try going southwest;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "NW":
		try going northwest;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	decide no.

After reading a command:
	let raw-command be text;
	let raw-command be the player's command;
	let dispatch-token be the OpenAdventure dispatch token for raw-command;
	if dispatch-token is not "":
		now openadventure-parser-dispatch-token is dispatch-token;
		change the text of the player's command to "openadventure-travel [dispatch-token]";
	else:
		now openadventure-parser-dispatch-token is "".

Carry out oatraveling:
	let dispatch-token be openadventure-parser-dispatch-token;
	if dispatch-token is "":
		let dispatch-token be the OpenAdventure dispatch token for "[the topic understood]";
	if dispatch-token is "":
		say "You can't go that way.";
		stop the action;
	let source-id be adventure-id of location;
	if openadventure non-direct travel from source-id with verb token dispatch-token:
		process openadventure forced travel from location;
	else if OpenAdventure direct direction fallback handles dispatch-token:
		do nothing;
	else:
		say "You can't go that way.";
	now openadventure-parser-dispatch-token is "".

Report oatraveling:
	do nothing.

Table of OpenAdventure Parser Travel Tokens
parser-token (text)	dispatch-token (text)
"n"	"NORTH"
"north"	"NORTH"
"s"	"SOUTH"
"south"	"SOUTH"
"e"	"EAST"
"east"	"EAST"
"w"	"WEST"
"west"	"WEST"
"u"	"UPWAR"
"up"	"UPWAR"
"d"	"DOWN"
"down"	"DOWN"
"ne"	"NE"
"northeast"	"NE"
"se"	"SE"
"southeast"	"SE"
"sw"	"SW"
"southwest"	"SW"
"nw"	"NW"
"northwest"	"NW"
"in"	"INWAR"
"inside"	"INWAR"
"inward"	"INWAR"
"out"	"OUT"
"outside"	"OUTDO"
"outdoors"	"OUTDO"
"enter"	"ENTER"
"cross"	"CROSS"
"over"	"OVER"
"forward"	"FORWA"
"onward"	"FORWA"
"back"	"BACK"
"return"	"BACK"
"retreat"	"BACK"
"left"	"LEFT"
"right"	"RIGHT"
"climb"	"CLIMB"
"crawl"	"CRAWL"
"jump"	"JUMP"
"building"	"BUILD"
"build"	"BUILD"
"house"	"BUILD"
"road"	"ROAD"
"hill"	"HILL"
"forest"	"FORES"
"forests"	"FORES"
"valley"	"VALLE"
"gully"	"GULLY"
"stream"	"STREA"
"upstream"	"UPSTR"
"downstream"	"DOWNS"
"depression"	"DEPRE"
"entrance"	"ENTRA"
"cave"	"CAVE"
"cavern"	"CAVER"
"cobble"	"COBBL"
"cobbles"	"COBBL"
"debris"	"DEBRI"
"debrisroom"	"DEBRI"
"pit"	"PIT"
"passage"	"PASSA"
"tunnel"	"TUNNE"
"canyon"	"CANYO"
"low"	"LOW"
"awkward"	"AWKWA"
"giant"	"GIANT"
"view"	"VIEW"
"crack"	"CRACK"
"steps"	"STEPS"
"stairs"	"STAIR"
"stair"	"STAIR"
"dome"	"DOME"
"hall"	"HALL"
"barren"	"BARRE"
"bed"	"BED"
"bedquilt"	"BEDQU"
"bedqu"	"BEDQU"
"oriental"	"ORIEN"
"orientalroom"	"ORIEN"
"fork"	"FORK"
"slab"	"SLAB"
"slabroom"	"SLAB"
"shell"	"SHELL"
"shellroom"	"SHELL"
"reservoir"	"RESER"
"room"	"ROOM"
"floor"	"FLOOR"
"hole"	"HOLE"
"wall"	"WALL"
"broken"	"BROKE"
"plover"	"PLOVE"
"plove"	"PLOVE"
"plugh"	"PLUGH"
"xyzzy"	"XYZZY"
"y2"	"Y2"
"office"	"OFFICE"
"main"	"OFFICE"

Section 6 - Diagnostics

To print OpenAdventure runtime state:
	say "Runtime ready: [if openadventure-framework-ready is true]yes[otherwise]no[end if]; ";
	say "rule [openadventure-current-travel-rule-id], source [openadventure-active-source-loc].".
