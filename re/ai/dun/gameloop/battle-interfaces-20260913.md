# Shared battle-script contracts

The existing `BT_EVENT_INFO` definition is shared through the dungeon loop's
header with its original 0xC0 size and field offsets. The entrance and escape
commands store script-stack pointers at +0x84 and +0x88; the dungeon loop writes
the result at pointer+4, represented by `RS_STACKDATA::i`. Request is the word
at +0x98, consumed by the transition switch in MoveChara. The word at +0xB8
controls party-status restoration in GameInit and GameLoop. Remaining unknown
fields retain their offsets and types.

`UserStatus` is defined by `src/dun/gameloop.cpp` at retail 0x2A3468, so its
extern declaration belongs to that header. Dungeonmap includes that owner;
charakey and monstorunit already include it.

The main symbol table gives `BtBattleMusic_Stop__Fv` address 0x1B7640 and size
0x48, and `LoadActiveItemIcon__Fv` address 0x1D13A0 and size 0x4C. Their callers
ignore the return register and their bodies do not return a defined value.
`BtLoadMonstor(int)` likewise has the existing void contract; its stale
unknown-return tag is removed.

`InitMenuManual__FPiP1` takes two `int *` arguments. The repeated-type encoding
P1 refers back to Pi. BattleManualInit forwards both argument registers
unchanged; the initializer uses the second as its load-buffer address.

Exposing the new declarations changes MWCC's allocation of two identical zero
arguments in EdDrawSky. Giving the second argument an explicit local preserves
the no-regression gate (objdiff 97.405045 baseline to 97.4273), without changing
its intended values. EdDrawSky remains an existing partial match and is not
counted as a new implementation or a PERFECT gain.
