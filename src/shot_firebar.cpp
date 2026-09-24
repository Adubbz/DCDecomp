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

int CSHOT_FIREBAR::Init(float *origin, float *direction, int collision_damage, int element) {
    sceVu0FVECTOR step;

    direction[3] = 1.0f;
    sceVu0Normalize(direction, direction);
    sceVu0ScaleVectorXYZ(step, direction, 2.0f);

    for (int particle = 0; particle < 24; particle++) {
        sceVu0CopyVector(position[particle + start_index], origin);
        position[particle + start_index][0] = origin[0] + step[0] * (float) particle;
        position[particle + start_index][1] = origin[1] + step[1] * (float) particle;
        position[particle + start_index][2] = origin[2] + step[2] * (float) particle;
        velocity[particle + start_index][0] = 0.01f * direction[0];
        velocity[particle + start_index][1] = 0.01f * direction[1];
        velocity[particle + start_index][2] = 0.01f * direction[2];
        size[particle + start_index] = 3.0f + 0.3f * (float) particle;
        opacity[particle + start_index] = 180.0f - 8.0f * (float) particle;
        state[particle + start_index] = 0;
    }

    init_damage = collision_damage;
    init_element = element;
    return -1;
}

int CSHOT_FIREBAR::Set(float *origin, float *direction, int collision_damage, int element) {
    sceVu0FVECTOR step;

    direction[3] = 1.0f;
    sceVu0Normalize(direction, direction);
    sceVu0ScaleVectorXYZ(step, direction, 2.0f);

    // Each particle travels from where it is to its place along the new stream, the farther
    // ones over more steps.
    for (int particle = 0; particle < 24; particle++) {
        velocity[particle + start_index][0] =
            (origin[0] + step[0] * (float) particle - position[particle + start_index][0]) /
            (1.0f + 0.5f * (float) particle);
        velocity[particle + start_index][1] =
            (origin[1] + step[1] * (float) particle - position[particle + start_index][1]) /
            (1.0f + 0.5f * (float) particle);
        velocity[particle + start_index][2] =
            (origin[2] + step[2] * (float) particle - position[particle + start_index][2]) /
            (1.0f + 0.5f * (float) particle);
        state[particle + start_index] = 0;
        size[particle + start_index] =
            3.0f + 0.3f * (float) particle + 3.0f * (float) rand() / 2147483648.0f;
        opacity[particle + start_index] = 180.0f - 8.0f * (float) particle;
        damage[particle] = collision_damage;
        texture_cell[particle] = element;
    }
    return -1;
}
void CSHOT_FIREBAR::Rset(void) {
    // A state of -1 is what stops a slot being drawn.
    for (int i = 0; i < 24; i++) {
        state[i] = -1;
    }
}
void CSHOT_FIREBAR::Step(void) {
    static int msg_cnt = 0;

    // The particles hit what they touch once every thirty steps.
    msg_cnt++;
    if (msg_cnt >= 30) {
        msg_cnt = 0;
    }

    for (int particle = 0; particle < 24; particle++) {
        if (state[particle] != -1 && state[particle] == 0) {
            opacity[particle] -= 4.0f;
            size[particle] += 0.06f;
            if (msg_cnt == 0) {
                NowColData->Set(position[particle], damage[particle], 2, 4.0f, 1.0f, 2, 2, 0, 0);
                NowColData->SetUserID(5, 6);
                NowColData->hit[NowColData->now_hit].weapon_flags = NowWeaponHave->flags;
                NowColData->hit[NowColData->now_hit].vs_monster = NowWeaponHave->vs_monster;
                s8 elem = NowWeaponHave->best_elem;
                CCollisionData *attr_col = NowColData;
                attr_col->hit[attr_col->now_hit].flags = GetWeaponElementAttr(elem);
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
