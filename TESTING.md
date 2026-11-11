# Shallow Water Floor Tile Renew: test scenarios

Written 2026-11-11 at revision `40d6e4f`. Figures checked against the game's own defs
(`Data/Core/Defs/TerrainDefs/Terrain_Water.xml`, `Terrain_Floors.xml`, `Buildings_Furniture.xml`).

The mod has no code. Everything below is def data, so what can be proved without the game
is in "Without the game"; what needs a running game is in "In the game" (played at `playTests`).

## Without the game

| Check | Tool | Expected |
|---|---|---|
| Defs well formed, parents resolve, no unknown field | `Check-DefRefs.ps1 -ModPath Mod`, `Check-XmlFields.ps1 -ModPath Mod` | no finding |
| French covers every label and description | `Check-Translations.ps1`, `Check-DefInjected.ps1` | 4 keys, 0 error |
| Mod files and notices | `Check-ModBasics.ps1` | PASS |

### Figures in the public text, checked against the defs

| Claim | Source in the game | Result |
|---|---|---|
| Both terrains cost 2 wood | `costList` `WoodLog` 2 in `Mod/Defs/Terrain_ShallowWater.xml` | true |
| Shallow water: 120 work, "alongside straw matting" | `StrawMatting` `WorkToBuild` 120 | true |
| "a shade above the 85 of a wood floor" | `WoodPlankFloor` `WorkToBuild` 85 | true |
| Fertile water: 400 work | own def | true |
| Hydroponics basin 2800 work, "700 each" for four tiles | `Buildings_Furniture.xml` `WorkToBuild` 2800, 2800 / 4 = 700 | true |
| Fertility 1.25 on fertile water | own def `fertility` 1.25 | true |
| Shallow water: pawns wade, can be bridged, nothing grows | parent `WaterShallowBase`: `pathCost` 30, affordances `ShallowWater`, `Bridgeable`, `WaterproofConduitable`, `Walkable`; no `GrowSoil`, `fertility` left at 0 | true |
| Fertile water: no movement penalty, no bridge, no waterproof conduit | own `pathCost` 0; `affordances` overridden to `Light`, `Medium`, `Heavy`, `GrowSoil`, `Diggable`: no `Bridgeable`, no `WaterproofConduitable` | true |
| Both ask for `Light` | `terrainAffordanceNeeded` `Light` | true |

## In the game (played at `playTests`)

Each scenario starts on a normal soil map, a colonist with Construction, 10 wood.

1. **Both terrains are buildable.** Precondition: Floors tab open. Action: designate one tile of
   each. Expected: both listed under Floors, both built by the colonist, work time visibly
   not instant (120 and 400). This is the scenario the original mod could never pass.
2. **Fertile water grows crops.** Action: sow rice on a `RuneFertileWater` tile and on a
   `RuneWaterShallow` tile. Expected: sowing accepted on fertile water only; the plant grows.
3. **No slowdown on fertile water.** Action: order a colonist across 5 tiles of each.
   Expected: slower on shallow water (path cost 30), normal speed on fertile water (0).
4. **Bridges.** Action: designate a bridge over each. Expected: allowed over shallow water,
   refused over fertile water.
5. **No settings page.** Expected: Mod options lists no entry for this mod, no MainButtons shortcut.
6. **No error in the log.** Expected: `Player.log` holds no red error naming `RuneWaterShallow`
   or `RuneFertileWater` after loading and playing 1 to 5.
