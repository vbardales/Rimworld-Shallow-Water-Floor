# Shallow Water Floor Tile — attribution

1.6 port of **Shallow Water Floor Tile**
(https://steamcommunity.com/sharedfiles/filedetails/?id=2217225014) by
**rune1993**. The original stopped at 1.3.

No licence is stated on the Workshop page or in the mod folder. The mod is two
terrain defs and no code, and the port keeps the author's defNames, values and
intent; if rune1993 asks for it to come down, it comes down.

What was added in this port (the 1.6 fixes, the French translation, the documentation, the artwork)
is under the MIT licence, see `LICENSE`. It does not cover rune1993's original work.

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

Second fix, of the author's own making rather than the parser's: **neither
terrain had a work cost.** `WaterShallowBase` declares no `WorkToBuild`, and the
stat's `defaultBaseValue` is `1`, so each tile was laid instantly — free fertile
ground for two wood. `RuneWaterShallow` is now 120 work, alongside straw matting
and a shade above the 85 of a wood floor; `RuneFertileWater` is 400, still well
under the 700 work per tile of a hydroponics basin, which also wants steel,
components and a power hookup.

This is the one place where the port departs from the author's numbers. It was
weighed against leaving them alone, and the deciding argument is that they were
never *chosen*: the field is simply absent, and the value of 1 is the game's
fallback, not a design. The 2-wood cost, the 1.25 fertility and the zero path
cost — which the author did write — are untouched.

## What was added

- A `description` on each terrain. Every vanilla floor has one; without it the
  build menu tooltip was empty.
- `drawStyleCategory` set to `Floors`, so the two terrains get the same shape
  tools as every vanilla floor. `FloorBase` carries it; `WaterShallowBase` does
  not, because natural water is never built.
- A French translation of the two labels and the two new descriptions.

## What was left out

`Textures/ShallowWaterFloor.png` — 1.3 MB of preview artwork filed under
`Textures/`, which nothing points at. Both terrains use the game's own
`Terrain/Surfaces/WaterShallowRamp`, as the original did.

## Verified against 1.6

`WaterShallowBase` still exists, and `waterDepthShader`, `layerable`,
`renderPrecedence`, `resourcesFractionWhenDeconstructed` and the `GrowSoil` and
`Diggable` affordances are all still read from XML. Nothing in the two defs was
broken by 1.6 itself: everything listed above under "What was fixed" was already
broken in 1.3.

One thing deliberately left as the author wrote it: `RuneFertileWater` overrides
`affordances` instead of extending them, so it does not inherit the water
affordances of its parent — no `ShallowWater`, no `Bridgeable`. That is what
makes it behave like ground you can plant on rather than like water.

## Adoption

If I do not answer within a reasonable time after being contacted, anyone may
freely update this or any other of my mods, including publishing a continuation
of it. All credit must be preserved.
