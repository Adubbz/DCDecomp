#include "displaylist.hpp"

#include <algorithm>
#include <cmath>
#include <cstring>
#include <unordered_map>

#include "context.hpp"

namespace gfx {

namespace detail {

namespace {

constexpr Mat4 kIdentity = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};

struct Quat {
    float x, y, z, w;
};

struct Vec3 {
    float x, y, z;
};

Vec3 Column(const Mat4 &m, int c) { return {m[c * 4 + 0], m[c * 4 + 1], m[c * 4 + 2]}; }

float Dot(Vec3 a, Vec3 b) { return a.x * b.x + a.y * b.y + a.z * b.z; }

Vec3 Cross(Vec3 a, Vec3 b) { return {a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x}; }

Vec3 Scale(Vec3 a, float s) { return {a.x * s, a.y * s, a.z * s}; }

Vec3 Sub(Vec3 a, Vec3 b) { return {a.x - b.x, a.y - b.y, a.z - b.z}; }

bool Normalize(Vec3 &v) {
    float length = std::sqrt(Dot(v, v));
    if (!(length > 1e-20f)) {
        return false;
    }
    v = Scale(v, 1.0f / length);
    return true;
}

bool IsAffine(const Mat4 &m) { return m[3] == 0.0f && m[7] == 0.0f && m[11] == 0.0f && m[15] == 1.0f; }

// 3x3 row r, column c of a rotation held as three columns.
using Mat3 = std::array<float, 9>;

float At(const Mat3 &m, int r, int c) { return m[c * 3 + r]; }

Quat QuatFromRotation(const Mat3 &m) {
    float trace = At(m, 0, 0) + At(m, 1, 1) + At(m, 2, 2);
    Quat  q;
    if (trace > 0.0f) {
        float s = std::sqrt(trace + 1.0f) * 2.0f;
        q = {(At(m, 2, 1) - At(m, 1, 2)) / s, (At(m, 0, 2) - At(m, 2, 0)) / s,
             (At(m, 1, 0) - At(m, 0, 1)) / s, 0.25f * s};
    } else if (At(m, 0, 0) > At(m, 1, 1) && At(m, 0, 0) > At(m, 2, 2)) {
        float s = std::sqrt(1.0f + At(m, 0, 0) - At(m, 1, 1) - At(m, 2, 2)) * 2.0f;
        q = {0.25f * s, (At(m, 0, 1) + At(m, 1, 0)) / s, (At(m, 0, 2) + At(m, 2, 0)) / s,
             (At(m, 2, 1) - At(m, 1, 2)) / s};
    } else if (At(m, 1, 1) > At(m, 2, 2)) {
        float s = std::sqrt(1.0f + At(m, 1, 1) - At(m, 0, 0) - At(m, 2, 2)) * 2.0f;
        q = {(At(m, 0, 1) + At(m, 1, 0)) / s, 0.25f * s, (At(m, 1, 2) + At(m, 2, 1)) / s,
             (At(m, 0, 2) - At(m, 2, 0)) / s};
    } else {
        float s = std::sqrt(1.0f + At(m, 2, 2) - At(m, 0, 0) - At(m, 1, 1)) * 2.0f;
        q = {(At(m, 0, 2) + At(m, 2, 0)) / s, (At(m, 1, 2) + At(m, 2, 1)) / s, 0.25f * s,
             (At(m, 1, 0) - At(m, 0, 1)) / s};
    }
    return q;
}

Mat3 RotationFromQuat(Quat q) {
    float x = q.x, y = q.y, z = q.z, w = q.w;
    // Columns.
    return {1 - 2 * (y * y + z * z), 2 * (x * y + w * z),     2 * (x * z - w * y),
            2 * (x * y - w * z),     1 - 2 * (x * x + z * z), 2 * (y * z + w * x),
            2 * (x * z + w * y),     2 * (y * z - w * x),     1 - 2 * (x * x + y * y)};
}

Quat Slerp(Quat a, Quat b, float t) {
    float dot = a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
    if (dot < 0.0f) {
        b = {-b.x, -b.y, -b.z, -b.w};
        dot = -dot;
    }
    float wa;
    float wb;
    if (dot > 0.9995f) {
        wa = 1.0f - t;
        wb = t;
    } else {
        float theta = std::acos(std::min(dot, 1.0f));
        float sine = std::sin(theta);
        wa = std::sin((1.0f - t) * theta) / sine;
        wb = std::sin(t * theta) / sine;
    }
    Quat  q = {a.x * wa + b.x * wb, a.y * wa + b.y * wb, a.z * wa + b.z * wb, a.w * wa + b.w * wb};
    float length = std::sqrt(q.x * q.x + q.y * q.y + q.z * q.z + q.w * q.w);
    return {q.x / length, q.y / length, q.z / length, q.w / length};
}

// m's 3x3 = R * K with R a rotation (Gram-Schmidt of m's columns) and K the scale and shear in
// R's frame; a reflection stays in K.
struct Decomposed {
    Vec3  translation;
    Quat  rotation;
    Mat3  rest;
    float determinant;
};

bool Decompose(const Mat4 &m, Decomposed &out) {
    if (!IsAffine(m)) {
        return false;
    }
    Vec3 c0 = Column(m, 0);
    Vec3 c1 = Column(m, 1);
    Vec3 c2 = Column(m, 2);
    out.determinant = Dot(c0, Cross(c1, c2));
    if (!(std::fabs(out.determinant) > 1e-12f)) {
        return false;
    }
    Vec3 r0 = c0;
    Vec3 r1 = Sub(c1, Scale(r0, Dot(c1, r0) / Dot(r0, r0)));
    if (!Normalize(r0) || !Normalize(r1)) {
        return false;
    }
    Vec3 r2 = Cross(r0, r1);
    Mat3 rotation = {r0.x, r0.y, r0.z, r1.x, r1.y, r1.z, r2.x, r2.y, r2.z};
    out.rotation = QuatFromRotation(rotation);
    // Rebuilt from the quaternion so that K is measured against the rotation slerp will produce.
    Mat3 exact = RotationFromQuat(out.rotation);
    Vec3 columns[3] = {c0, c1, c2};
    Vec3 axes[3] = {
        {exact[0], exact[1], exact[2]}, {exact[3], exact[4], exact[5]}, {exact[6], exact[7], exact[8]}};
    for (int c = 0; c < 3; c++) {
        for (int r = 0; r < 3; r++) {
            out.rest[c * 3 + r] = Dot(axes[r], columns[c]);
        }
    }
    out.translation = Column(m, 3);
    return true;
}

Mat4 Compose(Vec3 translation, const Mat3 &rotation, const Mat3 &rest) {
    Mat4 m = kIdentity;
    for (int c = 0; c < 3; c++) {
        for (int r = 0; r < 3; r++) {
            m[c * 4 + r] = At(rotation, r, 0) * rest[c * 3 + 0] + At(rotation, r, 1) * rest[c * 3 + 1] +
                           At(rotation, r, 2) * rest[c * 3 + 2];
        }
    }
    m[12] = translation.x;
    m[13] = translation.y;
    m[14] = translation.z;
    return m;
}

// Also gives the rotation the result has relative to b, for the normals.
bool Interpolate(const Mat4 &a, const Mat4 &b, float alpha, Mat4 &out, Mat3 *delta) {
    Decomposed da;
    Decomposed db;
    if (!Decompose(a, da) || !Decompose(b, db) || (da.determinant < 0.0f) != (db.determinant < 0.0f)) {
        out = b;
        return false;
    }
    Vec3 translation = {da.translation.x + (db.translation.x - da.translation.x) * alpha,
                        da.translation.y + (db.translation.y - da.translation.y) * alpha,
                        da.translation.z + (db.translation.z - da.translation.z) * alpha};
    Quat q = Slerp(da.rotation, db.rotation, alpha);
    Mat3 rest;
    for (int i = 0; i < 9; i++) {
        rest[i] = da.rest[i] + (db.rest[i] - da.rest[i]) * alpha;
    }
    Mat3 rotation = RotationFromQuat(q);
    out = Compose(translation, rotation, rest);
    if (delta != nullptr) {
        Mat3 current = RotationFromQuat(db.rotation);
        for (int c = 0; c < 3; c++) {
            for (int r = 0; r < 3; r++) {
                (*delta)[c * 3 + r] = At(rotation, r, 0) * At(current, c, 0) +
                                      At(rotation, r, 1) * At(current, c, 1) +
                                      At(rotation, r, 2) * At(current, c, 2);
            }
        }
    }
    return true;
}

// Cameras are interpolated as placed in the world, not as the world seen from them.
bool InterpolateView(const Mat4 &a, const Mat4 &b, float alpha, Mat4 &out) {
    Mat4 place_a;
    Mat4 place_b;
    Mat4 place;
    if (!InvertAffine(a, place_a) || !InvertAffine(b, place_b) ||
        !Interpolate(place_a, place_b, alpha, place, nullptr) || !InvertAffine(place, out)) {
        out = b;
        return false;
    }
    return true;
}

Mat4 ToMat4(const float *m) {
    Mat4 out;
    std::memcpy(out.data(), m, sizeof(float) * 16);
    return out;
}

uint32_t CameraIndex(DisplayList &list, const float *view) {
    for (uint32_t i = 0; i < list.cameras.size(); i++) {
        if (std::memcmp(list.cameras[i].data(), view, sizeof(float) * 16) == 0) {
            return i;
        }
    }
    list.cameras.push_back(ToMat4(view));
    return static_cast<uint32_t>(list.cameras.size() - 1);
}

bool CoversLogicalFrame(const LogicalRect &rect) {
    return rect.x <= 0.0f && rect.y <= 0.0f && rect.x + rect.w >= kLogicalWidth &&
           rect.y + rect.h >= kLogicalHeight;
}

void NoteMainDraw(DisplayList &list) {
    if (g.record_target == kMainTarget && !list.main_cleared) {
        list.needs_base = true;
    }
}

void BuildMatches(const DisplayList &list, const DisplayList &previous) {
    MatchCache &cache = list.cache;
    cache.previous_serial = previous.serial;

    struct KeyHash {
        size_t operator()(const std::pair<InterpKey, uint32_t> &k) const {
            return std::hash<uint64_t>()(k.first * 0x9E3779B97F4A7C15ull ^ k.second);
        }
    };

    std::unordered_map<std::pair<InterpKey, uint32_t>, int32_t, KeyHash> keyed;
    for (size_t i = 0; i < previous.records.size(); i++) {
        const MeshRecord &record = previous.records[i];
        if (record.key != 0 && record.has_transform) {
            keyed.emplace(std::pair{record.key, record.occurrence}, static_cast<int32_t>(i));
        }
    }
    cache.match.assign(list.records.size(), -1);
    for (size_t i = 0; i < list.records.size(); i++) {
        const MeshRecord &record = list.records[i];
        if (record.key == 0 || !record.has_transform || record.no_interpolation) {
            continue;
        }
        auto it = keyed.find({record.key, record.occurrence});
        if (it == keyed.end()) {
            continue;
        }
        const Mat4 &before = previous.records[it->second].model;
        float       dx = record.model[12] - before[12];
        float       dy = record.model[13] - before[13];
        float       dz = record.model[14] - before[14];
        if (!(std::sqrt(dx * dx + dy * dy + dz * dz) > record.teleport_distance)) {
            cache.match[i] = it->second;
        }
    }
    cache.cameras.assign(list.cameras.size(), -1);
    if (!list.camera_cut) {
        for (size_t i = 0; i < list.cameras.size() && i < previous.cameras.size(); i++) {
            cache.cameras[i] = static_cast<int32_t>(i);
        }
    }
}

struct Overrides {
    std::vector<int32_t>       index; // per record, into constants, or -1
    std::vector<MeshConstants> constants;
};

void Interpolated(const DisplayList &list, const DisplayList &previous, float alpha, Overrides &out) {
    if (list.cache.previous_serial != previous.serial) {
        BuildMatches(list, previous);
    }
    const MatchCache &cache = list.cache;

    std::vector<Mat4> views(list.cameras.size());
    std::vector<bool> moved(list.cameras.size(), false);
    for (size_t i = 0; i < list.cameras.size(); i++) {
        views[i] = list.cameras[i];
        int32_t before = cache.cameras[i];
        if (before >= 0 && previous.cameras[before] != list.cameras[i]) {
            moved[i] = InterpolateView(previous.cameras[before], list.cameras[i], alpha, views[i]);
        }
    }

    out.index.assign(list.records.size(), -1);
    out.constants.clear();
    for (const Entry &entry : list.entries) {
        const MeshEntry *mesh = std::get_if<MeshEntry>(&entry);
        if (mesh == nullptr) {
            continue;
        }
        const MeshRecord &record = list.records[mesh->record];
        if (!record.has_transform) {
            continue;
        }
        Mat4    model = record.model;
        Mat3    delta;
        bool    turned = false;
        int32_t match = cache.match[mesh->record];
        if (match >= 0 && previous.records[match].model != record.model) {
            turned = Interpolate(previous.records[match].model, record.model, alpha, model, &delta);
        }
        if (!turned && !moved[record.camera]) {
            continue;
        }
        MeshConstants constants = mesh->constants;
        Mat4 mvp = Multiply(Multiply(Multiply(record.projection, views[record.camera]), record.middle),
                            Multiply(model, record.local));
        std::memcpy(constants.mvp, mvp.data(), sizeof(constants.mvp));
        if (turned) {
            for (int c = 0; c < 3; c++) {
                float column[3];
                for (int r = 0; r < 3; r++) {
                    column[r] = At(delta, r, 0) * mesh->constants.normal_matrix[c * 4 + 0] +
                                At(delta, r, 1) * mesh->constants.normal_matrix[c * 4 + 1] +
                                At(delta, r, 2) * mesh->constants.normal_matrix[c * 4 + 2];
                }
                std::memcpy(&constants.normal_matrix[c * 4], column, sizeof(column));
            }
        }
        out.index[mesh->record] = static_cast<int32_t>(out.constants.size());
        out.constants.push_back(constants);
    }
}

void Replay(const DisplayList &list, bool canonical, const Overrides *overrides) {
    g.replaying = true;
    g.quiet = !canonical;
    for (const Entry &entry : list.entries) {
        std::visit(
            [&](const auto &e) {
                using T = std::decay_t<decltype(e)>;
                if constexpr (std::is_same_v<T, Draw2DEntry>) {
                    Draw2D(e.primitive, e.vertices, e.binding, e.state);
                } else if constexpr (std::is_same_v<T, MeshEntry>) {
                    const MeshConstants *constants = &e.constants;
                    if (overrides != nullptr && overrides->index[e.record] >= 0) {
                        constants = &overrides->constants[overrides->index[e.record]];
                    }
                    if (e.mesh != kNullMesh) {
                        DrawMesh(e.mesh, e.first_index, e.index_count, *constants, e.binding, e.state);
                    } else {
                        DrawMeshImmediate(e.vertices, e.indices, *constants, e.binding, e.state);
                    }
                } else if constexpr (std::is_same_v<T, ClearEntry>) {
                    if (e.stencil) {
                        ClearStencil(e.stencil_value, e.has_rect ? &e.rect : nullptr);
                    } else {
                        Clear(e.color, e.rgba, e.depth, e.z, e.has_rect ? &e.rect : nullptr);
                    }
                } else if constexpr (std::is_same_v<T, TargetEntry>) {
                    SetRenderTarget(e.target);
                } else if (canonical) {
                    if constexpr (std::is_same_v<T, CopyEntry>) {
                        if (e.kind == CopyEntry::Copy) {
                            CopyTexture(e.src, e.src_rect, e.dst, e.dst_rect.x, e.dst_rect.y);
                        } else {
                            BlitTexture(e.src, e.src_rect, e.dst, e.dst_rect, e.filter);
                        }
                    } else if constexpr (std::is_same_v<T, UpdateTextureEntry>) {
                        UpdateTexture(e.texture, e.mip, e.x, e.y, e.w, e.h, e.pixels.data());
                    } else if constexpr (std::is_same_v<T, UpdateMeshEntry>) {
                        UpdateMeshVertices(e.mesh, e.first, e.vertices);
                    } else if constexpr (std::is_same_v<T, ReadDepthEntry>) {
                        ReadDepth(e.id, e.rect.x, e.rect.y, e.rect.w, e.rect.h);
                    }
                }
            },
            entry);
    }
    g.replaying = false;
    g.quiet = false;
}

} // namespace

Mat4 Multiply(const Mat4 &a, const Mat4 &b) {
    Mat4 out;
    for (int c = 0; c < 4; c++) {
        for (int r = 0; r < 4; r++) {
            out[c * 4 + r] = a[0 * 4 + r] * b[c * 4 + 0] + a[1 * 4 + r] * b[c * 4 + 1] +
                             a[2 * 4 + r] * b[c * 4 + 2] + a[3 * 4 + r] * b[c * 4 + 3];
        }
    }
    return out;
}

bool InvertAffine(const Mat4 &m, Mat4 &out) {
    if (!IsAffine(m)) {
        return false;
    }
    Vec3  c0 = Column(m, 0);
    Vec3  c1 = Column(m, 1);
    Vec3  c2 = Column(m, 2);
    Vec3  r0 = Cross(c1, c2);
    Vec3  r1 = Cross(c2, c0);
    Vec3  r2 = Cross(c0, c1);
    float determinant = Dot(c0, r0);
    if (!(std::fabs(determinant) > 1e-12f)) {
        return false;
    }
    float inverse = 1.0f / determinant;
    r0 = Scale(r0, inverse);
    r1 = Scale(r1, inverse);
    r2 = Scale(r2, inverse);
    // The rows of the inverse are r0, r1, r2.
    out = kIdentity;
    Vec3 rows[3] = {r0, r1, r2};
    Vec3 t = Column(m, 3);
    for (int r = 0; r < 3; r++) {
        out[0 * 4 + r] = rows[r].x;
        out[1 * 4 + r] = rows[r].y;
        out[2 * 4 + r] = rows[r].z;
        out[3 * 4 + r] = -Dot(rows[r], t);
    }
    return true;
}

bool InterpolateAffine(const Mat4 &a, const Mat4 &b, float alpha, Mat4 &out) {
    return Interpolate(a, b, alpha, out, nullptr);
}

bool RecordingCalls() { return g.list != nullptr; }

void RecordEntry(Entry &&entry) {
    DisplayList &list = *g.list;
    if (std::holds_alternative<Draw2DEntry>(entry)) {
        NoteMainDraw(list);
    }
    list.entries.push_back(std::move(entry));
}

void RecordMesh(MeshEntry &&entry, const MeshTransform *transform) {
    DisplayList &list = *g.list;
    NoteMainDraw(list);
    MeshRecord record;
    record.key = g.interp_key;
    record.no_interpolation = g.interp_no_interpolation;
    record.teleport_distance = g.interp_teleport_distance;
    if (record.key != 0) {
        record.occurrence = list.occurrences[record.key]++;
    }
    if (transform != nullptr) {
        record.has_transform = true;
        record.projection = ToMat4(transform->projection);
        record.middle = ToMat4(transform->middle);
        record.model = ToMat4(transform->model);
        record.local = ToMat4(transform->local);
        record.camera = CameraIndex(list, transform->view);
    }
    entry.record = static_cast<uint32_t>(list.records.size());
    list.records.push_back(record);
    list.entries.push_back(std::move(entry));
}

void RecordClear(const ClearEntry &entry) {
    DisplayList &list = *g.list;
    if (!entry.stencil && entry.color && g.record_target == kMainTarget &&
        (!entry.has_rect || CoversLogicalFrame(entry.rect))) {
        list.main_cleared = true;
    }
    list.entries.push_back(entry);
}

void RecordDoomedTexture(TextureHandle handle) { g.list->doomed_textures.push_back(handle); }

void RecordDoomedMesh(MeshHandle handle) { g.list->doomed_meshes.push_back(handle); }

} // namespace detail

