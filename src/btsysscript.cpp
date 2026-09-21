#include "btsysscript.hpp"

#include <cstdio>
#include <cstring>

#include "btitem.hpp"
#include "btmisc.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "frame.hpp"
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

/**
 * Scatters the bees over their frames and hides the frames themselves.
 */
void InitBee(CFrame *frame, int count);

/**
 * Gives the two items the clown offers on one floor.
 */
void GetPieroItem(int map_no, int ura_dungeon, int *item0, int *item1);

INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptEventInfoInit__Fv);

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

INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptInit__Fv);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptAfter__Fv);
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
extern "C" static int GetStackInt__FP12RS_STACKDATA__2(RS_STACKDATA *argument) {
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
extern "C" static float GetStackFloat__FP12RS_STACKDATA__2(RS_STACKDATA *argument) {
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
extern "C" static char *GetStackString__FP12RS_STACKDATA__2(RS_STACKDATA *argument) {
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
extern "C" static void SetStack__FP12RS_STACKDATAi__2(RS_STACKDATA *argument, int value) {
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
extern "C" static void SetStack__FP12RS_STACKDATAf__2(RS_STACKDATA *argument, float value) {
    if (argument->type == RS_PTR) {
        argument->p->f = value;
    }
}

int _GET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, UserStatus->cur_floor);
    return 1;
}

int _SET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    ((CDngStatusData *) UserStatus)->SetNowFloor(GetStackInt__FP12RS_STACKDATA__2(stack));
    return 1;
}

int _GET_OLD_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, UserStatus->unk_03);
    return 1;
}

int _GET_ACTION_MODE(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, BtEventInfo.unk_24);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _ITEM_USE_WINDOW__FP12RS_STACKDATAi);
int _CHECK_EVENT_FLG(RS_STACKDATA *stack, int count) {
    int flag_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int flag = UserStatus->ChkEventFlag(flag_no);
    SetStack__FP12RS_STACKDATAi__2(stack, flag);
    return 1;
}

int _SET_EVENT_FLG(RS_STACKDATA *stack, int count) {
    int flag_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int value = GetStackInt__FP12RS_STACKDATA__2(stack);
    CUserStatus *status = UserStatus;

    if (flag_no >= 0 && flag_no < 50) {
        status->event_flags[flag_no] = value;
    }
    return 1;
}

int _GET_OBJHDL(RS_STACKDATA *stack, int count) {
    int index = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int parts_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    char *name = GetStackString__FP12RS_STACKDATA__2(stack);
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
    int index = GetStackInt__FP12RS_STACKDATA__2(stack++);
    float x = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    float y = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    float z = GetStackFloat__FP12RS_STACKDATA__2(stack);
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
    int index = GetStackInt__FP12RS_STACKDATA__2(stack++);
    float x = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    float y = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    float z = GetStackFloat__FP12RS_STACKDATA__2(stack);
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
    int index = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int draw = GetStackInt__FP12RS_STACKDATA__2(stack);
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

INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OBJHDL_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OBJHDL_ROT__FP12RS_STACKDATAi);

int _SET_URA_DUNGEON(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.request = 2;
    return 1;
}

int _GET_EVENT_POS(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAf__2(stack++, BtEventInfo.position[0]);
    SetStack__FP12RS_STACKDATAf__2(stack++, BtEventInfo.position[1]);
    SetStack__FP12RS_STACKDATAf__2(stack, BtEventInfo.position[2]);
    return 1;
}

int _GET_EVENT_ROT(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAf__2(stack++, BtEventInfo.direction[0]);
    SetStack__FP12RS_STACKDATAf__2(stack++, BtEventInfo.direction[1]);
    SetStack__FP12RS_STACKDATAf__2(stack, BtEventInfo.direction[2]);
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
    char *map_file = GetStackString__FP12RS_STACKDATA__2(stack++);
    BtLoadMapType = GetStackInt__FP12RS_STACKDATA__2(stack);
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
    int script_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    NowEventMan->SearchDataSwitch(script_no, GetStackInt__FP12RS_STACKDATA__2(stack));
    return 1;
}

