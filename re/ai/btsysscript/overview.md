# `btsysscript` analysis

## Translation-unit role

`btsysscript` adapts the run-script virtual machine to dungeon battle state.
The unit loads and starts system-event scripts, maintains battle event state,
and exposes opcode callbacks for monsters, map objects, floor transitions,
item traps, camera state, and status flags.

The 2026-09-13 wide evidence sweep covered all 80 queued functions. Its
baseline classified 61 functions as typework-shaped, seven as syntax-shaped,
and eleven as compilable drafts; no draft was byte-perfect as-is. Four source
includes retired the six explicit missing-type causes in the targeted rerun.

## Script stack helpers

Five functions at `0x1BB930` through `0x1BB9E0` are local counterparts of the
helpers already decompiled in `editloop3.cpp`:

- `GetStackInt` returns `stack->f` converted to `int` when the tag is
  `RS_FLOAT`, otherwise `stack->i`.
- `GetStackFloat` converts `stack->i` when the tag is `RS_INT`, otherwise it
  returns `stack->f`.
- `GetStackString` returns `stack->s`.
- The two `SetStack` overloads write through `stack->p` only for `RS_PTR`.

Retail marks these functions local and gives them their natural unsuffixed
C++ names. Splat disambiguates this copy as `__2` in per-function assembly,
and the remaining assembly callbacks call those suffixed labels. A natural
`static GetStackInt` C++ definition emits a local unsuffixed symbol, leaving
the assembly callers' `GetStackInt__FP12RS_STACKDATA__2` references
unresolved. Consequently these helpers cannot be migrated independently
without either converting every assembly caller in the same cohort or adding
a build-time alias for the transitional split. They must not be papered over
with public `extern "C"` declarations: retail binding and ownership are local.

## Matched command callbacks

`_LOAD_MONSTOR` at `0x1BC550` calls `BtLoadMonstor(0)`, calls
`BtArrengeMonstor()`, and returns `1`. The reconstructed C++ is byte-perfect.
The existing `@unknownret` on `BtLoadMonstor` is stale: its definition in
`dun/gameloop.cpp` and its callers establish a `void` return.

`_SET_FLOOR_TITLE` at `0x1BCFE0` calls `FloorTitleOn()` and returns `1`. The
reconstructed C++ is byte-perfect.

`BtSetMapJumpFloor` at `0x1BB920` stores its argument in `BtMapJumpFloor`.
It is deliberately a `void` setter: `_SET_DUNGEON_FLOOR` calls it only for
the store, then immediately replaces the call result with its own return value
of `1`; the corresponding C++ caller likewise uses it as a statement.
Although the reconstructed instructions and objdiff score are exact, the body
must remain assembly-backed until the BSS layout is repaired: the current
build places the global at `0x2A2CA4`, `0xC0` above retail's `0x2A2BE4`, so a
C++ body produces a differing GP-relative store.

## Battle object handles

`BtObjHdl` is a 32-element array occupying `0x180` bytes, so each entry is
`0xC` bytes. `GetObjHDL` bounds-checks the index against `[0, 32)`, prints
`"** obj hdl err **"` for an invalid index, and otherwise returns the selected
entry. Callers establish a frame pointer at offset `0`, an object/character
pointer at offset `4`, and a kind discriminator at offset `8`: kind `0` uses
the frame and kind `1` uses the object. This is distinct from the `0x38`-byte
`OBJ_HANDLE` used by editor scripts in `editloop3.hpp`.

Like `BtMapJumpFloor`, `BtObjHdl` is still supplied by the broad BSS dump and
is currently shifted by `0xC0`. Defining the type in `btsysscript.hpp` also
requires removing or reconciling the current consumers' incomplete/private
views during integration.

## Shared-header requests

The following changes are outside this shard's allowance and are required to
retire the next typework frontier:

1. Move the `BT_EVENT_INFO` definition at `src/dun/gameloop.cpp:180` to an
   owning shared header, expose `BtEventInfo`, and remove the private duplicate.
   The object is global at retail `0x1D56740`, size `0xC0`. Twenty swept
   callbacks read or write fields through offset `0xB8`.
2. Declare `UserStatus` in `include/dun/gameloop.hpp` with its established
   `CUserStatus *` type. It is defined at `src/dun/gameloop.cpp:1027`; assembly
   loads it from GP offset `-0x6388`.
3. Expose the dungeon `NPCUnit` object from its owning header. Both
   `BtSystemScriptEventInfoInit` and `BtSystemScriptInit` index it with a
   `0x14A0` stride and install it in `EdEventInfo`.
4. Add `void BtBattleMusic_Stop(void)` to `include/btmisc.hpp`; the function
   is owned by `btmisc` at `0x1B7640`, and `_STOP_BATTLE_BGM` calls it then
   returns `1`.
5. Add `void LoadActiveItemIcon(void);` to the `btitem` header. Its assembly
   computes no return value, and `_SET_ACTIVE_ITEM_ICON` overwrites `$v0` with
   `1` immediately after the call rather than consuming a callee result.
6. Remove the stale `@unknownret` from `BtLoadMonstor` in
   `include/dun/gameloop.hpp`. Its C++ definition returns `void`.

`BtEventInfo`, `BtObjHdl`, and `BtLoadMapFileName` occupy consecutive retail
BSS ranges `0x1D56740..0x1D569A0`. Their current build addresses are all
`0xC0` higher. Migrating or carving these objects must therefore be handled
with the existing global BSS-layout repair, not as an isolated source guess.

## Remaining code-level work

After the declarations above, the best callee-first order is the five stack
helpers as one transition cohort, `GetObjHDL`, then the short opcode callbacks
that call those helpers. The longer initialization, object-transform, and
monster-selection routines should wait until those callees and the shared
event/status layouts are available. The eleven `saved_reg_gp` drafts are not
source-ready; their GP-relative accesses must first be mapped to named globals.
