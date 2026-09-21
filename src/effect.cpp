#include "effect.hpp"

#include <libgraph.h>
#include <libvu0.h>

#include "mathutil.hpp"
#include "mglib.hpp"
#include "snd.hpp"

void C3DSprite::Draw(void) {
    if (texture == NULL) {
        return;
    }

    position[3] = 1.0f;
    int top_left[4];
    int bottom_right[4];
    if (MGRotTransPers3DSprite(top_left, bottom_right, position, half_width, half_height, 0) == 0) {
        return;
    }

    sceGsAlpha alpha = mgAlpha;
    if (alpha_blend > 0) {
        alpha.bits.a = 0;
        alpha.bits.b = 2;
        alpha.bits.c = 0;
        alpha.bits.d = 1;
        MGSetGsALPHA(&alpha);
    }
    if (disable_z_write != 0) {
        sceGsZbuf zbuffer = mgZBuffer;
        zbuffer.bits.zmsk = 1;
        MGSetGsZBUF(&zbuffer);
    }

    set3DSprite(GetVif1Packet(), texture, texel, top_left, bottom_right, &colour);
    if (alpha_blend != 0) {
        MGSetGsALPHA(&mgAlpha);
    }
    if (disable_z_write != 0) {
        MGSetGsZBUF(&mgZBuffer);
    }
}

