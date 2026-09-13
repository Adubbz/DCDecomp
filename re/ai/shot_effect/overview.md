# `shot_effect` analysis

## Runtime layout

`CSHOT_EFFECT` is 0xA160 bytes and aligned to 16 bytes. Its first word is a
`BT_SHOT_EFFECT *`: `Entry` tests the word before loading anything, and the
small `SetAttribute` method stores through it at offset 0x40, which is
`BT_SHOT_EFFECT::unk_040`. The 0x9FFC bytes after that pointer remain opaque.

The final 0x160 bytes contain eight-slot parallel arrays. The instruction
scales and load/store widths establish these fields independently of the m2c
drafts:

| Offset | Type | Use established in this pass |
| --- | --- | --- |
| 0xA000 | `s16 active[8]` | active flag cleared by `OffEffect` |
| 0xA010 | `s32 damage[8]` | damage set by `SetDmg` |
| 0xA030 | `s32 weapon_status[8]` | weapon status set by `SetWepStatus` |
| 0xA050 | `s16[8]` | initialized to -1 |
| 0xA060 | `s16 user_id_2[8]` | secondary user ID set by `SetUserID2` |
| 0xA070 | `s32[8]` | initialized to -1 |
| 0xA090 | `char *vs_monster[8]` | monster-effectiveness table set by `SetVsMonster` |
| 0xA0B0 | `s32 loop[8]` | loop setting |
| 0xA0D0 | `float random_rate[8]` | randomization rate |
| 0xA0F0 | `s32 life_time[8]` | lifetime |
| 0xA110 | `s32 enemy_attribute[8]` | enemy attribute |
| 0xA130 | `u8 no_sound[8]` | no-sound flag |
| 0xA138 | `u8 wait[8]` | wait value |
| 0xA140 | `u8 wait_state[8]` | secondary wait state cleared by `SetWait` |
| 0xA14C | `s32 slot_count` | initialized to 4; used as a slot count by larger methods |
| 0xA150 | `s32 current_slot` | currently selected slot, or -1 |
| 0xA154 | `s32` | resource/texture value passed to drawing code |

Offsets 0xA148, 0xA154, and 0xA158 remain unknown. Other fields use descriptive
names where the matched methods establish their runtime roles; these names are
functional descriptions rather than recovered retail identifiers.

## Matched functions

The following methods are instruction-for-instruction matches:

- `CSHOT_EFFECT::OffEffect` clears one active flag, or all eight for slot -1.
- `CSHOT_EFFECT::SetLoop` writes the current slot's loop setting.
- `CSHOT_EFFECT::SetWait` writes its byte-sized wait and clears a second state.
- `CSHOT_EFFECT::SetNoSound` sets the current slot's no-sound byte.
- `CSHOT_EFFECT::SetRandomRate` writes the current slot's float rate.
- `CSHOT_EFFECT::SetLifeTime` writes the current slot's lifetime.
- `CSHOT_EFFECT::SetEnemyAttr` writes the current slot's enemy attribute.
- `CSHOT_EFFECT::SetDmg` writes the current slot's damage.
- `CSHOT_EFFECT::SetAttribute` writes `BT_SHOT_EFFECT::unk_040` when selected.
- `CSHOT_EFFECT::SetWepStatus` writes the current slot's weapon status.
- `CSHOT_EFFECT::SetVsMonster` writes its monster-effectiveness table pointer.
- `CSHOT_EFFECT::SetUserID2` truncates its ID to the slot's 16-bit field.
- `CSHOT_EFFECT::Initialize` clears the source pointer, resets per-slot state,
  sets the slot count to four, and leaves no slot selected.
- `CSHOT_EFFECT_PACK::SetUserID2` forwards to the selected effect.
- `CSHOT_EFFECT_PACK::SetDmg` forwards to the selected effect.

None of the fifteen functions deliberately computes a return value, and their
observed callers use them only for their side effects. For the two pack
forwarders, the caller likewise does not consume the result of the delegated
setter. Together that supports the existing `void` declarations; absence of a
final `$2` or `$f0` assignment alone would not prove a return type. Renaming
the generated locals and parameters did not change any instruction.

## Typework and remaining frontier

Including `collisiondata.hpp` and `shot_effect_pack.hpp` resolved the six
missing-type failures from the initial sweep. The harness still emits
`CDataAlloc2_1_` in three drafts instead of the canonical `CDataAlloc2<1>`;
that spelling is a draft-generation limitation, not a type needed by compiled
upstream code, so this branch does not add an alias for it.
Including `texture.hpp` and `<cstdlib>` also gives the larger drafts the
existing `TexManager` and `rand` declarations.

The large `Entry`, `Entry2`, `ReEntry`, `Draw`, and `Step` methods now reach
body reconstruction issues rather than the layout failures fixed here. The
two `CSHOT` methods and two `CSHOT_MACHINGUN` methods likewise need their
internal element types and referenced globals reconstructed; their failures
are not evidence for widening `CSHOT_EFFECT` further.

## Out-of-bounds header follow-up

`include/shot_effect_pack.hpp` is outside this shard's allowance. Its two
matched forwarding methods should have their skeleton documentation replaced
with purpose text and should drop `@unknownret`:

```cpp
/**
 * Sets the secondary user identifier on the selected projectile effect.
 *
 * @mangled SetUserID2__17CSHOT_EFFECT_PACKFi
 * @address 0x1AE5C0
 * @size 0x50
 */
void SetUserID2(int);

/**
 * Sets the damage on the selected projectile effect.
 *
 * @mangled SetDmg__17CSHOT_EFFECT_PACKFi
 * @address 0x1AE610
 * @size 0x50
 */
void SetDmg(int);
```

The retail assembly for each method loads `current_effect` at 0x326E0,
compares it with -1, indexes `effect` with stride 0xA160, calls the
corresponding `CSHOT_EFFECT` method, and returns without setting a return
register.

Two shared-header follow-ups remain outside the allowance. The first no longer
blocks draft compilation after including its owning header, but its return tag
is still inaccurate; the second remains a sweep-visible global cause:

- `include/nowload.hpp` should drop `@unknownret` from
  `void wait_now_loading_vsync(void)`. The function's assembly at 0x153F70
  reaches `jr $31` without assigning `$2` or `$f0`; `CSHOT_EFFECT::Entry`
  calls it at 0x1ACCF4.
- The header owning dungeon `gameloop` globals should declare
  `extern CHIT_MACHINGUN_EFFECT OzumondShotEffect;`, with the type declared or
  included there. `src/dun/gameloop.cpp` already names the same exact global
  and uses it at its own call sites; `CSHOT_MACHINGUN::Step` loads its address
  before calling `CHIT_MACHINGUN_EFFECT::Set`.
