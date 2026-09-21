#include "shot_firebar.hpp"

#include <cstdlib>
#include <libvu0.h>

#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "itemdata.hpp"
#include "mglib.hpp"
#include "motionmodel.hpp"
#include "shot_utils.hpp"
#include "texture.hpp"
#include "weaponelement.hpp"

#ifdef NON_MATCHING
int CSHOT_FIREBAR::Init(float *origin, float *direction, int collision_damage,
                        int element) {
    sceVu0FVECTOR step;

    direction[3] = 1.0f;
    sceVu0Normalize(direction, direction);
    sceVu0ScaleVectorXYZ(step, direction, 2.0f);

    for (int particle = 0; particle < 24; particle++) {
        int slot = particle + start_index;
        float distance = (float) particle;
        sceVu0CopyVector(position[slot], origin);
        position[slot][0] = origin[0] + step[0] * distance;
        position[slot][1] = origin[1] + step[1] * distance;
        position[slot][2] = origin[2] + step[2] * distance;
        velocity[slot][0] = direction[0] * 0.01f;
        velocity[slot][1] = direction[1] * 0.01f;
        velocity[slot][2] = direction[2] * 0.01f;
        size[slot] = 3.0f + distance * 0.3f;
        opacity[slot] = 180.0f - distance * 8.0f;
        state[slot] = 0;
    }

    union {
        int integer;
        float scalar;
    } damage_bits;
    damage_bits.integer = collision_damage;
    opacity[63] = damage_bits.scalar;
    damage[63] = element;
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_firebar", Init__13CSHOT_FIREBARFPfPfii);
#endif
#ifdef NON_MATCHING
int CSHOT_FIREBAR::Set(float *origin, float *direction, int collision_damage,
                       int element) {
    sceVu0FVECTOR step;

    direction[3] = 1.0f;
    sceVu0Normalize(direction, direction);
    sceVu0ScaleVectorXYZ(step, direction, 2.0f);

    for (int particle = 0; particle < 24; particle++) {
        int slot = particle + start_index;
        float distance = (float) particle;
        float travel_steps = distance * 0.5f + 1.0f;
        velocity[slot][0] =
            (origin[0] + step[0] * distance - position[slot][0]) / travel_steps;
        velocity[slot][1] =
            (origin[1] + step[1] * distance - position[slot][1]) / travel_steps;
        velocity[slot][2] =
            (origin[2] + step[2] * distance - position[slot][2]) / travel_steps;
        state[slot] = 0;
        size[slot] = 3.0f + distance * 0.3f + (3.0f * (float) rand()) / 2147483648.0f;
        opacity[slot] = 180.0f - distance * 8.0f;
        damage[particle] = collision_damage;
        texture_cell[particle] = element;
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_firebar", Set__13CSHOT_FIREBARFPfPfii);
#endif
void CSHOT_FIREBAR::Rset(void) {
    // A state of -1 is what stops a slot being drawn.
    for (int i = 0; i < 24; i++) {
        state[i] = -1;
    }
}
#ifdef NON_MATCHING
void CSHOT_FIREBAR::Step(void) {
    static int collision_timer = 0;
    static char initialized = 0;

    if (initialized == 0) {
        collision_timer = 0;
        initialized = 1;
    }
    collision_timer++;
    if (collision_timer >= 30) {
        collision_timer = 0;
    }

    for (int particle = 0; particle < 24; particle++) {
        if (state[particle] != -1 && state[particle] == 0) {
            opacity[particle] -= 4.0f;
            size[particle] += 0.06f;
            if (collision_timer == 0) {
                NowColData->Set(position[particle], damage[particle], 2, 4.0f, 1.0f,
                                2, 2, 0, 0);
                COLLISION_HIT *hit = &NowColData->hit[NowColData->now_hit];
                hit->owner = 5;
                hit->unk_60 = 6;
                hit->weapon_flags = NowWeaponHave->flags;
                hit->vs_monster = NowWeaponHave->vs_monster;
                hit->flags = GetWeaponElementAttr(NowWeaponHave->best_elem);
            }
            position[particle][0] += velocity[particle][0];
            position[particle][1] += velocity[particle][1];
            position[particle][2] += velocity[particle][2];
            if (opacity[particle] <= 32.0f) {
                state[particle] = -1;
            }
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_firebar", Step__13CSHOT_FIREBARFv);
#endif
#ifdef NON_MATCHING
void CSHOT_FIREBAR::Draw(void) {
    bool texture_loaded = false;

    for (int particle = 0; particle < 24; particle++) {
        if (state[particle] == -1) {
            continue;
        }
        if (!texture_loaded) {
            TexManager.ReloadTexture(Vif1Packet, 0x46);
            texture_loaded = true;
        }

        int column;
        int row;
        switch (texture_cell[particle]) {
        case WEAPON_ELEMENT_COLD:
            column = 1;
            row = 1;
            break;
        case WEAPON_ELEMENT_THUNDER:
            column = 1;
            row = 0;
            break;
        case WEAPON_ELEMENT_WIND:
            column = 0;
            row = 0;
            break;
        case WEAPON_ELEMENT_HOLY:
            column = 2;
            row = 1;
            break;
        case WEAPON_ELEMENT_FIRE:
        default:
            column = 0;
            row = 1;
            break;
        }
        set3DCellModel(position[particle], "c05w_h", size[particle], column << 7,
                       row << 7, 0x80, 0x80, (u8) (int) opacity[particle]);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_firebar", Draw__13CSHOT_FIREBARFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shot_firebar", @1211);
