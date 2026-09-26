#include "itembombeffect.hpp"

#include <cmath>

#include "camera.hpp"
#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "itemdata.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "shot_freefuncs.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

extern CItemBombEffect *NowBombEffect;
extern CShockWave *NowShockWave;

#ifdef NON_MATCHING
extern ITEM_DATA ITEM_LIST[];

static const int bomb_uv[4][2] = {{0, 0}, {1, 0}, {0, 1}, {1, 1}};
#endif

/**
 * Reports whether one running item is still in use.
 *
 * @mangled checkItemUsed__Fi
 * @address 0x1D5580
 * @size 0x16C
 */
int checkItemUsed(int slot) {
    int character;
    float water_now;
    float water_max;
    int condition;
    s16 hp;
    s16 max_hp;

    character = UserStatus->cur_chara;
    water_now = UserStatus->water_now[character];
    water_max = UserStatus->water_max[character];
    hp = UserStatus->hp[character];
    max_hp = UserStatus->max_hp[character];
    condition = UserStatus->unk_42C8[character];
    int usable = 1;
    ITEM_PACK *pack = &UserStatus->item_pack;
    s16 item = pack->quick_item_slot[slot];

    if (item == -1) {
        return 0;
    }
    switch (item) {
    case 0x91:
    case 0x92:
    case 0x93:
        if (!(0.2f + water_now < water_max)) {
            usable = 0;
        }
        break;
    case 0x97:
        if ((condition & 0x10) == 0) {
            usable = 0;
        }
        break;
    case 0x99:
        if ((condition & 0x40) == 0) {
            usable = 0;
        }
        break;
    case 0x9A:
        if ((condition & 0x74) == 0) {
            usable = 0;
        }
        break;
    case 0x94:
    case 0x95:
    case 0x9B:
    case 0xAA:
        if (hp >= max_hp) {
            usable = 0;
        }
        break;
    }
    return usable;
}

/**
 * Spends one use of a running item.
 *
 * @mangled usedActiveItem__FP11CUserStatusi
 * @address 0x1D56F0
 * @size 0x248
 * @unknownret
 */
