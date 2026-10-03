#pragma once

#include <array>
#include <cmath>
#include <cstdint>
#include <unordered_map>
#include <variant>
#include <vector>

#include "gfx.hpp"

namespace gfx {

namespace detail {

using Mat4 = std::array<float, 16>;

struct Draw2DEntry {
    Primitive             primitive;
    std::vector<Vertex2D> vertices;
    TextureBinding        binding;
    DrawState             state;
};

// One record of DisplayList::meshes per entry.
struct MeshEntry {
    MeshHandle            mesh = kNullMesh; // kNullMesh: immediate, vertices and indices below
    uint32_t              first_index = 0;
    uint32_t              index_count = 0;
    std::vector<Vertex3D> vertices;
    std::vector<uint32_t> indices;
    MeshConstants         constants;
    TextureBinding        binding;
    DrawState             state;
    uint32_t              record = 0;
};

struct ClearEntry {
    bool        stencil = false;
    bool        color = false;
    bool        depth = false;
    uint8_t     rgba[4] = {};
    float       z = 0.0f;
    uint8_t     stencil_value = 0;
    bool        has_rect = false;
    LogicalRect rect = {};
};

struct TargetEntry {
    TextureHandle target;
};

struct CopyEntry {
    enum Kind : uint8_t { Copy, Blit, Snapshot } kind;

    TextureHandle src;
    Rect          src_rect;
    TextureHandle dst;
    Rect          dst_rect;
    Filter        filter;
};

struct UpdateTextureEntry {
    TextureHandle        texture;
    uint32_t             mip, x, y, w, h;
    std::vector<uint8_t> pixels;
};

struct UpdateMeshEntry {
    MeshHandle            mesh;
    uint32_t              first;
    std::vector<Vertex3D> vertices;
};

struct ReadDepthEntry {
    uint32_t    id;
    LogicalRect rect;
};

using Entry = std::variant<Draw2DEntry, MeshEntry, ClearEntry, TargetEntry, CopyEntry, UpdateTextureEntry,
                           UpdateMeshEntry, ReadDepthEntry>;

struct MeshRecord {
    InterpKey key = 0;
    uint32_t  occurrence = 0;
    uint32_t  entry = 0; // its MeshEntry in DisplayList::entries
    bool      no_interpolation = false;
    float     teleport_distance = INFINITY;
    bool      has_transform = false;
    uint32_t  camera = 0;
    Mat4      projection = {};
    Mat4      middle = {};
    Mat4      model = {};
    Mat4      local = {};
};

// What a display render of a list against one predecessor reuses from frame to frame.
struct MatchCache {
    uint64_t             previous_serial = 0;
    std::vector<int32_t> match;   // per record, the previous list's record, or -1
    std::vector<bool>    blend;   // per record, whether its immediate vertices moved since the match's
    std::vector<int32_t> cameras; // per camera, the previous list's, or -1
};

} // namespace detail

struct DisplayList {
    uint64_t                        instance = 0;
    uint64_t                        serial = 0;
    std::vector<detail::Entry>      entries;
    std::vector<detail::MeshRecord> records;
    std::vector<detail::Mat4>       cameras;
    std::vector<TextureHandle>      doomed_textures;
    std::vector<MeshHandle>         doomed_meshes;
    bool                            cut = false;
    bool                            camera_cut = false;
    // A draw reaches the main target before a clear covers its logical frame, so whatever the
    // target held shows through; a display render starts from the canonical image.
    bool                                    needs_base = false;
    bool                                    main_cleared = false;
    std::unordered_map<InterpKey, uint32_t> occurrences;
    mutable detail::MatchCache              cache;

    DisplayList() = default;
    DisplayList(const DisplayList &) = delete;
    DisplayList &operator=(const DisplayList &) = delete;
    ~DisplayList();
};

namespace detail {

// displaylist.cpp
void RecordEntry(Entry &&entry);
void RecordMesh(MeshEntry &&entry, const MeshTransform *transform);
void RecordClear(const ClearEntry &entry);
void RecordDoomedTexture(TextureHandle handle);
void RecordDoomedMesh(MeshHandle handle);

// Interpolation, exposed for tests through the pure functions below.
Mat4 Multiply(const Mat4 &a, const Mat4 &b);
bool InvertAffine(const Mat4 &m, Mat4 &out);
// a at alpha 0, b at 1: translation lerped, rotation slerped, the rest of the 3x3 (scale, shear)
// lerped in the rotation's frame. False (out = b) when either is not an invertible affine.
bool InterpolateAffine(const Mat4 &a, const Mat4 &b, float alpha, Mat4 &out);

} // namespace detail

} // namespace gfx
