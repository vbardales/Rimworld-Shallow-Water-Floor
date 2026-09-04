# Shallow Water Floor Tile — attribution

1.6 port of **Shallow Water Floor Tile**
(https://steamcommunity.com/sharedfiles/filedetails/?id=2217225014) by
**rune1993**. The original stopped at 1.3.

No licence is stated on the Workshop page or in the mod folder. The mod is two
terrain defs and no code, and the port keeps the author's defNames, values and
intent; if rune1993 asks for it to come down, it comes down.

## What was taken

| Element | Source |
| --- | --- |
| `RuneWaterShallow` — buildable shallow water | `Defs/ShallowWaterFloor.xml` |
| `RuneFertileWater` — the same, but crops grow in it | `Defs/ShallowWaterFloor.xml` |

The defNames are unchanged on purpose: renaming them would drop both terrains
out of any save that already uses them.

## What was fixed

`terrainAffordanceNeeded` takes ONE value — the game reads it as a single
`TerrainAffordanceDef`, not as a list. Both terrains declared it as a list of
`Heavy` and `Light`, which the parser ran together into `HeavyLight`, a surface
no def declares.

The consequence is not cosmetic: **neither terrain could be built**, in any
version, since 2021. They now ask for `Light`, the permissive one of the two,
which every soil and every floor provides.

## What was left out

`Textures/ShallowWaterFloor.png` — 1.3 MB of preview artwork filed under
`Textures/`, which nothing points at. Both terrains use the game's own
`Terrain/Surfaces/WaterShallowRamp`, as the original did.

## Verified against 1.6

`WaterShallowBase` still exists, and `waterDepthShader`, `layerable`,
`renderPrecedence`, `resourcesFractionWhenDeconstructed` and the `GrowSoil` and
`Diggable` affordances are all still read from XML. Nothing else in the two defs
needed changing.

One thing deliberately left as the author wrote it: `RuneFertileWater` overrides
`affordances` instead of extending them, so it does not inherit the water
affordances of its parent — no `ShallowWater`, no `Bridgeable`. That is what
makes it behave like ground you can plant on rather than like water.

## Adoption

If I do not answer within a reasonable time after being contacted, anyone may
freely update this or any other of my mods, including publishing a continuation
of it. All credit must be preserved.
