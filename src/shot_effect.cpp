#include "shot_effect.hpp"

#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "hit_machingun_effect.hpp"
#include "itemdata.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "shot_effect_pack.hpp"
#include "shot_utils.hpp"
#include "texture.hpp"

#include <cstdlib>

int GetWeaponElementAttr(int element);

/**
 * Draws the twelve projectiles of one shot.
 *
 * @mangled draw__5CSHOTFv
 * @address 0x1ABC40
 * @size 0xCC
 */
void CSHOT::draw() {
    int texture_cell = NowWeaponHave->item_no - 300;
    if (texture_cell <= 0) {
        texture_cell = 0;
    }

    for (int shot = 0; shot < 12; shot++) {
        if (used[shot] != 0) {
            set3DCellModel(pos[shot], "basefx01", unk_09[shot],
                           (texture_cell % 4) << 5, (texture_cell / 4) << 5,
                           32, 32, 128);
        }
    }
}
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @625__2);
/**
 * Advances the twelve projectiles of one shot.
 *
 * @mangled step__5CSHOTFv
 * @address 0x1ABD10
 * @size 0x204
 */
void CSHOT::step() {
    sceVu0FVECTOR hit_position;

    for (int shot = 0; shot < 12; shot++) {
        if (used[shot] == 0) {
            continue;
        }

        if (unk_280[shot] == 0) {
            SHOT_COLLISION_RESULT result =
                checkCollision(hit_position, pos[shot], vector[shot], 2, 2.0f);
            if (result == SHOT_COLLISION_NONE) {
                pos[shot][0] += vector[shot][0];
                pos[shot][1] += vector[shot][1];
                pos[shot][2] += vector[shot][2];
            } else {
                NowColData->Set(pos[shot], damage[shot], 1, 3.0f, 0.0f, 2, 2, 0, 0);
                COLLISION_HIT &hit = NowColData->hit[NowColData->now_hit];
                hit.owner = 1;
                hit.unk_60 = 0;
                hit.flags = GetWeaponElementAttr(NowWeaponHave->best_elem);
                hit.weapon_flags = NowWeaponHave->flags;
                hit.vs_monster = NowWeaponHave->vs_monster;
                used[shot] = 0;
            }
        }

        life[shot]--;
        if (life[shot] <= 0) {
            used[shot] = 0;
        }
    }
}

void CSHOT_EFFECT::Draw() {
    if (effect_data == NULL) {
        return;
    }

    TexManager.ReloadTexture(Vif1Packet, unk_A154);
    for (int slot = 0; slot < 8; slot++) {
        if (active[slot] != 0 && random_rate[slot] >= 0.0f) {
            // Drawing temporarily offsets each model by three independent random values.
            float jitter_x = random_rate[slot] * (float) rand() / 2147483648.0f;
            float jitter_y = random_rate[slot] * (float) rand() / 2147483648.0f;
            float jitter_z = random_rate[slot] * (float) rand() / 2147483648.0f;
            (void) jitter_x;
            (void) jitter_y;
            (void) jitter_z;
        }
    }
}

void CSHOT_EFFECT::Step() {
    if (effect_data == NULL) {
        return;
    }

    sceVu0FVECTOR hit_position;
    for (int slot = 0; slot < 8; slot++) {
        if (active[slot] == 0) {
            continue;
        }

        int current_phase = phase[slot];
        if (current_phase < 0 || current_phase >= 4) {
            active[slot] = 0;
            continue;
        }

        SHOT_COLLISION_RESULT result = SHOT_COLLISION_NONE;
        if (current_phase < 2) {
            result = checkCollision(hit_position, hit_position, velocity[slot],
                                    effect_data->unk_048,
                                    effect_data->radius[current_phase]);
        }

        if (life_time[slot] > 0) {
            life_time[slot]--;
        }
        if (effect_data->radius[current_phase] > 0.0f && life_time[slot] != 0) {
            int hit_index = NowColData->Set(hit_position, damage[slot], 2,
                                            effect_data->radius[current_phase], 1.0f,
                                            effect_data->unk_048, effect_data->unk_044,
                                            effect_data->unk_040, 0);
            if (hit_index != -1) {
                COLLISION_HIT &hit = NowColData->hit[hit_index];
                hit.owner = user_id[slot];
                hit.unk_60 = user_sub_id[slot];
                hit.weapon_flags = weapon_status[slot];
                hit.vs_monster = vs_monster[slot];
                hit.monster_no = user_id_2[slot];
                hit.target_kind = enemy_attribute[slot];
            }
        }

        if (phase_delay[slot] > 0) {
            phase_delay[slot]--;
        }
        if ((result != SHOT_COLLISION_NONE && current_phase == 1) ||
            (phase_delay[slot] == 0 && current_phase < 3)) {
            phase[slot]++;
            if (effect_data->motion[phase[slot]] == -1) {
                active[slot] = 0;
            }
        }
    }
}

