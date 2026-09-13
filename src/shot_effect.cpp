#include "shot_effect.hpp"

#include "collisiondata.hpp"
#include "shot_effect_pack.hpp"

typedef CDataAlloc2<1> CDataAlloc2_1_;

INCLUDE_ASM("asm/nonmatchings/shot_effect", draw__5CSHOTFv);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @625__2);
INCLUDE_ASM("asm/nonmatchings/shot_effect", step__5CSHOTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Draw__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Step__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", EndEffect__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", OffEffect__12CSHOT_EFFECTFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @899);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @900);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/shot_effect", ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_);
void CSHOT_EFFECT::SetLoop(s32 loop) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A0B0[slot] = loop;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__12CSHOT_EFFECTFPfPfiiiP6CFramei);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @977__2);
void CSHOT_EFFECT::SetWait(s32 wait) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A138[slot] = (u8) wait;
        this->unk_A140[this->unk_A150] = 0;
    }
}
void CSHOT_EFFECT::SetNoSound() {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A130[slot] = 1;
    }
}
void CSHOT_EFFECT::SetRandomRate(float rate) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A0D0[slot] = rate;
    }
}
void CSHOT_EFFECT::SetLifeTime(s32 life_time) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A0F0[slot] = life_time;
    }
}
void CSHOT_EFFECT::SetEnemyAttr(s32 attribute) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A110[slot] = attribute;
    }
}
void CSHOT_EFFECT::SetDmg(s32 damage) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A010[slot] = damage;
    }
}
void CSHOT_EFFECT::SetAttribute(s32 attribute) {
    if (this->unk_A150 != -1) {
        this->unk_0000->unk_040 = attribute;
    }
}
void CSHOT_EFFECT::SetWepStatus(s32 status) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A030[slot] = status;
    }
}
void CSHOT_EFFECT::SetVsMonster(s8 *effectiveness) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A090[slot] = effectiveness;
    }
}
void CSHOT_EFFECT::SetUserID2(s32 id) {
    s32 slot;

    slot = this->unk_A150;
    if (slot != -1) {
        this->unk_A060[slot] = (s16) id;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Initialize__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetUserID2__17CSHOT_EFFECT_PACKFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetDmg__17CSHOT_EFFECT_PACKFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__15CSHOT_MACHINGUNFPfPfii);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Step__15CSHOT_MACHINGUNFv);
