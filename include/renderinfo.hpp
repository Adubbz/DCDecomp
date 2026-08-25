#pragma once

#include "common.h"

#include <libvu0.h>

/**
 * Everything a frame is drawn against, kept in one object so that a draw takes a single pointer:
   the camera, the screen it is projected onto, the lights and the fog. Most of it is derived
   rather than set — the two matrices a caller supplies are the view and the projection, and the
   rest is recomputed from them whenever either changes.

   The block from scale to far is one clip volume expressed per axis rather than four
   vectors: x, y and z each get a scale, an offset and the two bounds they are held between.
 */
struct RenderInfo {
    RenderInfo() {
        unk_314 = 0;
        unk_310 = 0;
        scissoring = 0;
        unk_31C = 0.0f;
        unk_320 = 0;
        unk_324 = 0;
        fog_b = 0.0f;
        fog_a = 0.0f;
        fog_far = 0.0f;
        fog_near = 255.0f;
        fog_blue = 255;
        fog_green = 255;
        fog_red = 255;
        unk_340 = 0;
    }

    float projection;
    int unk_04[3];
    sceVu0FMATRIX view_scaled;
    sceVu0FMATRIX screen;
    sceVu0FMATRIX view;
    sceVu0FMATRIX view_screen;
    sceVu0FMATRIX light_direction;
    sceVu0FMATRIX light_color;
    sceVu0FVECTOR ambient;
    sceVu0FVECTOR scale;
    sceVu0FVECTOR offset;
    sceVu0FVECTOR near;
    sceVu0FVECTOR far;
    sceVu0FVECTOR position;
    sceVu0FVECTOR view_position;
    float pitch;
    float yaw;
    int unk_208[2];
    sceVu0FVECTOR clip_max;
    sceVu0FVECTOR clip_min;
    sceVu0FMATRIX perspective;
    sceVu0FMATRIX viewport;
    /**
 * The plane a frame's shadow is cast onto, kept as a point and a normal, and the projection
       onto it that ShadowMatrix derives from the pair and the first light direction.
 */
    sceVu0FVECTOR shadow_point;
    sceVu0FVECTOR shadow_normal;
    sceVu0FMATRIX shadow;
    /**
 * The block a draw fills in on its way through rather than one the camera setup owns: every
       field from here to the fog is written by CFrameVu1::DrawVu1 out of the frame's own
       attributes, so what a microprogram reads here belongs to the frame being drawn and not to
       the scene. unk_320 is the exception and is a switch the caller sets.
 */
    int unk_310;
    int unk_314;
    int scissoring;
    float unk_31C;
    int unk_320;
    int unk_324;
    /**
 * Fog is applied as a + b/z, which is what makes both ends of it a division the caller never
       does: MGSetFogParm takes the two depths and the two densities and solves for the pair.
 */
    float fog_a;
    float fog_b;
    float fog_far;
    float fog_near;
    u_char fog_red;
    u_char fog_green;
    u_char fog_blue;
    u_char unk_33B;
    int unk_33C;
    int unk_340;
    int unk_344[3];
};
