#include "shot_effect.hpp"

#include "collisiondata.hpp"
#include "nowload.hpp"
#include "shot_effect_pack.hpp"
#include "texture.hpp"

#include <cstdlib>

INCLUDE_ASM("asm/nonmatchings/shot_effect", draw__5CSHOTFv);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @625__2);
INCLUDE_ASM("asm/nonmatchings/shot_effect", step__5CSHOTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Draw__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Step__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", EndEffect__12CSHOT_EFFECTFv);
void CSHOT_EFFECT::OffEffect(s32 slot) {
    if (slot != -1) {
        active[slot] = 0;
        return;
    }

    for (s32 i = 0; i < 8; i++) {
        active[i] = 0;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @899);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @900);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/shot_effect", ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_);
void CSHOT_EFFECT::SetLoop(s32 loop) {
    s32 slot;

    slot = this->current_slot;
    if (slot != -1) {
        this->loop[slot] = loop;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__12CSHOT_EFFECTFPfPfiiiP6CFramei);
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
        unk_A050[i] = -1;
        unk_A070[i] = -1;
        slot_count = 4;
    }
    current_slot = -1;
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
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
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__15CSHOT_MACHINGUNFPfPfii);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Step__15CSHOT_MACHINGUNFv);
