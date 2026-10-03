# gfx

The port's Vulkan 1.4 renderer. `gfx.hpp` is the whole public API (namespace `gfx`); everything
else is internal. No game header is reachable from here: `platform/`, `gfx/` and `audio/` build as
`dc_host`, without `port.h` or the game's include paths. Replacement units include
`"gfx/gfx.hpp"`.

## Lifecycle

- `RendererInit(window, config)` creates the device, the swapchain, the main targets and every
  pipeline (below). `config.pipeline_cache` defaults to `save/pipeline_cache.bin`;
  `config.progress(done, total)` is called on the calling thread while pipelines compile;
  `config.present_mode` is FIFO unless Mailbox is asked for and supported.
- `BeginFrame()` / `EndFrame()` bracket a frame. Two frames are in flight. `BeginFrame` returns
  false when there is nothing to draw to (minimised); draws are then dropped and `EndFrame` does
  nothing. Every frame starts on the main target. `EndFrame` presents.
- `RendererResize()` after the window's pixel size changes (`WindowPollEvents` does it); the
  swapchain and main target follow at the next `BeginFrame`. Main-target contents are lost.
- Single-threaded: call everything from one thread.
- Textures, palettes, meshes and render targets can be created, updated and destroyed at any time,
  inside or outside a frame. Destruction is deferred until the GPU is done with them; a handle is
  dead as soon as it is destroyed (handles carry a generation).

## Spaces

- **Logical space** is the game's 640x480, y down. `Draw2D` vertices, `DrawState::scissor_rect`,
  `Clear` rects, `ReadDepth` rects and copy rects on `kMainTarget`/`kPreviousFrame` are in it.
- On the **main target** (window pixel size) logical space is scaled by
  `min(W / 640, H / 480)` and centred with whole-pixel offsets (letterbox or pillarbox).
  Coordinates outside 0..640 x 0..480 reach into the bars; nothing clips to the 4:3 area unless a
  scissor says so. `GetLogicalMapping(target)` returns `pixel = logical * scale + offset`.
- A **render target** is `logical_width x logical_height` scaled by the render scale (pixels per
  logical texel; `config.render_scale`, 0 = `round(window height / 480)`, at least 1), offset 0.
  `SetRenderScale` recreates every render target, blitting its contents over.
- A render target created with **`share_main_depth`** (`CreateRenderTarget`, `NamedRenderTarget`)
  has no depth buffer of its own: drawing into it tests and writes the main target's depth and
  stencil as drawn so far this frame, which is how the GS draws into another FRAME_1 with the same
  ZBUF (shadow volumes counted into `shadow_buf` against the scene). Its pixels must line up with
  the main target's, so it is the main target's pixel size and mapped like it (640x480 logical,
  letterboxed) whatever size is asked for, ignores the render scale, and is recreated with the
  main target on resize (contents lost). `Clear` of depth or `ClearStencil` while it is the target
  clears the main target's.
- **Texture coordinates** in `Draw2D` are logical texels of the texture (its `TextureDesc` size,
  or its logical size for render targets, 640x480 for `kPreviousFrame`). In `Vertex3D` they are
  normalised.
- **Meshes** draw over the whole target (not letterboxed). `MeshConstants::mvp` (column-major)
  maps to Vulkan clip space: x right, y down, z/w in [0, 1] with **near at 1** (reverse-Z).
  Front faces are counter-clockwise as seen on the target with y down.
- **Depth** is D32 float with an 8-bit stencil (`D32_SFLOAT_S8_UINT`; `D24_UNORM_S8_UINT` where
  the device cannot attach the former), reverse-Z: cleared to 0 (far), tests are GEQUAL/GREATER,
  so the game's ZTST values map one to one. A `Vertex2D::z` is the same depth (1 near), so 3D sprites can test
  against meshes when the projection agrees. `ReadDepth` returns these units.

## Colour and alpha units

| Quantity | Units |
|---|---|
| Colour in textures, palettes, targets, `Clear` | bytes as the GS stores them |
| Alpha in textures, palettes, targets | **0xFF is GS 0x80** (saturating). Upload GS alpha through `ConvertPs2Alpha`. |
| Vertex colour and alpha (`Vertex2D`, `Vertex3D`) | GS bytes |
| `Clear` alpha | GS byte (0x80 opaque) |
| `MeshConstants` colours | modulation, 1.0 = GS 0x80 |
| `DrawState::alpha_ref`, `texa_ta0`, `GsBlend::fix` | GS bytes |

