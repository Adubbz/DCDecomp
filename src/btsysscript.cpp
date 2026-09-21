#include "btsysscript.hpp"

#include <cmath>
#include <cstdio>
#include <cstring>

#include "btactstatus.hpp"
#include "btitem.hpp"
#include "btmisc.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "clsmes.hpp"
#include "collisiondata.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "dungeonparts.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "frame.hpp"
#include "itembombeffect.hpp"
#include "mathutil.hpp"
#include "menu_dungeon.hpp"
#include "menu_misc.hpp"
#include "monstorunit.hpp"
#include "nowload.hpp"
#include "npcharacter.hpp"
#include "runscript.hpp"
#include "savedata.hpp"
#include "shot_freefuncs.hpp"
#include "snd.hpp"
#include "userstatus.hpp"

/**
 * Name of the map file the next battle-map jump loads.
 */
extern char BtLoadMapFileName[32];

/** Randomized element the current floor's sealed door wants. */
extern int BtRubyDoorKey;

/** Nonzero while the dungeon floor is drawn at all. */
extern s32 BtAllDrawFlag;

/** Layout of the map the next battle-map jump loads. */
extern s32 BtLoadMapType;

/** The dungeon floor that the player is on. */
extern "C" CDungeonMap MainDungeonMap;

/** The events of the floor the dungeon is drawing. */
extern CDungeonEventMan *NowEventMan;

/** The events of the floor that the player is on. */
extern "C" CDungeonEventMan DngEventMan;

/** The events of the back dungeon's floor. */
extern "C" CDungeonEventMan UraEventMan;

/** The characters that walk the dungeon alongside the player. */
extern "C" CNPCharacter NPCUnit[6];

/** Whether the player is in the back dungeon rather than the main one. */
extern s32 BtUraDongeon;

/** Nonzero while a system event script holds the dungeon. */
extern s32 BtEventMode;

/** Nonzero while a system event script clears the dungeon's usual work. */
extern s32 BtAllClear;

/** Camera the dungeon currently draws through. */
extern CCameraFollow *NowCamera__3;

/** Camera that follows the player. */
extern "C" CCameraFollow MainCamera__4;

/** Camera that stands in for the player's while an event runs. */
extern "C" CCameraFollow SubCamera;

/** Message window the system script talks through first. */
extern "C" ClsMes BtEventMes0;

/** Message window the system script talks through second. */
extern "C" ClsMes BtEventMes1;

void BtSystemScriptEventInfoInit(void) {
    BtEventInfo.unk_2C = -1;
    BtEventInfo.unk_30 = -1;
    BtEventInfo.unk_28 = 1;
    BtEventInfo.unk_34 = 0;
    BtEventInfo.unk_20 = 1;
    BtEventInfo.unk_80 = 0;
    BtEventInfo.entrance_result = NULL;
    BtEventInfo.escape_result = NULL;
    BtEventInfo.request = 0;
    BtEventInfo.unk_9C = -1;
    BtEventInfo.unk_A0 = -1;
    BtEventInfo.unk_A4 = 0;
    BtEventInfo.script_main_chr = -1;
    BtEventInfo.unk_8C = 0;
    BtEventInfo.unk_94 = -1;
    BtEventInfo.unk_90 = 1;
    BtEventInfo.no_status_recover = 0;
    EdEventInfo.projection = -1.0f;
    EdEventInfo.main_character = &CharaMain;
    for (int i = 0; i < 6; i++) {
        NPCUnit[i].chara.frame = NULL;
    }
    EdEventInfo.npcs = NPCUnit;
    EdEventInfo.npc_texture_block = 32;
    EdEventInfo.player_texture_block = 17;
    EdEventInfo.npc_count = 6;
    EdEventInfo.villagers = NULL;
    for (int i = 0; i < 8; i++) {
        EdEventInfo.messages[i] = NULL;
    }
    EdEventInfo.messages[1] = &BtEventMes0;
    EdEventInfo.messages[2] = &BtEventMes1;
    EdEventAllClear();
}

