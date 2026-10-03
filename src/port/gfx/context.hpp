#pragma once

#include <array>
#include <cstdint>
#include <functional>
#include <map>
#include <memory>
#include <string>
#include <vector>

#include "gfx.hpp"
#include "requirements.hpp"

namespace gfx::detail {

inline constexpr uint32_t kFramesInFlight = 2;
// Descriptor slots in the bindless array; a handle's low 16 bits are its slot.
inline constexpr uint32_t kMaxTextures = 8192;
inline constexpr uint32_t kSamplerCount = 8;
inline constexpr uint32_t kMaxMeshes = 65535;
inline constexpr VkFormat kColorFormat = VK_FORMAT_R8G8B8A8_UNORM;
inline constexpr uint32_t kFirstUserSlot = 3;

[[noreturn]] void Fatal(const char *format, ...) __attribute__((format(printf, 1, 2)));
void              Error(const char *format, ...) __attribute__((format(printf, 1, 2)));
void              Check(VkResult result, const char *call);

// ---- Memory ----------------------------------------------------------------------------------

struct Allocation {
    VkDeviceMemory memory = VK_NULL_HANDLE;
    VkDeviceSize   offset = 0;
    VkDeviceSize   size = 0;
    uint32_t       pool = UINT32_MAX;
    uint32_t       block = UINT32_MAX; // UINT32_MAX: a dedicated allocation
    uint8_t       *mapped = nullptr;
};

Allocation AllocateMemory(const VkMemoryRequirements &requirements, VkMemoryPropertyFlags required,
                          VkMemoryPropertyFlags preferred, bool linear);
void       FreeMemory(Allocation &allocation);
void       ShutdownMemory();

struct Buffer {
    VkBuffer     buffer = VK_NULL_HANDLE;
    Allocation   memory;
    VkDeviceSize size = 0;
};

Buffer CreateBuffer(VkDeviceSize size, VkBufferUsageFlags usage, bool host_visible);
void   DestroyBuffer(Buffer &buffer);

// ---- Images ----------------------------------------------------------------------------------

struct ImageState {
    VkImageLayout         layout = VK_IMAGE_LAYOUT_UNDEFINED;
    VkPipelineStageFlags2 stage = VK_PIPELINE_STAGE_2_NONE;
    VkAccessFlags2        access = VK_ACCESS_2_NONE;
};

struct Image {
    VkImage            image = VK_NULL_HANDLE;
    VkImageView        view = VK_NULL_HANDLE;
    Allocation         memory;
    VkFormat           format = VK_FORMAT_UNDEFINED;
    VkImageAspectFlags aspect = 0;
    uint32_t           width = 0;
    uint32_t           height = 0;
    uint32_t           mips = 1;
    ImageState         state;
};

// Between operations every colour image rests readable by fragment shaders and every depth image
// rests as an attachment, so the upload and draw command buffers of a frame agree on layouts.
ImageState RestState(const Image &image);
Image      CreateImage(uint32_t width, uint32_t height, uint32_t mips, VkFormat format,
                       VkImageUsageFlags usage);
bool       IsDepthFormat(VkFormat format);
void       DestroyImage(Image &image);
void       Transition(VkCommandBuffer cmd, Image &image, const ImageState &to);
void       ToRest(VkCommandBuffer cmd, Image &image);
ImageState TransferSrc();
ImageState TransferDst();

// ---- Resources -------------------------------------------------------------------------------

struct Texture {
    bool        live = false;
    uint16_t    generation = 0;
    TextureDesc desc;
    Image       image;
    Image       depth; // render targets that keep their own only
    bool        render_target = false;
    bool        shares_main_depth = false;
    bool        frame = false;
    uint32_t    logical_width = 0;
    uint32_t    logical_height = 0;
    // The frame serial in which the draw command buffer last touched the image.
    uint64_t last_draw_use = 0;
    // Destroyed while a list that may draw it was recorded: dead to the API, alive to replays.
    bool doomed = false;
};

struct Mesh {
    bool     live = false;
    uint16_t generation = 0;
    Buffer   buffer; // vertices, then indices
    uint32_t vertex_count = 0;
    uint32_t index_count = 0;
    uint64_t last_draw_use = 0;
    bool     doomed = false;
};

struct TransientChunk {
    Buffer          buffer;
    VkDeviceSize    used = 0;
    VkDescriptorSet constants_set = VK_NULL_HANDLE;
};

struct TransientSpan {
    VkBuffer        buffer;
    VkDeviceSize    offset;
    uint8_t        *data;
    VkDescriptorSet constants_set;
};

struct DepthQuery {
    LogicalRect  rect = {};
    bool         queued = false;
    bool         recorded = false;
    bool         valid = false;
    float        result = 0.0f;
    VkDeviceSize offset = 0;
    uint32_t     texels = 0;
    uint8_t     *data = nullptr;
};

struct Frame {
    VkCommandPool                      pool = VK_NULL_HANDLE;
    VkCommandBuffer                    upload_cmd = VK_NULL_HANDLE;
    VkCommandBuffer                    draw_cmd = VK_NULL_HANDLE;
    bool                               upload_open = false;
    VkSemaphore                        image_available = VK_NULL_HANDLE;
    VkFence                            fence = VK_NULL_HANDLE;
    bool                               pending = false;
    std::vector<TransientChunk>        chunks;
    uint32_t                           chunk = 0;
    std::vector<std::function<void()>> deletions;
    // The only buffer the GPU writes for the host; kept apart from the transients, which it reads.
    Buffer depth_readback;
};

struct Swapchain {
    VkSwapchainKHR           handle = VK_NULL_HANDLE;
    VkFormat                 format = VK_FORMAT_UNDEFINED;
    VkExtent2D               extent = {};
    std::vector<VkImage>     images;
    std::vector<VkSemaphore> render_finished;
};

// Draw-path state that persists in the command buffer between draws.
struct BoundState {
    VkPipeline pipeline = VK_NULL_HANDLE;
    int        cull = -1;
    int        topology = -1;
    int        depth_test = -1;
    int        depth_write = -1;
    int        depth_op = -1;
    int        stencil_test = -1;
    // Per face: compare, fail, pass, depth-fail packed; reference, compare mask, write mask apart.
    int      stencil_ops[2] = {-1, -1};
    int      stencil_reference[2] = {-1, -1};
    int      stencil_compare_mask[2] = {-1, -1};
    int      stencil_write_mask[2] = {-1, -1};
    int      color_write_mask = -1;
    VkRect2D scissor = {
        {-1, -1},
        {0,  0 }
    };
    VkBuffer     vertex_buffer = VK_NULL_HANDLE;
    VkDeviceSize vertex_offset = 0;
};

struct BlendMapping {
    uint16_t slot;      // index into the precompiled blend states
    uint8_t  transform; // what the shader writes as source colour, kSourceTransform*
    bool     fix;       // C is FIX: the shader writes FIX / 128 as the factor
};

enum SourceTransform : uint8_t {
    kSourceColor = 0,
    kSourceTimesOnePlusC = 1,
    kSourceFactor = 2,
};

// Matches the push_constant block of every shader.
struct PushConstants {
    float    xform[4];    // 2D: logical to NDC, scale xy and offset zw
    float    uv_xform[4]; // scale xy, offset zw onto normalised texture coordinates
    uint32_t texture_slot;
    uint32_t palette_slot;
    uint32_t sampler_slot;
    uint32_t flags;
    uint32_t alpha; // ref 0-7, func 8-10, fix 16-23, ta0 24-31
    uint32_t fog_color;
};

enum PushFlags : uint32_t {
    kPushFog = 1u << 0,
    kPushTexa = 1u << 1,
    kPushAem = 1u << 2,
    kPushOpaqueTarget = 1u << 3,
    kPushTransformShift = 4,
    kPushFactorFix = 1u << 6,
    kPushLinear = 1u << 7,
};

// Axes along which an image shows past its logical frame.
enum ExtentAxis : uint32_t {
    kAxisX = 1u << 0,
    kAxisY = 1u << 1,
};

enum PipelineFamily : uint32_t {
    kFamily2DTriangles,
    kFamily2DLines,
    kFamilyMesh,
    kFamilyCount,
};

enum TextureMode : uint32_t {
    kTextureNone,
    kTextureRgba,
    kTexturePalette,
    kTextureModeCount,
};

struct Context {
    SDL_Window                      *window = nullptr;
    RendererConfig                   config;
    VkInstance                       instance = VK_NULL_HANDLE;
    VkDebugUtilsMessengerEXT         messenger = VK_NULL_HANDLE;
    VkSurfaceKHR                     surface = VK_NULL_HANDLE;
    VkPhysicalDevice                 physical_device = VK_NULL_HANDLE;
    VkPhysicalDeviceProperties       properties = {};
    VkPhysicalDeviceMemoryProperties memory_properties = {};
    VkDevice                         device = VK_NULL_HANDLE;
    uint32_t                         queue_family = 0;
    VkQueue                          queue = VK_NULL_HANDLE;
    // D32_SFLOAT_S8_UINT, or D24_UNORM_S8_UINT where the former cannot be an attachment.
    VkFormat                      depth_format = VK_FORMAT_UNDEFINED;
    bool                          dynamic_color_write_mask = false;
    bool                          offscreen = false;
    bool                          triangle_fans = true;
    bool                          separate_stencil_masks = true;
    bool                          portability_subset = false;
    PFN_vkCmdSetColorWriteMaskEXT cmd_set_color_write_mask = nullptr;
    Swapchain                     swapchain;
    bool                          resize_pending = false;