#ifdef NON_MATCHING
void usedActiveItem(CUserStatus *status, int item) {
    int character = status->cur_chara;

    if (item == 0xAA) {
        status->AddNowLife(character, 200, 100.0f);
        status->AddDrink(status->cur_chara, -20, 5.0f);
        return;
    }

    ITEM_DATA *item_data = &ITEM_LIST[item - 0x51];
    if ((item_data->kind_flags & 4) != 0) {
        int used_hp_value = 0;
        if ((item_data->use_flags & 0x40) != 0) {
            status->AddNowLife(character, item_data->vol, 100.0f);
            used_hp_value = 1;
        }
        if ((item_data->use_flags & 0x80) != 0) {
            s16 *volume = &item_data->vol;
            status->AddDrink(status->cur_chara, volume[used_hp_value], 5.0f);
        }
    }

    if ((item_data->kind_flags & 1) != 0) {
        if ((item_data->use_flags & 0x1000) != 0) {
            BtSetStatusErr(8);
            SndSePlay(0x6F, -1, 0);
        }
        if ((item_data->use_flags & 0x20000) != 0 &&
            (status->unk_42C8[character] & 0x40) != 0) {
            status->unk_42C8[character] = 0;
        }
        if ((item_data->use_flags & 0x8000) != 0 &&
            (status->unk_42C8[character] & 0x10) != 0) {
            status->unk_42C8[character] = 0;
        }
        if ((item_data->use_flags & 0x3C000) != 0) {
            status->unk_42C8[character] = 0;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/itembombeffect", usedActiveItem__FP11CUserStatusi);
#endif

/**
 * Starts a bomb effect at a position and gives back the slot it took.
 *
 * @mangled SetBombEffect__FPfiif
 * @address 0x1D5940
 * @size 0x1F0
 */
int SetBombEffect(float *position, int owner, int damage, float scale) {
    int collision_slot = -1;

    for (int effect_no = 0; effect_no < 3; effect_no++) {
        if (NowBombEffect[effect_no].CheckBomb() != 0) {
            continue;
        }

        NowBombEffect[effect_no].SetBomb(position, scale);
        SndSePlay(0x6C, -1, 0);
        collision_slot = NowColData->Set(position, damage, (int) (45.0f * scale), 20.0f * scale,
                                        0.0f, owner, 3, 0, 0);
        if (collision_slot != -1) {
            CCollisionData *collision = NowColData;
            collision->hit[collision->now_hit].unk_70 = 10;
            collision->hit[collision->now_hit].unk_74 = 10;
        }

        if (scale > 1.0f) {
            CShockWave *wave = NowShockWave;
            sceVu0CopyVector(wave->position, position);
            wave->position[3] = 1.0f;
            wave->base_radius = wave->radius_scale = 30.0f * scale;
            wave->radius = 0.0f;
            wave->expand_steps = 15.0f * scale;
            wave->phase = 0.0f;
            wave->alpha = 0.0f;
            wave->unk_28 = 1;
        }
        break;
    }
    return collision_slot;
}

/**
 * Draws the bomb's blast and its shock wave.
 *
 * @mangled Draw__15CItemBombEffectFP7CCamera
 * @address 0x1D5B30
 * @size 0x374
 */
#ifdef NON_MATCHING
void CItemBombEffect::Draw(CCamera *camera) {
    sceVu0FVECTOR camera_position;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR world;
    int top_left[4];
    int top_right[4];
    int bottom_left[4];
    int bottom_right[4];
    sceGsAlpha alpha = mgAlpha;
    sceGsZbuf zbuffer = mgZBuffer;

    camera->GetPos(camera_position);
    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    MGSetGsALPHA(&alpha);
    zbuffer.bits.zmsk = 1;
    MGSetGsZBUF(&zbuffer);

    for (int effect_no = 0; effect_no < 5; effect_no++) {
        if (active[effect_no] != 1 || counters[effect_no] < 0) {
            continue;
        }

        int cell = effect_no < 3 ? effect_no : 3;
        CRect_i_ source(bomb_uv[cell][0] << 6, bomb_uv[cell][1] << 6, 0x40, 0x40);
        direction[0] = camera_position[0] - positions[effect_no][0];
        direction[1] = 0.0f;
        direction[2] = camera_position[2] - positions[effect_no][2];
        direction[3] = 0.0f;
        sceVu0Normalize(direction, direction);
        float distance = effect_no * 5.0f + counters[effect_no] * 2.0f;
        direction[0] *= distance;
        direction[2] *= distance;
        world[0] = positions[effect_no][0] + direction[0];
        world[1] = positions[effect_no][1] + direction[1];
        world[2] = positions[effect_no][2] + direction[2];
        world[3] = 1.0f;

        float size = sizes[effect_no] * scale;
        if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) != 1) {
            continue;
        }
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        top_right[3] = top_left[3];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];
        bottom_left[3] = bottom_right[3];
        set3DSprite(Vif1Packet, TexManager.GetTexture("bomb_ex", -1), source, top_left, top_right,
                    bottom_left, bottom_right, (u8) alphas[effect_no]);
    }

    MGSetGsALPHA(NULL);
    MGSetGsZBUF(NULL);
}
#else
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Draw__15CItemBombEffectFP7CCamera);
#endif
INCLUDE_RODATA("asm/nonmatchings/itembombeffect", @1169__2);

/**
 * Advances the bomb effect by a frame.
 *
 * @mangled Step__15CItemBombEffectFv
 * @address 0x1D5EB0
 * @size 0x1F0
 */
void CItemBombEffect::Step(void) {
    for (int effect_no = 0; effect_no < 5; effect_no++) {
        if (active[effect_no] != 1) {
            continue;
        }

        switch (phases[effect_no]) {
            case 0:
                counters[effect_no]++;
                sizes[effect_no] += 2.0f;
                alphas[effect_no] += 8.0f;
                if (counters[effect_no] >= 3) {
                    counters[effect_no] = 0;
                    phases[effect_no]++;
                }
                break;
            case 1:
                counters[effect_no]++;
                sizes[effect_no] += 1.0f;
                alphas[effect_no] += 8.0f;
                if (counters[effect_no] >= 4) {
                    counters[effect_no] = 0;
                    phases[effect_no]++;
                }
                break;
            case 2:
                counters[effect_no]++;
                sizes[effect_no] += 0.3f;
                alphas[effect_no] -= 3.0f;
                if (counters[effect_no] >= 20) {
                    counters[effect_no] = 0;
                    phases[effect_no]++;
                }
                break;
            case 3:
                counters[effect_no]++;
                sizes[effect_no] += 0.1f;
                alphas[effect_no] -= 2.0f;
                if (counters[effect_no] >= 40) {
                    active[effect_no] = 0;
                }
                break;
        }
    }
}

