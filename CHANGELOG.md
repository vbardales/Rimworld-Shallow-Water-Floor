# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display
it in game.

## [1.0.0] - unreleased

On release: create the `v1.0.0` tag and the matching GitHub release.

First release of the 1.6 update of rune1993's Shallow Water Floor Tile, which stopped at 1.3.

### Fixed

- **Neither terrain could be built** - in any version, since 2021. Both declared
  `terrainAffordanceNeeded` as a list of `Heavy` and `Light`, but the game reads that field as a
  single `TerrainAffordanceDef`: the parser ran the two together into `HeavyLight`, a surface no
  def declares. Both now ask for `Light`, which every soil and every floor provides.
- **Neither terrain had a work cost.** `WaterShallowBase` declares no `WorkToBuild` and the stat
  defaults to `1`, so each tile was laid instantly. `RuneWaterShallow` is now 120 work, alongside
  straw matting; `RuneFertileWater` is 400, still well under the 700 work per tile of a
  hydroponics basin.

### Added

- Support for RimWorld 1.6. Every field in the two defs was checked against the 1.6 game files:
  `WaterShallowBase` still exists, and `waterDepthShader`, `layerable`, `renderPrecedence`,
  `resourcesFractionWhenDeconstructed` and the `GrowSoil` and `Diggable` affordances are all still
  read from XML.
- A `description` on each terrain, so the build menu tooltip is no longer empty.
- `drawStyleCategory` set to `Floors`, giving both terrains the shape tools every vanilla floor
  gets.
- A French translation of the two labels and descriptions.

### Removed

- `Textures/ShallowWaterFloor.png`, 1.3 MB of preview artwork filed under `Textures/` that nothing
  pointed at. Both terrains use the game's own `Terrain/Surfaces/WaterShallowRamp`, as the
  original did.
- The `1.1`, `1.2` and `1.3` version folders: this build targets 1.6 only.

### Notes

The `defName`s `RuneWaterShallow` and `RuneFertileWater` are unchanged on purpose: renaming them
would drop both terrains out of any save that already uses them.

`RuneFertileWater` overrides `affordances` instead of extending them, so it does not inherit the
water affordances of its parent - no `ShallowWater`, no `Bridgeable`. That is the author's choice
and it is kept: it is what makes the tile behave like ground you can plant on rather than like
water.