    std::array<Frame, kFramesInFlight> frames;
    uint32_t                           frame_slot = 0;
    uint64_t                           frame_serial = 1;
    bool                               in_frame = false;
    uint32_t                           image_index = 0;

    // Two main colour images, swapped every frame: one is drawn, the other is the previous frame.
    std::array<Image, 2> main_color;
    Image                main_depth;
    uint32_t             main_current = 0;
    float                render_scale = 1.0f;
    FrameLayout          layout;

    VkSampler                    samplers[kSamplerCount] = {};
    VkDescriptorSetLayout        texture_set_layout = VK_NULL_HANDLE;
    VkDescriptorSetLayout        constants_set_layout = VK_NULL_HANDLE;
    VkDescriptorPool             texture_pool = VK_NULL_HANDLE;
    VkDescriptorPool             constants_pool = VK_NULL_HANDLE;
    VkDescriptorSet              texture_set = VK_NULL_HANDLE;
    VkPipelineLayout             pipeline_layout = VK_NULL_HANDLE;
    VkPipelineCache              pipeline_cache = VK_NULL_HANDLE;
    std::vector<VkPipeline>      pipelines;
    uint32_t                     blend_slot_count = 0;
    std::array<BlendMapping, 81> blend_map = {};
    double                       pipeline_seconds = 0.0;

