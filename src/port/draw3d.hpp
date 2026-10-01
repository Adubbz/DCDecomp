#pragma once

#include <cstdint>
#include <vector>

#include "gfx/gfx.hpp"
#include "mglib_port.hpp"
#include "texture_port.hpp"

struct RenderInfo;

// What the 3D replacement units (mglib, frame_draw, visualvu1, visualshadow, cloth_draw,
// water_draw) share with each other and with their tests, and nobody else needs.

// The GS registers the game last sent (MGSetGs*, and the clears, fills, stretches and shadow
// calls that leave them set as retail does) and the scissor MGSetWindowRect set, in the logical
// frame.
struct MGPortRegisters {
    sceGsTest        test;
    sceGsZbuf        zbuf;
    sceGsAlpha       alpha;
    sceGsTexa        texa;
    gfx::LogicalRect window;
};

MGPortRegisters &MGPortCurrent();
// TEST, ZBUF and ALPHA back to mgPixelTest, mgZBuffer and mgAlpha, as SetEnv and every retail
// helper that borrows them end.
void MGPortRestoreRegisters();

// The texture lookups, swappable so tests can stand in for the texture phase's resolver.
using Draw3DTex0Resolver = PortTextureRef (*)(u_long tex0);
using Draw3DHandleResolver = PortTextureRef (*)(int handle);
void           Draw3DSetResolvers(Draw3DTex0Resolver tex0, Draw3DHandleResolver handle);
PortTextureRef Draw3DResolveTex0(u_long tex0);
PortTextureRef Draw3DResolveHandle(int handle);

// The texture the game last copied the frame into (MGMoveImage, MGStretchMoveImage), if it is
// still alive: the water samples it, as retail's "work" aliased the copy's VRAM.
gfx::TextureHandle Draw3DLastFrameCopy();

// Shadow passes 1 and 2 draw only between MGBeginDrawShadow and MGEndDrawShadow, into the target
// the former picked; with no target they are dropped rather than brightening the frame.
bool Draw3DShadowTargetActive();

// 4x4 matrices are column-major [column][row], as sceVu0FMATRIX.
void Draw3DMul(float out[4][4], const float a[4][4], const float b[4][4]);

// Eye space (what view_scaled produces: x right, y down, z forward) to clip space of the current
// render target.
void Draw3DEyeToClip(const RenderInfo &info, float clip[4][4]);

// mvp, normal matrix, lights, ambient and fog of one draw, as the VU1 header carried them. On
// shadow passes 1 and 2 the planar projection info.shadow sits between the model and the view.
void Draw3DSceneConstants(gfx::MeshConstants &constants, const RenderInfo &info, const float model[4][4]);
// What SetMaterial uploaded: diffuse (alpha in w), ambient and specular.
void Draw3DMaterial(gfx::MeshConstants &constants, const RenderInfo &info, const float *diffuse,
                    const float *ambient, const float *specular);
// Current registers, PRMODE.ABE on, the window scissor on the current target, fog when asked.
gfx::DrawState Draw3DState(const RenderInfo &info, bool fog);

// A built visual. The game's vu_data block holds kDraw3DBlockQuads quadwords with a tag; the record
// lives here, keyed by the block's address.
inline constexpr unsigned kDraw3DBlockQuads = 4;

struct Draw3DStrip {
    uint32_t first_index = 0;
    uint32_t index_count = 0;
    float    diffuse[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    float    ambient[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    float    specular[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    int      texture = -1; // TexManager handle; -1 draws untextured
    u_long   tex0 = 0;
    u_long   tex1 = 0;
};

struct Draw3DVisual {
    gfx::MeshHandle            mesh = gfx::kNullMesh;
    std::vector<Draw3DStrip>   strips;
    std::vector<gfx::Vertex3D> vertices;
    std::vector<uint32_t>      indices; // kept only for immediate (per-frame) visuals
    bool                       vertex_colour = false;
    bool                       immediate = false;
};

Draw3DVisual *Draw3DFindVisual(const void *block);
// A fresh record for block, replacing (and destroying) what an earlier build left there. A
// transient record lives until the next MGBeginFrame.
Draw3DVisual &Draw3DRegisterVisual(unsigned int *block, bool transient);
void          Draw3DDropTransientVisuals();
// Uploads the record's vertices and indices as a mesh, or keeps them for immediate draws.
void Draw3DFinishVisual(Draw3DVisual &visual);
void Draw3DDrawVisual(const Draw3DVisual &visual, const float model[4][4], const RenderInfo &info, int program);

// Strip index order into a triangle list, every triangle wound as the strip's first.
void Draw3DStripToList(std::vector<uint32_t> &indices, uint32_t first_vertex, uint32_t count);
