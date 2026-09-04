# Art — sources

`ModIcon-source.png` — the icon as it was generated, **1254 x 1254, 1267 KB**.

`About/ModIcon.png` is derived from it: scaled to **128 x 128**, 21 KB. The icon is rendered at
roughly 32 pixels in the in-game mod list, so the full-resolution file was 62 times the weight it
needed to be — and it would have travelled to every subscriber, since the Workshop uploader
publishes the mod folder as-is with no way to exclude anything.

```
ffmpeg -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" -y About/ModIcon.png
```

`Preview-source.png` and `About/Preview.png` are not made yet.

RimWorld never reads this folder.