- Untextured, the vertex colour is written as is (0x80 is mid grey). Textured, MODULATE:
  `Cv = Ct * Cf / 0x80`, `Av = At * Af / 0x80`, so 0x80 is 1.0 and 0xFF nearly doubles.
- Mesh lighting: `colour = ambient * ambient_material + sum(max(0, n . -light_direction[i]) *
  light_color[i]) * diffuse`, alpha `diffuse.w`, times the vertex colour / 0x80 with
  `kMeshVertexColor`, saturated at 0xFF as VU1 saturates. Without `kMeshLit` it is `diffuse`
  (times the vertex colour). `kMeshShadow` is flat `diffuse`. `specular` is carried, unused.
- **TEXA**: a texture with `has_alpha = false` (24-bit TIM2, a 24-bit render target) gets
  `alpha = (texa_aem && rgb == 0) ? 0 : texa_ta0` per texel, before filtering.
- **Palettes**: an `Index8` texture is looked up in its palette before filtering, so a linear
  filter blends four palette entries (base level only). Palettes are 256x1 RGBA8 textures;
  swapping one between two draws of a frame is ordered as written.
- **Fog**: `Cv = Cs * F + FOGCOL * (1 - F)`, F per vertex (`Vertex2D::fog`; for meshes
  `clamp(fog[0] + fog[1] / w, fog[2], fog[3]) / 255` with `kMeshFog`), applied when
  `DrawState::fog`.
- **Alpha test** compares `Av` in GS units (rounded) with `alpha_ref` by ATST. AFAIL is KEEP
  (the only value the game uses).
- A **target without alpha** (`has_alpha = false`) stores alpha 0x80 whatever is drawn, so its
  destination alpha reads 0x80, as the GS reads it for PSMCT24.

## Blending

GS `((A - B) * C >> 7) + D`, A/B/D in {Cs, Cd, 0}, C in {As, Ad, FIX}. The fragment shader writes
the source colour and, on the second dual-source output, C when it can compute it (As or
FIX / 0x80). Vulkan then computes `src * Fs (op) dst * Fd`. `F` below is `SRC1_ALPHA` for As and
FIX, `DST_ALPHA` for Ad; `1-F` its complement. All 81 combinations reduce to 28 Vulkan blend
states.

| A | B | D | GS result | Fs, Fd, op | shader writes | exact |
|---|---|---|---|---|---|---|
| = | = | Cs | Cs | blend off | Cs | yes |
| = | = | Cd | Cd | 0, 1, add | | yes |
| = | = | 0 | 0 | 0, 0, add | | yes |
| Cs | Cd | Cd | Cs c + Cd (1 - c) | F, 1-F, add | Cs | yes |
| Cs | Cd | 0 | (Cs - Cd) c | F, F, sub | Cs | yes |
| Cs | Cd | Cs | Cs (1 + c) - Cd c | 1, F, sub | Cs (1 + c) | no, see below |
| Cd | Cs | Cs | Cd c + Cs (1 - c) | 1-F, F, add | Cs | yes |
| Cd | Cs | 0 | (Cd - Cs) c | F, F, rev-sub | Cs | yes |
| Cd | Cs | Cd | Cd (1 + c) - Cs c | F, 1, rev-sub | Cs | no: Cd - Cs c |
| Cs | 0 | Cd | Cd + Cs c | F, 1, add | Cs | yes |
| Cs | 0 | 0 | Cs c | F, 0, add | Cs | yes |
| Cs | 0 | Cs | Cs (1 + c) | 1, 0, add | Cs (1 + c) | As/FIX yes; Ad: Cs |
| Cd | 0 | Cs | Cs + Cd c | 1, F, add | Cs | yes |
| Cd | 0 | 0 | Cd c | 0, F, add | Cs | yes |
| Cd | 0 | Cd | Cd (1 + c) | DST_COLOR, 1, add | c | As/FIX yes; Ad: Cd |
| 0 | Cs | Cd | Cd - Cs c | F, 1, rev-sub | Cs | yes |
| 0 | Cs | Cs | Cs (1 - c) | 1-F, 0, add | Cs | yes |
| 0 | Cs | 0 | 0 (saturated) | 0, 0, add | | yes |
| 0 | Cd | Cs | Cs - Cd c | 1, F, sub | Cs | yes |
| 0 | Cd | Cd | Cd (1 - c) | 0, 1-F, add | Cs | yes |
| 0 | Cd | 0 | 0 (saturated) | 0, 0, add | | yes |