#ifdef NON_MATCHING
void C3DSprite::Initialize(void) {
    texture = NULL;
    texel = CRect_i_(0, 0, 0, 0);
    colour.r = 128;
    colour.g = 128;
    colour.b = 128;
    colour.a = 128;
    alpha_blend = 0;
    disable_z_write = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/effect", Initialize__9C3DSpriteFv);
#endif

void CEffect::SetEffect(CEffectParam *parameters) {
    active = 1;
    frame = 0;
    draw_mode = (s16) parameters->draw_mode;
    lifetime = (s16) parameters->lifetime;
    position_oscillation_flags = parameters->position_oscillation_flags;
    scale_oscillation_flags = parameters->scale_oscillation_flags;
    width = parameters->width;
    height = parameters->height;
    sceVu0CopyVector(position, parameters->position);
    position[3] = 1.0f;
    sceVu0CopyVector(velocity, parameters->velocity);
    sceVu0CopyVector(acceleration, parameters->acceleration);
    sceVu0CopyVector(position_oscillation_scale, parameters->position_oscillation_scale);
    sceVu0CopyVector(position_oscillation_rate, parameters->position_oscillation_rate);
    sceVu0CopyVector(scale, parameters->scale);
    sceVu0CopyVector(scale_velocity, parameters->scale_velocity);
    sceVu0CopyVector(scale_oscillation_scale, parameters->scale_oscillation_scale);
    sceVu0CopyVector(scale_oscillation_rate, parameters->scale_oscillation_rate);
    opacity_mode = parameters->opacity_mode;
    render_flags = parameters->render_flags;
    texture = parameters->texture;
    texel = parameters->texel;
    texture_frames = parameters->texture_frames;
    texture_frame_period = parameters->texture_frame_period;

    switch (opacity_mode) {
        case 0:
            opacity = parameters->opacity;
            opacity_step = 0.0f;
            break;
        case 1:
            opacity = parameters->opacity;
            opacity_step = (1.0f - parameters->opacity) / (float) lifetime;
            break;
        case 2:
            opacity = parameters->opacity;
            opacity_step = -parameters->opacity / (float) lifetime;
            break;
    }
}

#ifdef NON_MATCHING
void CEffect::Step(int unused) {
    (void) unused;
    if (active == 0) {
        return;
    }

    frame++;
    if (lifetime < frame) {
        frame = 0;
        active = 0;
    }
    sceVu0AddVector(position, position, velocity);
    sceVu0AddVector(velocity, velocity, acceleration);
    if ((position_oscillation_flags & 1) != 0) {
        float phase = (float) frame;
        for (int axis = 0; axis < 3; axis++) {
            if (position_oscillation_scale[axis] > 0.0f) {
                position[axis] += position_oscillation_scale[axis] *
                                  Sinf(phase * position_oscillation_rate[axis]);
            }
        }
    }

    scale[0] += scale_velocity[0];
    scale[1] += scale_velocity[1];
    if ((scale_oscillation_flags & 1) != 0) {
        float phase = (float) frame;
        for (int axis = 0; axis < 2; axis++) {
            if (scale_oscillation_scale[axis] > 0.0f) {
                scale[axis] += scale_oscillation_scale[axis] *
                               Sinf(phase * scale_oscillation_rate[axis]);
            }
        }
    }

    opacity += opacity_step;
    if (opacity < 0.0f) {
        opacity = 0.0f;
    }
    if (opacity > 1.0f) {
        opacity = 1.0f;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/effect", Step__7CEffectFi);
#endif

#ifdef NON_MATCHING
void CEffect::Draw(void) {
    if (active == 0 || texture == NULL) {
        return;
    }

    position[3] = 1.0f;
    float sprite_width = scale[0] * width;
    float sprite_height = scale[1] * height;
    int screen[4][4];
    if (draw_mode == 0) {
        if (MGRotTransPers3DSprite(screen[0], screen[1], position, sprite_width, sprite_height,
                                   0) == 0) {
            return;
        }
    } else {
        float corner[4][4];
        for (int i = 0; i < 4; i++) {
            sceVu0CopyVector(corner[i], position);
        }
        float half_width = sprite_width / 2.0f;
        float half_height = sprite_height / 2.0f;
        corner[0][0] -= half_width;
        corner[0][2] -= half_height;
        corner[1][0] += half_width;
        corner[1][2] -= half_height;
        corner[2][0] -= half_width;
        corner[2][2] += half_height;
        corner[3][0] += half_width;
        corner[3][2] += half_height;
        for (int i = 0; i < 4; i++) {
            if (MGRotTransPers(screen[i], corner[i], 0) == 0) {
                return;
            }
        }
    }

    if (render_flags != 0) {
        sceGsZbuf zbuffer = mgZBuffer;
        zbuffer.bits.zmsk = 1;
        MGSetGsZBUF(&zbuffer);
        sceGsAlpha alpha = mgAlpha;
        if ((render_flags & 1) != 0) {
            alpha.bits.a = 0;
            alpha.bits.b = 2;
            alpha.bits.c = 0;
            alpha.bits.d = 1;
        }
        if ((render_flags & 2) != 0) {
            alpha.bits.a = 2;
            alpha.bits.b = 0;
            alpha.bits.c = 0;
            alpha.bits.d = 1;
        }
        MGSetGsALPHA(&alpha);
    }

    // Texture changes lag their corresponding source rectangle by one draw.
    CTexture *draw_texture = texture;
    CRect_i_ draw_texel = texel;
    CEffectTextureFrame *animation = texture_frames;
    if (animation != NULL) {
        int animation_frame = frame;
        if (texture_frame_period > 0) {
            animation_frame %= texture_frame_period;
        }
        while (animation != NULL) {
            if (animation_frame < animation->end_frame) {
                texture = animation->texture;
                draw_texel = animation->texel;
                break;
            }
            animation = animation->next;
        }
    }

    spRGBA colour = {0x68, 0x80, 0x80, (u8) (opacity * 128.0f)};
    if (draw_mode == 0) {
        set3DSprite(GetVif1Packet(), draw_texture, draw_texel, screen[0], screen[1], &colour);
    } else {
        set3DSprite(GetVif1Packet(), draw_texture, draw_texel, screen[0], screen[1], screen[2],
                    screen[3], &colour);
    }
    if (render_flags != 0) {
        MGSetGsZBUF(NULL);
        MGSetGsALPHA(NULL);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/effect", Draw__7CEffectFv);
#endif

#ifdef NON_MATCHING
void CEffectParam::Initialize(void) {
    lifetime = 0;
    draw_mode = 0;
    position_oscillation_flags = 0;
    scale_oscillation_flags = 0;
    opacity_mode = 0;
    opacity = 1.0f;
    render_flags = 0;
    width = 0.0f;
    height = 0.0f;
    position[0] = 0.0f;
    position[1] = 0.0f;
    position[2] = 0.0f;
    position[3] = 0.0f;
    sceVu0CopyVector(velocity, position);
    sceVu0CopyVector(acceleration, position);
    sceVu0CopyVector(position_oscillation_scale, position);
    sceVu0CopyVector(position_oscillation_rate, position);
    scale[0] = 1.0f;
    scale[1] = 1.0f;
    sceVu0CopyVector(scale_velocity, position);
    sceVu0CopyVector(scale_oscillation_scale, position);
    sceVu0CopyVector(scale_oscillation_rate, position);
    texture = NULL;
    texel = CRect_i_(0, 0, 0, 0);
    texture_frame_period = 0;
    texture_frames = NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/effect", Initialize__12CEffectParamFv);
#endif

#ifdef NON_MATCHING
void CEffect::Initialize(void) {
    active = 0;
    frame = 0;
    lifetime = 0;
    draw_mode = 0;
    position_oscillation_flags = 0;
    scale_oscillation_flags = 0;
    opacity_mode = 0;
    opacity = 1.0f;
    render_flags = 0;
    opacity_step = 0.0f;
    width = 0.0f;
    height = 0.0f;
    position[0] = 0.0f;
    position[1] = 0.0f;
    position[2] = 0.0f;
    position[3] = 0.0f;
    sceVu0CopyVector(velocity, position);
    sceVu0CopyVector(acceleration, position);
    sceVu0CopyVector(position_oscillation_scale, position);
    sceVu0CopyVector(position_oscillation_rate, position);
    scale[0] = 1.0f;
    scale[1] = 1.0f;
    sceVu0CopyVector(scale_velocity, position);
    sceVu0CopyVector(scale_oscillation_scale, position);
    sceVu0CopyVector(scale_oscillation_rate, position);
    texture = NULL;
    texel = CRect_i_(0, 0, 0, 0);
    texture_frames = NULL;
    texture_frame_period = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/effect", Initialize__7CEffectFv);
#endif
