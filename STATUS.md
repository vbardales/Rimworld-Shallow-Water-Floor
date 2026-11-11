---
mod: Shallow Water Floor Tile Renew (unofficial)
packageId: nelim.shallowwaterfloortile
repo: Rimworld-Shallow-Water-Floor
remote: https://github.com/vbardales/Rimworld-Shallow-Water-Floor.git
visibility: public
detached: no
workflow_stage: localize[1.0.0]
licence: silent
licence_at: "2026-11-11: original by rune1993 declares no licence (silent); owner decision: MIT on what is added here only, LICENSE excludes the original work"
upstream_mod_remotes: N/A      # none found, not searched on GitHub or GitLab (replay 2026-11-11)
settings_audit: not_applicable
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
dependencies: none      # 2026-11-11: two TerrainDefs on vanilla WaterShallowBase, no DLC, no MayRequire, no patch, OptionalCompat 0 declared (rev 0c0ac91)
workshop_required_items: n/a, no Workshop dependency
workshop: 3811403332
published: yes
tested_on: never
remaining:
  - "2026-11-11: unverified: never seen running"
  - "2026-11-11: unverified: upstream git remotes of rune1993's mod not searched"
  - "2026-11-11: defect: Art/ holds files outside the closed set (Gallery/, ModIcon-signature-candidate.png, README.md)"
updated: 2026-11-11
protocols_read_sha: 3937f9048f97c0e3cd28ab4c492ddef003895f23
---

# Shallow Water Floor Tile Renew: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Check it with `scripts/Check-Status.ps1 -Mod <Folder>` (no ERROR) before the commit that leaves the monorepo.

## Settings audit

2026-11-11, revision 1b0ed9d, analysis only (no game run).

- Inventory: two `TerrainDef` (`RuneWaterShallow`, `RuneFertileWater`) on vanilla `WaterShallowBase`. No assembly, no `.cs`, no `Keyed` file, no `MainButtonDef`, no mod settings class in `Mod/`.
- Decision: no setting is useful. Costs, fertility and affordances are fixed on purpose (original author's design, see `ATTRIBUTION.md`); a slider would only reopen choices the port settled.
- Absence of a settings page and of a MainButtons shortcut: verified in the sources (no code, one def type).
- Result: `not_applicable`. In-game check that "Mod options" lists no page for this mod stays for `playTests`.
