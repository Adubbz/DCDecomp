# `snd` analysis

## Provenance

The bodies of the 18 functions matched here come from Dayuppy's Dark Cloud
decompilation. Each was restyled to this repository's headers and names and
judged against the reference assembly on its own.

## Background-music state

The music globals sit in `.sbss` from `0x2A25F4`. Their meanings come from the
matched readers and writers:

| Global | Type | Meaning | Evidence |
| --- | --- | --- | --- |
| `now_bgm_no` | `int` | loaded set, -1 for none | `SndBgmInit` writes -1; `SndBgmPlay`/`SndBgmStop`/`SndBgmRePlay` test `>= 0` |
| `now_bgm_play` | `int` | play state 0/1/2 | `SndBgmPlay` sets 1, `SndBgmStop` sets 0, `SndBgmRePlay` resumes only from 2 |
| `now_bgm_vol` | `int` | volume set now | `SndBgmPlay` stores `SndGetDefaultBgmVol()`; `SndGetBgmVol` returns it |
| `bgm_fade` | `int` | fade direction, 0 for none | `SndCheckFade` returns `bgm_fade == 0`; `SndBgmFadeInOut` clears it when the fade ends |
| `now_bgm_fade_vol` | `float` | fade's current volume | `SndBgmFadeInOut` reads and writes it with `lwc1`/`swc1` |
| `bgm_fade_step` | `float` | fade's per-frame step | `SndBgmFadeIn` stores it; `SndBgmFadeInOut` adds it each frame |
| `bgm_fade_vol` | `int` | fade's end volume | `SndBgmFadeIn` stores it; `SndBgmFadeInOut` converts it to compare |
| `bgm_off` | `int` | nonzero blocks `SndBgmPlay` | only `SndBgmPlay` reads it; nothing writes it |

Nothing in retail writes 2 to `now_bgm_play`; the only stores are 0 and 1.
`SndBgmRePlay` still resumes only from 2.

`SndGetDefaultBgmVol` reads `MIDI_STATE.sequence` at `0x30` and
`MIDI_SEQUENCE.volume` at `0xC`, the offsets already established in trunk.

## Return types

- `SndBgmInit` and `SndAmbientInit` return 1. `SndBgmInit` was declared `void`,
  and the title units `rushmovi`, `title` and `titleloop` repeated that
  declaration next to their `snd.hpp` include; those local copies were removed
  so the header's `int` declaration is the only one.
- `SndGetNowSetNo` returns `now_sound_set`; its `@unknownret` tag is settled.
- `SndGetPanf` clamps to `[-1, 1]` and returns `(int) (63 * pan) + 64`. The
  compiler emits the `fptosi` helper call for the cast.

## Ambient and sprite state

`SndAmbientPlay` plays on port 1, the ambient port. `setbilinear` writes
`linear__2` at `0x2A1EE8` (`.sdata`), read by the `set2DSprite*` family through
`-0x7908($gp)`. It is a different global from `gameutil`'s `linear_filter` at
`0x2A25A8`.