Where it is not exact, and why:

- **C above 0x80.** Blend factors and shader outputs to a UNORM attachment saturate at 1.0, so
  As, Ad and FIX above 0x80 blend as 0x80. The alpha test still sees the unsaturated value. The
  game's alpha values are 0x80 or below except in rare overbright effects.
- **Cs (1 + c) - Cd c** (A=Cs, B=Cd, D=Cs). The shader scales the source and the blend subtracts;
  the scaled source saturates before the subtraction rather than after. With C = Ad the source
  cannot be scaled and the result is `Cs - Cd Ad`.
- **Cd (1 + c) - Cs c** (A=Cd, B=Cs, D=Cd). No destination factor exceeds 1; it becomes
  `Cd - Cs c`.
- **D = A, B = 0 with C = Ad.** `Cs (1 + Ad)` and `Cd (1 + Ad)` need a factor above 1 that the
  shader cannot know; they become Cs and Cd.
- The destination alpha is the stored alpha, which is the last source alpha written (the GS does
  not blend alpha either), saturated at 0x80.

## Stencil and colour writes

| `DrawState` field | Meaning |
|---|---|
| `stencil_test` | stencil test on; off, the stencil is neither tested nor written |
| `stencil_front`, `stencil_back` | per face (by winding, as culling tells them; lines are front): `compare` (Vulkan's order), `fail`, `pass`, `depth_fail` ops, `reference`, `compare_mask`, `write_mask` |
| `color_write_mask` | `ColorWriteBits`; 0 writes no colour (a stencil or depth-only pass) |

`ClearStencil(value, rect)` clears the current target's stencil (the main one for a target that
shares it). Every frame's stencil keeps what the last frame left until cleared. The GS has no
stencil; it is here for techniques the GS did with destination alpha (DATE) or colour counting.

All stencil state is core dynamic state (Vulkan 1.3's `STENCIL_TEST_ENABLE` and `STENCIL_OP`, 1.0's
masks and reference), so it adds no pipelines. The colour write mask is dynamic through
`VK_EXT_extended_dynamic_state3` (`extendedDynamicState3ColorWriteMask`) where the device has it;
otherwise a colourless pipeline per family, texture mode and alpha test (18) is precompiled, and a
partial mask writes every channel. `RendererConfig::dynamic_color_write_mask = false` forces that
path.

## Ordering

Everything happens in the order it was called. An update or copy into a texture or mesh the
frame's draws have not touched yet goes into a batch that runs before the frame's draws, keeping
the render pass whole; one into something already drawn with this frame splits the pass and runs
in place. Copies and blits inside a frame always run in place. Sampling the target being drawn
to is refused: snapshot it first (`SnapshotFrame`, `CopyTexture` from `kMainTarget`).

## Pipelines

3 families (2D triangles, 2D lines, meshes) x 28 blend states x 3 texture modes (none, RGBA,
index + palette) x alpha test on/off = 504 pipelines (522 without a dynamic colour write mask,
above), all created in `RendererInit` on up to eight threads against the pipeline cache. Depth
test, depth write, compare op, the whole stencil state, cull mode, front face, viewport, scissor
and topology within a class are dynamic state, so they add none. The cache file is checked against the device before use and written through a temporary
file and a rename.

## Readback

- `ReadDepth(id, rect)` (16 ids) reads the main depth buffer at `EndFrame`, at most 64x64 pixels
  around the rect's centre, and keeps the farthest (smallest) value: the game's pick-Z keeps the
  farthest of an 8x8 block. `EndFrame` waits for that frame when a query was made, so
  `DepthResult(id)` holds the answer as soon as `EndFrame` returns.
- `ReadbackFrame` (the last presented frame) and `ReadbackTexture` are synchronous and only
  allowed outside a frame. `WritePng` writes an RGB PNG with stored (uncompressed) deflate.

## Not done here

- DATE/DATM (destination alpha test; `clsmes.cpp` MakeFukidashi) is not emulated; a stencil pass
  marking the pixels whose alpha passes, then a test against it, is the way.
- GS mip LOD (TEX1 L and K) is ignored; filtering is standard trilinear over the supplied levels.
- `dualSrcBlend`, `shaderClipDistance`, update-after-bind sampled images (8192) and dynamic
  indexing are required of the device.
