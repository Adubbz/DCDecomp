# MWCC behaviour, quirks and bugs

## 1. Leaked state (bugs)

The compiler carries these for the life of the process. A program compiled in
one invocation is therefore not the same as the same program compiled one unit
at a time.

### 1.1 The helper-call argument mask

`0x0051CE00` (integer) and `0x0051CE04` (float) record which argument registers
a compiler-emitted helper call reads, so the allocator keeps them live up to it.

* `0x0049F270` ORs one bit per argument pushed. The bit is the argument's
  **index**, not the register: `1 << (4 + n-1)` integer, `1 << (12 + 2(n-1))`
  float. A `double` is one argument in a register *pair* — one bit, two
  registers.
* `0x0049F250` passes the array to the call builder.
* **Nothing clears it.** Three `or` sites in the image and no store.

Each set bit gives that register a live range reaching every later helper call,
so anything live across the call is pushed one register up.

Bits are set by **double-precision arithmetic**: with no double hardware, every
`double` operation is a helper call taking its operands in integer register
pairs. One-operand conversions set `$a0`; two-operand ones set `$a0` and `$a1`.
Float conversions set `$f12` only. Struct and string copies set nothing — they
do not use this path.

A `float` compared against a `double` literal is enough to set both integer
bits.

### 1.2 The float-constant "evaluate first" byte

`0x004B28C0` annotates every expression node with `+5` = *evaluate this subtree
before the rest*, propagated up from the children. Its leaf case writes `0`.

For a floating constant (node kind `0x33`) it asks `0x004B21E0` whether its raw
representation is simple enough to materialise directly and, when it is,
**returns at `0x004B290D` without writing the byte**. For `float`, “simple”
means `(float_bits & 0xFFFF) == 0`; for `double`, at most one 16-bit halfword
is nonzero. This is unrelated to exact representability. Affected nodes reach
the back end holding whatever their arena slots last held — the arena is a bump
allocator that never zeroes.

Call lowering reads the byte at `0x0049E925`, `0x0049E94F`, `0x0049E97B`,
`0x0049EFFB` and `0x0049F06C`, and materialises the operand in the **first** of
two walks when it is non-zero. This decides float argument materialisation
order — the `mtc1` order — and nothing else.

`#pragma argument_flag` / `argument_flag_ones` pin those reads one by one (in
the order the compiler reaches them; `quicktu.py --argnodes` lists them). A
call whose first argument is an expression goes into one walk whole: the read
at `0x0049E925` is of the argument's root node, so a leaf inside it cannot be
ordered against the other arguments. When retail loads such a leaf, then the
zero arguments, then the rest of the arithmetic, the leaf was a local assigned
on the statement above the call, with the root's read pinned `0` and the
zeros' `1` (`DrawItemBox`).

Binary control-flow analysis and a 125-unit census of all five consumers show
that kind `0x33` is the only kind whose own `+5` can be read without a defining
write. Parents can explicitly derive their byte from a stale `0x33` child; that
is contamination, not an uninitialised read of the parent field.

`config/expression_node_overrides.json` makes the decision reproducible. A node
is keyed by the current translation-unit name, the current function's mangled
name, binary32/binary64 type, exact IEEE bits, and its one-based occurrence
among equal constants in that function. All fields are read from MWCC memory at
`0x004B290D`; arena addresses and decimal spellings are not identifiers.
The JSON groups entries by translation unit and then function to avoid repeating
those two components for each constant.

### 1.3 The invented-name counter

`0x0052B5D0`, handed out and post-incremented by `0x0042E540`; `0x0042E550`
renders it as the `@<n>` a float constant is filed under. It runs for the whole
invocation and cannot be written before the run — the compiler initialises it
itself. It changes names in the object and not one instruction.

### 1.3a A float literal's reuse across stores

