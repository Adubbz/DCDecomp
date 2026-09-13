# NowWeaponStatus refinement — 2026-09-13

Base: battlemenu shard `b3636d82`.

`MenuClsMes::NowWeaponStatus` reaches PERFECT on the linked and object
checker axes. It retains the existing documented option/message behavior;
no shared header or layout changes are needed. The new menu_misc.hpp
include supplies the owning declaration of CheckWeaponOptionStatus.

## Evaluation and register allocation

The starting documented candidate scored 97.07865%. Thirteen bounded
variants tested typed address intermediates, loop comparison spellings,
local scopes, and direct versus referenced array accesses.

- An explicit `ATTACH_LIST *attachment` before reading its option flags
  emits the retail index shift before loading the weapon pointer.
- `bit <= 13` uses retail's comparison temporary; `bit < 14` does not.
- An explicit window pointer inside the clearing loop gives its counter
  and pointer the retail registers. The clearing loop retains `< 10`;
  changing it to `<= 9` changed a comparison register unnecessarily.
- Loading the window before the option index, then reading and writing
  `window->mes_no[index]` directly, emits the retail address-add operand
  order. Retaining an `int &slot` changes only that commutative addition,
  leaving the candidate at 99.88764%. Ordinary array syntax matches.

The attachment option field remains the existing shared `unk_04` because
renaming itemdata.hpp is outside this shard. Its width and role are covered
by weapon-options.md. The clearing counter is int, preserving retail's
lack of halfword narrowing. No raw pointer arithmetic or behavioral fixes
were introduced.