using namespace detail;

DisplayList::~DisplayList() {
    if (instance != g.renderer_instance || g.device == VK_NULL_HANDLE) {
        return;
    }
    for (TextureHandle texture : doomed_textures) {
        DestroyDoomedTexture(texture);
    }
    for (MeshHandle mesh : doomed_meshes) {
        DestroyDoomedMesh(mesh);
    }
}

MeshTransform IdentityMeshTransform() {
    MeshTransform transform;
    for (float *m :
         {transform.projection, transform.view, transform.middle, transform.model, transform.local}) {
        std::memcpy(m, kIdentity.data(), sizeof(float) * 16);
    }
    return transform;
}

bool InvertAffineTransform(const float matrix[16], float inverse[16]) {
    Mat4 out;
    if (!InvertAffine(ToMat4(matrix), out)) {
        return false;
    }
    std::memcpy(inverse, out.data(), sizeof(float) * 16);
    return true;
}

void SetInterpKey(InterpKey key, bool no_interpolation, float teleport_distance) {
    g.interp_key = key;
    g.interp_no_interpolation = no_interpolation;
    g.interp_teleport_distance = teleport_distance;
}

InterpKey CurrentInterpKey() { return g.interp_key; }

bool CurrentNoInterpolation() { return g.interp_no_interpolation; }

