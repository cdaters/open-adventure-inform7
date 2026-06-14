# Memory Analysis - Milestone 7C

## Scope

This document measures the current generated Inform 6 output for the default
Z-machine target and estimates which costs are reducible. It intentionally does
not optimize source code; Milestone 7C is measurement and recommendation only.

## Current Z-machine Failure

Default build:

```bash
./build.sh --compile
```

Result:

```text
110160 bytes readable memory used (maximum 65536)
Compiled with 1 error
```

The project therefore needs to recover at least `44624` bytes of readable
memory to emit a valid Z8 story file. A practical target should leave headroom,
so the real recovery goal is closer to `48000` to `50000` bytes.

The current Z-target intermediate is:

```text
OpenAdventure.inform/Build/OpenAdventure.i6
```

It contains about `95494` lines of generated Inform 6 source.

## Readable Memory Map

The failing Inform 6 compile reports this readable-memory layout:

| Region | End address | Size |
| --- | ---: | ---: |
| Header | `0x00040` | 64 bytes |
| Abbreviations table | `0x00102` | 194 bytes |
| Header extension | `0x0010a` | 8 bytes |
| Property defaults | `0x00188` | 126 bytes |
| Objects | `0x0119c` | 4116 bytes |
| Object short names and common property values | `0x05c1a` | 19070 bytes |
| Class numbers table | `0x05c44` | 42 bytes |
| Symbol names table | `0x08d6e` | 12586 bytes |
| Individual property values | `0x0a1f7` | 5257 bytes |
| Globals | `0x0a3d7` | 480 bytes |
| Arrays | `0x19777` | 62368 bytes |
| Grammar | `0x19e13` | 1692 bytes |
| Actions | `0x19ec7` | 180 bytes |
| Parsing routines/adjectives | `0x19ec9` | 2 bytes |
| Dictionary | `0x1ae50` | 3975 bytes |

Largest regions:

1. Arrays: `62368` bytes
2. Object short names and common property values: `19070` bytes
3. Symbol names table: `12586` bytes
4. Individual property values: `5257` bytes
5. Objects: `4116` bytes
6. Dictionary: `3975` bytes

The arrays region alone is nearly the whole Z-machine readable-memory limit.
Even eliminating the entire dictionary would not solve the build.

## Generated Array Indicators

Counts in the current I6 intermediate:

| Generated construct | Count |
| --- | ---: |
| `Array` declarations | `6066` |
| `bc_U*` block-value text arrays | `4652` |
| `Constant text_U*` text constants | `3304` |
| `ts_array*` arrays | `395` |
| `name_array*` arrays | `269` |

The generated travel dispatch is the largest project-authored data structure.
It appears in `OpenAdventure.inform/Source/OpenAdventure.generated.ni` as:

```text
Table of Generated Travel Non-Direct Rules
```

That table has text-valued diagnostic and dispatch columns such as source
location, action kind, travel category, target, verbs, condition kind,
condition arguments, and handwritten reason. Inform 7 represents these text
cells with many block-value arrays and constants in readable memory.

## Major Contributors

| Contributor | Current footprint | Projected savings | Effort | Gameplay risk |
| --- | ---: | ---: | --- | --- |
| Generated arrays, total | `62368` bytes | `20000` to `35000` bytes if deeply redesigned | High | Medium to high |
| Generated travel non-direct table | about `8000` to `12000` bytes of direct column arrays, plus related text wrappers | `12000` to `22000` bytes by replacing text columns with numeric enums, packed arrays, or generated dispatch code | High | Medium |
| Block-value text wrappers (`bc_U*`) | estimated `18600` bytes in array declarations | `8000` to `14000` bytes if text-heavy generated tables are removed or encoded numerically | High | Medium |
| Inform map storage (`Map_Storage`) | about `4440` bytes | `0` under current Inform map model; up to `4440` bytes only by bypassing built-in map storage | High | High |
| Rulebook, response, and action metadata arrays | about `4000` to `6000` bytes | `1584` bytes measured with `Use memory economy.` | Low | Low |
| Objects plus object property data | `28443` bytes across object table, short names/common properties, and individual properties | `2000` to `6000` bytes with aggressive object/property reduction | High | Medium to high |
| Symbol names table | `12586` bytes | unclear; effectively `0` with normal project settings | Very high | High |
| Dictionary, grammar, and actions | `5847` bytes combined | `500` to `1500` bytes from realistic vocabulary trimming | Medium | High |
| Treasure, dwarf, pirate, and scoring tables | small compared with travel table | under `1000` bytes in likely savings | Low to medium | Low |

