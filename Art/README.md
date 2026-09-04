# Art — sources

Full-resolution originals. RimWorld never reads this folder; `About/` holds the cut-down files
that ship.

## `Preview-source.png` — 1672 x 941, 1780 KB

Above Steam's hard 1 MB limit as generated, which is the recurring trap: image models render
large by default.

`About/Preview.png` is composed from it at **896 x 504**, 577 KB. The name and the summary line
are engraved directly at final size — Chrome headless rasterises an HTML page 896 px wide with
this file as its background, so the glyphs are never resampled:

| | Value |
|---|---|
| Title | `Shallow Water / Floor Tile`, 52 px, two lines |
| Rule | 58 x 3, amber `#D68F2C`, picked up from the lamp pool |
| Summary | 21 px over 430 px |
| Darkening | radial from the top-left corner, `rgba(6,5,4,.86)` at the centre, nil at **62 %** |

That last figure is the one place this showcase departs from the repository standard, which is
74 %. At 74 % the veil reached the planted basin and dimmed the crops — and the crops are the
half of the mod that the empty basin cannot show. Pulling the falloff in keeps them bright
without costing the title any contrast, because the title sits over bare packed earth.

The summary line falls to about 6 px on the 268 px Workshop thumbnail and is not meant to be read
there. It is written for whoever opens the mod page.

## `ModIcon-source.png` — 1254 x 1254, 1267 KB

`About/ModIcon.png` is derived from it: scaled to **128 x 128**, 21 KB. The icon renders at
roughly 32 px in the in-game mod list, so the full-resolution file was 62 times the weight it
needed to be — and it would have travelled to every subscriber, since the Workshop uploader
publishes the mod folder as-is with no way to exclude anything.

```
ffmpeg -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" -y About/ModIcon.png
```
