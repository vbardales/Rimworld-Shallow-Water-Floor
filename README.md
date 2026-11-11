# Shallow Water Floor Tile Renew

Update of rune1993's **Shallow Water Floor Tile** to RimWorld 1.6.

**I am not the author of this mod.** The idea and the original defs are rune1993's - all I did
was the work needed to make it run on 1.6, and the work needed to make it run at all. Credit goes
to them; mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2217225014 (stopped at 1.3)

## What the mod does

Shallow water you can lay down like a floor. Two terrains, both built for 2 wood from the
**Floors** tab:

- **Shallow water** - behaves like the natural kind. Pawns wade through it, bridges can be built
  over it, nothing grows in it.
- **Fertile water** - crops grow in it: fertility 1.25, and no movement penalty. As far as the
  colony is concerned it is not water any more: nothing can be bridged over it, and it will not
  carry a waterproof conduit.

No code, no dependencies. Safe to add to an ongoing save. Removing it mid-save is the usual
terrain-mod caveat: tear up any tile you have laid before you unsubscribe, or the save comes back
with terrain it can no longer resolve.

## What changed in the 1.6 update

### The mod never worked, in any version

`terrainAffordanceNeeded` takes **one** value - the game reads it as a single
`TerrainAffordanceDef`, not as a list. Both terrains declared it as a list of `Heavy` and `Light`,
which the parser ran together into `HeavyLight`, a surface no def declares.

The consequence is not cosmetic: **neither terrain could be built**, in any version, since 2021.
They now ask for `Light`, the permissive one of the two, which every soil and every floor
provides.

### Neither terrain had a work cost

`WaterShallowBase` declares no `WorkToBuild`, and the stat's `defaultBaseValue` is `1` - so each
tile was laid instantly. That is free fertile ground for two wood, which is not what the rest of
the game charges for it:

| Terrain | Work | Compare with |
| --- | --- | --- |
| `RuneWaterShallow` | 120 | straw matting 120, wood floor 85 |
| `RuneFertileWater` | 400 | hydroponics basin 2800 for four tiles - 700 each, plus steel, components and power, for fertility 2.8 |

The 2-wood cost, the 1.25 fertility and the zero path cost are the author's and are untouched.

### Smaller additions

- A `description` on each terrain. Every vanilla floor has one; without it the build menu tooltip
  was empty.
- `drawStyleCategory` set to `Floors`, so the two terrains get the same shape tools as every
  vanilla floor.

The `defName`s are unchanged on purpose: renaming them would drop both terrains out of any save
that already uses them.

## What was left out

`Textures/ShallowWaterFloor.png` - 1.3 MB of preview artwork filed under `Textures/`, which
nothing points at. Both terrains use the game's own `Terrain/Surfaces/WaterShallowRamp`, as the
original did.

## Terms

The original mod declares no licence, on the Workshop page or in the mod folder. This update is
published under the usual practice for abandoned mods: **explicit credit to rune1993, a link to
the original, and removal on request.** If rune1993 comes back to the mod, or asks for this to be
taken down, it comes down.

What I added to it (the 1.6 fixes, the French translation, the documentation and the artwork) is
under the MIT licence, see `LICENSE`. That licence does not cover rune1993's original work.

If I do not answer within a reasonable time after being contacted, anyone may freely update this
or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **rune1993** - the mod itself.
- 1.6 update by Nelim. Written with the help of Claude (Anthropic).