int _SET_MONSTOR_ID(RS_STACKDATA *stack, int count) {
    int model_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int event_flag = -1;
    float pos[3];

    if (count == 2) {
        if (GetStackInt__FP12RS_STACKDATA__2(stack++)) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    if (count == 5) {
        int clean = GetStackInt__FP12RS_STACKDATA__2(stack++);
        pos[0] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        pos[1] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        pos[2] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        if (clean) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    if (count == 6) {
        int clean = GetStackInt__FP12RS_STACKDATA__2(stack++);
        pos[0] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        pos[1] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        pos[2] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
        event_flag = GetStackInt__FP12RS_STACKDATA__2(stack);
        if (clean) {
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(0);
        }
    }
    NowMonstorUnit->SetupViewMonstor(model_no, pos, event_flag);
    return 1;
}

int _CHK_ATRA_HAVE(RS_STACKDATA *stack, int count) {
    int atra_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int have = GetAtraTipNowHave(atra_no, UserStatus->cur_georama);

    printf("%d,%d --> %d\n", atra_no, UserStatus->cur_georama, have);
    SetStack__FP12RS_STACKDATAi__2(stack, have);
    return 1;
}

int _SET_ATRA(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR pos;

    pos[0] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[1] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[2] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[3] = 1.0f;
    NowDngMap->SetAtraBoll(pos, GetStackInt__FP12RS_STACKDATA__2(stack));
    return 1;
}

int _SET_IBOX(RS_STACKDATA *stack, int count) {
    sceVu0FVECTOR pos;

    pos[0] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[1] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[2] = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    pos[3] = 1.0f;
    NowDngMap->SetTreasureBox(pos, GetStackInt__FP12RS_STACKDATA__2(stack), 1, 0);
    return 1;
}

int _GET_NOW_USER_ID(RS_STACKDATA *stack, int count) {
    int cur_chara = UserStatus->cur_chara;
    printf("get id = %d\n", cur_chara);
    SetStack__FP12RS_STACKDATAi__2(stack, cur_chara);
    return 1;
}

int _RUN_SCRIPT_NO(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt__FP12RS_STACKDATA__2(stack++);

    BtEventInfo.unk_34 = 0;
    if (count == 2) {
        BtEventInfo.unk_34 = GetStackInt__FP12RS_STACKDATA__2(stack++);
    }
    if (count == 3) {
        BtEventInfo.unk_34 = GetStackInt__FP12RS_STACKDATA__2(stack++);
        BtEventInfo.unk_90 = GetStackInt__FP12RS_STACKDATA__2(stack);
    }
    BtEventInfo.request = 5;
    BtEventInfo.unk_9C = script_no;
    return 1;
}

int _CLEAN_MONSTOR_SCRIPT_NO(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt__FP12RS_STACKDATA__2(stack++);

    BtEventInfo.unk_A4 = 0;
    if (count > 1) {
        BtEventInfo.unk_A4 = GetStackInt__FP12RS_STACKDATA__2(stack);
    }
    BtEventInfo.unk_A0 = script_no;
    return 1;
}

int _GET_NPC_OBJHDL(RS_STACKDATA *stack, int count) {
    int index = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int npc_no = GetStackInt__FP12RS_STACKDATA__2(stack);
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
    int npc_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int motion_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int speed = -1;
    int mode = 0;

    if (count > 2) {
        speed = GetStackFloat__FP12RS_STACKDATA__2(stack++);
    }
    if (count > 3) {
        mode = GetStackInt__FP12RS_STACKDATA__2(stack);
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
    int npc_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int enable = GetStackInt__FP12RS_STACKDATA__2(stack);

    if (NowDngMap->npc[npc_no].chara.frame == NULL) {
        return 1;
    }
    NowDngMap->npc[npc_no].unk_11D8 = enable;
    return 1;
}

int _GET_GATEKEY_NO(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, NowDngMap->unk_0464);
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
    int chara = GetStackInt__FP12RS_STACKDATA__2(stack++);
    int mode = 0;

    if (count == 2) {
        mode = GetStackInt__FP12RS_STACKDATA__2(stack);
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
    UserStatus->res_limit_zone_current = GetStackInt__FP12RS_STACKDATA__2(stack);
    SndSPSeLoad(0x1B);
    return 1;
}

int _SET_DEAD_FLAG(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->SetDead();
    return 1;
}

int _ALL_DRAW_FLAG(RS_STACKDATA *stack, int count) {
    if (count == 1) {
        BtAllDrawFlag = GetStackInt__FP12RS_STACKDATA__2(stack);
    }
    return 1;
}

int _SET_FLOOR_TITLE(RS_STACKDATA *stack, int argument_count) {
    FloorTitleOn();
    return 1;
}

int _GET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, BtRubyDoorKey);
    return 1;
}

int _SET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    GetStackInt__FP12RS_STACKDATA__2(stack);
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
    BtEventInfo.unk_94 = GetStackInt__FP12RS_STACKDATA__2(stack);
    InitBee(NPCUnit[BtEventInfo.unk_94].chara.frame, 15);
    return 1;
}

