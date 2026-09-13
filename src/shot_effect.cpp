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
void CSHOT_EFFECT::SetLoop(s32 arg0) {
    s32 temp_6;

    temp_6 = this->unk_A150;
    if (temp_6 != -1) {
        this->unk_A0B0[temp_6] = arg0;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__12CSHOT_EFFECTFPfPfiiiP6CFramei);
INCLUDE_RODATA("asm/nonmatchings/shot_effect", @977__2);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetWait__12CSHOT_EFFECTFi);
void CSHOT_EFFECT::SetNoSound() {
    s32 temp_6;

    temp_6 = this->unk_A150;
    if (temp_6 != -1) {
        this->unk_A130[temp_6] = 1;
    }
}
void CSHOT_EFFECT::SetRandomRate(float arg0) {
    s32 temp_5;

    temp_5 = this->unk_A150;
    if (temp_5 != -1) {
        this->unk_A0D0[temp_5] = arg0;
    }
}
void CSHOT_EFFECT::SetLifeTime(s32 arg0) {
    s32 temp_6;

    temp_6 = this->unk_A150;
    if (temp_6 != -1) {
        this->unk_A0F0[temp_6] = arg0;
    }
}
void CSHOT_EFFECT::SetEnemyAttr(s32 arg0) {
    s32 temp_6;

    temp_6 = this->unk_A150;
    if (temp_6 != -1) {
        this->unk_A110[temp_6] = arg0;
    }
}
void CSHOT_EFFECT::SetDmg(s32 arg0) {
    s32 temp_6;

    temp_6 = this->unk_A150;
    if (temp_6 != -1) {
        this->unk_A010[temp_6] = arg0;
    }
}
void CSHOT_EFFECT::SetAttribute(s32 arg0) {
    if (this->unk_A150 != -1) {
        this->unk_0000->unk_040 = arg0;
    }
}
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetWepStatus__12CSHOT_EFFECTFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetVsMonster__12CSHOT_EFFECTFPc);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetUserID2__12CSHOT_EFFECTFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Initialize__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetUserID2__17CSHOT_EFFECT_PACKFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", SetDmg__17CSHOT_EFFECT_PACKFi);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Set__15CSHOT_MACHINGUNFPfPfii);
INCLUDE_ASM("asm/nonmatchings/shot_effect", Step__15CSHOT_MACHINGUNFv);