When value numbering meets a store through an unknown address it asks
`0x00432F50` whether each remembered load's object may have been overwritten.
For a data object that reads a VarInfo byte at `[object+0x24]+0x22`, but a float
literal (`0x004B2280`, pool at `0x005555E4`) keeps its 8-byte value buffer at
`+0x24`. So the answer is whatever the arena holds 0x1A bytes past the value.
Zero reuses the literal's `lwc1` across the store; anything else reloads it.
Retail created each literal once for the whole program, and a per-unit compile
creates it next to different data. Symptom: one `lwc1` of a pool constant where
retail has two, a statement apart, with a store between them (`Step_Fire`,
`0.01f`). Fix: `#pragma literal_reload 0x3C23D70A` (statefix), naming the
literal's IEEE bits.

### 1.4 Consequence: compiles are not reproducible

Because §1.2 reads uninitialised memory, two identical runs can emit different
code. Any function whose float arguments are constants may differ, and one that
matches may be matching by accident.

### 1.5 Pragmas

Unknown pragma names are skipped silently unless `-warn illpragma`. The handler
is `0x004440A0`; at `0x004440C6` the name is the token at `[0x005570FC] + 10`,
`0x00555614` is the lexer's source pointer, and `0x00444505` is the
unknown-name exit.

The annotation pass of §1.2 runs **one function behind the parser**.

---

## 2. Register allocation

**The rule: the lowest-numbered register no live neighbour holds.** A wrong
register means a missing interference edge, never a preference.

* Declaration order picks **callee-saved** registers. Caller-saved ignore it.
* Colouring order is the reverse of a Chaitin removal order: passes scan vregs
  in ascending number and remove any with degree < 26. When a pass is stuck,
  the node with the lowest cost/degree is removed (ties go to the later vreg)
  and scanning resumes. Parameters (`this` = 32) are scanned first, so a
  parameter that ends up in the final clique is always coloured late,
  whatever the declaration order.
* A local assigned from a ternary (`p = c ? a : b;`) becomes the ternary's
  optimizer temporary, which has a low vreg number, so moving its declaration
  does nothing. Written as `if`/`else` it keeps the declared local's number, and
  declaration order places it again (`EventItemSelectDraw`).
* A loop counter shared at function scope puts every loop in one register;
  declaring it in the `for` does not.
* **A different set of spilled values means a different counter layout.** When
  the graph gets stuck, MWCC removes the node with the lowest *static reference
  count / current degree*, so which values spill (not only which registers
  they get) depends on how long each live range is. `DepthOfField` spilled two
  loop locals where retail spilled the `alpha` argument. The fix was giving one
  run-once loop its own counter rather than the shared `i`. Separating or
  merging loop counters is a lever to try before looking for missing references.
* Every vreg-to-vreg copy is folded, so a surviving `move` came from a call
  argument or a return value, not an assignment.
* A pointer local live across a call goes callee-saved.
* **A node at exactly K when simplify reaches it** colours a pass late instead
  of in reverse number order, which pushes it *down* the registers (`&row_step[1]`
  at `$v1` where retail has `$t2`, and every temporary around it shifted).
  Its degree can only be cut by a neighbour numbered *below* it and removed
  first. Optimizer temporaries number below every declared local, so the lever
  is a second occurrence of an operand the header already scales -- a **dead
  assignment** does it without emitting anything: `below = h + columns;` beside
  `above = h - columns;` makes `columns * 4` a CSE temp, the store is deleted,
  and the temp's removal takes the address node under K (`CWater::CreateVUData`).
* **A counter reused as a later loop's countdown** is one node whose colour
  comes from the loop with more pressure: `j` at `$t9` in a first loop that
  holds only `$v0`..`$t3` means the same variable is the second loop's
  remaining count (`for (j = 0; ...)` then `j = columns; while (j > 0) j -= 27`).
