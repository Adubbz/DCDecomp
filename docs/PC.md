# PC port

`PLATFORM=PC` builds the game's code as a native x64 Linux program with clang
20, as C++26, on SDL3 and Vulkan 1.4 (`docs/MACOS.md` covers macOS on Apple
Silicon). The port is always the PAL release;
there is no region setting. `docs/PC_PORT_PLAN.md` is the plan it was built
to and records the phases; this document describes what is built.

## Building and running

```sh
cmake -S . -B build/pc -G Ninja -DPLATFORM=PC -DCMAKE_CXX_COMPILER=clang++-20
ninja -C build/pc
(cd build/pc && ctest --output-on-failure -j4)
(cd build/pc && DC_DATA=$PWD/../../data ctest -R integration_real_data)
```

The `integration_real_data_*` cases run `darkcloud` on the extracted data
and are skipped unless `DC_DATA` names it.

`cmake --preset linux-x64` (and `linux-x64-release`, in `build/pc-release`)
with `cmake --build --preset` and `ctest --preset` of the same name does the
same.

It needs clang 20 with lld and the LLVM binary tools (`llvm-objcopy`,
`llvm-nm`, `llvm-objdump`, `llvm-readobj`, `llvm-lipo`), Python 3, CMake 3.28, Ninja,
`glslangValidator`, SDL3 (3.2) and the Vulkan 1.4 headers and loader, and at
run time a device with Vulkan 1.3 or later, `dualSrcBlend` and `shaderClipDistance`
(any desktop driver; Mesa's lavapipe in CI; `src/port/gfx/README.md`, "Device", has the whole list). `.github/workflows/pc.yml` is a
complete recipe on Ubuntu 24.04.

The game's files come from the disc (see "Game data"):

```sh
build/pc/dcdata extract "rom/Dark Cloud (PAL).iso" data
build/pc/darkcloud --data data --save save
```

`darkcloud` takes:

| Option | Meaning |
|---|---|
| `--data DIR` | the extracted data (default: `DC_DATA`, then `./data`, then `data/` beside the executable) |
| `--save DIR` | memory cards, `config.ini`, the pipeline cache and host files (default: `DC_SAVE`, then `./save`, then `save/` beside the executable); created on first use |
| `--headless` | SDL's offscreen video driver with `VK_EXT_headless_surface`, SDL's dummy audio driver, and the game clock unbounded (one tick per pump, no sleeping) |
| `--offscreen` | `--headless` without a Vulkan surface: frames are drawn to an image only (what `--headless` does by itself when the loader has no `VK_EXT_headless_surface`) |
| `--high-arenas` | map the arenas above 4 GiB, as macOS must (also `DC_HIGH_ARENAS=1`); shows the game's pointer round trips through `int` on Linux |
| `--frames N` | stop after N frames of the game's main loop |
| `--screenshot PATH` | after the run, write the last presented frame to PATH as a PNG |
| `--input FILE` | drive the pads from a script (default: `DC_INPUT`; see "Scripted input") |
| `--width W`, `--height H` | window size in pixels, over `config.ini` |
| `--display-per-tick N` | headless test aid: render N interpolated display frames per tick (offscreen, not presented) before presenting the tick's canonical image |

Environment: `DC_DATA` and `DC_SAVE` (above), `DC_INPUT` (above), `DC_AUDIO=off` (no audio
device), `DC_VULKAN_VALIDATION` (enable the Khronos validation layer in a
release build; a debug build always asks for it), `DC_PRESENT_STATS=1` (print
draws per tick and render times at exit), and SDL's own variables.

Exit statuses (`src/port/exitcodes.hpp`): 0 when the window was closed or
`--frames` ran out, 1 when the window, the renderer or the screenshot failed,
2 for bad arguments, 3 when the data directory is missing or holds no file
(one line names it and the `dcdata` command; checked before any window
opens), 4 for a failed game assertion (retail's `__assert`, after the game's
own message: `LoadFile` prints `File open error "<path>"`). A `PS2_UNIMPLEMENTED`
stub aborts (SIGABRT) so a debugger or a core dump stops at it.

`<save>/config.ini` (`src/port/platform/config.cpp`; unknown keys and bad
values are reported and ignored):

```ini
[game]
tick_rate = 50          ; logic ticks (the game's VSyncs) per second
[video]
present_mode = fifo     ; fifo, mailbox or immediate (each falls back to the next safer one)
vsync = true            ; shorthand: true is fifo, false immediate
interpolation = on      ; off: present each tick's image once, as rendered
max_fps = 0             ; display frames per second at most; 0: as the present mode allows
width = 1280
height = 960
fullscreen = false
[audio]
master_volume = 1.0     ; 0 to 1
[input]
cross = Z, Space        ; an action = SDL key names; replaces that action's keys
```

The keyboard drives pad 1 next to the first gamepad: arrows (D-pad),
Z cross, X circle, C square, V triangle, Q/E L1/R1, 1/3 L2/R2, F/H L3/R3,
Return start, Backspace select, WASD the left stick and IJKL the right. The
actions are `up down left right cross circle square triangle l1 r1 l2 r2 l3
r3 start select lx- lx+ ly- ly+ rx- rx+ ry- ry+`. A second gamepad is pad 2.

### Scripted input

`--input FILE` (`src/port/platform/input_script.cpp`) replaces the pads with
a script, through `InputSetOverride`. Each line is

```
<frame> [pad1|pad2] [button ...] [lx ly rx ry]
```

and holds the named buttons (`cross circle square triangle start select l1
r1 l2 r2 l3 r3 up down left right`, any case) and the four stick bytes
(0-255, centred at 128 when left out) on that pad, pad 1 unless the line
says `pad2`, from that frame until the pad's next line. A line with no
button releases everything. Frames count the game's main loop as
`--frames` does; frame 0 also covers the 60-tick warm-up and the loading
screens before the first frame. `#` starts a comment; a pad's frames must
not decrease. Pad 1 is held released until its first line; pad 2 keeps its
device unless a line names it. A bad script stops `darkcloud` with status 2
before the window opens. `GamePad.Down` fires on a press edge, so a press
needs a later line that releases it:

```
# language select (English), memory check, attract movie, title logo, menu
0
70 cross
75
90 cross
95
200 start
205
480 start
485
520 start
525
```

reaches the title menu at frame 560.

### Developer menu

PAL retail's `main` sets `DebugMode` when pad 2 holds L1+R1+L2+R2 through
the warm-up; the game then starts in `GAME_MODE_MENU`, the developer menu
(`MenuLoop`, `src/ps2/main.cpp`), instead of the language select, and leaves
pad 2 unlocked. Up and down (pad 1) pick a row, left and right change its
number, circle or triangle enters it:

| Row | Goes to |
|---|---|
| game start | the attract movie (`MapNo` 801), then the title |
| `e0N` | the town `N` (1-5; `main_select_menu_no` N-1, `GAME_MODE_EDIT`) |
| `sN` | the sub map `N` (map number N+10, `GAME_MODE_EDIT`); R1/L1 step by ten |
| interior | map 99, `GAME_MODE_EDIT` |
| dungeon | the dungeon loader (`LoaderLoop`): up and down pick one of the seven dungeons, circle, cross or start enters floor 1 |
| opening | the opening (`GAME_MODE_OPENING`, scenes op_a to op_d) |
| `eventN` | one of three story events (map 23 event 310, map 41 event 150, map 19 event 305) |
| `memory card N` | the save screen in mode N |
| `Language N` | sets `LanguageCode` (PAL default 2, British English) |

```
0 pad2 l1 r1 l2 r2
1 pad2
10 down
12
20 circle
22
```

enters town 1 (Norune).

## Start-up and the main loop

`src/port/main.cpp` is the executable's `main`. In order: `PathsConsumeArgs`
takes `--data`/`--save` out of argv; the other options are parsed; the data
directory is checked; `ConfigLoad` reads `config.ini`; `WindowInit` opens the
window (size and fullscreen from the config, offscreen when headless);
`InputInit`; `gfx::RendererInit` with the config's present mode, the pipeline
cache at `<save>/pipeline_cache.bin` and a progress callback that prints
`compiling shaders n/total` at quarters; `AudioOutputStart` pulls
`audio::DefaultMixer()` at its rate with the config's master gain; the clock
gets the config's tick rate (unbounded when headless); a pump hook is
installed that pumps window events (a close request stops the game) and
samples input; then `RunGame`. After it returns: the screenshot, then
`AudioOutputStop`, `InputShutdown`, `RendererShutdown`, `WindowShutdown`.
`main.cpp` also forwards the names MWCC gives the calls in retail `main`
(below).

`RunGame` (`src/port/gameloop.cpp`) is retail `main` (`src/ps2/main.cpp`)
with the hardware taken out, line for line otherwise:

- `init_all` is reduced to `InitCDFile`, `MGInit`, `InitMemoryFile`,
  `BufferAllClear`, `InitReadBG`: no IOP reboot or module loads, no
  `sceCdInit`/`sceCdMmode`/`sceFsReset`, no `DevInit` DMA reset or channel
  handles. `mwInit` is not called; the host has run the static constructors.
- Every `sceGsSyncV` wait is `ClockSyncV()`; Timer 0, the DMA channel kick,
  `sceGsSyncPath` and the `FlushCache` calls go.
- The two uploads of `My_dma_start0` (the GS environment chain) and
  `Vu_progmain` (VU1 microcode) around a mode's `Init` become `LoadDrawEnv`,
  which sets the one register of `My_DrawEnv` the renderer still reads,
  TEXA (TA0 0x80, AEM 1, TA1 0x80).
- Per frame, `SetEnv` (replaced in `gameloop.cpp`) resets TEST, ZBUF and
  ALPHA to mglib's shadows as retail's A+D packet did, and the window
  rectangle to the full frame, which `sceGsSwapDBuff`'s draw environment did;
  TEX1 is read where a texture is bound and CLAMP is the sampler's.
  `sceVif1PkCall(Vu_prog0f)` goes.
- `save_data` and `config_data` are static in retail's unit, so `RunGame` has
  its own and reaches the rest through `SaveData`, as retail does.
- Mode 12's loop reads a register nothing set; the port's zero keeps it
  running.
- The transitions are `GameApplyLoopResult` (what each mode's loop result
  does) and `GameFollowMapJump` (`NextMapNo` into the next mode), exported for
  the tests.
- Each pass of the loop is one logic tick, recorded and rendered as described
  in "Ticks and display frames" below.
- `--frames` counts frames of this loop (one per `MGEndFrame` it calls);
  `RunGame` returns `kExitOk` at the top of the next frame once the budget
  is spent or a stop was requested, outside any frame, so the last frame can
  be read back. Presents a mode makes itself (`EditLoop`'s fades) and the
  loading screen's are not counted.

### Ticks and display frames

The game logic runs at the fixed tick rate; the window is presented at its own
rate, with motion interpolated between ticks (`src/port/gfx/README.md`,
"Display lists"):

1. `MGBeginFrame` starts recording the tick's display list: what the game draws,
   copies and uploads is appended to the list rather than executed.
2. `MGEndFrame` seals it and `GameRenderTick` (`gameloop.cpp`) renders it once,
   in full, as the tick's canonical image. That image is what the next tick's
   `MGGetFBuffBackTex` / `kPreviousFrame` samples and what frame copies and
   `mgPickZBuff` read, and every copy, blit, texture or palette update in the
   list (frame grabs into `frame_image` and `water`, texture animation,
   `MGMoveImage`, `MGStretchMoveImage`) runs there, once per tick. The
   previous-frame effects (the title's trail, water, depth of field) are
   therefore tick-exact whatever the display rate.
3. `MGEndFrame` then waits for the next tick as before (`mgWaitVSync`, the
   count, the callbacks and every spin on the clock are unchanged), and while
   it waits `GamePresentBetweenTicks` renders display frames from the last two
   lists at alpha = the elapsed fraction of the tick and presents them, as fast
   as `present_mode` and `max_fps` allow. A display frame replays the newest
   list's drawing only, into its own image, with each `CFrame`'s model matrix
   (`frame_draw.cpp` tags its draws with the frame's address; a visual drawn
   outside one with its record) and the camera interpolated between the two
   ticks. A tick that did not wait, or presented nothing, presents its
   canonical image.

What a display frame does not interpolate: 2D (the HUD is tick-exact), 3D
sprites (2D quads with depth), skinned poses, objects that moved more than
`kDraw3DTeleportDistance` (200 units) in a tick, a camera that moved more than
200 units or turned more than 45 degrees, and the first tick of every mode
(`RunGame` cuts there). `interpolation = off` presents each canonical image once,
which is the PS2's picture at the tick rate. Headless runs (unbounded clock)
present one canonical image per tick, so screenshots are those images.

The loading screen still presents from the idle hook as immediate frames; once
it has, display frames stop until the next tick's canonical render.

Overlays are not re-initialised: `TITLE.BIN` and `DUN.BIN` are linked in
once, where retail reloaded the overlay's data, zeroed its `.bss` and re-ran
its static constructors on every switch between the title and the dungeon.
`LoadOverlay` only rebuilds the title objects the port defines with host
classes ("The title overlay's own class declarations"). A mode that relies
on fresh overlay globals is a known gap (below).

Each mode's loop result is applied by the mode that ran the loop
(`GameApplyLoopResult(old_main_mode, result)`), as retail handles it inside
that mode's `case`: the developer menu sets `mode` itself and returns 1.

## Platform

`src/port/platform`, `src/port/gfx` and `src/port/audio` are the host side.
They build as `dc_host` without `port.h` or the game's include paths, so no
game header or SDK type reaches them. Game types meet them only in the
replacement units.

- **Window** (`platform/window`): SDL3 window, resizable, high pixel density,
  optionally fullscreen; `WindowPollEvents` pumps events, reports a close,
  and forwards pixel-size changes to the renderer. `WindowAddEventHook` lets
  input see every event.
- **Input** (`platform/input`, `sce/libpad.cpp`): two DualShock 2-shaped
  pads from SDL gamepads and the keyboard, with rumble. libpad's nine
  functions read them: buttons active-low in bytes 2-3, sticks in 4-7,
  `scePadGetState` stable, `scePadInfoMode` DualShock. `InputSetOverride`
  replaces a pad for tests.
- **Clock** (`platform/clock`): the stand-in for the VSync interrupt. One
  tick is one VSync, the count is the number of tick periods since the
  anchor, and the game's tick callback (`PlayTimeCount` or the loading
  screen) runs inside `ClockPump`, once per elapsed tick. Every retail spin
  on the interrupt pumps (`sceGsSyncV`, `WaitVSync`, `check_now_loading`,
  `wait_now_loading_vsync`, `ReadBGSync`, `MGEndFrame`). After the ticks a
  pump runs the pump hooks (the host's, added with `ClockAddPumpHook`: the
  window and input) and then the single idle hook (the game side's,
  `ClockSetIdleHook`: the loading screen's presenter), so spin-waits keep the
  window alive and the pads fresh whatever the loading screen does.
  `sceGsSyncV` returns the parity of the tick, as the interlaced field
  alternated: `CGamePad::Init` and `main` spin until it reads 1. The tick
  rate is a setting (50 Hz by default); presentation is not tied to it (below).
  `ClockWaitNextTick(hook)` runs a hook over and over while it waits, with the
  elapsed fraction of the tick; `MGEndFrame` presents display frames through it.
- **Config** (`platform/config`) and **paths** (`platform/paths`): above.
- **Audio output** (`platform/audio`): an SDL3 float stereo stream that pulls
  frames from a render callback on SDL's audio thread; `DC_AUDIO=off` or no
  device leaves the game silent.

## Rendering

`src/port/gfx` is a Vulkan 1.3+ renderer: one graphics queue that presents,
two frames in flight, dynamic rendering, synchronization2, a bindless texture
array, every pipeline created at start-up against the on-disk pipeline
cache, reverse-Z D32 depth with stencil, an immediate 2D API in the game's 640x480 logical
space (letterboxed on the window) and a mesh API in 3D, named render targets,
copies, blits, depth readback and screenshots. `src/port/gfx/README.md` is its
contract: spaces, colour and alpha units, how the GS blend equation maps to
Vulkan blending and where it does not.

The game's drawing reaches it through replacement units, in four groups that
share small internal headers:

- **`mglib_port.hpp`** (`mglib.cpp`, `mglib_port.cpp`, `mglib_math.cpp`):
  every `MG*` function. The GS register shadows the game sets
  (`MGSetGsTEST/ZBUF/ALPHA/TEXA`, `MGSetWindowRect`, and the clears, fills
  and stretches that leave them set) become the current `gfx::DrawState`
  (`MGPortDrawState`); GS 12.4 coordinates and 24-bit Z convert into logical
  space and reverse-Z (`MGPortLogicalX/Y`, `MGPortDepth`); TBP0 0 and 0xFFF
  stand for the frame and the previous frame. The VSync group (`MGInit`,
  `MGInitVSyncCallBack`, `MGGetVSyncCount`, `MGBeginFrame`, `MGEndFrame`,
  `MGFlipWaitVSync`) sits on the clock; `MGBeginFrame` starts recording a
  tick, `MGEndFrame` renders it, presents between ticks and keeps retail's
  "do not wait twice" rule. Pick-Z reads the canonical render's depth buffer.
  `MGSetRenderInfo` keeps retail's matrices; the field squeeze is undone
  where the game's rects reach the renderer.
- **`texture_port.hpp`** (`texture.cpp`, `texture_port.cpp`,
  `textureanime.cpp`, `nowload.cpp`): TIM2 (IDTEX4, IDTEX8, RGB16/24/32,
  mip levels, the IM2 swizzle undone) decoded into renderer textures with
  index textures and 256-entry palettes; a registry keyed by unique TBP0/CBP
  values so any TEX0 the game hands around resolves to one image;
  placeholder names (`#name#w#h#bpp`) become named render targets; texture
  animation and CLUT swaps are copies. The loading screen draws from the
  idle hook, never inside a frame the game has open.
- **`draw2d_port.hpp`** (`snd.cpp`, `gameutil_sprite.cpp`, `clsmes.cpp`,
  `spritetable.cpp`, `dispctrl.cpp`, `editloop_sprite.cpp`): the sprite
  primitives, `SetClut`, message windows, sprite tables and the debug font
  as glyph quads, mapped into the current target (render targets hold field
  rows).
- **`draw3d.hpp`** (`frame_draw.cpp`, `visualvu1.cpp`, `visualshadow.cpp`,
  `cloth_draw.cpp`, `water_draw.cpp`, the `*_math.cpp` units): MDT data built
  into meshes keyed by the game's vu_data block (the record dies with the
  block), `DrawVu1` submitting meshes with the constants the VU1 header
  carried (matrices, four lights, ambient, material, fog), shadow volumes
  extruded to the shadow plane and counted into `shadow_buf` against the
  scene's depth, then composited, cloth rebuilt per draw, water sampling the
  last frame copy. The assembly functions (`MulMatrix`, `MotionProc2`,
  `CCloth::Step`, the shadow CLIP builder and the rest) are C++ with the
  lanes retail writes.
- The long tail on top of those: `dun/gameloop.cpp` (`DunMainDraw`,
  `LoaderLoop`), `effectmacro.cpp`, `runeffect.cpp`, `fireomni.cpp`,
  `fishing.cpp`, `shot_freefuncs.cpp`, `battlemenu.cpp`, `clothread.cpp`,
  `langset.cpp`, and `editloop_init.cpp` (`EditInit`, its town objects
  carved out of `EtcDataBuffer` at host sizes where retail's quadword counts
  are the PS2's).

## Audio

All music and effects are sequenced. `src/port/audio` decodes VAG ADPCM,
parses HD banks and SQ sequences, and runs a sixteen-port MIDI player into a
48-voice synth with envelopes and an approximated reverb (`audio::Mixer`).
`src/port/sound.cpp` replaces `CSound` (bank and sequence transfers, play,
stop, fades, volumes, effect messages) on that mixer, and
`gameutil_midi.cpp` answers the EZMIDI RPC commands for anything that still
sends them. `main` starts the output; `CSound::Init` starts it too if it is
not running.

## Saves and host files

`sce/libmc.cpp` implements libmc on `<save>/mc0/` and `<save>/mc1/`, a
directory per card, with the game's own directory and file names. Every
command finishes inside the call that issues it, and the next `sceMcSync`
reports the function number and result the game checks. The save itself is
retail's 0x136A7-byte image. `sce/sifdev.cpp` implements `sceOpen`,
`sceRead`, `sceWrite`, `sceLseek` and `sceClose` on `<save>/host0/` with the
device prefix stripped (the debug dump `edit.cpp` writes to `host0:`), and
`WriteFile` writes there too.

## Arenas

`CDataAlloc2<1>::Alloc/Alloc64/Align64` and the carving in
`InitializeDataBuffer`, `BufferAllClear`, `SetDataBuffer` and
`SetPacketReadBuffer` (`dataset.cpp`, `dataalloc2_1.cpp`) give each arena its
own block below 2 GiB on Linux (the game casts arena pointers to `int`;
`src/port/platform/memory.hpp`, and `docs/port/truncations.md` for macOS, where nothing can be
mapped there) sized at four
times the quadwords retail asked for (`kArenaHeadroom`, `src/port/arena.hpp`),
because the game sizes allocations with the host's larger `sizeof`s. A guard
page follows each block, and an overflow aborts naming the arena instead of
retail's endless loop.

## What is still a stub

`src/port/stubs/sce/` holds the only stubs left: libdma, libgraph (all but
`sceGsSyncV`, which is `src/port/sce/libgraph.cpp`) and libpkt. Each calls
`PS2_UNIMPLEMENTED()` (`include/port/port.h`), which prints the function,
file and line and aborts. They stay stubs by design: the port does not
emulate DMA chains, VIF/GIF packets or the GS, so a call that reaches one
is a drawing path no replacement unit covers yet.

Everything else from the SDK is implemented in `src/port/sce/`: libvu0 in
C++ (static constructors call it before `main`), libpad, libmc, sifdev,
eekernel (`FlushCache` and friends do nothing, `Exit` exits), libcdvd's
`sceCdInit`/`sceCdMmode` and sifrpc's IOP boot and module loads (no-ops).
The Metrowerks runtime calls are in `src/port/runtime.cpp`: `mwInit` and
`LoadOverlay` do nothing, `mwLoadOverlay` succeeds, `__assert` prints and
exits with status 4, `exit__2` exits.

None of the 39 stubbed functions is linked into `darkcloud`, and neither is
`Ps2Unimplemented` itself: `--gc-sections` keeps only what `main` reaches,
and no function it reaches calls a stub. `darkcloud_tests` still links some
through the units the tests call directly. To check after a change,
disassemble `build/pc/darkcloud` (`llvm-objdump -d`), collect the functions
with a `call` to a stub's address and map them to their source with
`llvm-addr2line`; static helpers inlined into a caller show under that
caller.

At the last count the final link held 249 `src/ps2` definitions displaced
by a strong one in `src/port` and 3,912 that survive as the game's own
(`nm` of `dc_ps2.o`'s weak definitions against the port's objects and the
executable's symbols).

## Known gaps

- **Rendering approximations.** DATE/DATM (destination alpha test,
  `MakeFukidashi`'s mask) is not emulated. TEX1 LOD (L, K) is ignored in
  favour of standard trilinear filtering. The GS blends that need a factor
  above 1 or a destination scaled past 1 are approximated
  (`src/port/gfx/README.md`, "Blending" and "Not done here").
- **Overlay re-initialisation.** Retail reloads `TITLE.BIN` or `DUN.BIN` and
  re-runs its constructors on every switch; the port links both once and
  runs nothing again but the title objects it lays out with host classes
  (below). Other globals a mode expects fresh keep the previous visit's
  values.
- **Arena headroom** is four times retail's request across the board, a
  stopgap rather than measured peaks.
- **Retail statics of the title units.** The title units' own static
  constructors still build their file-local `CFireOmni`, `CMapObject`,
  `CEffectGroup` and `OBJ_ANIME_SEQ` objects at PS2 sizes with the host
  constructors, which write up to 16 bytes past each. Every such object is
  dead in the port (its users are the port's copies, with their own
  statics), and what the writes reach is another dead title static or
  padding, but the bytes are written.
- **File records read with host structs.** Data the game reads straight
  from the disc into structures with pointers is laid out with 4-byte
  pointers. The town stops on the first: `LoadPTS` (`editloop.cpp`) copies
  a `.pts` record into `EPARTS_INFO_HEADER` and walks its `func` table,
  whose offsets and 0xC0-byte `EPARTS_FUNC_DATA` stride are the PS2's, so
  `EdInitEventPoint` reads a count of 1572864 functions from a wild
  pointer and faults. The dungeon stops on the second: the event script
  VM (`runscript.cpp`) reads the STB file's `funcdata` table (16-byte
  records, a 4-byte name pointer) with the host's 24-byte struct, and
  `CRunScript::exe` faults printing a function name from it.

## How far the game runs

With the PAL data extracted and no input, `darkcloud --headless --frames 120`
boots, compiles the pipelines, runs the 60-tick warm-up and the loading
screen, draws the language select (English highlighted) and exits 0 with
that frame in the screenshot. Scripted (above), it plays the attract movie,
the title screen and its menu, and START opens the opening book. Through the
developer menu, the opening's scenes play, the dungeon loader lists the
seven dungeons and floor 1 of the first starts (its name card fades in)
before the event script faults on its first frame; the town faults while
`EditInit` loads its parts (both under "Known gaps"). No stub is reached on
the way. `integration_real_data_*` (skipped unless `DC_DATA` names the
data) run the first two routes.

## The title overlay's own class declarations

The title units (`src/ps2/title/*.cpp`) declare other units' classes
themselves, with only the members they touch named and the PS2 extents
padded out, and the PS2 link binds them to the main executable's code. On
the host the main executable's code uses the real classes, with 8-byte
pointers:

| Class | Title units' size | Host size | Declared by |
|---|---|---|---|
| `OBJ_ANIME_SEQ` | 144 | 192 | op_a, op_b, op_c, opening, rushmovi, title |
| `CMap` | 2800 | 3120 | op_a, opening, rushmovi, title, titleloop |
| `CMapObject` | 240 (op_a), 256 | 272 | all but sprite |
| `CObjectFrame` | 176 | 224 | op_b, op_c, op_d, opening, rushmovi, title, titleloop |
| `CWater` | 816 | 848 | op_c, rushmovi, title, titleloop |
| `CFireOmni` | 64 | 80 | op_a, op_b, op_c, rushmovi, title, titleloop |
| `CEffectParam` | 240 | 256 | op_a, op_c |
| `CEffectGroup` | 8 | 16 | op_a, op_c |
| `CategoryAttr` (`CMapCategoryAttr`) | 24 | 24 | op_a, opening |
| `CRunEffect` | 208 | 208 | rushmovi, title, titleloop |
| `CRect<int>` (`CRect_i_`), `RECT` | 16 | 16 | all |
| `SND_INFO` (op_c's own table row, unrelated to `snd.hpp`'s) | 24 | 16 | op_c |

The port defines every shared object of a mismatched class with the real
one: op_a's `OP_GroundMap`, `OP_BuildingMap`, `OP_BuildingMap2`,
`OP_AnimeSeq[32]` and `CFire`, op_b's `OP_NornMapObj[76]` and
`OP_NornMapObj2[87]`, op_c's `Water`, rushmovi's `Water__2` and `CFire__4`.
Every function that indexes or sizes them is the port's, compiled against
the real headers: the long-tail copies of op_a, op_b, op_c, opening and
rushmovi, `src/port/title/title.cpp` (all of title.cpp's scene set-ups and
draws), `opening_mds.cpp` (`OPAnalyz`, `OPMdsLoad` and the definition
reader's state) and op_d's `OpD_InitProcess`, `OpD_InitProcess2` and
`OpD_DrawProcess`, which reach op_d's statics through names its stub header
gives them. The smoke pools are sized from the host `CEffect` (288 bytes,
where retail asked for fifty 256-byte ones). `title_layout_test.cpp` checks
the linked symbols' sizes.

The title units' static constructors still run after the port's, over the
port's objects, at the PS2 strides and through op_a's inline `CMap`
constructor. `LoadOverlay` (`src/port/runtime.cpp`) therefore does what
retail's overlay loader did when a mode needs TITLE.BIN and DUN.BIN (or
nothing) was loaded before: `TitleOverlayConstruct` zeroes those objects and
constructs them again (and initialises the maps, as op_a's constructor did).

## Layout

The root `CMakeLists.txt` only picks the platform:

- `src/ps2` is the game's code, exactly as the PS2 build compiles it, and
  nothing else. Port accommodations never live in `src/ps2` or `include/ps2`;
  the one exception is the `#ifndef PORT` around functions written in
  assembly (below).
  `src/ps2/CMakeLists.txt` (with `src/ps2/cmake/`) is the PS2 build.
- `src/port` is code only the port compiles. `src/port/CMakeLists.txt` is the
  port's build. `main.cpp` and `gameloop.cpp` start the game;
  `platform/`, `gfx/` and `audio/` are the host side; `sce/` implements the
  SDK; `stubs/sce/` holds the stubs left; `<unit>.cpp` (and `dun/`) replace
  functions of `src/ps2/<unit>.cpp`, sometimes split as `<unit>_math.cpp`,
  `<unit>_draw.cpp` or `<unit>_port.cpp`; `linknames.cpp` supplies link-time
  names (below); `tests/` is `darkcloud_tests`, one ctest case per
  `DC_TEST` (`DC_SKIP` ends a case as skipped, exit status 77).
- `tools/dcdata` is the data extraction tool.
- `include/ps2` holds the game's headers and, under `include/ps2/sce` and
  `include/ps2/std`, the SDK and standard headers MWCC compiles against. Both
  builds use them.
- `include/port` holds headers only the port uses: `port.h`, included ahead
  of every unit it compiles, and `stubs/` (below).

## How `src/port` takes precedence

`src/port/CMakeLists.txt` builds the two halves like this:

1. Every unit in `src/ps2` is compiled as it is, with `PORT` defined.
2. The objects are merged into one relocatable object, `build/pc/dc_ps2.o`,
   and `llvm-objcopy --weaken` makes every definition in it weak. Two units
   defining the same strong name fail the merge. References
   stay strong, so a missing function is still a link error.
3. The units in `src/port` are compiled and linked with it. Their definitions
   are strong, so any function or variable `src/port` defines replaces the
   `src/ps2` one. `--gc-sections` then drops the `src/ps2` body.

`src/ps2` units are compiled with `-fPIC -fsemantic-interposition`. That stops
clang from inlining or folding a call to a function `src/port` may replace, so
calls inside a `src/ps2` unit reach the replacement too. `ps2_interposition_check`
(`tools/weaken/interposition_check.py`, part of every build) disassembles
`dc_ps2.o` and fails if a call to a replaced function was bound inside it or
a definition in it is still strong. macOS does the same with other tools
(`docs/MACOS.md`).

To replace a function, define it with the same signature in `src/port`. By
convention it goes in the file that mirrors its unit: `src/port/mglib.cpp`
holds the replacements for `src/ps2/mglib.cpp`. A `static` function cannot be
replaced this way; it keeps the body `src/ps2` gives it.


## Per-unit adjustments

`include/port/stubs/<unit>.hpp`, if it exists, is included ahead of
`src/ps2/<unit>.cpp`, after `port.h`, and nothing else. Only the port's build
sees `include/port`; the PS2 build compiles nothing differently. It declares
what the port defines in place of code `PORT` leaves out, and supplies or
renames what the unit takes from MWCC or from the PS2 link alone:

- `bound`, `cloth`, `collisionmdt`, `frame`, `gameutil`, `mglib`, `visualvu1`
  and `water` get declarations of their `static` assembly functions, which
  the port defines.
- `battlemenu` and `editground` pass each temporary `CRect_i_` as an lvalue
  (`Ps2Lvalue`, `include/port/port.h`): MWCC binds a temporary to the non-const
  references of `DrawMenuColorGradation` and `CEditGround::CheckPartsRect`.
- `main` gets an overload of `LoadFileMenuData` for a `const char *`: one call
  names its file with a comma expression ending in a string literal.
- `mathutil` gets the Metrowerks runtime's own `std::exception` and
  `std::bad_exception` renamed apart from the host library's, and
  `__exception_magic`, which MWCC provides inside an exception handler.
- `menu_save` and `memcard` export statics the other calls: memcard's
  `SaveMenuFunc` table names menu_save's eighteen `SaveMenuKey*` steps and
  menu_save calls memcard's `ExitSaveSelect`. Each header defines a global
  forwarder under the external name (an asm label), which also keeps clang
  from dropping the unused static.
- `title/rushmovi` declares title.cpp's `DataLoad`, `DrawProcA`..`I` and
  `DrawProcTitle` static; its header defines those statics as forwarders to
  the global ones.
- `title/op_d` declares the state and the helpers `OpD_InitProcess`,
  `OpD_InitProcess2` and `OpD_DrawProcess` share with the rest of the unit
  `extern` under `OpD_*` names before the unit declares them `static`, and
  gives the static helpers global forwarders, so the port's copies of those
  three reach them.
- The per-object renames below.

## Names the PS2 build renames

`main.cpp` calls other units through the names MWCC gives them
(`init_all__Fv`) and calls the overlays' entry points through their retail
addresses (`func_01DAC1C0`). `src/port/main.cpp` forwards each one to the real
function.

The PS2 link binds some names through `config/pal/object_fixups.json` and the
linker script rather than through the source. The port reproduces each:

- **Per-object renames**, by `#define` in the unit's header: the opening
  scenes' four `FaceChange(int)` become op_b's `FaceChange`, op_c's
  `FaceChangeC`, op_d's `FaceChangeD` and rushmovi's `FaceChangeMovie`, the
  names their neighbours call them by; the dungeon's `MainDraw` and
  `MoveChara` become `DunMainDraw` and `DunMoveChara`, apart from editloop's
  (`src/port/dun/gameloop.cpp` replaces `DunMainDraw`); edit_in's `Chara`,
  `MainCamera`, `NowCamera`, `TalkCamera`, `NowTime`, `TexAnimeData`,
  `camera_dist_mode`, `door_open_cnt`, `fix_chara_pos`, `fix_chara_rot`,
  `goto_menu`, `goto_return_menu`, `key_counter` and `loop_counter`, which it
  redeclares `static` after a header declares them `extern` (MWCC makes them
  file-local, clang's `-fms-extensions` keeps them global), become
  `EditIn_*`.
- **Pooled literals under extern names** (`BtAtraShortCharaFile`,
  `MdsExtension`, `gamemode_empty_string`, `allmenu_mes` and six more) and
  **the title overlay's own `CRect<int>`** spelling of the rectangle in
  `MGFillBox`, `MGMoveImage`, `MGStretchMoveImage`, `MoveImageTest` and the
  `set2DSprite` overloads, plus op_c's `CWater::DrawVu1` and main's
  `MAP_NPC_MODEL::operator=`: weak definitions and forwarders in
  `src/port/linknames.cpp`.
- **Aliases**, by `--defsym` (ld64's `-alias` on macOS) in
  `src/port/CMakeLists.txt`: `ItemPutListTbl12_bytes` = `ItemPutListTbl12`,
  `draw_rect` = `draw_rect_store` and `WorkBuffer__2` = `WorkBuffer`.
  `EditGaijiTbl` is `GaijiDataTbl + 0x601C` on the PS2 link. The linker
  script places it inside `EditPartsData`, but the codes `clsmes.cpp`
  indexes it with (-0x300 and up) only ever land on the last word of a
  `GaijiDataTbl` entry, and `GaijiDataTbl` keeps its layout on the host
  where `EditPartsData`'s pointers grow. ld64 cannot alias with an offset,
  so `linknames.cpp` defines it on every platform: storage for the 0x300
  entries below it, filled from `GaijiDataTbl` before `main`, with
  `EditGaijiTbl` an assembler alias of the storage's end.

Data the title overlay's units type themselves with PS2 layouts: see "The
title overlay's own class declarations".

## Game headers

`include/port/port.h` adjusts two game headers for the host, from outside:

- `types.h` defines the PS2's `size_t` and `NULL`. `port.h` includes it with
  `size_t` renamed and `NULL` saved, so the host's stay in force, and
  `#pragma once` keeps the game from including it again.
- `common.h` defines `STATIC_ASSERT`, which checks the PS2's layouts. `port.h`
  includes it and redefines the macro to check nothing.


## Keeping the PS2 build matching

Edits to `src/ps2` or `include/ps2` that help clang must leave both PS2 builds
byte-identical. They are corrections that are standard C++ either way, never
code for the port:

- **Initialisations a `switch` jumps over.** They are split into a declaration
  and an assignment.
- **Language linkage.** `BtEnemyLayoutList` and `BtUraEnemyLayoutList` are
  declared `extern "C"` to match their definitions.
- **Exception specifications.** `__dl` is declared `throw()`, as it is
  defined.
- **`#ifndef PORT` around assembly functions**, the one exception: clang
  cannot parse them. It replaces blank lines, so no line number moves. The
  generic `CDataAlloc<Kind, Size>::Align64()` in `include/ps2/dataalloc.hpp`
  is guarded too; nothing instantiates it, since both arenas specialise it.

Retail's own mistakes stay in `src/ps2`, because the match reproduces them:
locals read before anything sets them (`SaveToMc`'s `status`, `main`'s
`idle_result` and six more), non-void functions that fall off the end,
format strings that do not fit their arguments. Initialising any of the
locals changes what MWCC emits. The port gives them defined behaviour
instead:

- `-ftrivial-auto-var-init=zero`: locals start at zero.
- `-fno-strict-return`: falling off the end returns an unspecified value
  instead of being undefined.
- `-fno-strict-aliasing` and `-fwrapv`: the type punning and wraparound the
  code assumes.

`src/ps2` is compiled with `-Wall`. The warnings left on are the porting
work: uninitialised reads, missing returns, format strings, copies over
objects with a vtable and the like. Those that only describe how MWCC-era
code is spelled -- string literals as `char *`, MWCC's pragmas, 32-bit pointer
casts, the unused names and expressions matching leaves behind -- are off.

Clang also needs a few flags to accept code MWCC accepts:

- `-fms-extensions`: pointers truncated to `int`.
- `-Wno-c++11-narrowing`: narrowing in braced initialisers.
- `-Wno-register`: the `register` keyword.
- `-Wno-return-mismatch`: a bare `return;` in a non-void function.

The executable is linked without PIE so its code and data sit below 4 GiB.
Pointers the game casts to 32-bit integers therefore survive the round trip
for globals, though not for the heap or stack.

## Checking the PS2 build

An edit to `src/ps2` or `include/ps2` made for the port is checked by building
both regions (`scripts/build/cmake.sh build`, and again with `REGION=PAL`),
which verifies every image byte for byte.

## Game data

The game reads its files from a plain directory, not from the disc.
`build/pc/dcdata` (`tools/dcdata`) makes it:

```sh
build/pc/dcdata extract "rom/Dark Cloud (PAL).iso" data
build/pc/dcdata list "rom/Dark Cloud (PAL).iso"
```

The source is a disc image, read through its ISO 9660 tree, or a directory
that holds `DATA.DAT` and `DATA.HD2` (such as `rom/pal/extracted/iso`).
`extract` writes every file `DATA.HD2` indexes to `<data>/<path>`, the path
lowercased with `/` separators and no leading separator, at its exact size,
and copies the index itself to `<data>/data.hd2`. A file already present at
its size is kept, so a rerun only repairs what is missing. When a path is
listed twice, only the first is written, as the game only ever finds the
first. `list` prints each file's sector, size and path.

The layout of `data/` is the archive's own: `dun/pack/maindat.pac`,
`commenu/a_eng/savetex.pak`, `sound/bgm/...` and so on. Lookups fold case,
as the game's `strcasecmp` does, so the case on disk does not matter.

`src/port/platform/paths.cpp` finds the data directory from `--data <dir>`,
then `DC_DATA`, then `data/` in the working directory, then `data/` beside
the executable. The save directory comes from `--save`, `DC_SAVE`, or
`save/` in the same places, and is created when first used. `main` stops
with status 3 and one line naming the directory and the `dcdata` command
when the data directory is missing or holds no file, before anything else
starts; `InitCDFile` would abort on the same conditions. `InitCDFile` warns
when `data.hd2` lists a file that is missing or the wrong size. Files the
game looks for and does not find behave as on the disc: `LoadFile2` returns
0 and `LoadFile` asserts, naming the file (status 4).
