# MWCC 2.3.3 internal-state capture

Dumps what the project's own compiler is thinking while it compiles one
function: the PCode at each backend pass boundary, and the register allocator's
priority list, colours, and interference edges.

    python3 tools/mwcc-debug/capture.py SOURCE [FUNCTION] -o OUTPUT [-- flags...]

`FUNCTION` is the name the compiler uses, which for a C++ member is the
unqualified name (`AddDrink`, not the mangled symbol). Omit it to capture every
function in the file. Without `--` flags the retail flags are used.

    python3 tools/mwcc-debug/capture.py permuting/adddrink_fuzz/base.c AddDrink -o /tmp/cap

The output directory holds, per captured function:

    NNN-<fn>-backend-NN-<stage>.txt   PCode at that pass boundary, with vregs
    NNN-<fn>-regalloc-NN-<class>-entry.txt    nodes before colouring
    NNN-<fn>-regalloc-NN-<class>-result.txt   nodes after colouring
    manifest.json                     status, compiler fingerprint, artifacts

Each `.txt` has a `.json` beside it with the same data.

## Replaying the allocator

`replay.py` reads a capture and re-runs the compiler's own colouring loop over
the captured interference graph. With no rule it only checks that the replay
reproduces the real allocation, which is the sanity check that makes any
variant result meaningful; with a rule it reports which functions would be
allocated differently, flagging any that currently match retail.

    python3 tools/mwcc-debug/replay.py <capture-dir>          # validate the replay
    python3 tools/mwcc-debug/replay.py <capture-dir> homed    # test a variant rule

The rules model candidate differences between our compiler and the build that
compiled the game; `homed` is the one that reproduces retail's
`CUserStatus::AddDrink`. See `re/ai/adddrink_register_allocation.md`.

## What it needs

- `gdb` with Python support, on PATH.
- `wibo`, on PATH or passed with `--wibo`. The development image already has
  one, so the simplest way to get it on the host is:

      podman run --rm --entrypoint cat localhost/dcdecomp_build /usr/bin/wibo > ~/.local/bin/wibo
      chmod +x ~/.local/bin/wibo

The compiler itself is the one the build uses,
`tools/compilers/mw/2.3.3/mwccmips.exe`, and the capture refuses to run against
any other image: the profile pins its SHA-256, size, and PE timestamp.

## How it fits together

The decoding is [mwccps2-debugger](https://github.com/Raikaru/mwccps2-debugger)'s,
checked out at `tools/mwccps2-debugger`. This directory supplies the two things
that toolkit cannot know about this project:

- `profiles/mwccmips-2.3.3-000921.json`, a schema-version-2 profile for our
  compiler. Its `evidence` field records how every address and layout was
  recovered from that exact image. Nothing was inherited from the toolkit's
  2.4 or b210 profiles, and the differences are real: this build packs a PCode
  operand into 14 bytes where 2.4 uses 22.
- `gdb_capture.py`, the breakpoint wiring. It imports the toolkit's profile
  model unchanged and adds only what the transport needs.

The transport is wibo, not Windows. Three things follow from that, and each is
commented where it is done:

- wibo maps `mwccmips.exe` at 0x400000 only after it loads the image, so the
  guest breakpoints are armed at wibo's import-resolution symbol rather than at
  `starti`.
- GDB has a 64-bit inferior running 32-bit guest code, so out-of-line
  breakpoint stepping decodes guest instructions with the wrong rules and
  faults. `set displaced-stepping off` is required, not cosmetic.
- The image to fingerprint is a guest file, not the process GDB started, so it
  is named explicitly.

The toolkit's own `mwccps2_debugger.py` assumes a Windows-hosted compiler and
so cannot drive this compiler directly; nothing in the submodule is patched.

## Limits

- The scheduler is not profiled. `CodeGen_Generator` only reaches the
  scheduling pass when the optimization level byte is 3 or more, and the
  project compiles at `-O2`, so no scheduler anchor was recovered and none is
  guessed.
- The frontend/IRO anchors are likewise unrecovered; the profile carries an
  empty `frontend_ir` section so no frontend breakpoint is armed.
- Everything else -- PCode at six pass boundaries, the opcode table, and the
  complete register-allocation state -- is live and validated.