BT_OBJ_HANDLE *GetObjHDL(int index) {
    if (index < 0 || index >= 32) {
        printf("** obj hdl err **\n");
        return NULL;
    }

    return &BtObjHdl[index];
}

/** File buffer the current floor's system script is read into. */
extern "C" CDataAlloc2<1> BtSystemScriptFileBuffer;

/** Base address of the system script data currently loaded. */
extern s32 BtEventData;

void BtSystemScriptLoad(int floor) {
    char path[44];
    int read_size;

    sprintf(path, "dun/script/d0%d/event.stb", floor + 1);
    BtSystemScriptFileBuffer.used = 0;
    BtEventData = (s32) (BtSystemScriptFileBuffer.base + BtSystemScriptFileBuffer.used * 0x10);
    LoadFile(path, (void *) BtEventData, &read_size);
    wait_now_loading_vsync();
    BtSystemScriptFileBuffer.Alloc((read_size >> 4) + 1);
    EdSetEventScript((char *) BtEventData, NULL, &BtSystemScriptFileBuffer);
    AddSystemEventScript();
}

void BtSystemScriptInit(void) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR ref;
    float text_rate;

    BtEventMode = 1;
    BtAllClear = 1;
    NowCamera__3->GetPos(pos);
    NowCamera__3->GetRef(ref);
    SubCamera.FollowOff();
    SubCamera.SetPos(pos);
    SubCamera.SetRef(ref);
    SubCamera.Step(-1);
    NowCamera__3 = &SubCamera;
    NowCamera__3->FollowOff();
    CUserStatus *status = UserStatus;
    status->step_disable = 1;
    EdEventInfo.projection = -1.0f;
    EdEventInfo.camera = NowCamera__3;
    EdEventInfo.main_character = &CharaMain;
    for (int i = 0; i < 6; i++) {
        NPCUnit[i].chara.frame = NULL;
    }
    EdEventInfo.npcs = NPCUnit;
    EdEventInfo.npc_texture_block = 32;
    EdEventInfo.player_texture_block = 17;
    EdEventInfo.npc_count = 6;
    EdEventInfo.villagers = NULL;
    for (int i = 0; i < 8; i++) {
        EdEventInfo.messages[i] = NULL;
    }
    EdEventInfo.messages[1] = &BtEventMes0;
    EdEventInfo.messages[2] = &BtEventMes1;
    EDIT_CONFIG_VIEW *config = (EDIT_CONFIG_VIEW *) SaveData->GetConfigData();
    if (config->message_speed != 0) {
        text_rate = 0.6f;
    } else {
        text_rate = 0.3f;
    }
    EdEventInfo.messages[1]->text_rate = text_rate;
    EdEventInfo.messages[2]->text_rate = text_rate;
    EdEventInfo.messages[1]->text_rate_set = text_rate;
    EdEventInfo.messages[2]->text_rate_set = text_rate;
    if (BtEventInfo.unk_90 != 0) {
        EdFadeInit();
    }
    BtEventInfo.unk_90 = 1;
    for (int i = 0; i < 32; i++) {
        BtObjHdl[i].frame = NULL;
        BtObjHdl[i].character = NULL;
    }
    BtEventInfo.unk_38 = 0;
    BtEventInfo.unk_8C = 0;
    BtEventInfo.unk_B0 = 0;
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_004 = -1;
    BtActStatus.unk_008 = -1;
    BtActStatus.action_no = 0;
    BtActStatus.action_on = 0;
    BtActStatus.unk_028 = 0;
}

