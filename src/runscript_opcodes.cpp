#include "runscript_opcodes.hpp"
#include "runscript.hpp"

#include <cmath>
#include <cstdio>
#include <cstdlib>

#include "collision.hpp"
#include "dataalloc.hpp"
#include "dun/gameloop.hpp"
#include "edit.hpp"
#include "editloop3.hpp"
#include "frame.hpp"
#include "mathutil.hpp"
#include "monstorunit.hpp"
#include "shot_freefuncs.hpp"
#include "userstatus.hpp"
#include "snd.hpp"

/**
 * Integers the monster scripts share, set and read by index.
 */
extern int GL_INT[10];

/**
 * Describes one opcode a monster script can call and the number that calls it.
 */
struct BT_EVENT_EXTERNAL_FUNCTION {
    int (*function)(RS_STACKDATA *, int); /**< Native function the opcode runs. */
    int operation;                        /**< Number the script calls the opcode by. */
};

/**
 * Opcodes of the monster scripts, ended by an entry with no function.
 */
extern BT_EVENT_EXTERNAL_FUNCTION ext_func_info__3[];

/**
 * Opcode table the monster scripts dispatch through, indexed by operation number.
 */
extern int (*ext_func[256])(RS_STACKDATA *, int);

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

int _SET_MOTION(RS_STACKDATA *stack, int argc) {
    int motion_id;
    int monster_no = NowMonstorUnit->unk_090;
    int half_speed;

    motion_id = GetStackInt(stack++);

    NowMonstorUnit->monster[monster_no].last_hit_damage = -1;
    NowMonstorUnit->monster[monster_no].requested_motion_speed = -1.0f;
    half_speed = 0;
    if (NowMonstorUnit->monster[monster_no].unk_014 > 0) {
        half_speed = 1;
    }

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
        float speed = GetStackFloat(stack++);
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
        float speed = GetStackFloat(stack++);
        if (half_speed) {
            speed *= 0.5f;
        }
        int mode = GetStackInt(stack++);
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
int _CHK_MOTION_FRM(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float current_frame = NowMonstorUnit->chara[monster_no][0].motion_type.state.time;
    int motion_no = NowMonstorUnit->chara[monster_no][0].motion_no;
    float end_frame = (float) NowMonstorUnit->chara[monster_no][0].motion_type.motion_info[motion_no].end;
    int done = 0;

    if (!(current_frame < end_frame - 1.0f) && current_frame < end_frame) {
        done = 1;
    }
    SetStack(stack++, done);
    if (argc == 2) {
        SetStack(stack, current_frame);
    }
    return 1;
}
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
int _GET_DISTANCE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float monster_position[4];
    float target_position[4];

    NowMonstorUnit->chara[monster_no][0].GetPosition(monster_position);
    if (argc == 1) {
        sceVu0CopyVector(target_position, CharaMain.pos);
    } else {
        target_position[0] = GetStackFloat(stack++);
        target_position[1] = GetStackFloat(stack++);
        target_position[2] = GetStackFloat(stack++);
    }
    SetStack(stack, DistVector(monster_position, target_position));
    return 1;
}
int _GET_POSITION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int who = (int) GetStackFloat(stack++);
    float position[4];

    if (who == -1) {
        NowMonstorUnit->chara[monster_no][0].GetPosition(position);
    }
    if (who == -2) {
        sceVu0CopyVector(position, CharaMain.pos);
    }
    SetStack(stack++, position[0]);
    SetStack(stack++, position[1]);
    SetStack(stack, position[2]);
    return 1;
}
int _SET_ROTATION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_070[0] = GetStackFloat(stack++);
    NowMonstorUnit->monster[monster_no].unk_070[1] = GetStackFloat(stack++);
    NowMonstorUnit->monster[monster_no].unk_070[2] = GetStackFloat(stack++);
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
int _CHK_ROTATION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int done = 0;

    if (NowMonstorUnit->monster[monster_no].turn_speed == 0.0f) {
        done = 1;
    }
    SetStack(stack, done);
    return 1;
}
int _CHK_MOVE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int done = 0;

    if (NowMonstorUnit->monster[monster_no].movement_speed == 0.0f) {
        done = 1;
    }
    SetStack(stack++, done);
    if (argc == 2) {
        float position[4];

        NowMonstorUnit->chara[monster_no][0].GetPosition(position);
        SetStack(stack, DistVector(NowMonstorUnit->monster[monster_no].movement, position));
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _CHK_USER_INNER_PRODUCT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_VECTOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_DIRECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MOVE__FP12RS_STACKDATAi);
int _CHK_MOVE_INFO(RS_STACKDATA *stack, int argc) {
    int clear;
    int monster_no = NowMonstorUnit->unk_090;
    float from[4];
    float to[4];
    float hit[4];

    clear = 1;
    NowMonstorUnit->chara[monster_no][0].GetPosition(from);
    to[0] = GetStackFloat(stack++);
    to[1] = GetStackFloat(stack++);
    to[2] = GetStackFloat(stack++);
    from[1] += 5.0f;
    to[1] += 5.0f;
    if (CheckHit(NowMonstorUnit->monster[monster_no].collision_poly, NowMonstorUnit->monster[monster_no].unk_050,
                 from, to, hit, 0, 0) >= 0) {
        clear = 0;
    }
    SetStack(stack, clear);
    return 1;
}
int _SET_MOVE_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].movement_speed = 0.0f;
    return 1;
}
int _SET_ROT_CANSEL(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->monster[NowMonstorUnit->unk_090].turn_speed = 0.0f;
    return 1;
}
int _SET_POSITION(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float x = GetStackFloat(stack++);
    float y = GetStackFloat(stack++);
    float z = GetStackFloat(stack);

    NowMonstorUnit->chara[monster_no][0].SetPosition(x, y, z);
    return 1;
}
int _STATUS_SET_FALL(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_088 = GetStackInt(stack);
    return 1;
}
int _STATUS_SET_MUTEKI(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int value = GetStackInt(stack);

    if (NowMonstorUnit->monster[monster_no].hp > 0 && NowMonstorUnit->monster[monster_no].unk_0E4 != 0) {
        value = 0;
    }
    NowMonstorUnit->monster[monster_no].unk_098 = value;
    return 1;
}
int _STATUS_SET_ALPHA(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].palette_alpha_step = GetStackFloat(stack++);
    if (argc == 2) {
        NowMonstorUnit->monster[monster_no].palette_alpha_step = GetStackInt(stack);
    } else {
        NowMonstorUnit->monster[monster_no].palette_delay = 0;
    }
    return 1;
}
int _STATUS_CHK_ALPHA(RS_STACKDATA *stack, int argc) {
    int done;
    int monster_no = NowMonstorUnit->unk_090;
    int opaque;

    done = 0;
    opaque = 0;

    if (argc == 2) {
        opaque = GetStackInt(stack++);
    }
    if (opaque == 0) {
        if (NowMonstorUnit->monster[monster_no].palette_alpha <= 0.0f) {
            done = 1;
        }
    } else if (NowMonstorUnit->monster[monster_no].palette_alpha >= 128.0f) {
        done = 1;
    }
    SetStack(stack, done);
    return 1;
}
int _STATUS_SET_DEAD(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].state = -1;
    NowMonstorUnit->unk_04C--;
    return 1;
}
int _STATUS_SET_EVENT(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->unk_094 = GetStackInt(stack);
    return 1;
}
int _RUN_SCRIPT(RS_STACKDATA *stack, int argc) {
    NowMonstorUnit->unk_094 = GetStackInt(stack);
    printf("run script !!\n");
    return 1;
}
int _STATUS_SET_COL_OFF(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_0A8 = GetStackInt(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_GET_LIFE_RATE__FP12RS_STACKDATAi);
int _STATUS_GET_USER_VECTOR(RS_STACKDATA *stack, int argc) {
    int normalize = 0;
    float angle;
    float vector[4];

    if (argc == 4) {
        normalize = GetStackInt(stack++);
    }
    angle = 0.0f;
    angle += 0.017453292f * GetStackFloat(stack++);
    if (angle > 3.1415927f) {
        angle -= 6.2831855f;
    }
    if (angle < -3.1415927f) {
        angle += 6.2831855f;
    }
    getCharacterVector(vector, angle);
    if (normalize != 0) {
        sceVu0Normalize(vector, vector);
    }
    SetStack(stack++, vector[0]);
    SetStack(stack++, vector[1]);
    SetStack(stack, vector[2]);
    return 1;
}
int _STATUS_GET_HEIGHT(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].ground_distance);
    return 1;
}
int _GET_RAND(RS_STACKDATA *stack, int argc) {
    int range = GetStackInt(stack++);

    int value = (float) range * rand() / 2147483648.0f;

    SetStack(stack, value);
    return 1;
}
int _GET_RANDF(RS_STACKDATA *stack, int argc) {
    float range = GetStackFloat(stack++);

    SetStack(stack, (float) (int) (range * rand() / 2147483648.0f));
    return 1;
}
int _SIN_DEG(RS_STACKDATA *stack, int argc) {
    float angle = GetStackFloat(stack++);

    angle = 0.017453292f * angle;
    SetStack(stack, sinf(angle));
    return 1;
}
int _COS_DEG(RS_STACKDATA *stack, int argc) {
    float angle = GetStackFloat(stack++);

    angle = 0.017453292f * angle;
    SetStack(stack, cosf(angle));
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _STATUS_SET_PALLET__FP12RS_STACKDATAi);
int _STATUS_SET_CLIPLEVEL(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].clip_distance = GetStackFloat(stack);
    return 1;
}
int _STATUS_GET_HITDMG_VOL(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].last_hit_damage);
    return 1;
}
int _STATUS_GET_MOTION_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->chara[NowMonstorUnit->unk_090][0].motion_no);
    return 1;
}
int _STATUS_GET_DMG_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->monster[NowMonstorUnit->unk_090].last_hit_id);
    return 1;
}
int _STATUS_SET_LOCKON_DIST(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].lock_range = GetStackFloat(stack);
    return 1;
}
int _STATUS_SET_SHADOW_LEN(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].shadow_length = GetStackFloat(stack);
    return 1;
}
int _STATUS_SET_LOCKON_TRG(RS_STACKDATA *stack, int argc) {
    char *name;
    int monster_no = NowMonstorUnit->unk_090;
    float scale_x = 1.0f;
    float scale_y = scale_x;
    CFrame *frame;

    name = GetStackString(stack++);

    if (argc == 3) {
        scale_x = GetStackFloat(stack++);
        scale_y = GetStackFloat(stack);
    }
    frame = NowMonstorUnit->chara[monster_no][0].frame->SearchFrame(name);
    if (frame == NULL) {
        printf("lock:NofFountNull %s\n", name);
    } else {
        NowMonstorUnit->monster[monster_no].unk_0FC = frame;
        NowMonstorUnit->monster[monster_no].unk_110 = scale_x;
        NowMonstorUnit->monster[monster_no].unk_114 = scale_y;
    }
    return 1;
}
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
int _SET_SND_FRM(RS_STACKDATA *stack, int argc) {
    int slot;
    int i;
    int monster_no = NowMonstorUnit->unk_090;

    slot = -1;
    for (i = 0; i < 16; i++) {
        if (NowMonstorUnit->sound[monster_no].id[i] == -1) {
            if (NowMonstorUnit->sound[monster_no].cooldown[i] == 0) {
                slot = i;
            }
            break;
        }
    }
    if (slot == -1) {
        return 1;
    }
    NowMonstorUnit->sound[monster_no].start[slot] = GetStackFloat(stack++);
    NowMonstorUnit->sound[monster_no].end[slot] = GetStackFloat(stack++);
    NowMonstorUnit->sound[monster_no].id[slot] = GetStackInt(stack);
    return 1;
}
int _SET_LOOP_SND(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->sound[monster_no].sequence_start = GetStackFloat(stack++);
    NowMonstorUnit->sound[monster_no].sequence_end = GetStackFloat(stack++);
    NowMonstorUnit->sound[monster_no].sequence_step = GetStackInt(stack++);
    NowMonstorUnit->sound[monster_no].sequence_id = GetStackInt(stack);
    return 1;
}
int _STOP_LOOP_SND(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int sound_id = NowMonstorUnit->sound[monster_no].sequence_id;

    if (sound_id == -1) {
        return 1;
    }
    NowMonstorUnit->sound[monster_no].sequence_id = -1;
    SndSeStop(sound_id, monster_no * 2);
    return 1;
}
int _DEL_LOOP_SND(RS_STACKDATA *stack, int argc) {
    // The sound keeps playing; the monster just stops owning it.
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->sound[monster_no].sequence_id = -1;
    return 1;
}
int _SET_SND_NOW(RS_STACKDATA *stack, int argc) {
    SndSePlay(GetStackInt(stack), -1, 0);
    return 1;
}
int _STOP_SND_NOW(RS_STACKDATA *stack, int argc) {
    SndSeStop(GetStackInt(stack), 0);
    return 1;
}
int _GET_CHR_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, (int) UserStatus->cur_chara);
    return 1;
}
int _GET_COL_HIT_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->effect[NowMonstorUnit->unk_090].hit_slot);
    return 1;
}
int _GET_SCRIPT_ID(RS_STACKDATA *stack, int argc) {
    SetStack(stack, NowMonstorUnit->unk_090);
    return 1;
}