void CSHOT_EFFECT::EndEffect() {
    for (int slot = 0; slot < 8; slot++) {
        if (active[slot] != 0 && (phase[slot] == 0 || phase[slot] == 1)) {
            phase[slot] = 2;
            if (effect_data->motion[2] == -1) {
                active[slot] = 0;
            }
        }
    }
}

void CSHOT_EFFECT::OffEffect(s32 slot) {
    if (slot != -1) {
        active[slot] = 0;
        return;
    }

    for (s32 i = 0; i < 8; i++) {
        active[i] = 0;
    }
}

int CSHOT_EFFECT::Entry(BT_SHOT_EFFECT *description, unsigned int *resource,
                        int texture_block, CDataAlloc2<1> *allocator, int slots) {
    (void) resource;
    (void) allocator;
    if (effect_data != NULL || description == NULL) {
        return 0;
    }

    effect_data = description;
    unk_A154 = texture_block;
    slot_count = slots;
    for (int slot = 0; slot < 8; slot++) {
        active[slot] = 0;
        phase[slot] = 0;
        user_id[slot] = -1;
        user_id_2[slot] = -1;
    }
    current_slot = -1;
    return 1;
}
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @899);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @900);
int CSHOT_EFFECT::Entry2(BT_SHOT_EFFECT *description, unsigned int *resource,
                         int texture_block, CDataAlloc2<1> *allocator, int slots) {
    (void) resource;
    (void) allocator;
    if (effect_data != NULL || description == NULL) {
        return 0;
    }

    effect_data = description;
    unk_A154 = texture_block;
    slot_count = slots;
    for (int slot = 0; slot < slots && slot < 8; slot++) {
        active[slot] = 0;
        phase[slot] = 0;
    }
    current_slot = -1;
    return 1;
}

void CSHOT_EFFECT::ReEntry(BT_SHOT_EFFECT *description, CDataAlloc2<1> *allocator) {
    (void) allocator;
    effect_data = description;
    for (int slot = 0; slot < 8; slot++) {
        active[slot] = 0;
        phase[slot] = 0;
        phase_delay[slot] = description != NULL ? description->life_time : 0;
    }
    current_slot = -1;
}

void CSHOT_EFFECT::SetLoop(s32 loop) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->loop[slot] = loop;
    }
}

int CSHOT_EFFECT::Set(float *position, float *target, int owner, int sub_id,
                      int source, CFrame *frame, int initial_phase) {
    (void) frame;
    current_slot = -1;
    if (effect_data == NULL) {
        return -1;
    }

    int slot = 0;
    while (slot < slot_count && active[slot] != 0) {
        slot++;
    }
    if (slot >= slot_count || slot >= 8) {
        return -1;
    }

    phase[slot] = initial_phase == -1 ? (effect_data->motion[0] == -1) : initial_phase;
    if (effect_data->unk_010 == 0) {
        position[3] = 1.0f;
        target[3] = 1.0f;
        sceVu0SubVector(velocity[slot], target, position);
        sceVu0Normalize(velocity[slot], velocity[slot]);
        sceVu0ScaleVectorXYZ(velocity[slot], velocity[slot], effect_data->speed[phase[slot]]);
    }

    active[slot] = 1;
    user_id[slot] = owner;
    user_sub_id[slot] = sub_id;
    source_id[slot] = source;
    damage[slot] = effect_data->unk_03C;
    phase_delay[slot] = effect_data->life_time;
    loop[slot] = -1;
    random_rate[slot] = -1.0f;
    life_time[slot] = -1;
    status = 0;
    current_slot = slot;
    user_id_2[slot] = -1;
    enemy_attribute[slot] = -1;
    no_sound[slot] = 0;
    wait[slot] = 0;
    wait_state[slot] = 0;
    return slot;
}
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @977__2);

void CSHOT_EFFECT::SetWait(s32 wait) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->wait[slot] = (u8) wait;
        this->wait_state[this->current_slot] = 0;
    }
}

void CSHOT_EFFECT::SetNoSound() {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->no_sound[slot] = 1;
    }
}

