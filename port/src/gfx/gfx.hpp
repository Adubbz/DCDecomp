#pragma once

#include <cmath>
#include <cstddef>
#include <cstdint>
#include <filesystem>
#include <functional>
#include <memory>
#include <optional>
#include <span>
#include <string_view>
#include <vector>

struct SDL_Window;

// The port's Vulkan renderer. See port/src/gfx/README.md for the conventions: logical space,
// colour and alpha units, reverse-Z and how GS blending maps onto Vulkan.
namespace gfx {

// The game's 2D space. 2D draws, scissors and main-target rectangles are given in it and mapped
// to the target, letterboxed on the main target.
inline constexpr float kLogicalWidth = 640.0f;
inline constexpr float kLogicalHeight = 480.0f;

inline constexpr uint32_t kDepthQueryCount = 16;

enum class PresentMode : uint8_t {
    Fifo,
    Mailbox,
    // Falls back to Mailbox, then Fifo, where the surface lacks it.
    Immediate,
};

struct RendererConfig {
    PresentMode           present_mode = PresentMode::Fifo;
    std::filesystem::path pipeline_cache = "save/pipeline_cache.bin";
    // Pixels per logical texel of render targets; 0 derives it from the window height at init.
    float render_scale = 0.0f;
#ifdef NDEBUG
    bool validation = false;
#else
    bool validation = true;
#endif
    std::function<void(uint32_t done, uint32_t total)> progress;
    // False forces the pipeline variants that stand in for a dynamic colour write mask where
    // VK_EXT_extended_dynamic_state3 lacks it, so that path can be exercised on any device.
    bool dynamic_color_write_mask = true;
    // No surface and no swapchain: every frame is drawn to the main target alone, at the window's
    // pixel size, and EndFrame presents nothing. The window then needs no SDL_WINDOW_VULKAN. For
    // headless runs where the Vulkan loader has no VK_EXT_headless_surface.
    bool offscreen = false;
    // False draws triangle fans as indexed lists, as on a VK_KHR_portability_subset device without
    // triangleFans, so that path can be exercised on any device.
    bool triangle_fans = true;
    // False sets one stencil reference and compare and write masks for both faces, as on a
    // portability-subset device without separateStencilMaskRef.
    bool separate_stencil_masks = true;
};

// What RendererInit settled on, from the config and the device.
struct RendererFeatures {
    uint32_t api_version;
    bool     offscreen;
    bool     triangle_fans;
    bool     separate_stencil_masks;
    bool     dynamic_color_write_mask;
    bool     portability_subset;
};

// Exits the process with a message, naming what each device lacks, if no Vulkan 1.3 or later device
// has what the renderer needs and can drive the window (any device with a graphics queue, offscreen).
void             RendererInit(SDL_Window *window, const RendererConfig &config);
RendererFeatures ActiveRendererFeatures();
// Whether the Vulkan loader offers VK_EXT_headless_surface, which SDL's offscreen driver needs for a
// Vulkan window; without it a headless run renders offscreen. Callable before RendererInit.
bool HeadlessSurfaceAvailable();
void RendererShutdown();
// The window's pixel size changed; the swapchain and main target follow at the next BeginFrame.
void RendererResize();
// False when no frame can be drawn (minimised window); draws until EndFrame are then dropped.
bool BeginFrame();
void EndFrame();
// Inside BeginFrame/EndFrame or BeginRecording/EndRecording.
bool InFrame();
// Validation-layer messages seen so far (validation and performance types, warning or worse).
uint32_t ValidationMessageCount();
uint32_t PipelineCount();
// Pipelines created during init versus found in the loaded pipeline cache are not
// distinguishable through Vulkan, so this is only the time RendererInit spent creating them.
double PipelineCompileSeconds();
float  RenderScale();
// Recreates every render target at the new scale, carrying its contents over.
void SetRenderScale(float scale);

// ---- Textures --------------------------------------------------------------------------------

using TextureHandle = uint32_t;

inline constexpr TextureHandle kNullTexture = 0;
// The frame being drawn. A render target and a copy source or destination, never sampled.
inline constexpr TextureHandle kMainTarget = 1;
// The frame before this one: the last canonical render of a display list, or the last frame
// EndFrame finished. Sampled like a texture in logical 640x480 space.
inline constexpr TextureHandle kPreviousFrame = 2;

enum class TextureFormat : uint8_t {
    Rgba8,
    Index8,
};

struct TextureDesc {
    uint32_t      width = 0;
    uint32_t      height = 0;
    TextureFormat format = TextureFormat::Rgba8;
    uint32_t      mip_levels = 1;
    // False for 24-bit sources: the draw's TEXA state supplies alpha when the texture is sampled.
    bool has_alpha = true;
};

struct TextureInfo {
    uint32_t      width;  // logical texels
    uint32_t      height; // logical texels
    uint32_t      pixel_width;
    uint32_t      pixel_height;
    TextureFormat format;
    uint32_t      mip_levels;
    bool          has_alpha;
    bool          render_target;
    bool          shares_main_depth;
};

// Returns kNullTexture, with a message, for a size the device cannot hold. Contents start zeroed.
TextureHandle CreateTexture(const TextureDesc &desc);
// A 256-entry RGBA8 palette for Index8 textures.
TextureHandle CreatePalette();
// A texture the renderer can draw into, logical_width x logical_height scaled by the render
// scale, with its own depth buffer. Starts black, alpha 0x80, depth far.
//
// With share_main_depth it has no depth buffer of its own: drawing into it tests and writes the
// main target's depth and stencil, as drawn so far this frame. It is then the main target's pixel
// size and mapped like it (640x480 logical, letterboxed), whatever size is asked for, follows the
// main target through resizes (contents lost, like the main target's) and ignores the render
// scale. A Clear of depth or stencil on it clears the main target's.
TextureHandle CreateRenderTarget(uint32_t logical_width, uint32_t logical_height, bool has_alpha,
                                 bool share_main_depth = false);
// The render target registered under name (the game's "#name#w#h#bpp" placeholders), created on
// first use and recreated if asked for at another size, alpha or depth sharing. Destroying it
// drops the name.
TextureHandle NamedRenderTarget(std::string_view name, uint32_t logical_width, uint32_t logical_height,
                                bool has_alpha, bool share_main_depth = false);
TextureHandle FindNamedRenderTarget(std::string_view name);
void          DestroyTexture(TextureHandle texture);
// Pixels are tightly packed rows of row_length texels (0: w), RGBA8 as bytes r,g,b,a, or one
// index byte. Alpha is in the renderer's units: 0xFF is GS 0x80; ConvertPs2Alpha converts.
bool UpdateTexture(TextureHandle texture, uint32_t mip, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
                   const void *pixels, uint32_t row_length = 0);
bool UpdatePalette(TextureHandle palette, const uint32_t *rgba, uint32_t first = 0, uint32_t count = 256);

std::optional<TextureInfo> GetTextureInfo(TextureHandle texture);
// GS alpha (0x80 opaque, up to 0xFF) to the renderer's (0xFF opaque), saturating.
void ConvertPs2Alpha(uint32_t *rgba, size_t count);

// ---- Meshes ----------------------------------------------------------------------------------

using MeshHandle = uint32_t;

inline constexpr MeshHandle kNullMesh = 0;

struct Vertex3D {
    float   position[3];
    float   normal[3];
    float   uv[2]; // normalised
    uint8_t color[4];
};

MeshHandle CreateMesh(std::span<const Vertex3D> vertices, std::span<const uint32_t> indices);
bool       UpdateMeshVertices(MeshHandle mesh, uint32_t first, std::span<const Vertex3D> vertices);
void       DestroyMesh(MeshHandle mesh);

// ---- Draw state ------------------------------------------------------------------------------

enum class Filter : uint8_t {
    Nearest,
    Linear,
};

enum class Wrap : uint8_t {
    Clamp,
    Repeat,
};

struct TextureBinding {
    TextureHandle texture = kNullTexture;
    TextureHandle palette = kNullTexture; // required with an Index8 texture
    Filter        filter = Filter::Linear;
    Wrap          wrap_u = Wrap::Clamp;
    Wrap          wrap_v = Wrap::Clamp;
};

// GS ALPHA: ((A - B) * C >> 7) + D. A, B, D: 0 source, 1 destination, 2 zero. C: 0 source
// alpha, 1 destination alpha, 2 fix.
struct GsBlend {
    uint8_t a = 0;
    uint8_t b = 1;
    uint8_t c = 0;
    uint8_t d = 1;
    uint8_t fix = 0x80;
};

// GS ZTST order.
enum class DepthTest : uint8_t {
    Never,
    Always,
    GEqual,
    Greater,
};

// GS ATST order.
enum class AlphaFunc : uint8_t {
    Never,
    Always,
    Less,
    LEqual,
    Equal,
    GEqual,
    Greater,
    NotEqual,
};

// Front faces are counter-clockwise on the target, y down.
enum class CullMode : uint8_t {
    None,
    Back,
    Front,
};

// Vulkan's order, for the stencil test.
enum class CompareOp : uint8_t {
    Never,
    Less,
    Equal,
    LEqual,
    Greater,
    NotEqual,
    GEqual,
    Always,
};

enum class StencilOp : uint8_t {
    Keep,
    Zero,
    Replace,
    IncrementClamp,
    DecrementClamp,
    Invert,
    IncrementWrap,
    DecrementWrap,
};

// The test passes when (reference & compare_mask) compare (stored & compare_mask).
struct StencilFace {
    CompareOp compare = CompareOp::Always;
    StencilOp fail = StencilOp::Keep;
    StencilOp pass = StencilOp::Keep;
    StencilOp depth_fail = StencilOp::Keep;
    uint8_t   reference = 0;
    uint8_t   compare_mask = 0xFF;
    uint8_t   write_mask = 0xFF;
};

enum ColorWriteBits : uint8_t {
    kWriteRed = 1u << 0,
    kWriteGreen = 1u << 1,
    kWriteBlue = 1u << 2,
    kWriteAlpha = 1u << 3,
    kWriteRgba = 0xF,
};

struct LogicalRect {
    float x;
    float y;
    float w;
    float h;
};

struct DrawState {
    bool      blend = false; // GS PRIM.ABE
    GsBlend   alpha;
    DepthTest depth_test = DepthTest::Always;
    bool      depth_write = false;
    bool      alpha_test = false;
    AlphaFunc alpha_func = AlphaFunc::Always;
    uint8_t   alpha_ref = 0;
    CullMode  cull = CullMode::None;
    bool      fog = false;
    uint8_t   fog_color[3] = {0, 0, 0};
    // GS TEXA for textures without alpha: AEM makes black texels transparent, TA0 is the rest.
    bool        texa_aem = true;
    uint8_t     texa_ta0 = 0x80;
    bool        scissor = false;
    LogicalRect scissor_rect = {0.0f, 0.0f, kLogicalWidth, kLogicalHeight};
    // Faces are told apart by winding, as for culling; lines are front faces.
    bool        stencil_test = false;
    StencilFace stencil_front;
    StencilFace stencil_back;
    // ColorWriteBits. Without VK_EXT_extended_dynamic_state3's dynamic mask only none or all of
    // them are honoured; any other non-zero mask writes every channel.
    uint8_t color_write_mask = kWriteRgba;
};

// ---- Drawing ---------------------------------------------------------------------------------

// x, y in logical space of the target, z the depth (1 near, 0 far), u, v in logical texels of
// the texture. color is the GS vertex colour: written as is untextured, a modulation with 0x80
// as 1.0 textured. fog is the GS per-vertex F (0xFF: no fog).
struct Vertex2D {
    float   x;
    float   y;
    float   z;
    float   u;
    float   v;
    uint8_t color[4];
    uint8_t fog = 0xFF;
    uint8_t pad[3] = {};
};

enum class Primitive : uint8_t {
    Triangles,
    TriangleStrip,
    TriangleFan,
    Lines,
    LineStrip,
    // Four vertices per quad, in order around it.
    Quads,
};

enum MeshFlags : uint32_t {
    kMeshLit = 1u << 0,
    kMeshVertexColor = 1u << 1,
    kMeshFog = 1u << 2,
    // Flat material diffuse, no lighting or vertex colour.
    kMeshShadow = 1u << 3,
    kMeshClip0 = 1u << 4,
    kMeshClip1 = 1u << 5,
};

// Matches the std140 block in shaders/mesh.vert. Colours are modulations with 1.0 as GS 0x80.
struct MeshConstants {
    float    mvp[16];           // column-major, object to Vulkan clip space (y down, reverse-Z)
    float    normal_matrix[12]; // three columns of xyz_, object to lighting space
    float    light_direction[4][4];
    float    light_color[4][4];
    float    ambient[4];
    float    diffuse[4]; // material; w is alpha
    float    ambient_material[4];
    float    specular[4];
    float    fog[4];           // F = clamp(fog[0] + fog[1] / w, fog[2], fog[3]), GS units 0..255
    float    clip_plane[2][4]; // object space, kept where dot(plane, (p, 1)) >= 0
    uint32_t flags = 0;
    uint32_t light_count = 0;
    uint32_t pad[2] = {};
};

// How a mesh draw's mvp was made: projection * view * middle * model * local, column-major. Recorded
// with the draw so a display frame can interpolate the model and the view (the camera) between two
// ticks and rebuild mvp; normal_matrix follows the model's rotation. Draws without one replay
// their recorded constants.
struct MeshTransform {
    float projection[16]; // eye to clip
    float view[16];       // world to eye
    float middle[16];     // world to world after the model (a planar shadow projection), else identity
    float model[16];      // object to world
    float local[16];      // fixed, applied before the model, else identity
};

MeshTransform IdentityMeshTransform();
// The inverse of an affine column-major matrix (bottom row 0 0 0 1); false when it is not one or
// is singular.
bool InvertAffineTransform(const float matrix[16], float inverse[16]);

void Draw2D(Primitive primitive, std::span<const Vertex2D> vertices, const TextureBinding &texture,
            const DrawState &state);
void DrawMesh(MeshHandle mesh, uint32_t first_index, uint32_t index_count, const MeshConstants &constants,
              const TextureBinding &texture, const DrawState &state,
              const MeshTransform *transform = nullptr);
// A triangle list that lives for this frame only (cloth, water, anything rebuilt per frame).
void DrawMeshImmediate(std::span<const Vertex3D> vertices, std::span<const uint32_t> indices,
                       const MeshConstants &constants, const TextureBinding &texture, const DrawState &state,
                       const MeshTransform *transform = nullptr);

// ---- Targets, copies, blits ------------------------------------------------------------------

// Texels of the texture's logical size; kMainTarget and kPreviousFrame are 640x480 logical.
// A negative width or height mirrors a blit.
struct Rect {
    int32_t x;
    int32_t y;
    int32_t w;
    int32_t h;
};

// How logical coordinates land on a target's pixels: pixel = logical * scale + offset.
struct LogicalMapping {
    float    scale_x;
    float    scale_y;
    float    offset_x;
    float    offset_y;
    uint32_t pixel_width;
    uint32_t pixel_height;
};

void           SetRenderTarget(TextureHandle target);
TextureHandle  CurrentRenderTarget();
LogicalMapping GetLogicalMapping(TextureHandle target);
// Clears the current target within rect (logical; null: all of it). color is GS bytes.
void Clear(bool clear_color, const uint8_t color[4], bool clear_depth, float depth,
           const LogicalRect *rect = nullptr);
// Clears the stencil of the current target's depth buffer within rect (logical; null: all of it).
void ClearStencil(uint8_t value, const LogicalRect *rect = nullptr);
bool CopyTexture(TextureHandle src, Rect src_rect, TextureHandle dst, int32_t dst_x, int32_t dst_y);
bool BlitTexture(TextureHandle src, Rect src_rect, TextureHandle dst, Rect dst_rect, Filter filter);
// The main target's logical 640x480, as drawn so far this frame, stretched over all of dst.
bool SnapshotFrame(TextureHandle dst);

// ---- Readback --------------------------------------------------------------------------------

// Queues a read of the main depth buffer over a logical rect, taken at EndFrame. The result is
// the farthest (smallest) depth in it, 1 near and 0 far, available after EndFrame.
void ReadDepth(uint32_t id, float x, float y, float w = 1.0f, float h = 1.0f);
// The answer to the last ReadDepth(id); none if the rect was off the target or never asked.
std::optional<float> DepthResult(uint32_t id);
// The last presented frame, RGBA8 rows top to bottom. Outside a frame only.
bool ReadbackFrame(std::vector<uint8_t> &rgba, uint32_t &width, uint32_t &height);
// The base level at pixel size: RGBA8, or one byte per texel for Index8. Outside a frame only.
bool ReadbackTexture(TextureHandle texture, std::vector<uint8_t> &pixels, uint32_t &width, uint32_t &height);
// An RGB PNG from RGBA8 rows, stored uncompressed.
bool WritePng(const std::filesystem::path &path, const uint8_t *rgba, uint32_t width, uint32_t height);

// ---- Display lists ---------------------------------------------------------------------------

// What one logic tick drew. Between BeginRecording and EndRecording the drawing calls (Draw2D,
// DrawMesh, DrawMeshImmediate, Clear, ClearStencil, SetRenderTarget) and the stateful ones
// (CopyTexture, BlitTexture, SnapshotFrame, UpdateTexture, UpdatePalette, UpdateMeshVertices,
// ReadDepth) are appended to the list instead of executed; their arguments are validated and
// copied, so the calls return what they would have. Creating textures, meshes and render targets
// happens at once; destroying one is held back until the last list that may draw it is released.
struct DisplayList;
using DisplayListRef = std::shared_ptr<const DisplayList>;

// Identity of the object the following mesh draws belong to, so a display frame can match each one
// with the same object's draw in the previous tick (the n-th draw with a key matches the n-th with
// it). 0 is none. no_interpolation draws them at this tick's transform, as does a model whose
// translation moved more than teleport_distance since the previous tick (a teleport).
using InterpKey = uint64_t;
void      SetInterpKey(InterpKey key, bool no_interpolation = false, float teleport_distance = INFINITY);
InterpKey CurrentInterpKey();
bool      CurrentNoInterpolation();

// Not inside a frame BeginFrame opened.
void           BeginRecording();
DisplayListRef EndRecording();
bool           Recording();
// The list being recorded is not interpolated from its predecessor (a mode's first tick, a cut).
void CutInterpolation();
// Its camera (MeshTransform::view) is not; the objects still are.
void CutCameraInterpolation();

struct RenderOptions {
    // Run the stateful entries and render into the tick's colour image, which then becomes what
    // kPreviousFrame, SnapshotFrame of kMainTarget and the depth queries see. alpha is ignored.
    // Otherwise only the drawing entries run, into the display image (the window's size), with
    // kMainTarget meaning that image and kPreviousFrame the image the tick's canonical render saw.
    bool canonical = false;
    // The tick before, for interpolation; display renders at alpha < 1 only.
    const DisplayList *previous = nullptr;
    // Display renders: present the result.
    bool present = false;
    // Display renders: drawn over the list, as recorded, on kMainTarget, before the result is
    // presented (a host overlay). Never part of a canonical image.
    const DisplayList *overlay = nullptr;
};

// False when nothing was rendered: the list belongs to another renderer, a frame is open, or a
// display render was asked for when the newest main image is not a canonical render (the loading
// screen presented since) or the window cannot present.
bool RenderList(const DisplayList &list, float alpha, const RenderOptions &options);
// Presents the last canonical render as it is (interpolation off, headless runs).
bool PresentCanonical();

struct DisplayListStats {
    uint32_t draws_2d;
    uint32_t mesh_draws;
    uint32_t keyed_mesh_draws;
    uint32_t stateful;
    uint32_t cameras;
};

DisplayListStats ListStats(const DisplayList &list);

} // namespace gfx