int _GET_MONSTOR_POS(RS_STACKDATA *stack, int argc) {
    float position[4];

    NowMonstorUnit->chara[GetStackInt(stack++)][0].GetPosition(position);
    SetStack(stack++, position[0]);
    SetStack(stack++, position[1]);
    SetStack(stack, position[2]);
    return 1;
}
int _GET_MONSTOR_FRM(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack++);

    float frame = NowMonstorUnit->chara[monster_no][0].motion_type.state.time;

    SetStack(stack, frame);
    return 1;
}
int _SET_MONSTOR_POS(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack++);
    float position[4];

    position[0] = GetStackFloat(stack++);
    position[1] = GetStackFloat(stack++);
    position[2] = GetStackFloat(stack);
    NowMonstorUnit->chara[monster_no][0].SetPosition(position);
    return 1;
}
int _SET_MONSTOR_MOVE(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack++);
    float direction[4];
    float position[4];

    NowMonstorUnit->chara[monster_no][0].GetPosition(position);
    direction[0] = GetStackFloat(stack++);
    direction[1] = GetStackFloat(stack++);
    direction[2] = GetStackFloat(stack++);
    direction[0] -= position[0];
    direction[1] -= position[1];
    direction[2] -= position[2];
    direction[3] = 1.0f;
    sceVu0Normalize(NowMonstorUnit->monster[monster_no].movement, direction);
    NowMonstorUnit->monster[monster_no].movement_speed = GetStackFloat(stack);
    return 1;
}
int _SET_MONSTOR_LINK_MOVE(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack++);
    int leader_no = GetStackInt(stack);

    sceVu0CopyVector(NowMonstorUnit->monster[monster_no].movement, NowMonstorUnit->monster[leader_no].movement);
    NowMonstorUnit->monster[monster_no].movement_speed = NowMonstorUnit->monster[leader_no].movement_speed;
    return 1;
}
int _SET_MONSTOR_MOVE_CANSEL(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack);

    NowMonstorUnit->monster[monster_no].movement_speed = 0.0f;
    return 1;
}
int _SET_LOCKON_DIST(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].lock_range = GetStackFloat(stack);
    return 1;
}
int _SET_LOCKON_SW(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_11C = GetStackInt(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_MONSTOR_MOTION__FP12RS_STACKDATAi);
int _SET_GLOBAL_INT(RS_STACKDATA *stack, int argc) {
    int index = GetStackInt(stack++);

    GL_INT[index] = GetStackInt(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_GLOBAL_INT__FP12RS_STACKDATAi);
/**
 * Reads the world position of a named frame of the monster's model.
 */
static int _GET_OBJ_POS(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    CFrame *frame = NowMonstorUnit->chara[monster_no][0].frame->SearchFrame(GetStackString(stack++));
    float local[4];
    float world[4];

    sceVu0CopyVector(local, frame->position);
    frame->GetWorldPosition(world, local);
    SetStack(stack++, world[0]);
    SetStack(stack++, world[1]);
    SetStack(stack, world[2]);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_ROTATION_X__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _LOOKAT__FP12RS_STACKDATAi);
int _SET_MOTION_CHANGE_STEP(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float step = GetStackFloat(stack);

    NowMonstorUnit->chara[monster_no][0].motion_type.state.blend_step = step;
    for (int i = 0; i < NowMonstorUnit->monster[monster_no].unk_0B4; i++) {
        NowMonstorUnit->chara[monster_no][i + 1].motion_type.state.blend_step = step;
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MONSTOR_VECTOR__FP12RS_STACKDATAi);
int _STATUS_SET_LIFE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    float rate = GetStackFloat(stack);

    NowMonstorUnit->monster[monster_no].hp = (int) (NowMonstorUnit->monster[monster_no].max_hp * rate);
    return 1;
}
int _SET_BIN2(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_010 = GetStackInt(stack);
    return 1;
}
int _SET_STATUS_CHANGE(RS_STACKDATA *stack, int argc) {
    int kind = GetStackInt(stack++);
    int weight = GetStackInt(stack++);
    int monster_no = GetStackInt(stack);

    if (monster_no < 0 || monster_no > 15) {
        return 1;
    }
    if (kind < 0 || kind > 4) {
        kind = 0;
    }
    NowMonstorUnit->monster[monster_no].attachment_weight[kind] = weight;
    return 1;
}
int _SET_TEX_ANIME_SW(RS_STACKDATA *stack, int argc) {
    int anime_no = GetStackInt(stack++);
    int on = GetStackInt(stack++);
    int monster_no = GetStackInt(stack);

    if (monster_no < 0 || monster_no > 15) {
        return 2;
    }
    if (on) {
        NowMonstorUnit->chara[monster_no][0].TexAnimeOn(anime_no);
        printf("animOn %d\n", anime_no);
    } else {
        NowMonstorUnit->chara[monster_no][0].TexAnimeOff(anime_no);
        printf("animOff %d\n", anime_no);
    }
    return 1;
}
int _GET_STATUS_BIN2(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int status = NowMonstorUnit->monster[monster_no].unk_010;

    NowMonstorUnit->monster[monster_no].unk_010 = status;
    SetStack(stack, status);
    return 1;
}
int _SET_COLLISION_WIDTH(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].collision_radius = GetStackFloat(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_NEAR_MONSTER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _BOSS_FADE_OUT__FP12RS_STACKDATAi);
int _CHEKC_FADE_OUT(RS_STACKDATA *stack, int argc) {
    int done = EdFadeOutCheck();

    SetStack(stack, done);
    return 1;
}
int _SET_GRAVITY(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_0D6 = GetStackInt(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _SET_GUARD_FRAME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GUARD_SEARCH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _GET_MOVE_VEC__FP12RS_STACKDATAi);
int _PUSH_IGLOBAL(RS_STACKDATA *stack, int argc) {
    int index;
    int monster_no = NowMonstorUnit->unk_090;

    index = GetStackInt(stack++);
    if (index < 0 || index > 7) {
        return 0;
    }
    PUSH_INT_DATA[monster_no][index] = GetStackInt(stack);
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/runscript_opcodes", _POP_IGLOBAL__FP12RS_STACKDATAi);
int _GET_USER_STATUS(RS_STACKDATA *stack, int argc) {
    int kind = GetStackInt(stack++);
    int chara = UserStatus->cur_chara;
    int value = 0;

    if (UserStatus->unk_42C8[chara] != 0 && kind != 0) {
        value = UserStatus->unk_42E0[chara];
    }
    SetStack(stack, value);
    return 1;
}
int _SET_REFERENCE(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;
    int target_no = GetStackInt(stack++);
    char *name = GetStackString(stack);
    CFrame *frame;
    CFrame *reference;

    if (name == NULL) {
        return 1;
    }
    frame = NowMonstorUnit->chara[monster_no][0].frame;
    reference = NowMonstorUnit->chara[target_no][0].frame->SearchFrame(name);
    if (reference == NULL) {
        return 1;
    }
    frame->SetReference(reference);
    return 1;
}
int _DEL_REFERENCE(RS_STACKDATA *stack, int argc) {
    int monster_no = GetStackInt(stack);
    CFrame *frame = NowMonstorUnit->chara[monster_no][0].frame;

    if (frame == NULL) {
        return 1;
    }
    frame->DeleteReference();
    return 1;
}
int _SET_SHADOW_FLAG(RS_STACKDATA *stack, int argc) {
    int monster_no = NowMonstorUnit->unk_090;

    NowMonstorUnit->monster[monster_no].unk_0D2 = GetStackInt(stack);
    return 1;
}
int BtSetEventScript(CRunScript *script, char *program, CDataAlloc2<1> *arena) {
    RS_STACKDATA *stack = (RS_STACKDATA *) arena->Alloc(64);

    script->load((RS_PROG_HEADER *) program, stack, 128, (RS_CALLDATA *) arena->Alloc(384), 512);
    script->ext_func(ext_func, 256);
    return 1;
}
void BtSetEventExtendTable() {
    int i;

    for (i = 0; i < 256; i++) {
        ext_func[i] = NULL;
    }
    for (i = 0;; i++) {
        if (ext_func_info__3[i].function == NULL) {
            break;
        }
        int j;
        for (j = 0; j < i; j++) {
            if (ext_func_info__3[i].operation == ext_func_info__3[j].operation) {
                printf("same ext_func_no!!!\n");
                while (1) {
                }
            }
        }
        int operation = ext_func_info__3[i].operation;
        if (operation < 0 || operation >= 256) {
            printf("ext func over!!");
        } else {
            ext_func[operation] = ext_func_info__3[i].function;
        }
    }
}