void CSHOT_EFFECT::SetRandomRate(float rate) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->random_rate[slot] = rate;
    }
}

void CSHOT_EFFECT::SetLifeTime(s32 life_time) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->life_time[slot] = life_time;
    }
}

void CSHOT_EFFECT::SetEnemyAttr(s32 attribute) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->enemy_attribute[slot] = attribute;
    }
}

void CSHOT_EFFECT::SetDmg(s32 damage) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->damage[slot] = damage;
    }
}

void CSHOT_EFFECT::SetAttribute(s32 attribute) {
    if (this->current_slot != -1) {
        this->effect_data->unk_040 = attribute;
    }
}

void CSHOT_EFFECT::SetWepStatus(s32 status) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->weapon_status[slot] = status;
    }
}

void CSHOT_EFFECT::SetVsMonster(s8 *effectiveness) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->vs_monster[slot] = effectiveness;
    }
}

void CSHOT_EFFECT::SetUserID2(s32 id) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->user_id_2[slot] = (s16) id;
    }
}

void CSHOT_EFFECT::Initialize() {
    effect_data = NULL;
    for (s32 i = 0; i < 8; i++) {
        active[i] = 0;
        user_id[i] = -1;
        user_sub_id[i] = -1;
        slot_count = 4;
    }
    current_slot = -1;
}

int CSHOT_EFFECT_PACK::Entry(BT_SHOT_EFFECT *description, unsigned int *resource,
                             int texture_block, CDataAlloc2<1> *allocator,
                             int slots) {
    for (int index = 0; index < 5; index++) {
        if (effect[index].effect_data == description) {
            return index;
        }
    }
    for (int index = 0; index < 5; index++) {
        if (effect[index].Entry(description, resource, texture_block, allocator, slots) != 0) {
            return index;
        }
    }
    return -1;
}

void CSHOT_EFFECT_PACK::SetUserID2(s32 id) {
    if (current_effect != -1) {
        effect[current_effect].SetUserID2(id);
    }
}

void CSHOT_EFFECT_PACK::SetDmg(s32 damage) {
    if (current_effect != -1) {
        effect[current_effect].SetDmg(damage);
    }
}

/**
 * Starts one rapid-fire projectile from a position along a heading.
 *
 * @mangled Set__15CSHOT_MACHINGUNFPfPfii
 * @address 0x1AE660
 * @size 0xEC
 */
int CSHOT_MACHINGUN::Set(float *origin, float *movement, int shot_damage,
                         int shot_attribute) {
    int slot = 0;
    while (slot < 16 && unk_280[slot] != 0) {
        slot++;
    }
    if (slot == 16) {
        return -1;
    }

    sceVu0CopyVector(position[slot], origin);
    sceVu0CopyVector(velocity[slot], movement);
    unk_200[slot] = shot_damage;
    unk_240[slot] = shot_attribute;
    unk_280[slot] = 1;
    return slot;
}
/**
 * Advances the sixteen rapid-fire projectiles.
 *
 * @mangled Step__15CSHOT_MACHINGUNFv
 * @address 0x1AE750
 * @size 0x230
 */
extern "C" CHIT_MACHINGUN_EFFECT OzumondShotEffect;

void CSHOT_MACHINGUN::Step() {
    for (int slot = 0; slot < 16; slot++) {
        if (unk_280[slot] <= 0) {
            continue;
        }

        unk_280[slot]++;
        if (unk_280[slot] >= 240) {
            unk_280[slot] = 0;
            continue;
        }

        SHOT_COLLISION_RESULT result =
            checkCollision(position[slot], position[slot], velocity[slot], 2, 2.0f);
        if (result == SHOT_COLLISION_MAP) {
            OzumondShotEffect.Set(position[slot]);
            unk_280[slot] = 0;
        } else if (result == SHOT_COLLISION_MONSTER) {
            NowColData->Set(position[slot], unk_200[slot], 2, 4.0f, 1.0f, 2, 2, 0, 0);
            COLLISION_HIT &hit = NowColData->hit[NowColData->now_hit];
            hit.flags = GetWeaponElementAttr(NowWeaponHave->best_elem);
            hit.vs_monster = NowWeaponHave->vs_monster;
            hit.weapon_flags = NowWeaponHave->flags;
            hit.owner = 5;
            hit.unk_60 = 6;
            unk_280[slot] = 0;
        }

        position[slot][0] += velocity[slot][0];
        position[slot][1] += velocity[slot][1];
        position[slot][2] += velocity[slot][2];
    }
}
