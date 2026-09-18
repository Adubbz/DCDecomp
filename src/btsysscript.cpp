#include "btsysscript.hpp"

#include <cstdio>

#include "btitem.hpp"
#include "btmisc.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "frame.hpp"
#include "nowload.hpp"
#include "runscript.hpp"
#include "shot_freefuncs.hpp"
#include "userstatus.hpp"

/**
 * Name of the map file the next battle-map jump loads.
 */
extern char BtLoadMapFileName[32];

/** Randomized element the current floor's sealed door wants. */
extern int BtRubyDoorKey;

/** Nonzero while the dungeon floor is drawn at all. */
extern s32 BtAllDrawFlag;

INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptEventInfoInit__Fv);

#ifdef NON_MATCHING
BT_OBJ_HANDLE *GetObjHDL(int index) {
    if (index < 0 || index >= 32) {
        printf("** obj hdl err **\n");
        return NULL;
    }

    return &BtObjHdl[index];
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetObjHDL__Fi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @579);
#endif
/** File buffer the current floor's system script is read into. */
extern "C" CDataAlloc2<1> BtSystemScriptFileBuffer;

/** Base address of the system script data currently loaded. */
extern s32 BtEventData;

#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptLoad__Fi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @584);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptInit__Fv);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptAfter__Fv);
#ifdef NON_MATCHING
int BtSystemScriptRun(int event, CDataAlloc2<1> *arena) {
    return EdEventInit(event, arena, (char *) BtEventData);
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptRun__FiP14CDataAlloc2_1_);
#endif

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
#ifdef NON_MATCHING
int GetStackInt(RS_STACKDATA *argument) {
    if (argument->type == RS_FLOAT) {
        return (int) argument->f;
    }
    return argument->i;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackInt__FP12RS_STACKDATA__2);
