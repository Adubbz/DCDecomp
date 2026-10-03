#pragma once

#include "dataset.hpp"
#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "visualshadow.hpp"

namespace dc::test {

// Scenes for the shadow passes, in world space with the fixture's identity camera (x right, y
// down, z forward; logical row 240 + 800 y / z, column 320 + 800 x / z). Light 0 points along y.
struct ShadowScene : Draw3DFixture {
    ShadowScene() {
        // The volume pass builds its records in the frame's ActiveData arena.
        InitializeDataBuffer();
        sceVu0FMATRIX light = {};
        light[1][0] = 1.0f;
        sceVu0FMATRIX colour = {};
        MGSetPLight(light, colour);
    }

    // A flat, unlit quad that writes depth, as the scene the shadows fall on.
    static void Quad(const std::array<std::array<float, 3>, 4> &corners, std::array<uint8_t, 3> color) {
        std::vector<gfx::Vertex3D> vertices;
        for (const auto &corner : corners) {
            gfx::Vertex3D vertex = {};
            std::memcpy(vertex.position, corner.data(), sizeof(vertex.position));
            vertices.push_back(vertex);
        }
        std::vector<uint32_t> indices = {0, 1, 2, 0, 2, 3};
        gfx::MeshConstants    constants = {};
        float                 clip[4][4];
        MGPortWorldToClip(clip);
        std::memcpy(constants.mvp, clip, sizeof(clip));
        for (int i = 0; i < 3; i++) {
            constants.diffuse[i] = color[i] / 128.0f;
        }
        constants.diffuse[3] = 1.0f;
        gfx::DrawState state;
        state.depth_test = gfx::DepthTest::GEqual;
        state.depth_write = true;
        gfx::DrawMeshImmediate(vertices, indices, constants, {}, state);
    }

    // Horizontal floor at height y.
    static void Floor(float y, std::array<uint8_t, 3> color = {200, 200, 200}) {
        Quad({
                 {{-400.0f, y, 20.0f}, {400.0f, y, 20.0f}, {400.0f, y, 600.0f}, {-400.0f, y, 600.0f}}
        },
             color);
    }
};

// An MDT shadow mesh of axis-aligned boxes, twelve outward-wound triangles each.
struct ShadowMesh {
    std::vector<std::array<float, 4>> vertices;
    std::vector<int>                  corners;

    void Box(std::array<float, 3> min, std::array<float, 3> max) {
        int base = static_cast<int>(vertices.size());
        for (int i = 0; i < 8; i++) {
            vertices.push_back({i & 1 ? max[0] : min[0], i & 2 ? max[1] : min[1], i & 4 ? max[2] : min[2], 1.0f});
        }
        static constexpr int kFaces[6][4] = {
            {0, 1, 3, 2},
            {4, 5, 7, 6},
            {0, 1, 5, 4},
            {2, 3, 7, 6},
            {0, 2, 6, 4},
            {1, 3, 7, 5}
        };
        float centre[3] = {(min[0] + max[0]) / 2, (min[1] + max[1]) / 2, (min[2] + max[2]) / 2};
        for (const auto &face : kFaces) {
            int quad[4] = {base + face[0], base + face[1], base + face[2], base + face[3]};
            if (!Outward(quad, centre)) {
                std::swap(quad[1], quad[3]);
            }
            corners.insert(corners.end(), {quad[0], quad[1], quad[2], quad[0], quad[2], quad[3]});
        }
    }

    bool Outward(const int quad[4], const float centre[3]) const {
        const auto &a = vertices[quad[0]];
        const auto &b = vertices[quad[1]];
        const auto &c = vertices[quad[2]];
        float       u[3] = {b[0] - a[0], b[1] - a[1], b[2] - a[2]};
        float       v[3] = {c[0] - a[0], c[1] - a[1], c[2] - a[2]};
        float       n[3] = {u[1] * v[2] - u[2] * v[1], u[2] * v[0] - u[0] * v[2], u[0] * v[1] - u[1] * v[0]};
        return n[0] * (a[0] - centre[0]) + n[1] * (a[1] - centre[1]) + n[2] * (a[2] - centre[2]) > 0.0f;
    }

    // Header, vertices at 64, one MDT_SHADOW shape after them.
    std::vector<u_int> Build() const {
        size_t             mesh_ofs = 64 + vertices.size() * 16;
        size_t             bytes = mesh_ofs + 16 + 12 + corners.size() * sizeof(MDT_SVERTEX) + 64;
        std::vector<u_int> image((bytes + 15) / 16 * 4, 0);
        auto              *base = reinterpret_cast<unsigned char *>(image.data());
        auto              *header = reinterpret_cast<MDT_HEADER *>(base);
        header->size = static_cast<unsigned>(image.size() * 4);
        header->vertex_ofs = 64;
        header->vertex_num = static_cast<int>(vertices.size());
        header->mesh_ofs = static_cast<int>(mesh_ofs);
        std::memcpy(base + 64, vertices.data(), vertices.size() * 16);
        auto *shadow = reinterpret_cast<MDT_SHADOW *>(base + mesh_ofs);
        shadow->shape_num = 1;
        shadow->shape[0].index_num = static_cast<int>(corners.size());
        for (size_t i = 0; i < corners.size(); i++) {
            shadow->shape[0].vertex[i].index = corners[i];
        }
        return image;
    }
};

// A shadow frame drawing one CVisualShadow, as dataset.cpp's CreateVisual builds it with the
// model kept (attr 2 | 8).
struct ShadowCaster {
    explicit ShadowCaster(const ShadowMesh &mesh) : image(mesh.Build()) {
        visual.CreateVUdataShadow(block, image.data());
        visual.vu_data_buffer[0] = visual.vu_data_buffer[1] = visual.vu_data;
        visual.SetMDTDataAddress(image.data());
        frame.SetVisual(&visual);
        frame.attr.cull_enable = false;
    }

    std::vector<u_int> image;
    alignas(64) unsigned int block[64] = {};
    CVisualShadow visual;
    CFrameVu1     frame;
};

} // namespace dc::test
