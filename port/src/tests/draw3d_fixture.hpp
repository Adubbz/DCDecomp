#pragma once

#include <gtest/gtest.h>

// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>
#include <libvu0.h>

#include <array>
#include <cstring>
#include <vector>

#include "draw3d.hpp"
#include "gfx_fixture.hpp"
#include "mdt.hpp"
#include "mglib.hpp"
#include "platform/clock.hpp"
#include "renderinfo.hpp"

namespace dc::test {

// The game's renderer state on a headless window: MGInit, an unbounded clock, retail's
// MGSetRenderInfo(800, 10, 65535), an identity camera (x right, y down, z forward), no
// directional light and a full ambient, so a lit material shows its ambient colour.
struct Draw3DFixture : GfxFixture {
    explicit Draw3DFixture(int width = 640, int height = 480) : GfxFixture(width, height) {
        MGInit();
        ClockSetUnbounded(true);
        MGSetRenderInfo(800.0f, 10.0f, 65535.0f);
        sceVu0FMATRIX view;
        sceVu0UnitMatrix(view);
        sceVu0FVECTOR eye = {0.0f, 0.0f, 0.0f, 0.0f};
        MGSetViewMatrix(view, eye);
        sceVu0FMATRIX zero = {};
        MGSetPLight(zero, zero);
        sceVu0FVECTOR ambient = {128.0f, 128.0f, 128.0f, 128.0f};
        MGSetAmbient(ambient);
        MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
    }

    ~Draw3DFixture() {
        Draw3DSetResolvers(nullptr, nullptr);
        ClockSetUnbounded(false);
    }

    template <class Record>
    void Frame(Record record) {
        MGBeginFrame();
        record();
        MGEndFrame();
        ASSERT_TRUE(gfx::ReadbackFrame(pixels, width, height));
    }
};

// A synthetic MDT image: float4 positions, normals and uvs, materials, then the mesh section of
// strips {prim, count, material} each followed by {v, n, uv} entries.
struct MdtBuilder {
    struct Entry {
        float position[3];
        float uv[2];
    };

    struct Strip {
        unsigned           prim;
        int                material;
        std::vector<Entry> entries;
    };

    std::vector<MDT_MATERIAL> materials;
    std::vector<Strip>        strips;

    int Material(std::array<float, 4> ambient, const char *texture = "", std::array<float, 4> diffuse = {1, 1, 1, 1}) {
        MDT_MATERIAL material = {};
        std::memcpy(material.diffuse, diffuse.data(), sizeof(material.diffuse));
        std::memcpy(material.ambient, ambient.data(), sizeof(material.ambient));
        std::strncpy(material.texture, texture, sizeof(material.texture) - 1);
        materials.push_back(material);
        return static_cast<int>(materials.size()) - 1;
    }

    // A quad as a GS triangle strip: top-left, top-right, bottom-left, bottom-right.
    void Quad(float x0, float y0, float x1, float y1, float z, int material) {
        strips.push_back({
            4u, material, {{{x0, y0, z}, {0, 0}}, {{x1, y0, z}, {1, 0}}, {{x0, y1, z}, {0, 1}}, {{x1, y1, z}, {1, 1}}}
        });
    }

    std::vector<u_int> Build() const {
        std::vector<Entry> all;
        for (const Strip &strip : strips) {
            all.insert(all.end(), strip.entries.begin(), strip.entries.end());
        }
        size_t vertex_ofs = 64;
        size_t normal_ofs = vertex_ofs + all.size() * 16;
        size_t uv_ofs = normal_ofs + all.size() * 16;
        size_t info_ofs = uv_ofs + all.size() * 16;
        size_t mesh_ofs = info_ofs + materials.size() * sizeof(MDT_MATERIAL);
        size_t mesh_words = 4;
        for (const Strip &strip : strips) {
            mesh_words += 3 + strip.entries.size() * 3;
        }
        std::vector<u_int> image((mesh_ofs + mesh_words * 4 + 15) / 4 + 4, 0);
        auto              *bytes = reinterpret_cast<unsigned char *>(image.data());
        auto              *header = reinterpret_cast<MDT_HEADER *>(bytes);
        header->size = static_cast<unsigned>(image.size() * 4);
        header->vertex_num = static_cast<int>(all.size());
        header->vertex_ofs = static_cast<int>(vertex_ofs);
        header->normal[1] = static_cast<int>(normal_ofs);
        header->uv[1] = static_cast<int>(uv_ofs);
        header->info_ofs = static_cast<int>(info_ofs);
        header->mesh_ofs = static_cast<int>(mesh_ofs);
        for (size_t i = 0; i < all.size(); i++) {
            float position[4] = {all[i].position[0], all[i].position[1], all[i].position[2], 1.0f};
            float normal[4] = {0.0f, 0.0f, -1.0f, 0.0f};
            float uv[4] = {all[i].uv[0], all[i].uv[1], 1.0f, 0.0f};
            std::memcpy(bytes + vertex_ofs + i * 16, position, 16);
            std::memcpy(bytes + normal_ofs + i * 16, normal, 16);
            std::memcpy(bytes + uv_ofs + i * 16, uv, 16);
        }
        if (!materials.empty()) {
            std::memcpy(bytes + info_ofs, materials.data(), materials.size() * sizeof(MDT_MATERIAL));
        }
        auto *mesh = reinterpret_cast<u_int *>(bytes + mesh_ofs);
        mesh[2] = static_cast<u_int>(strips.size());
        u_int   *cursor = mesh + 4;
        unsigned next = 0;
        for (const Strip &strip : strips) {
            *cursor++ = strip.prim;
            *cursor++ = static_cast<u_int>(strip.entries.size());
            *cursor++ = static_cast<u_int>(strip.material);
            for (size_t i = 0; i < strip.entries.size(); i++, next++) {
                *cursor++ = next;
                *cursor++ = next;
                *cursor++ = next;
            }
        }
        return image;
    }
};

} // namespace dc::test
