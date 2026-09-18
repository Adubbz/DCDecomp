#include "runscript_opcodes.hpp"
#include "runscript.hpp"

#include <cmath>
#include <cstdio>

#include "dun/gameloop.hpp"
#include "monstorunit.hpp"

#ifdef NON_MATCHING
int GetStackInt(RS_STACKDATA *argument) {
    if (argument->type == RS_FLOAT) {
        return (int) argument->f;
    }
    return argument->i;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", GetStackInt__FP12RS_STACKDATA__3);
#endif
#ifdef NON_MATCHING
float GetStackFloat(RS_STACKDATA *argument) {
    if (argument->type == RS_INT) {
        return (float) argument->i;
    }
    return argument->f;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", GetStackFloat__FP12RS_STACKDATA__3);
#endif
#ifdef NON_MATCHING
char *GetStackString(RS_STACKDATA *argument) {
    return argument->s;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", GetStackString__FP12RS_STACKDATA__3);
#endif
#ifdef NON_MATCHING
void SetStack(RS_STACKDATA *argument, int value) {
    if (argument->type == RS_PTR) {
        argument->p->i = value;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", SetStack__FP12RS_STACKDATAi__3);
#endif
#ifdef NON_MATCHING
void SetStack(RS_STACKDATA *argument, float value) {
    if (argument->type == RS_PTR) {
        argument->p->f = value;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", SetStack__FP12RS_STACKDATAf__3);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOTION_FRM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MOTION_FRM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOTION_FRM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_DISTANCE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_POSITION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_ROTATION__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _CHK_ROTATION(RS_STACKDATA *stack, int argc) {
    int done = 0;

    if (NowMonstorUnit->monster[NowMonstorUnit->unk_090].turn_speed == 0.0f) {
        done = 1;
    }
    SetStack(stack, done);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_ROTATION__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_USER_INNER_PRODUCT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_VECTOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_DIRECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOVE_INFO__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _SET_MOVE_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].movement_speed = 0.0f;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOVE_CANSEL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _SET_ROT_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].turn_speed = 0.0f;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_ROT_CANSEL__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_POSITION__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _STATUS_SET_FALL(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_088 = GetStackInt(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_FALL__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_MUTEKI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_ALPHA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_CHK_ALPHA__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _STATUS_SET_DEAD(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].state = -1;
    NowMonstorUnit->unk_04C--;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_DEAD__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_SET_EVENT(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->unk_094 = GetStackInt(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_EVENT__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _RUN_SCRIPT(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->unk_094 = GetStackInt(stack);
    printf("run script !!\n");
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _RUN_SCRIPT__FP12RS_STACKDATAi);
#endif
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @870);
#ifdef NON_MATCHING
int _STATUS_SET_COL_OFF(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_0A8 = GetStackInt(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_COL_OFF__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_LIFE_RATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_USER_VECTOR__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _STATUS_GET_HEIGHT(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].ground_distance);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_HEIGHT__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_RAND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_RANDF__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _SIN_DEG(RS_STACKDATA *stack, int argc) {
    SetStack(&stack[1], sinf(0.017453292f * GetStackFloat(stack)));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SIN_DEG__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _COS_DEG(RS_STACKDATA *stack, int argc) {
    SetStack(&stack[1], cosf(0.017453292f * GetStackFloat(stack)));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _COS_DEG__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_PALLET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_CLIPLEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_HITDMG_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_MOTION_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_DMG_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_LOCKON_DIST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_SHADOW_LEN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_LOCKON_TRG__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @960);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOV_COL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @979__2);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_BODY_COL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1010);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_BODY_COL_PARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_DMG_COL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1040);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_DMG_PARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SHOT__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1069);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SHOT2__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1086__2);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SND_FRM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_LOOP_SND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STOP_LOOP_SND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _DEL_LOOP_SND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SND_NOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STOP_SND_NOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_CHR_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_COL_HIT_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_SCRIPT_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MONSTOR_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MONSTOR_FRM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_LINK_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_MOVE_CANSEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_LOCKON_DIST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_LOCKON_SW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_GLOBAL_INT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_GLOBAL_INT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_OBJ_POS__FP12RS_STACKDATAi__2);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_ROTATION_X__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _LOOKAT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOTION_CHANGE_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MONSTOR_VECTOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_LIFE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_BIN2__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_STATUS_CHANGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_TEX_ANIME_SW__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1311);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1312);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_STATUS_BIN2__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_COLLISION_WIDTH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_NEAR_MONSTER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _BOSS_FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHEKC_FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_GRAVITY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_GUARD_FRAME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GUARD_SEARCH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MOVE_VEC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _PUSH_IGLOBAL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _POP_IGLOBAL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_USER_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_REFERENCE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _DEL_REFERENCE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SHADOW_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", BtSetEventScript__FP10CRunScriptPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", BtSetEventExtendTable__Fv);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1452);
INCLUDE_RODATA("asm/nonmatchings/runscript_opcodes", @1453);