/**
 * Places the bomb's five blast puffs around a position.
 *
 * @mangled SetBomb__15CItemBombEffectFPff
 * @address 0x1D60A0
 * @size 0xBC
 */
void CItemBombEffect::SetBomb(float *position, float scale) {
    for (int effect_no = 0; effect_no < 5; effect_no++) {
        sceVu0CopyVector(positions[effect_no], position);
        phases[effect_no] = 0;
        counters[effect_no] = -(effect_no * 3);
        alphas[effect_no] = 128.0f;
        sizes[effect_no] = 20.0f;
        active[effect_no] = 1;
    }
    this->scale = scale;
    phases[0] = 2;
    phases[1] = 1;
}

/**
 * Reports whether the bomb effect is still running.
 *
 * @mangled CheckBomb__15CItemBombEffectFv
 * @address 0x1D6160
 * @size 0x48
 */
int CItemBombEffect::CheckBomb(void) {
    for (int effect_no = 0; effect_no < 5; effect_no++) {
        if (active[effect_no] != 0) {
            return 1;
        }
    }
    return 0;
}

/**
 * Clears the bomb effect.
 *
 * @mangled Initialize__15CItemBombEffectFv
 * @address 0x1D61B0
 * @size 0x30
 */
void CItemBombEffect::Initialize(void) {
    for (int effect_no = 0; effect_no < 5; effect_no++) {
        active[effect_no] = 0;
    }
}

/**
 * Draws the expanding shock-wave ring.
 *
 * @mangled Draw__10CShockWaveFP7CCamera
 * @address 0x1D61E0
 * @size 0x2F8
 */
#ifdef NON_MATCHING
void CShockWave::Draw(CCamera *camera) {
    if (unk_28 == 0) {
        return;
    }

    sceVu0FVECTOR camera_position;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR corner[4];
    int screen[4][4];
    camera->GetPos(camera_position);
    direction[0] = camera_position[0] - position[0];
    direction[1] = 0.0f;
    direction[2] = camera_position[2] - position[2];
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);
    direction[0] *= 10.0f;
    direction[2] *= 10.0f;

    for (int i = 0; i < 4; i++) {
        sceVu0CopyVector(corner[i], position);
    }
    corner[0][0] -= radius;
    corner[0][2] -= radius;
    corner[1][0] += radius;
    corner[1][2] -= radius;
    corner[2][0] -= radius;
    corner[2][2] += radius;
    corner[3][0] += radius;
    corner[3][2] += radius;

    if (MGRotTransPers(screen[0], corner[0], 0) == 0 ||
        MGRotTransPers(screen[1], corner[1], 0) == 0 ||
        MGRotTransPers(screen[2], corner[2], 0) == 0 ||
        MGRotTransPers(screen[3], corner[3], 0) == 0) {
        return;
    }

    sceGsAlpha blend = mgAlpha;
    blend.bits.a = 0;
    blend.bits.b = 2;
    blend.bits.c = 0;
    blend.bits.d = 1;
    MGSetGsALPHA(&blend);
    sceGsZbuf zbuffer = mgZBuffer;
    zbuffer.bits.zmsk = 1;
    MGSetGsZBUF(&zbuffer);
    CRect_i_ source(0x80, 0, 0x40, 0x40);
    set3DSprite(Vif1Packet, TexManager.GetTexture("bomb_ex", -1), source, screen[0], screen[1],
                screen[2], screen[3], (u8) alpha);
    MGSetGsALPHA(NULL);
    MGSetGsZBUF(NULL);
}
#else
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Draw__10CShockWaveFP7CCamera);
#endif

/**
 * Expands and fades the shock-wave ring by a frame.
 *
 * @mangled Step__10CShockWaveFv
 * @address 0x1D64E0
 * @size 0xD8
 */
void CShockWave::Step(void) {
    if (unk_28 == 0) {
        return;
    }

    const float half_pi = 1.5707964f;
    if (phase < half_pi) {
        phase += half_pi / expand_steps;
        float envelope = sinf(phase);
        alpha = 160.0f * envelope;
        radius = base_radius + radius_scale * envelope;
    }
    if (phase >= half_pi) {
        alpha -= 5.0f;
        if (alpha <= 0.0f) {
            alpha = 0.0f;
            unk_28 = 0;
        }
    }
}