void BtSystemScriptAfter(void) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR ref;

    BtEventMode = 0;
    BtAllClear = 0;
    BtEventInfo.unk_30 = -1;
    SetMIniMapStatus(1);
    CharaMain.SetMotion(0, 0);
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_004 = -1;
    BtActStatus.unk_008 = -1;
    BtActStatus.unk_000 = 1;
    BtActStatus.unk_058 = 1;
    BtActStatus.unk_054 = 1;
    EdEventInfo.player_shadow_draw = 1;
    EdEventInfo.player_draw = 1;
    EdEventAllClear();
    UserStatus->step_disable = 0;
    BtMapJumpFloor = -1;
    if (EdEventInfo.reset_camera_angle > 0) {
        sceVu0CopyVector(pos, CharaMain.pos);
        CharaMain.GetRotation(ref);
        float angle = ref[1] + EdEventInfo.reset_camera_yaw;
        if (!(angle <= 3.141592f)) {
            angle -= 6.2831855f;
        }
        MainCamera__4.SetAngleSoon(angle);
        MainCamera__4.SetFollow(pos[0], pos[1] + 16.0f - 3.0f, pos[2]);
        MainCamera__4.Step(-1);
    }
    if (EdEventInfo.reset_camera_angle < 0) {
        SubCamera.GetPos(pos);
        SubCamera.GetRef(ref);
        MainCamera__4.FollowOff();
        MainCamera__4.SetPos(pos);
        MainCamera__4.SetRef(ref);
        MainCamera__4.Step(-1);
        MainCamera__4.Step(1);
        MainCamera__4.FollowOn();
        MainCamera__4.SetHeight(pos[1] - ref[1]);
        MainCamera__4.SetFollow(ref[0], ref[1], ref[2]);
        MainCamera__4.SetAngleSoon(atan2(pos[0] - ref[0], pos[2] - ref[2]));
        MainCamera__4.Step(-1);
        MainCamera__4.Step(1);
    }
    NowCamera__3 = &MainCamera__4;
}

int BtSystemScriptRun(int event, CDataAlloc2<1> *arena) {
    return EdEventInit(event, arena, (char *) BtEventData);
}

void BtSetMapJumpFloor(int floor) {
    BtMapJumpFloor = floor;
}