#endif
/**
 * Reads one script argument as a float, converting it where the slot holds an integer.
 *
 * @mangled GetStackFloat__FP12RS_STACKDATA__2
 * @address 0x1BB980
 * @size 0x2C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
float GetStackFloat(RS_STACKDATA *argument) {
    if (argument->type == RS_INT) {
        return (float) argument->i;
    }
    return argument->f;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackFloat__FP12RS_STACKDATA__2);
#endif
/**
 * Reads one script argument as a string.
 *
 * @mangled GetStackString__FP12RS_STACKDATA__2
 * @address 0x1BB9B0
 * @size 0xC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
char *GetStackString(RS_STACKDATA *argument) {
    return argument->s;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackString__FP12RS_STACKDATA__2);
#endif
/**
 * Writes an integer back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAi__2
 * @address 0x1BB9C0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
void SetStack(RS_STACKDATA *argument, int value) {
    if (argument->type == RS_PTR) {
        argument->p->i = value;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", SetStack__FP12RS_STACKDATAi__2);
#endif
/**
 * Writes a float back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAf__2
 * @address 0x1BB9E0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
void SetStack(RS_STACKDATA *argument, float value) {
    if (argument->type == RS_PTR) {
        argument->p->f = value;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", SetStack__FP12RS_STACKDATAf__2);
#endif
#ifdef NON_MATCHING
int _GET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->cur_floor);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_FLOOR_LEVEL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _SET_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    ((CDngStatusData *) UserStatus)->SetNowFloor(GetStackInt(stack));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_FLOOR_LEVEL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_OLD_FLOOR_LEVEL(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->unk_03);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_ACTION_MODE(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtEventInfo.unk_24);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ACTION_MODE__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", _ITEM_USE_WINDOW__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _CHECK_EVENT_FLG(RS_STACKDATA *stack, int count) {
    SetStack(&stack[1], UserStatus->ChkEventFlag(GetStackInt(stack)));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_EVENT_FLG__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_EVENT_FLG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OBJHDL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @700);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @701);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_OBJHDL_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_OBJHDL_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_OBJHDL_DRAW_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OBJHDL_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OBJHDL_ROT__FP12RS_STACKDATAi);

int _SET_URA_DUNGEON(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.request = 2;
    return 1;
}

#ifdef NON_MATCHING
int _GET_EVENT_POS(RS_STACKDATA *stack, int count) {
    SetStack(stack++, BtEventInfo.position[0]);
    SetStack(stack++, BtEventInfo.position[1]);
    SetStack(stack, BtEventInfo.position[2]);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_EVENT_POS__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_EVENT_ROT(RS_STACKDATA *stack, int count) {
    SetStack(stack++, BtEventInfo.direction[0]);
    SetStack(stack++, BtEventInfo.direction[1]);
    SetStack(stack, BtEventInfo.direction[2]);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_EVENT_ROT__FP12RS_STACKDATAi);
#endif

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

#ifdef NON_MATCHING
#include <cstring>

extern s32 BtLoadMapType;
extern s32 BtLoadMapTypeMirror;

int _SET_DUNGEON_MAP(RS_STACKDATA *stack, int count) {
    char *map_file = GetStackString(stack);
    BtLoadMapType = GetStackInt(&stack[1]);
    strcpy(BtLoadMapFileName, map_file);
    BtLoadMapTypeMirror = BtLoadMapType;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_DUNGEON_MAP__FP12RS_STACKDATAi);
#endif

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

#ifdef NON_MATCHING
#include "dungeoneventman.hpp"

extern CDungeonEventMan *NowEventMan;

int _SET_EVENT_SW(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack++);
    NowEventMan->SearchDataSwitch(script_no, GetStackInt(stack));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_EVENT_SW__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MONSTOR_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHK_ATRA_HAVE__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @809);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_ATRA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _GET_NOW_USER_ID(RS_STACKDATA *stack, int count) {
    int cur_chara = UserStatus->cur_chara;
    printf("get id = %d\n", cur_chara);
    SetStack(stack, cur_chara);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_NOW_USER_ID__FP12RS_STACKDATAi);
#endif
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @817);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _RUN_SCRIPT_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_NPC_OBJHDL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @833);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MOTION_OBJHDL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_NPC_ON_OFF__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _GET_GATEKEY_NO(RS_STACKDATA *stack, int count) {
    SetStack(stack, NowDngMap->unk_0464);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_GATEKEY_NO__FP12RS_STACKDATAi);
#endif
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
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MAIN_CHR2__FP12RS_STACKDATAi);

int _RESET_MAIN_CHR(RS_STACKDATA *stack, int argument_count) {
    if (BtEventInfo.script_main_chr == -1) {
        return 1;
    }
    selectChrUnit(BtEventInfo.script_main_chr, 0);
    BtEventInfo.script_main_chr = -1;
    // Past the early exit the result is whatever selectChrUnit left behind.
}

#ifdef NON_MATCHING
extern "C" int SndSPSeLoad__Fi(int set_no);

int _SET_LIMMIT_ZONE(RS_STACKDATA *stack, int count) {
    UserStatus->res_limit_zone_current = GetStackInt(stack);
    SndSPSeLoad__Fi(0x1B);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_LIMMIT_ZONE__FP12RS_STACKDATAi);
#endif

int _SET_DEAD_FLAG(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->SetDead();
    return 1;
}

#ifdef NON_MATCHING
int _ALL_DRAW_FLAG(RS_STACKDATA *stack, int count) {
    if (count == 1) {
        BtAllDrawFlag = GetStackInt(stack);
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _ALL_DRAW_FLAG__FP12RS_STACKDATAi);
#endif

int _SET_FLOOR_TITLE(RS_STACKDATA *stack, int argument_count) {
    FloorTitleOn();
    return 1;
}

#ifdef NON_MATCHING
int _GET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtRubyDoorKey);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_RUBY_ELEMENT__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _SET_RUBY_ELEMENT(RS_STACKDATA *stack, int count) {
    GetStackInt(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_RUBY_ELEMENT__FP12RS_STACKDATAi);
#endif

int _SET_FLOOR_TITLE_OFF(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.unk_8C = 1;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi);

int _CLEAR_DEAMON_SHAFT(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->ClearDeamonShaft();
    return 1;
}

#ifdef NON_MATCHING
#include "npcharacter.hpp"

extern "C" CNPCharacter NPCUnit[6];
extern "C" void InitBee__FP6CFramei(CFrame *frame, int count);

int _INIT_BEE(RS_STACKDATA *stack, int count) {
    BtEventInfo.unk_94 = GetStackInt(stack);
    InitBee__FP6CFramei(NPCUnit[BtEventInfo.unk_94].chara.frame, 15);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _INIT_BEE__FP12RS_STACKDATAi);
#endif

int _END_BEE(RS_STACKDATA *stack, int argument_count) {
    BtEventInfo.unk_94 = -1;
    return 1;
}

#ifdef NON_MATCHING
#include "menu_misc.hpp"

int _EASTKING_COMPLETE(RS_STACKDATA *stack, int count) {
    SetStack(stack, EastKingCheckComplete());
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _EASTKING_COMPLETE__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_ITEM_TRAPID(RS_STACKDATA *stack, int count) {
    SetStack(stack, NowDngMap->boxes[BtEventInfo.unk_AC].unk_30);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ITEM_TRAPID__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _RESET_ITEM_TRAP(RS_STACKDATA *stack, int count) {
    NowDngMap->boxes[BtEventInfo.unk_AC].unk_30 = 0;
    BtEventInfo.unk_AC = 0;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _RESET_ITEM_TRAP__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", _BOM_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_STATUS_ERR__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
#include "shop.hpp"

int _CHECK_MARDAN(RS_STACKDATA *stack, int count) {
    SetStack(stack, GetMardanGareyanFlag());
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_MARDAN__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _NO_RESET_CHARA_NO(RS_STACKDATA *stack, int count) {
    *(s32 *) BtEventInfo.unk_B0 = 1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _NO_RESET_CHARA_NO__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _CHECK_CHR_HELP(RS_STACKDATA *stack, int count) {
    SetStack(stack, BtEventInfo.unk_B4);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_CHR_HELP__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
extern "C" CDungeonEventMan DngEventMan;
extern "C" CDungeonEventMan UraEventMan;

int _HOLD_ITEM_EVENT(RS_STACKDATA *stack, int count) {
    int script_no = GetStackInt(stack);
    DngEventMan.SearchItemEventHold(script_no);
    UraEventMan.SearchItemEventHold(script_no);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _HOLD_ITEM_EVENT__FP12RS_STACKDATAi);
#endif

int _STOP_BATTLE_BGM(RS_STACKDATA *stack, int argument_count) {
    BtBattleMusic_Stop();
    return 1;
}

#ifdef NON_MATCHING
int _NO_STATUS_RECOVER(RS_STACKDATA *stack, int count) {
    BtEventInfo.no_status_recover = 1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _NO_STATUS_RECOVER__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
#include "savedata.hpp"

int _SET_QUEST_DUNGEON(RS_STACKDATA *stack, int count) {
    int dungeon_no = GetStackInt(stack++);
    SaveData->QuestDungeon(dungeon_no, GetStackInt(stack));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_QUEST_DUNGEON__FP12RS_STACKDATAi);
#endif
#ifdef NON_MATCHING
int _GET_MAP_CODE(RS_STACKDATA *stack, int count) {
    SetStack(stack, UserStatus->cur_georama + 1);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_MAP_CODE__FP12RS_STACKDATAi);
#endif

int _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *stack, int argument_count) {
    LoadActiveItemIcon();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ITEM_UNIT_NO__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
int _SET_IBOX_ANGLE(RS_STACKDATA *stack, int count) {
    NowDngMap->boxes[BtEventInfo.unk_AC].lid_angle = GetStackFloat(stack);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX_ANGLE__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX_FINISH__FP12RS_STACKDATAi);
#ifdef NON_MATCHING
extern s32 BtUraDongeon;
extern "C" void GetPieroItem__FiiPiPi(int map_no, int ura_dungeon, int *item0, int *item1);

int _GET_PIERO_ITEM(RS_STACKDATA *stack, int count) {
    int item0, item1;

    GetPieroItem__FiiPiPi(selectMapNo, BtUraDongeon, &item0, &item1);
    SetStack(stack++, item0);
    SetStack(stack, item1);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_PIERO_ITEM__FP12RS_STACKDATAi);
#endif
INCLUDE_ASM("asm/nonmatchings/btsysscript", AddSystemEventScript__Fv);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @974);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @975);