    std::vector<Texture>                              textures;
    std::map<std::string, TextureHandle, std::less<>> named_targets;
    std::vector<uint32_t>                             free_texture_slots;
    std::vector<Mesh>                                 meshes;
    std::vector<uint32_t>                             free_mesh_slots;

    TextureHandle target = kMainTarget;
    bool          rendering = false;
    BoundState    bound;

    std::array<DepthQuery, kDepthQueryCount> depth_queries;
    bool                                     depth_queries_recorded = false;

    // Display lists. The canonical render of a list draws into main_color like an immediate frame;
    // a display render draws into display_color with display_depth.
    uint64_t                     renderer_instance = 0;
    uint64_t                     list_serial = 0;
    std::shared_ptr<DisplayList> list;
    TextureHandle                record_target = kMainTarget;
    InterpKey                    interp_key = 0;
    bool                         interp_no_interpolation = false;
    float                        interp_teleport_distance = INFINITY;
    bool                         replaying = false;
    bool                         display_pass = false;
    // Errors are reported by the canonical render; display renders of the same list stay quiet.
    bool  quiet = false;
    Image display_color;
    Image display_depth;
    // The newest main_color image is a canonical render no immediate frame has followed.
    bool canonical_newest = false;
    bool presented_display = false;

    uint32_t validation_messages = 0;
};

extern Context g;

// renderer.cpp
// Frames of RenderList: a canonical one draws into main_color and harvests depth queries, a
// display one into display_color (starting from the canonical image when base) and presents it
// when present. False when a display frame cannot present.
bool OpenListFrame(bool canonical, bool present, bool base);
// The main targets take the window's size before a tick records draws laid out for them.
void            PrepareRecording();
void            CloseListFrame(bool canonical, bool present);
Frame          &CurrentFrame();
VkCommandBuffer UploadCommands();
VkCommandBuffer DrawCommands();
void            DeferDestroy(std::function<void()> destroy);
// Submits recorded uploads outside a frame and waits for them.
void   SubmitUploadsAndWait();
void   RunOneShot(const std::function<void(VkCommandBuffer)> &record);
Image &CurrentMainColor();
Image &PreviousMainColor();
// What kMainTarget and its depth are in the frame being drawn: the display image in a display render.
Image &MainColorTarget();
Image &MainDepth();
// What kPreviousFrame samples, and its descriptor slot.
Image   &PreviousFrameImage();
uint32_t PreviousFrameSlot();
void     CreateMainTargets();
void     DestroyMainTargets();

// memory.cpp
TransientSpan AllocateTransient(VkDeviceSize size, VkDeviceSize alignment);
void          ResetTransients(Frame &frame);
void          DestroyTransients(Frame &frame);

// resources.cpp
void     InitResources();
void     ShutdownResources();
Texture *LookupTexture(TextureHandle handle);
Mesh    *LookupMesh(MeshHandle mesh);
Image   *ColorImageOf(TextureHandle handle);
// Picks the command buffer an operation on these resources must go into: the upload command
// buffer when the draw command buffer has not touched them this frame, so no rendering is broken.
VkCommandBuffer CommandsForWrite(uint64_t &last_draw_use);
uint32_t        SamplerIndex(Filter filter, Wrap wrap_u, Wrap wrap_v);
// Every render target not at the size the render scale, the main target and the layout give it
// now, with its logical frame carried over.
void RecreateRenderTargets();
// The targets that share the main depth buffer, at the main target's new size (contents lost).
void           RecreateSharedTargets();
LogicalMapping TextureMapping(const Texture &texture);
bool           FrameShaped(const Texture &texture);
// What DestroyTexture and DestroyMesh do once no list may draw the resource any more.
void DestroyDoomedTexture(TextureHandle handle);
void DestroyDoomedMesh(MeshHandle handle);

// pipelines.cpp
void     CreatePipelineLayout();
void     CreatePipelines();
void     DestroyPipelines();
uint32_t PipelineIndex(PipelineFamily family, uint32_t blend_slot, TextureMode mode, bool alpha_test);
// Without a dynamic colour write mask: the pipelines that write no colour, after the others.
uint32_t     NoColorPipelineIndex(PipelineFamily family, TextureMode mode, bool alpha_test);
BlendMapping MapBlend(const GsBlend &blend, bool enable);

// displaylist.cpp
// The public resource calls that record instead of executing while a list is recorded.
bool RecordingCalls();

// draw.cpp
void           EndRendering();
void           ResetDrawState();
void           ReleaseTarget();
LogicalMapping MainMapping(uint32_t width, uint32_t height);
LogicalMapping UiMapping(const LogicalMapping &mapping);
bool           FillsWindow();
// ExtentAxis bits; none with AspectMode::Letterbox.
uint32_t    ExtentAxes(TextureHandle handle);
LogicalRect LogicalFrame(TextureHandle handle);
// The whole of the mapping's pixels in its logical units.
LogicalRect TargetBounds(const LogicalMapping &mapping);
// rect with every edge that reaches frame's along an axis in axes moved out to the mapping's pixel
// bounds.
LogicalRect ExtendRect(LogicalRect rect, uint32_t axes, const LogicalRect &frame,
                       const LogicalMapping &mapping);

// readback.cpp
void RecordDepthQueries(VkCommandBuffer cmd);
void HarvestDepthQueries();

} // namespace gfx::detail