/**
 * Reads one script argument as an integer, converting it where the slot holds a float.
 *
 * @mangled GetStackInt__FP12RS_STACKDATA__2
 * @address 0x1BB930
 * @size 0x44
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static int GetStackInt(RS_STACKDATA *argument) {
    if (argument->type == RS_FLOAT) {
        return (int) argument->f;
    }
    return argument->i;
}

/**
 * Reads one script argument as a float, converting it where the slot holds an integer.
 *
 * @mangled GetStackFloat__FP12RS_STACKDATA__2
 * @address 0x1BB980
 * @size 0x2C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static float GetStackFloat(RS_STACKDATA *argument) {
    if (argument->type == RS_INT) {
        return (float) argument->i;
    }
    return argument->f;
}

/**
 * Reads one script argument as a string.
 *
 * @mangled GetStackString__FP12RS_STACKDATA__2
 * @address 0x1BB9B0
 * @size 0xC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static char *GetStackString(RS_STACKDATA *argument) {
    return argument->s;
}

/**
 * Writes an integer back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAi__2
 * @address 0x1BB9C0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void SetStack(RS_STACKDATA *argument, int value) {
    if (argument->type == RS_PTR) {
        argument->p->i = value;
    }
}

/**
 * Writes a float back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAf__2
 * @address 0x1BB9E0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void SetStack(RS_STACKDATA *argument, float value) {
    if (argument->type == RS_PTR) {
        argument->p->f = value;
    }
}

int _GET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->cur_floor);
    return 1;
}

int _SET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    ((CDngStatusData *) UserStatus)->SetNowFloor(GetStackInt(stack));
    return 1;
}

int _GET_OLD_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->unk_03);
    return 1;
}

int _GET_ACTION_MODE(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtEventInfo.unk_24);
    return 1;
}

int _ITEM_USE_WINDOW(RS_STACKDATA *stack, int count) {
    if (stack->type != RS_PTR) {
        return 0;
    }

    BtEventInfo.unk_80 = (s32) stack->p;
    stack++;
    int i;
    for (i = 0; i < count - 1; i++) {
        BtEventInfo.unk_3C[i] = GetStackInt(stack++);
    }
    BtEventInfo.unk_7C = 0;
    if (count > 1) {
        BtEventInfo.unk_7C = 1;
    }
    BtEventInfo.unk_3C[i] = -1;
    BtEventInfo.request = 1;
    return 1;
}

int _CHECK_EVENT_FLG(RS_STACKDATA *stack, int count) {
    int flag_no = GetStackInt(stack++);
    int flag = UserStatus->ChkEventFlag(flag_no);
    SetStack(stack, flag);
    return 1;
}

int _SET_EVENT_FLG(RS_STACKDATA *stack, int count) {
    int flag_no = GetStackInt(stack++);
    int value = GetStackInt(stack);
    CUserStatus *status = UserStatus;

    if (flag_no >= 0 && flag_no < 50) {
        status->event_flags[flag_no] = value;
    }
    return 1;
}

int _GET_OBJHDL(RS_STACKDATA *stack, int count) {
    int index = GetStackInt(stack++);
    int parts_no = GetStackInt(stack++);
    char *name = GetStackString(stack);
    BT_OBJ_HANDLE *handle = GetObjHDL(index);

    if (parts_no != -1) {
        CDungeonMap *map = NowDngMap;
        CFrame *frame = map->parts[parts_no].GetSearchFrame(name);
        if (frame != NULL) {
            handle->frame = frame;
            handle->type = 0;
        } else {
            printf("******** Frame NotFount %s *******\n", name);
            handle->frame = NULL;
            handle->type = 0;
        }
    } else {
        CFrame *frame = NowDngMap->GetFrameSearch(name);
        if (frame != NULL) {
            handle->frame = frame;
            handle->type = 0;
        } else {
            printf("******** All Frame NotFount %s *******\n", name);
            handle->frame = NULL;
            handle->type = 0;
        }
    }
    return 1;
}

int _SET_OBJHDL_POS(RS_STACKDATA *stack, int count) {
    int index = GetStackInt(stack++);
    float x = GetStackFloat(stack++);
    float y = GetStackFloat(stack++);
    float z = GetStackFloat(stack);
    BT_OBJ_HANDLE *handle = GetObjHDL(index);

    if (handle->type == 0 && handle->frame != NULL) {
        handle->frame->SetPosition(x, y, z);
    }
    if (handle->type == 1 && handle->character != NULL) {
        handle->character->SetPosition(x, y, z);
    }
    return 1;
}

int _SET_OBJHDL_ROT(RS_STACKDATA *stack, int count) {
    int index = GetStackInt(stack++);
    float x = GetStackFloat(stack++);
    float y = GetStackFloat(stack++);
    float z = GetStackFloat(stack);
    BT_OBJ_HANDLE *handle = GetObjHDL(index);

    if (handle->type == 0) {
        CFrame *frame = handle->frame;
        if (frame != NULL) {
            frame->SetRotType(2);
            frame->SetRotation(AngleLimit(x), AngleLimit(y), AngleLimit(z));
        }
    }
    if (handle->type == 1) {
        CCharacter *chara = handle->character;
        if (chara != NULL) {
            chara->SetRotation(AngleLimit(x), AngleLimit(y), AngleLimit(z));
        }
    }
    return 1;
}

int _SET_OBJHDL_DRAW_FLAG(RS_STACKDATA *stack, int count) {
    int index = GetStackInt(stack++);
    int draw = GetStackInt(stack);
    BT_OBJ_HANDLE *handle = GetObjHDL(index);

    if (handle->type == 0) {
        CFrame *frame = handle->frame;
        if (frame != NULL) {
            int draw_on = 2;
            if (draw) {
                draw_on = 1;
            }
            frame->attr.draw_on = draw_on;
            frame->flags = draw_on;
        }
    }
    if (handle->type == 1) {
        CCharacter *chara = handle->character;
        if (chara != NULL) {
            CFrame *frame = chara->frame;
            if (frame != NULL) {
                int draw_on = 2;
                if (draw) {
                    draw_on = 1;
                }
                frame->attr.draw_on = draw_on;
            }
        }
    }
    return 1;
}

int _GET_OBJHDL_POS(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR local = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR pos;
    BT_OBJ_HANDLE *handle = GetObjHDL(GetStackInt(stack++));

    if (handle->type == 0) {
        CFrame *frame = handle->frame;
        if (frame != NULL) {
            frame->GetWorldPosition(pos, local);
        }
    }
    if (handle->type == 1) {
        CCharacter *chara = handle->character;
        if (chara != NULL) {
            chara->GetPosition(pos);
        }
    }
    SetStack(stack++, pos[0]);
    SetStack(stack++, pos[1]);
    SetStack(stack, pos[2]);
    return 1;
}

int _GET_OBJHDL_ROT(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR rot = {0.0f, 0.0f, 0.0f, 1.0f};
    sceVu0FMATRIX matrix;
    BT_OBJ_HANDLE *handle = GetObjHDL(GetStackInt(stack++));

    if (handle->type == 0) {
        CFrame *frame = handle->frame;
        if (frame != NULL) {
            frame->GetLWMatrix(matrix);
            rot[0] = 0.0f;
            rot[1] = atan2f(matrix[2][0], matrix[2][2]);
            rot[2] = 0.0f;
            rot[3] = 1.0f;
        }
    }
    if (handle->type == 1) {
        CCharacter *chara = handle->character;
        if (chara != NULL) {
            chara->GetRotation(rot);
        }
    }
    SetStack(stack++, rot[0]);
    SetStack(stack++, rot[1]);
    SetStack(stack, rot[2]);
    return 1;
}

int _SET_URA_DUNGEON(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.request = 2;
    return 1;
}

int _GET_EVENT_POS(RS_STACKDATA *stack, int count) {
    SetStack(stack++, BtEventInfo.position[0]);
    SetStack(stack++, BtEventInfo.position[1]);
    SetStack(stack, BtEventInfo.position[2]);
    return 1;
}

int _GET_EVENT_ROT(RS_STACKDATA *stack, int count) {
    SetStack(stack++, BtEventInfo.direction[0]);
    SetStack(stack++, BtEventInfo.direction[1]);
    SetStack(stack, BtEventInfo.direction[2]);
    return 1;
}

int _OPEN_ENTRANCE_WINDOW(RS_STACKDATA *stack, int argument_count) {
    if (stack->type != RS_PTR) {
        return 0;
    }

    BtEventInfo.entrance_result = stack->p;
    BtEventInfo.request = 3;
    return 1;
}

int _OPEN_ESCAPE_WINDOW(RS_STACKDATA *stack, int argument_count) {
    if (stack->type != RS_PTR) {
        return 0;
    }

    BtEventInfo.escape_result = stack->p;
    BtBattleMusic_Stop();
    BtEventInfo.request = 6;
    return 1;
}

int _GO_DUNGEON(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.request = 4;
    return 1;
}

int _SET_DUNGEON_MAP(RS_STACKDATA *stack, int count) {
    char *map_file = GetStackString(stack++);
    BtLoadMapType = GetStackInt(stack);
    strcpy(BtLoadMapFileName, map_file);
    MainDungeonMap.unk_BDEC = BtLoadMapType;
    return 1;
}

int _LOAD_DUNGEON_MAP2(RS_STACKDATA *stack, int argument_count) {
    CUserStatus *status = UserStatus;
    status->res_limit_zone_current = -1;
    BtMapJumpLoad(BtLoadMapFileName);
    return 1;
}

int _LOAD_MONSTOR(RS_STACKDATA *stack, int argument_count) {
    BtLoadMonstor(0);
    BtArrengeMonstor();
    return 1;
}

int _SET_RANDOM_MAP(RS_STACKDATA *stack, int argument_count) {
    if (NowDngMap->unk_BDEC == 1) {
        BtCleatRandomMap();
    } else {
        BtCleatFreeMap();
    }
    return 1;
}

int _SET_EVENT_SW(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack++);
    NowEventMan->SearchDataSwitch(script_no, GetStackInt(stack));
    return 1;
}

int _SET_MONSTOR_ID(RS_STACKDATA *stack, int count) {
    int model_no = GetStackInt(stack++);
    int event_flag = -1;
    float pos[3];

    if (count == 2) {
        if (GetStackInt(stack++)) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    if (count == 5) {
        int clean = GetStackInt(stack++);
        pos[0] = GetStackFloat(stack++);
        pos[1] = GetStackFloat(stack++);
        pos[2] = GetStackFloat(stack++);
        if (clean) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    if (count == 6) {
        int clean = GetStackInt(stack++);
        pos[0] = GetStackFloat(stack++);
        pos[1] = GetStackFloat(stack++);
        pos[2] = GetStackFloat(stack++);
        event_flag = GetStackInt(stack);
        if (clean) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    NowMonstorUnit->SetupViewMonstor(model_no, pos, event_flag);
    return 1;
}

int _CHK_ATRA_HAVE(RS_STACKDATA *stack, int count) {
    int atra_no = GetStackInt(stack++);
    int have = GetAtraTipNowHave(atra_no, UserStatus->cur_georama);

    printf("%d,%d --> %d\n", atra_no, UserStatus->cur_georama, have);
    SetStack(stack, have);
    return 1;
}

int _SET_ATRA(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR pos;

    pos[0] = GetStackFloat(stack++);
    pos[1] = GetStackFloat(stack++);
    pos[2] = GetStackFloat(stack++);
    pos[3] = 1.0f;
    NowDngMap->SetAtraBoll(pos, GetStackInt(stack));
    return 1;
}

int _SET_IBOX(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR pos;

    pos[0] = GetStackFloat(stack++);
    pos[1] = GetStackFloat(stack++);
    pos[2] = GetStackFloat(stack++);
    pos[3] = 1.0f;
    NowDngMap->SetTreasureBox(pos, GetStackInt(stack), 1, 0);
    return 1;
}

int _GET_NOW_USER_ID(RS_STACKDATA *stack, int count) {
    int cur_chara = UserStatus->cur_chara;
    printf("get id = %d\n", cur_chara);
    SetStack(stack, cur_chara);
    return 1;
}

int _RUN_SCRIPT_NO(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack++);

    BtEventInfo.unk_34 = 0;
    if (count == 2) {
        BtEventInfo.unk_34 = GetStackInt(stack++);
    }
    if (count == 3) {
        BtEventInfo.unk_34 = GetStackInt(stack++);
        BtEventInfo.unk_90 = GetStackInt(stack);
    }
    BtEventInfo.request = 5;
    BtEventInfo.unk_9C = script_no;
    return 1;
}

int _CLEAN_MONSTOR_SCRIPT_NO(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack++);

    BtEventInfo.unk_A4 = 0;
    if (count > 1) {
        BtEventInfo.unk_A4 = GetStackInt(stack);
    }
    BtEventInfo.unk_A0 = script_no;
    return 1;
}

int _GET_NPC_OBJHDL(RS_STACKDATA *stack, int count) {
    int index = GetStackInt(stack++);
    int npc_no = GetStackInt(stack);
    BT_OBJ_HANDLE *handle = GetObjHDL(index);

    if (npc_no < 0 || npc_no > 3) {
        printf("over err\n");
        return 1;
    }

    CCharacter *chara = &NowDngMap->npc[npc_no].chara;
    if (chara->frame != NULL) {
        handle->character = chara;
        handle->type = 1;
    } else {
        handle->character = NULL;
        handle->type = 1;
    }
    return 1;
}

int _SET_MOTION_OBJHDL(RS_STACKDATA *stack, int count) {
    int npc_no = GetStackInt(stack++);
    int motion_no = GetStackInt(stack++);
    int speed = -1;
    int mode = 0;

    if (count > 2) {
        speed = GetStackFloat(stack++);
    }
    if (count > 3) {
        mode = GetStackInt(stack);
    }
    if (NowDngMap->npc[npc_no].chara.frame == NULL) {
        return 1;
    }
    if (count < 3) {
        NowDngMap->NPCSetMotion(npc_no, motion_no);
    } else {
        NowDngMap->NPCSetMotion(npc_no, motion_no, speed, mode);
    }
    return 1;
}

int _SET_NPC_ON_OFF(RS_STACKDATA *stack, int count) {
    int npc_no = GetStackInt(stack++);
    int enable = GetStackInt(stack);

    if (NowDngMap->npc[npc_no].chara.frame == NULL) {
        return 1;
    }
    NowDngMap->npc[npc_no].unk_11D8 = enable;
    return 1;
}

int _GET_GATEKEY_NO(RS_STACKDATA *stack, int count) {
    SetStack(stack, NowDngMap->unk_0464);
    return 1;
}

#ifdef NON_MATCHING
extern s32 BtUserWeaponDraw;

int _USER_WEAPON_DRAW(RS_STACKDATA *stack, int count) {
    if (count == 1) {
        BtUserWeaponDraw = GetStackInt(stack);
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _USER_WEAPON_DRAW__FP12RS_STACKDATAi);
#endif

int _SET_MAIN_CHR2(RS_STACKDATA *stack, int count) {
    int chara = GetStackInt(stack++);
    int mode = 0;

    if (count == 2) {
        mode = GetStackInt(stack);
    }
    if (chara < 0 || chara > 5) {
        return 1;
    }
    selectChrUnit(chara, mode);
    BtEventInfo.script_main_chr = chara;
    return 1;
}

int _RESET_MAIN_CHR(RS_STACKDATA *stack, int argument_count) {
    if (BtEventInfo.script_main_chr == -1) {
        return 1;
    }
    selectChrUnit(BtEventInfo.script_main_chr, 0);
    BtEventInfo.script_main_chr = -1;
    // Past the early exit the result is whatever selectChrUnit left behind.
}

int _SET_LIMMIT_ZONE(RS_STACKDATA *stack, int count) {
    UserStatus->res_limit_zone_current = GetStackInt(stack);
    SndSPSeLoad(0x1B);
    return 1;
}

int _SET_DEAD_FLAG(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->SetDead();
    return 1;
}

int _ALL_DRAW_FLAG(RS_STACKDATA *stack, int count) {
    if (count == 1) {
        BtAllDrawFlag = GetStackInt(stack);
    }
    return 1;
}

int _SET_FLOOR_TITLE(RS_STACKDATA *stack, int argument_count) {
    FloorTitleOn();
    return 1;
}

int _GET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtRubyDoorKey);
    return 1;
}

int _SET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    GetStackInt(stack);
    return 1;
}

int _SET_FLOOR_TITLE_OFF(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.unk_8C = 1;
    return 1;
}

int _SET_RES_LIMMIT_ZONE(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->SetResLimmitZone();
    if (UserStatus->res_limit_zone_current != -1) {
        SndSPSeLoad(0x1B);
    }
    return 1;
}

int _CLEAR_DEAMON_SHAFT(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->ClearDeamonShaft();
    return 1;
}

int _INIT_BEE(RS_STACKDATA *stack, int count) {
    BtEventInfo.unk_94 = GetStackInt(stack);
    InitBee(NPCUnit[BtEventInfo.unk_94].chara.frame, 15);
    return 1;
}

int _END_BEE(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.unk_94 = -1;
    return 1;
}

int _EASTKING_COMPLETE(RS_STACKDATA *stack, int count) {
    SetStack(stack, EastKingCheckComplete());
    return 1;
}

int _GET_ITEM_TRAPID(RS_STACKDATA *stack, int count) {
    int box = BtEventInfo.unk_AC;
    SetStack(stack, NowDngMap->boxes[box].unk_30);
    return 1;
}

int _RESET_ITEM_TRAP(RS_STACKDATA *stack, int count) {
    int box = BtEventInfo.unk_AC;
    NowDngMap->boxes[box].unk_30 = 0;
    BtEventInfo.unk_AC = 0;
    return 1;
}

int _BOM_SET(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR push = {0.0f, 0.0f, 1.0f, 1.0f};
    sceVu0FVECTOR direction;

    sceVu0CopyVector(pos, CharaMain.pos);
    pos[1] += 16.0f;
    pos[2] -= 3.0f;
    int bomb = SetBombEffect(pos, 1, selectMapNo * 20 + 20, 0.8f);
    if (bomb != -1) {
        CCollisionData *collision = NowColData;
        sceVu0Normalize(direction, push);
        sceVu0ScaleVectorXYZ(collision->hit[bomb].velocity, direction, 0.8f);
    }
    BtActStatus.unk_148 = 30;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_STATUS_ERR__FP12RS_STACKDATAi);
int _CHECK_MARDAN(RS_STACKDATA *stack, int count) {
    SetStack(stack, SaveData->GetMardanGareyanFlag());
    return 1;
}

int _NO_RESET_CHARA_NO(RS_STACKDATA *stack, int count) {
    BtEventInfo.unk_B0 = 1;
    return 1;
}

int _CHECK_CHR_HELP(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtEventInfo.unk_B4);
    return 1;
}

int _HOLD_ITEM_EVENT(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack);
    DngEventMan.SearchItemEventHold(script_no);
    UraEventMan.SearchItemEventHold(script_no);
    return 1;
}

int _STOP_BATTLE_BGM(RS_STACKDATA *stack, int argument_count) {
    BtBattleMusic_Stop();
    return 1;
}

int _NO_STATUS_RECOVER(RS_STACKDATA *stack, int count) {
    BtEventInfo.no_status_recover = 1;
    return 1;
}

int _SET_QUEST_DUNGEON(RS_STACKDATA *stack, int count) {
    int dungeon_no = GetStackInt(stack++);
    SaveData->QuestDungeon(dungeon_no, GetStackInt(stack));
    return 1;
}

int _GET_MAP_CODE(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->cur_georama + 1);
    return 1;
}

int _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *stack, int argument_count) {
    LoadActiveItemIcon();
    return 1;
}

int _GET_ITEM_UNIT_NO(RS_STACKDATA *stack, int count) {
    int item_no = GetStackInt(stack++);
    int unit = -1;
    int below = item_no < 0x101;

    if (!below) {
        if (!below && item_no < 0x12B) {
            unit = 0;
        }
        if (item_no >= 0x12B && item_no < 0x13A) {
            unit = 1;
        }
        if (item_no >= 0x13A && item_no < 0x14B) {
            unit = 2;
        }
        if (item_no >= 0x14B && item_no < 0x15B) {
            unit = 3;
        }
        if (item_no >= 0x15B && item_no < 0x16B) {
            unit = 4;
        }
        if (item_no >= 0x16B) {
            unit = 5;
        }
    }
    SetStack(stack, unit);
    return 1;
}

int _SET_IBOX_ANGLE(RS_STACKDATA *stack, int count) {
    NowDngMap->boxes[BtEventInfo.unk_AC].lid_angle = GetStackFloat(stack);
    return 1;
}

int _SET_IBOX_FINISH(RS_STACKDATA *stack, int count) {
    NowDngMap->boxes[BtEventInfo.unk_AC].lid_angle = -30.0f;
    NowDngMap->boxes[BtEventInfo.unk_AC].unk_24 = 0;
    return 1;
}

int _GET_PIERO_ITEM(RS_STACKDATA *stack, int count) {
    int item0, item1;

    GetPieroItem(selectMapNo, BtUraDongeon, &item0, &item1);
    SetStack(stack++, item0);
    SetStack(stack, item1);
    return 1;
}

/** Pairs one system script opcode function with its bytecode operation number. */
struct BT_EVENT_EXTERNAL_FUNCTION {
    int (*function)(RS_STACKDATA *, int); /**< Native function invoked by the bytecode operation. */
    int operation;                        /**< Bytecode operation number assigned to the function. */
};

/** Opcode functions of the system script, ended by an entry without a function. */
extern "C" BT_EVENT_EXTERNAL_FUNCTION ext_func_info__2[];

/** Dispatch table the event script calls opcodes through. */
extern int (*ext_func__2[1500])(RS_STACKDATA *, int);

void AddSystemEventScript(void) {
    for (int i = 0;; i++) {
        if (ext_func_info__2[i].function == NULL) {
            break;
        }
        int j;
        for (j = 0; j < i; j++) {
            if (ext_func_info__2[i].operation == ext_func_info__2[j].operation) {
                printf("same ext_func_no!!!\n");
                while (1) {
                }
            }
        }
        int operation = ext_func_info__2[i].operation;
        if (operation < 0 || operation >= 1500) {
            printf("ext func over!!");
        } else {
            ext_func__2[operation] = ext_func_info__2[i].function;
        }
    }
}
