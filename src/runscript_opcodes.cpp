#include "runscript_opcodes.hpp"
#include "runscript.hpp"

#include <cmath>
#include <cstdio>

#include "dun/gameloop.hpp"
#include "mathutil.hpp"
#include "monstorunit.hpp"
#include "userstatus.hpp"
#include "snd.hpp"

/**
 * Reads one script argument as an integer, converting it where the slot holds a float.
 */
static int GetStackInt(RS_STACKDATA *argument) {
    if (argument->type == RS_FLOAT) {
        return (int) argument->f;
    }
    return argument->i;
}

/**
 * Reads one script argument as a float, converting it where the slot holds an integer.
 */
static float GetStackFloat(RS_STACKDATA *argument) {
    if (argument->type == RS_INT) {
        return (float) argument->i;
    }
    return argument->f;
}

/**
 * Reads one script argument as a string.
 */
static char *GetStackString(RS_STACKDATA *argument) {
    return argument->s;
}

/**
 * Writes an integer back through a script argument that names a variable.
 */
static void SetStack(RS_STACKDATA *argument, int value) {
    if (argument->type == RS_PTR) {
        argument->p->i = value;
    }
}

/**
 * Writes a float back through a script argument that names a variable.
 */
static void SetStack(RS_STACKDATA *argument, float value) {
    if (argument->type == RS_PTR) {
        argument->p->f = value;
    }
}