## Memory-Reduction Options

| Option | Measured or estimated recovery | Notes |
| --- | ---: | --- |
| `Use memory economy.` | `1584` bytes measured | Reduces rule and rulebook name metadata. Helpful but far below the `44624` byte minimum. |
| Existing Z-machine compiler options | `0` additional bytes | Generated I6 already contains `ZCODE_LESS_DICT_DATA=1` and `OMIT_UNUSED_ROUTINES=1`. |
| Additional Z-machine abbreviation tuning | `0` to `500` readable-memory bytes | Mostly affects compressed text and story-file size, not the large readable-memory arrays. |
| Convert generated travel table text columns to numeric enums | `12000` to `22000` bytes | Highest-value project-level option. Requires generator and runtime rewrite. |
| Compress sparse/generated table columns | `2000` to `6000` bytes | Boolean and small enum columns can become packed byte or bit arrays. |
| Remove or compact repeated empty text block values | `5000` to `9000` bytes if source generator stops producing them | There are many empty/default text wrappers. Savings overlap with travel-table redesign. |
| Vocabulary reduction | `500` to `1500` bytes realistic | Parser behavior risk is high because Open Adventure accepts many historical synonyms. |
| Reduce Inform object/property footprint | `2000` to `6000` bytes | Requires fewer objects, fewer properties, or less introspection. Risks gameplay and parser behavior. |
| Avoid Inform map route storage | up to about `4440` bytes | Z-machine already defaults to slow route-finding. Saving this requires bypassing built-in map storage. |
| Inform template/compiler surgery | `10000` to `15000` bytes possible in theory | High maintenance risk and not appropriate before exhausting generator-side reductions. |

## Cost Categories

### Generated Content Costs

These are the most realistically reducible costs. The travel generator currently
uses Inform 7 tables with many text fields. This is convenient and auditable,
but expensive on Z-machine readable memory. Numeric IDs, packed arrays, and
generated branch code are the strongest candidates if Z8 remains a goal.

Realistic savings: `15000` to `30000` bytes with significant work.

### Runtime System Costs

The runtime framework adds rulebooks, activities, variables, tables, and text
values. Some metadata can be reduced with `Use memory economy.`, but the
measured recovery is only `1584` bytes.

Realistic savings: `2000` to `5000` bytes without risky rewrites.

### Inform Library Costs

The object model, symbol names, parser, dictionary, grammar, and map machinery
are substantial. Normal project settings do not expose a low-risk switch that
recovers tens of kilobytes. The symbol names table alone is `12586` bytes and
did not materially shrink under the memory-economy measurement.

Realistic savings: low under normal Inform 7 use; higher only with template or
compiler-level work.

### Unavoidable Game-Content Costs

Open Adventure needs a large cave map, historical vocabulary, treasures,
creatures, messages, and puzzle state. Cutting this content would undermine
parity. Some representation choices can be optimized, but the content itself is
not optional.

Realistic savings: limited. The implementation can encode content more tightly,
but should not remove vocabulary, rooms, objects, or behavior for size alone.

## Findings

The Z8 overage is not a small build setting problem. The current project must
recover at least `44624` bytes, and low-risk compiler or Inform settings recover
only about `1584` bytes.

The largest project-controllable opportunity is the generated travel and table
data. Even an aggressive travel-table rewrite may not be sufficient by itself.
Reaching Z8 likely requires several changes together:

1. Replace text-heavy generated travel tables with numeric or packed data.
2. Remove repeated block-value text storage from generated tables.
3. Compress sparse boolean and enum table columns.
4. Consider bypassing selected Inform map/table machinery.
5. Apply `Use memory economy.` once behavior has been rechecked.

These are substantial architecture changes. They should be treated as a
separate optimization milestone, not as a prerequisite for gameplay parity.
