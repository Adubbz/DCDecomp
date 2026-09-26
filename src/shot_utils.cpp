#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 604

#include "shot_utils.hpp"

#include <cstdio>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dranmapfield.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "monstorunit.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

#ifdef NON_MATCHING
SHOT_COLLISION_RESULT checkCollision(float *hit_position, float *position, float *movement,
                                     s32 target_mode, float radius) {
    WorkBuffer__2->used = 0;
    CCPoly *polygons = (CCPoly *) WorkBuffer__2->Alloc(0x500);
    int polygon_count = setCollisionData(NowDngMap, polygons, position, 20.0f, 1.5f);
    if (polygon_count >= 256) {
        printf("over col poly! %d\n", polygon_count);
    }

    sceVu0FVECTOR destination = {
        position[0] + movement[0],
        position[1] + movement[1],
        position[2] + movement[2],
        0.0f,
    };

    if (target_mode != 2) {
        sceVu0FVECTOR player_position;
        float player_height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};

        sceVu0CopyVector(player_position, CharaMain.pos);
        player_position[1] += player_height[UserStatus->cur_chara];
        if (DistVector(player_position, destination) <= radius + 6.0f) {
            sceVu0CopyVector(hit_position, player_position);
            return SHOT_COLLISION_PLAYER;
        }
    }

    if (target_mode != 1) {
        for (int monster_no = 0; monster_no < 16; monster_no++) {
            MONSTOR *monster = &NowMonstorUnit->monster[monster_no];
            if (monster->state == -1 || monster->unk_0D4 == 0) {
                continue;
            }
            MONSTOR_EFFECT_STATE *effect = &NowMonstorUnit->effect[monster_no];
            for (int sphere_no = 0; sphere_no < 16; sphere_no++) {
                if (effect->timer[sphere_no] != 0 &&
                    DistVector(effect->position[sphere_no], position) <=
                        radius + effect->radius[sphere_no]) {
                    sceVu0CopyVector(hit_position, effect->position[sphere_no]);
                    return SHOT_COLLISION_MONSTER;
                }
            }
        }
    }

    int hit = CheckHit(polygons, polygon_count, position, destination, hit_position, 1, 4);
    if (hit >= 0) {
        int field_no = polygons[hit].attr.unk_44;
        if (field_no > 0 && field_no < 13) {
            DRAN_MAP_FIELD_SET *field_set = (DRAN_MAP_FIELD_SET *) NowDranMapField;
            if (field_set->state[field_no] >= 2) {
                field_set->state[field_no]--;
            }
        }
        return SHOT_COLLISION_MAP;
    }

    sceVu0CopyVector(hit_position, position);
    return SHOT_COLLISION_NONE;
}
#else
INCLUDE_ASM("asm/nonmatchings/shot_utils", checkCollision__FPfPfPfif);
#endif
void set3DCellModel(float *world, char *texture_name, float size, s32 x, s32 y, s32 width,
                    s32 height, u8 blend) {
    sceVu0IVECTOR top_left;
    sceVu0IVECTOR top_right;
    sceVu0IVECTOR bottom_left;
    sceVu0IVECTOR bottom_right;
    CTexture *texture = TexManager.GetTexture(texture_name, -1);

    world[3] = 1.0f;
    // The sprite stands twice as wide as it is tall.
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) == 1) {
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];
        set3DSprite(Vif1Packet, texture, CRect_i_(x, y, width, height), top_left, top_right,
                    bottom_left, bottom_right, blend);
    }
}