#ifdef NON_MATCHING
int _SET_MOTION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int motion_id = GetStackInt(stack);
    int half_speed = NowMonstorUnit->monster[monster_no].unk_014 > 0;

    NowMonstorUnit->monster[monster_no].last_hit_damage = -1;
    NowMonstorUnit->monster[monster_no].requested_motion_speed = -1.0f;
    stack++;

    if (argc == 1) {
        float speed = NowMonstorUnit->chara[monster_no][0].motion_type.motion_info[motion_id].speed;
        if (half_speed) {
            speed *= 0.5f;
        }
        NowMonstorUnit->chara[monster_no][0].SetMotion(motion_id, 0);
        NowMonstorUnit->chara[monster_no][0].SetMotionSpeed(speed);
        NowMonstorUnit->monster[monster_no].requested_motion = motion_id;
        NowMonstorUnit->monster[monster_no].requested_motion_flags = 0;
        NowMonstorUnit->monster[monster_no].requested_motion_speed = speed;
        for (int i = 0; i < NowMonstorUnit->monster[monster_no].unk_0B4; i++) {
            NowMonstorUnit->chara[monster_no][i + 1].SetMotion(motion_id, 0);
            NowMonstorUnit->chara[monster_no][i + 1].SetMotionSpeed(speed);
        }
    }
    if (argc == 2) {
        float speed = GetStackFloat(stack);
        stack++;
        if (half_speed) {
            speed *= 0.5f;
        }
        NowMonstorUnit->chara[monster_no][0].SetMotion(motion_id, 0);
        NowMonstorUnit->chara[monster_no][0].SetMotionSpeed(speed);
        NowMonstorUnit->monster[monster_no].requested_motion = motion_id;
        NowMonstorUnit->monster[monster_no].requested_motion_flags = 0;
        NowMonstorUnit->monster[monster_no].requested_motion_speed = speed;
        for (int i = 0; i < NowMonstorUnit->monster[monster_no].unk_0B4; i++) {
            NowMonstorUnit->chara[monster_no][i + 1].SetMotion(motion_id, 0);
            NowMonstorUnit->chara[monster_no][i + 1].SetMotionSpeed(speed);
        }
    }
    if (argc == 3) {
        float speed = GetStackFloat(stack);
        stack++;
        if (half_speed) {
            speed *= 0.5f;
        }
        int mode = GetStackInt(stack);
        stack++;
        NowMonstorUnit->chara[monster_no][0].SetMotion(motion_id, mode);
        NowMonstorUnit->chara[monster_no][0].SetMotionSpeed(speed);
        NowMonstorUnit->monster[monster_no].requested_motion = motion_id;
        NowMonstorUnit->monster[monster_no].requested_motion_flags = mode;
        NowMonstorUnit->monster[monster_no].requested_motion_speed = speed;
        for (int i = 0; i < NowMonstorUnit->monster[monster_no].unk_0B4; i++) {
            NowMonstorUnit->chara[monster_no][i + 1].SetMotion(motion_id, mode);
            NowMonstorUnit->chara[monster_no][i + 1].SetMotionSpeed(speed);
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOTION__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _CHK_MOTION_FRM(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float current_frame = NowMonstorUnit->chara[monster_no][0].motion_type.state.time;
    int motion_no = NowMonstorUnit->chara[monster_no][0].motion_no;
    float end_frame = (float) NowMonstorUnit->chara[monster_no][0].motion_type.motion_info[motion_no].end;
    int done = 0;

    if (!(current_frame < end_frame - 1.0f) && current_frame < end_frame) {
        done = 1;
    }
    SetStack(stack, done);
    stack++;
    if (argc == 2) {
        SetStack(stack, current_frame);
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOTION_FRM__FP12RS_STACKDATAi);
#endif
int _GET_MOTION_FRM(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    SetStack(stack, NowMonstorUnit->chara[monster_no][0].motion_type.state.time);
    return 1;
}
int _SET_MOTION_FRM(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->chara[monster_no][0].motion_type.state.time = GetStackFloat(stack);
    return 1;
}
#ifdef NON_MATCHING
int _GET_DISTANCE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float monster_position[4];
    float target_position[4];

    NowMonstorUnit->chara[monster_no][0].GetPosition(monster_position);
    if (argc == 1) {
        sceVu0CopyVector(target_position, CharaMain.pos);
    } else {
        target_position[0] = GetStackFloat(stack);
        stack++;
        target_position[1] = GetStackFloat(stack);
        stack++;
        target_position[2] = GetStackFloat(stack);
        stack++;
    }
    SetStack(stack, DistVector(monster_position, target_position));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_DISTANCE__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_POSITION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int who = (int) GetStackFloat(stack);
    float position[4];

    stack++;
    if (who == -1) {
        NowMonstorUnit->chara[monster_no][0].GetPosition(position);
    }
    if (who == -2) {
        sceVu0CopyVector(position, CharaMain.pos);
    }
    SetStack(stack, position[0]);
    stack++;
    SetStack(stack, position[1]);
    stack++;
    SetStack(stack, position[2]);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_POSITION__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _SET_ROTATION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_070[0] = GetStackFloat(stack);
    stack++;
    NowMonstorUnit->monster[monster_no].unk_070[1] = GetStackFloat(stack);
    stack++;
    NowMonstorUnit->monster[monster_no].unk_070[2] = GetStackFloat(stack);
    stack++;
    NowMonstorUnit->monster[monster_no].turn_speed = GetStackFloat(stack);

    if (NowMonstorUnit->monster[monster_no].turn_speed < 0.0f) {
        float position[4];
        float rotation[4];
        float direction[4];

        NowMonstorUnit->chara[monster_no][0].GetPosition(position);
        NowMonstorUnit->chara[monster_no][0].GetRotation(rotation);
        sceVu0SubVector(direction, NowMonstorUnit->monster[monster_no].unk_070, position);
        rotation[1] = atan2f(direction[0], direction[2]);
        NowMonstorUnit->chara[monster_no][0].SetRotation(rotation);
        NowMonstorUnit->monster[monster_no].turn_speed = 0.0f;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_ROTATION__FP12RS_STACKDATAi);
#endif
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
#ifdef NON_MATCHING
int _CHK_MOVE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int done = 0;

    if (NowMonstorUnit->monster[monster_no].movement_speed == 0.0f) {
        done = 1;
    }
    SetStack(stack, done);
    if (argc == 2) {
        float position[4];

        stack++;
        NowMonstorUnit->chara[monster_no][0].GetPosition(position);
        SetStack(stack, DistVector(NowMonstorUnit->monster[monster_no].movement, position));
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOVE__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_USER_INNER_PRODUCT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_VECTOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_DIRECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_MOVE_INFO__FP12RS_STACKDATAi);
int _SET_MOVE_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].movement_speed = 0.0f;
    return 1;
}
int _SET_ROT_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].turn_speed = 0.0f;
    return 1;
}
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
#ifdef NON_MATCHING
int _STATUS_SET_CLIPLEVEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].clip_distance = GetStackFloat(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_CLIPLEVEL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_GET_HITDMG_VOL(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].last_hit_damage);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_HITDMG_VOL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_GET_MOTION_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->chara[NowMonstorUnit->unk_090][0].motion_no);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_MOTION_ID__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_GET_DMG_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].last_hit_id);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_DMG_ID__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_SET_LOCKON_DIST(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].lock_range = GetStackFloat(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_LOCKON_DIST__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STATUS_SET_SHADOW_LEN(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].shadow_length = GetStackFloat(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_SHADOW_LEN__FP12RS_STACKDATAi);
#endif
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
#ifdef NON_MATCHING
int _DEL_LOOP_SND(RS_STACKDATA *stack, int argc) {
    // The sound keeps playing; the monster just stops owning it.
    NowMonstorUnit->sound[NowMonstorUnit->unk_090].sequence_id = -1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _DEL_LOOP_SND__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _SET_SND_NOW(RS_STACKDATA *stack, int argc) {
    SndSePlay(GetStackInt(stack), -1, 0);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_SND_NOW__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _STOP_SND_NOW(RS_STACKDATA *stack, int argc) {
    SndSeStop(GetStackInt(stack), 0);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STOP_SND_NOW__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_CHR_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, (int) UserStatus->cur_chara);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_CHR_ID__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_COL_HIT_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->effect[NowMonstorUnit->unk_090].hit_slot);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_COL_HIT_ID__FP12RS_STACKDATAi);
#endif
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