void BeginRecording() {
    if (g.list != nullptr) {
        return;
    }
    if (g.in_frame) {
        Error("BeginRecording inside a frame");
        return;
    }
    PrepareRecording();
    g.list = std::make_shared<DisplayList>();
    g.list->instance = g.renderer_instance;
    g.list->serial = ++g.list_serial;
    g.record_target = kMainTarget;
    g.interp_key = 0;
    g.interp_no_interpolation = false;
    g.interp_teleport_distance = INFINITY;
}

DisplayListRef EndRecording() {
    std::shared_ptr<DisplayList> list = std::move(g.list);
    g.list = nullptr;
    return list;
}

bool Recording() { return g.list != nullptr; }

void CutInterpolation() {
    if (g.list != nullptr) {
        g.list->cut = true;
    }
}

void CutCameraInterpolation() {
    if (g.list != nullptr) {
        g.list->camera_cut = true;
    }
}

bool RenderList(const DisplayList &list, float alpha, const RenderOptions &options) {
    if (list.instance != g.renderer_instance || g.device == VK_NULL_HANDLE) {
        return false;
    }
    if (g.in_frame || g.list != nullptr) {
        Error("RenderList inside a frame");
        return false;
    }
    if (options.canonical) {
        OpenListFrame(true, false, false);
        Replay(list, true, nullptr);
        CloseListFrame(true, false);
        return true;
    }
    if (!g.canonical_newest) {
        return false;
    }
    Overrides overrides;
    bool interpolate = options.previous != nullptr && options.previous->instance == g.renderer_instance &&
                       alpha < 1.0f && !list.cut;
    if (interpolate) {
        Interpolated(list, *options.previous, std::max(alpha, 0.0f), overrides);
    }
    if (!OpenListFrame(false, options.present, list.needs_base)) {
        return false;
    }
    Replay(list, false, interpolate ? &overrides : nullptr);
    CloseListFrame(false, options.present);
    return true;
}

DisplayListStats ListStats(const DisplayList &list) {
    DisplayListStats stats = {};
    for (const Entry &entry : list.entries) {
        if (std::holds_alternative<Draw2DEntry>(entry)) {
            stats.draws_2d++;
        } else if (const MeshEntry *mesh = std::get_if<MeshEntry>(&entry)) {
            stats.mesh_draws++;
            if (list.records[mesh->record].key != 0) {
                stats.keyed_mesh_draws++;
            }
        } else if (!std::holds_alternative<ClearEntry>(entry) &&
                   !std::holds_alternative<TargetEntry>(entry)) {
            stats.stateful++;
        }
    }
    stats.cameras = static_cast<uint32_t>(list.cameras.size());
    return stats;
}

} // namespace gfx
