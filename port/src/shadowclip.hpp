#pragma once

struct RenderInfo;

// The CPU half of CVisualShadow::CreateVUdataShadowCLIP, without the VU1 packet.
//
// Input: an MDT shadow mesh (header, vertex array, MDT_SHADOW shapes), the frame's local-to-world
// matrix and the render info (view_scaled, perspective, light_direction column 0, shadow_point,
// shadow_normal, near[2]). Output: one record per triangle facing away from the light
// (face . light <= 0 in model space), in shape order, exactly the 11 quadwords retail packs per
// triangle. Retail draws every record twice: pass 0 with ALPHA_1 = 0x8000000068 (Cs * 0x80/128 +
// Cd), pass 1 with ALPHA_1 = 0x8000000062 (Cd - Cs * 0x80/128); pass 1 records have counts
// {0, 0, 0, 1} and all five cap entries equal to cap[4] of pass 0. The VU1 program additionally
// takes the triangle flag (1 on pass 1) and the matrices CVisualMDTVu1::DrawVu1 sends.
struct ShadowClipTriangle {
    unsigned int edges[4];    // corner[0..2].edge of MDT_SVERTEX (no silhouette across that edge), then 0
    float        local[4][4]; // model-space a, b, c, c as the MDT stores them, w included
    int          counts[4];   // near-cap strip lengths: {min(n, 4), n > 4 ? 3 : 0, 0, 1}, n from the clip
    float        cap[5][4];   // near-cap polygon in clip space (perspective * eye), last clipped vertex first
};

// Writes up to capacity records for one pass and returns how many triangles the pass has.
int ShadowClipBuild(ShadowClipTriangle *out, int capacity, unsigned int *model_data, RenderInfo *info,
                    float (*matrix)[4], int pass);
