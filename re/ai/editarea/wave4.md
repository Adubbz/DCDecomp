# editarea matching pass — 2026-09-13

Base: merged `5f00a5d8`; shard branch `grind/wave4-editarea`.

13 functions are PERFECT on both checker axes, totaling 3,936 symbol bytes
(4,016 bytes including reference instruction padding). No BLOCKED bodies
were retained. Main byte-perfect count rises 885 → 898. Original-base
snapshot comparison reports zero function/object/data regressions and zero
changed data records. TITLE and DUN counts remain unchanged.

| Function | Symbol bytes |
| --- | ---: |
| `GetAlt__9CEditAreaFfff` | 68 |
| `GetAlt_i__9CEditAreaFfff` | 68 |
| `GetPartsExtra__9CEditAreaFii` | 384 |
| `SetRiverParts__9CEditAreaFii` | 1088 |
| `SetRoadParts__9CEditAreaFii` | 812 |
| `SearchPartsID__9CEditAreaFfff` | 92 |
| `SearchPartsExtra__9CEditAreaFfff` | 68 |
| `GetGrid__9CEditAreaFP11CVector3_f_fff` | 88 |
| `MakePartsBox__9CEditAreaFv` | 392 |
| `PickUpPoly__9CEditAreaFP6CCPolyfff` | 196 |
| `PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0` | 224 |
| `GetPartsRect__9CEditAreaFR8CRect_i_Pii` | 336 |
| `Initialize__9CEditAreaFv` | 120 |

## Verification

Each function was checked individually after implementation. All 13 were
checked again after formatting, enum cleanup, and reference moves. The
remaining unit queue received one evidence-only sweep with `--category all`,
`--max-instr 1000000`, `--count 100000`, `--fail-streak 100000`, and
`--include-jumptables`: all nine remaining functions were attempted, zero
excluded. All nine raw m2c drafts fail compilation; this is distinct from
the manually reconstructed matching bodies above. The sweep refreshed its
own baseline, so the final regression comparison uses the preserved merged
base snapshot rather than claiming its 898 → 898 gate measures additions.

The 13 byte-identical function assembly moves are collected in their own
commit following the individual function commits. They alter the harness
fingerprint and retire readiness freshness; the full sweep log and events
remain evidence of the final source/header content before those moves.

## Remaining work

- `CheckAreaRect`: declarations already exist; generated member-call syntax
  fails. A manually translated candidate compiles around 99% but needs
  register-allocation work. No candidate is retained in source.
- `GetPos(CVector3_i_*,...)`: raw GP constant and compiler conversion helper
  spellings in the draft; integer vector fields are now available.
- `DrawGrid`/`RemakeGrid`: require analyzed CFrameVu1/visual data accesses;
  the draft also leaves member-call spellings untranslated. Owners are
  `include/framevu1.hpp`, `include/frame.hpp`, and `include/visualvu1.hpp`.
- `CheckRiverChain`: local initializer/global reconstruction remains.
- `SetMapParts`, `DeleteMapParts`, `CheckParts`: CMapParts member calls and
  grid accesses need manual reconstruction using `include/mapparts.hpp`.
- `PickUpPoly(CCPoly*,CRect_i_)`: vector copies, stack geometry and GP
  accesses still appear as raw decompiler artifacts.

No additional shared declarations are requested without completing their
type analysis. No changes to compiler tooling, linker layout, or data dumps
are part of this pass. See `overview.md` for behavior and layout evidence.