int _END_BEE(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.unk_94 = -1;
    return 1;
}

int _EASTKING_COMPLETE(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, EastKingCheckComplete());
    return 1;
}

int _GET_ITEM_TRAPID(RS_STACKDATA *stack, int count) {
    int box = BtEventInfo.unk_AC;
    SetStack__FP12RS_STACKDATAi__2(stack, NowDngMap->boxes[box].unk_30);
    return 1;
}

int _RESET_ITEM_TRAP(RS_STACKDATA *stack, int count) {
    int box = BtEventInfo.unk_AC;
    NowDngMap->boxes[box].unk_30 = 0;
    BtEventInfo.unk_AC = 0;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _BOM_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_STATUS_ERR__FP12RS_STACKDATAi);
int _CHECK_MARDAN(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, SaveData->GetMardanGareyanFlag());
    return 1;
}

#ifdef NON_MATCHING
int _NO_RESET_CHARA_NO(RS_STACKDATA *stack, int count) {
    *(s32 *) BtEventInfo.unk_B0 = 1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _NO_RESET_CHARA_NO__FP12RS_STACKDATAi);
#endif
int _CHECK_CHR_HELP(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, BtEventInfo.unk_B4);
    return 1;
}

int _HOLD_ITEM_EVENT(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt__FP12RS_STACKDATA__2(stack);
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
    int dungeon_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
    SaveData->QuestDungeon(dungeon_no, GetStackInt__FP12RS_STACKDATA__2(stack));
    return 1;
}

int _GET_MAP_CODE(RS_STACKDATA *stack, int count) {
    SetStack__FP12RS_STACKDATAi__2(stack, UserStatus->cur_georama + 1);
    return 1;
}

int _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *stack, int argument_count) {
    LoadActiveItemIcon();
    return 1;
}

int _GET_ITEM_UNIT_NO(RS_STACKDATA *stack, int count) {
    int item_no = GetStackInt__FP12RS_STACKDATA__2(stack++);
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
    SetStack__FP12RS_STACKDATAi__2(stack, unit);
    return 1;
}

int _SET_IBOX_ANGLE(RS_STACKDATA *stack, int count) {
    NowDngMap->boxes[BtEventInfo.unk_AC].lid_angle = GetStackFloat__FP12RS_STACKDATA__2(stack);
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
    SetStack__FP12RS_STACKDATAi__2(stack++, item0);
    SetStack__FP12RS_STACKDATAi__2(stack, item1);
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