* A caller-saved local that retail colours **ahead of** the loop temporaries
  around it (`$v0` where ours is `$v1`) is on the hard list: its degree was at
  least K=26 when simplify reached it. A declared local numbers below every
  codegen temporary, so this is the only way to get there. Raise the degree
  without changing code: reuse the one local for other short live ranges
  (`parent = p->parent;` in an earlier loop), and name a CSE-temp operand in a
  local declared *above* it, so that operand is still in the graph when simplify
  reaches it (`AnimeDataInit`).
  Another lever: split a local that two sibling blocks share into a
  block-scoped copy in each (`int j = 0;` in both `if` arms). Each copy is a
  separate node, so a value live across both blocks gains a neighbour, and the
  declared copies number above it, so simplify has not removed them when it
  reaches that value (`PresetSmallItemNo_Get`: the CSE'd `n*sizeof` offset).
* **A value kept in a caller-saved register across a `jal` proves the callee is
  `static`, defined *above* the caller, and calls nothing external.** MWCC does
  inter-procedural analysis only over statics it has already compiled; a
  forward declaration buys nothing. Get it wrong and the caller saves a
  callee-saved register retail does not, which costs two instructions and 16
  bytes of frame -- and a wrong-length function shifts everything after it.
  A declaration of the callee left in a header defeats it: MWCC rejects the
  definition with "inconsistent linkage".

---

## 3. Evaluation and operand order

* A **no-op cast** raises an operand's evaluation rank without moving it, fixing
  load order *and* `addu` operand order where swapping the source operands fixes
  only one.
* For an **equality**, swapping the operands works where a cast on either side
  does nothing.
* A cast on a **call argument** makes it evaluate first. So does naming it in a
  local — which also fixes which `$f` register a constant argument's `mtc1`
  writes.
* Two loads among a call's arguments means the later one was a local.
* Naming **both** halves of a sum fixes an order neither half alone will.
* A constant comma expression such as `(0, 5.5f)` emits the same code as the literal but allocates
  another front-end node. It can advance the leaked float-constant state from §1.2 and thereby
  correct the materialisation order of this and later constant arguments without adding code.
* `p->field = CONST` evaluates the constant first. Naming the base in a local
  evaluates the address first. It does not work when the store also has an
  index.
* A statement emitted before a block's locals belongs above their declarations.
* **Element-pointer locals change the `addu` operand order.** With
  `q = &p[i]; r = &q[3];` the compiler emits `addu d, base, index`; writing the
  accesses out (`p[i]`, `p[i+3]`) makes it CSE the *address* and emit
  `addu d, index, base` with an `addiu` beside it. No spelling of `&p[i]`
  changes this — only the change of shape.
* `x -= 1; if (x <= 0)` reloads the location; `if ((x -= 1) <= 0)` tests the
  value in the register.
* `v = f(); if (v != -1)` stores a global and reloads it; folding the assignment
  into the condition keeps it.
* Member offsets ride in the displacement only when a pointer local holds the
  element.
* `f = f + CONST` materialises an inline (`lui`/`mtc1`) constant **first**;
  `f += CONST` loads the field first, which is what puts retail's `nop` between
  the `mtc1` and the arithmetic. Each site is worth one instruction of length.
* Reading two columns of one row -- `t[k][0]`, `t[k][1]` -- off an **index**
  local gives one address and two displacements. Writing the index out twice
  recomputes it; a *pointer* local to the row is worse still, materialising the
  row address instead of folding it.
* A `lui`/`addiu`/`addu` per field means a 2-D array, not a struct pointer.
* Index arithmetic *before* the scale -- `sll 1`, `addiu 1`, `sll 4`, `addu` --
  means a **flat** array indexed `i * 2 + 1`. The 2-D spelling `a[i][1]` folds
  the same address to one `sll` and a constant displacement, which is two
  instructions shorter, so this one shows up as a length mismatch.
* Computing a global's address before using it means the source dereferenced a
  cast.
* A **no-op cast on an array's base** -- `((T *) a)[i].f` -- flips the `addu`
  that forms the element address to `base, index` and, because that is a
  different expression from the written-out `a[i].f`, stops the two being
  CSE'd. It is what separates the element address a function keeps in a
  callee-saved register from the one it recomputes.
* `a && b` **assigned to an `int`** normalises the result with `andi 0xff`,
  and the short-circuit branch lands on that instruction; the same condition
  split across two `if`s does not.
* `p->f != 0` returns `sltu`; `p->f != 0 ? 1 : 0` returns `addiu 1` and `movz`.
* A **shared local for two calls' return values** keeps the copy MWCC folds
  when each call has its own: one `BG_READ_INFO *read` reused for both
  `GetReadBGFile` calls reproduces retail's `move`, two locals do not.
* `f(a, b)` where `b` is a call's result evaluates `a` first; naming the result
  in a local first makes retail's order, and a cast on it does not.

---

## 4. Comparisons

| source | code |
| --- | --- |
| `x >= N` | `slti` into a general register |
| `x > N-1` | `slti` into `$at` |
| `a >= b` | `slt; xori; beqz` |
| `!(a < b)` | `slt; bnez` |
| `0 < x` | `slt` / `beqz` |
| `x > 0` | `blez` |
| `0.0f < x` vs `x > 0.0f` | different `c.lt.s` / `c.le.s` |

The `>=` / `>` rule only applies when the compare's *destination* is the sole
difference. `!(a < b)` is one instruction shorter than `a >= b`, so it changes
the function's length.

In a `switch`, the compares come out in reverse source order and the blocks in
source order. Two labels that fall through into one body are one block, and
their compares still come out in reverse source order: retail comparing 3 then
2 means the source wrote `case 3:` under `case 2:`.

---

## 5. Conversions and widths

A `dsll32 24` / `dsra32 24` pair is the front end re-proving a byte's width. It
is one PCode op, `sext rD, rS, 8`, present from the first backend stage — the
scheduler and allocator have no say. The compiler emits it when it can no longer
see that the value is narrow, and that knowledge is **per basic block**.

| source | code |
| --- | --- |
| the field, at the use | a fresh `lb`, no narrowing |
| a short-lived `s8` local | a temporary, no narrowing |
| an `s8` local live across a call | a `qmove`, then a `sext` at every later use |
| an `s8` parameter | a `sext` before the first use |
| `s8 c = (s8) someInt;` | a real narrowing |
| the field first, a local after | a `sext` at the head of the second block |

    signed char c = p->f;
    if (p->f == 1 || c == 3 || c == 5)

Both uses share one `lb`, but the conversion is only needed for the local, so it
is not hoisted into the first block. The lifetime is the lever, not the type;
the same question decides whether an address is recomputed or kept.

`lb` where a wider load is expected means the value passed through a local.

---

## 6. Control flow

* A **branch to the next instruction** needs a body that assigns a *local* the
  value it already holds. An empty body deletes the test; assigning a global to
  itself keeps the test but emits the store.
  The dead store may also be to a *different* local, and then it changes the
  register allocation: `num = 0; if (data != NULL) { num = 1; } num = Call();
  sprintf(.., num)` emits nothing for the two assignments, but `num` is
  multi-def, so the front end does not fold the call into the argument and the
  result is copied to `$a2` straight after the `jal` instead of staying in
  `$v0`. A call result that behaves like an unfolded local is this shape
  (`DebugInfomationDraw`).
* A **`b`-only join block** survives only when the then-block ends in an
  explicit `return` and the else-code is moved out from under the `if`. A plain
  `if`/`else` forwards every branch to the epilogue and deletes the join.
* A moved statement shows up as a **branch displacement**, not as an operand. A
  displacement wrong by *n* means a statement is on the wrong side of a brace,
  and two otherwise identical instruction streams can still differ.
* Equivalent integer bounds are not register-allocation equivalent. In
  particular, `count > 1` can allocate the `slti` result in `$at`, while
  `count >= 2` allocates it in `$v0`; use the comparison spelling shown by the
  retail temporary register.
* Reversing a constant comparison can likewise select `$at`: `12 < count`
  emits the assembler-temporary form where `count >= 13` may select `$v0`.
* **Lone `nop`s in front of loop labels** -- before a loop-test label, and after a
  loop branch's delay slot ahead of the exit label -- are 8-byte label alignment.
  It needs both `#pragma alignlabel on` and `#pragma optimize_for_size off`;
  either one alone does nothing. The MW C++ runtime (`__construct_new_array`)
  was built this way. `padloop` is a different pad (loops of 5 instructions or
  fewer) and does not produce it.
* **try/catch** (`#pragma exceptions on`) forces a `$s8` frame and a
  compiler-written `sw $sp, magic+0x14($s8)` at entry; the catch block follows
  the try's `b` unreachably. `#pragma exception_magic` plus
  `((MWCatchRecord *) &__exception_magic)` reaches the catch record. A loop
  that comes out twice with its own `&adjustment` slot and a `$v0` result
  flag is one `static inline` helper returning `true`/`false`, called twice.
  Locals declared above the `try` get the stack slots below the catch record.
* **Deferred generation**: a function with a try block (and its string
  constants) is generated at the next *initialised data definition*, not at its
  closing brace, using the pragma state in force there. An unused
  `static const int x = 0;` right after the function forces generation and emits
  nothing. A catch clause whose only guarded call is to a function defined with
  exceptions off is deleted, so `exceptions` must still be on at that point.

---

## 7. Locals, stack slots and initialisers

* **Stack slots follow the source text.** Nesting does not matter.
* An aggregate's `lq`/`sq` template copy is emitted **where the declaration
  stands** — not at first use, not at function entry.
* Moving one aggregate out of a run of declarations also moves its stack slot;
  move the whole run.
* Hoisting a `for`'s initialiser above the statement before it zeroes the
  counter first.
* Updating a pointer in a call argument, such as `Get(stack += 3)`, can retain
  the update in its saved register where a preceding standalone update is
  folded into the argument address.
* A local initialized from a call in its own statement can remain in the
  call-argument register across the following call. Initializing it through an
  assignment nested in that following call may introduce a second argument
  register to preserve it.
* A block-scope `static` **with an initialiser** gets a six-instruction run-once
  guard. Declared without one, it gets none.
* Local array initialisers are never deduped: two identical ones get two
  templates. A **shared** template therefore proves an inline function, whose
  copy is emitted at each call site and whose slot comes after every local of
  the caller.
* A local aggregate cached in an `$s` register means the source declared an
  array.

---

## 8. Calls and dispatch

* `jal` is a static bind; `lw`/`lw`/`jalr $25` is a virtual one. A call on an
  **object** binds statically even when the function is virtual — only a pointer
  or reference dispatches.
* A derived class declaring a function with a base's `virtual` signature is
  itself virtual, keyword or not. Qualifying the call binds it statically.
* An inverted float argument register pair can come from the member's declared
  class.
* Assigning the final shared float argument inside a call can make MWCC load
  the constant into the highest floating-point argument register and copy it
  to the earlier argument registers.
* Returning a final assignment can reserve `$v0` early enough to change the
  register used by preceding assignments, even when the return value is
  otherwise redundant.
* A relocation folded into the displacement means the source had its own extern
  there.

---

## 9. Data and layout

* A whole-object assignment whose class has a member with a non-trivial
  `operator=` is not one `memcpy` but a plan: one `lw`/`sw` per scalar, one
  counted loop per array (8-byte steps, 16 when quadword-aligned), one call per
  `operator=` member. It is a free readout of the class layout.
* A generated `operator=` is a field map; padding must come from alignment, not
  from filler members.
* A class with no fields is one byte, so its globals are reached through `$gp`.
* Every small-data datum gets a 4-byte slot, packed.
* A local array initialiser emits a `@N` template in `.data`.
* A float constant whose low half is zero is built inline with `lui`/`mtc1`;
  every other one reaches the literal pool. Bound pool constants retain the
  compiler's original local `@N` symbol at the retail address.
* Assigning such a constant to a float field stores the **integer** register
  the `lui` produced -- `sw`, not `swc1`, and `sw $0` for `0.0f`. A comparison
  against the same constant materialises it once and the store reuses it.
* Static alias families take a `__N` suffix.
* Stray `nop`s that pad loop-body labels to 8 bytes (plus short loops padded to
  six instructions) are the runtime library's "speed" settings:
  `optimization_level 4` (3 works too), `optimize_for_size off`, `padloop on`
  and `alignlabel on`. Every one of the four is needed. Our -O2 build treats
  code as optimised for size, and in that mode `alignlabel` does nothing.
  `alignlabel` aligns a label that begins a block whose loop weight is at
  least 8. (mathutil `__throw_catch_compare`)
