#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDataAlloc2_1_;
struct RS_STACKDATA;


/**
 * @mangled BtSystemScriptEventInfoInit__Fv
 * @address 0x1BB060
 * @size 0x1A0
 * @unknownret
 */
void BtSystemScriptEventInfoInit(void);

/**
 * @mangled GetObjHDL__Fi
 * @address 0x1BB200
 * @size 0x60
 * @unknownret
 */
void GetObjHDL(int);

/**
 * @mangled BtSystemScriptLoad__Fi
 * @address 0x1BB260
 * @size 0xB0
 * @unknownret
 */
void BtSystemScriptLoad(int);

/**
 * @mangled BtSystemScriptInit__Fv
 * @address 0x1BB310
 * @size 0x2D0
 * @unknownret
 */
void BtSystemScriptInit(void);

/**
 * @mangled BtSystemScriptAfter__Fv
 * @address 0x1BB5E0
 * @size 0x310
 * @unknownret
 */
void BtSystemScriptAfter(void);

/**
 * @mangled BtSystemScriptRun__FiP14CDataAlloc2_1_
 * @address 0x1BB8F0
 * @size 0x30
 * @unknownret
 */
void BtSystemScriptRun(int, CDataAlloc2_1_ *);

/**
 * @mangled BtSetMapJumpFloor__Fi
 * @address 0x1BB920
 * @size 0x10
 * @unknownret
 */
void BtSetMapJumpFloor(int);

/**
 * @mangled GetStackInt__FP12RS_STACKDATA__2
 * @address 0x1BB930
 * @size 0x50
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void GetStackInt(RS_STACKDATA *);

/**
 * @mangled GetStackFloat__FP12RS_STACKDATA__2
 * @address 0x1BB980
 * @size 0x30
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void GetStackFloat(RS_STACKDATA *);

/**
 * @mangled GetStackString__FP12RS_STACKDATA__2
 * @address 0x1BB9B0
 * @size 0x10
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void GetStackString(RS_STACKDATA *);

/**
 * @mangled SetStack__FP12RS_STACKDATAi__2
 * @address 0x1BB9C0
 * @size 0x20
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void SetStack(RS_STACKDATA *, int);

/**
 * @mangled SetStack__FP12RS_STACKDATAf__2
 * @address 0x1BB9E0
 * @size 0x20
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void SetStack(RS_STACKDATA *, float);

/**
 * @mangled _GET_FLOOR_LEVEL__FP12RS_STACKDATAi
 * @address 0x1BBA00
 * @size 0x30
 * @unknownret
 */
void _GET_FLOOR_LEVEL(RS_STACKDATA *, int);

/**
 * @mangled _SET_FLOOR_LEVEL__FP12RS_STACKDATAi
 * @address 0x1BBA30
 * @size 0x40
 * @unknownret
 */
void _SET_FLOOR_LEVEL(RS_STACKDATA *, int);

/**
 * @mangled _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi
 * @address 0x1BBA70
 * @size 0x30
 * @unknownret
 */
void _GET_OLD_FLOOR_LEVEL(RS_STACKDATA *, int);

/**
 * @mangled _GET_ACTION_MODE__FP12RS_STACKDATAi
 * @address 0x1BBAA0
 * @size 0x30
 * @unknownret
 */
void _GET_ACTION_MODE(RS_STACKDATA *, int);

/**
 * @mangled _ITEM_USE_WINDOW__FP12RS_STACKDATAi
 * @address 0x1BBAD0
 * @size 0xF0
 * @unknownret
 */
void _ITEM_USE_WINDOW(RS_STACKDATA *, int);

/**
 * @mangled _CHECK_EVENT_FLG__FP12RS_STACKDATAi
 * @address 0x1BBBC0
 * @size 0x50
 * @unknownret
 */
void _CHECK_EVENT_FLG(RS_STACKDATA *, int);

/**
 * @mangled _SET_EVENT_FLG__FP12RS_STACKDATAi
 * @address 0x1BBC10
 * @size 0x70
 * @unknownret
 */
void _SET_EVENT_FLG(RS_STACKDATA *, int);

/**
 * @mangled _GET_OBJHDL__FP12RS_STACKDATAi
 * @address 0x1BBC80
 * @size 0x130
 * @unknownret
 */
void _GET_OBJHDL(RS_STACKDATA *, int);

/**
 * @mangled _SET_OBJHDL_POS__FP12RS_STACKDATAi
 * @address 0x1BBDB0
 * @size 0x100
 * @unknownret
 */
void _SET_OBJHDL_POS(RS_STACKDATA *, int);

/**
 * @mangled _SET_OBJHDL_ROT__FP12RS_STACKDATAi
 * @address 0x1BBEB0
 * @size 0x180
 * @unknownret
 */
void _SET_OBJHDL_ROT(RS_STACKDATA *, int);

/**
 * @mangled _SET_OBJHDL_DRAW_FLAG__FP12RS_STACKDATAi
 * @address 0x1BC030
 * @size 0xD0
 * @unknownret
 */
void _SET_OBJHDL_DRAW_FLAG(RS_STACKDATA *, int);

/**
 * @mangled _GET_OBJHDL_POS__FP12RS_STACKDATAi
 * @address 0x1BC100
 * @size 0xF0
 * @unknownret
 */
void _GET_OBJHDL_POS(RS_STACKDATA *, int);

/**
 * @mangled _GET_OBJHDL_ROT__FP12RS_STACKDATAi
 * @address 0x1BC1F0
 * @size 0x110
 * @unknownret
 */
void _GET_OBJHDL_ROT(RS_STACKDATA *, int);

/**
 * @mangled _SET_URA_DUNGEON__FP12RS_STACKDATAi
 * @address 0x1BC300
 * @size 0x20
 * @unknownret
 */
void _SET_URA_DUNGEON(RS_STACKDATA *, int);

/**
 * @mangled _GET_EVENT_POS__FP12RS_STACKDATAi
 * @address 0x1BC320
 * @size 0x60
 * @unknownret
 */
void _GET_EVENT_POS(RS_STACKDATA *, int);

/**
 * @mangled _GET_EVENT_ROT__FP12RS_STACKDATAi
 * @address 0x1BC380
 * @size 0x60
 * @unknownret
 */
void _GET_EVENT_ROT(RS_STACKDATA *, int);

/**
 * @mangled _OPEN_ENTRANCE_WINDOW__FP12RS_STACKDATAi
 * @address 0x1BC3E0
 * @size 0x40
 * @unknownret
 */
void _OPEN_ENTRANCE_WINDOW(RS_STACKDATA *, int);

/**
 * @mangled _OPEN_ESCAPE_WINDOW__FP12RS_STACKDATAi
 * @address 0x1BC420
 * @size 0x60
 * @unknownret
 */
void _OPEN_ESCAPE_WINDOW(RS_STACKDATA *, int);

/**
 * @mangled _GO_DUNGEON__FP12RS_STACKDATAi
 * @address 0x1BC480
 * @size 0x20
 * @unknownret
 */
void _GO_DUNGEON(RS_STACKDATA *, int);

/**
 * @mangled _SET_DUNGEON_MAP__FP12RS_STACKDATAi
 * @address 0x1BC4A0
 * @size 0x70
 * @unknownret
 */
void _SET_DUNGEON_MAP(RS_STACKDATA *, int);

/**
 * @mangled _LOAD_DUNGEON_MAP2__FP12RS_STACKDATAi
 * @address 0x1BC510
 * @size 0x40
 * @unknownret
 */
void _LOAD_DUNGEON_MAP2(RS_STACKDATA *, int);

/**
 * @mangled _LOAD_MONSTOR__FP12RS_STACKDATAi
 * @address 0x1BC550
 * @size 0x30
 * @unknownret
 */
void _LOAD_MONSTOR(RS_STACKDATA *, int);

/**
 * @mangled _SET_RANDOM_MAP__FP12RS_STACKDATAi
 * @address 0x1BC580
 * @size 0x50
 * @unknownret
 */
void _SET_RANDOM_MAP(RS_STACKDATA *, int);

/**
 * @mangled _SET_EVENT_SW__FP12RS_STACKDATAi
 * @address 0x1BC5D0
 * @size 0x60
 * @unknownret
 */
void _SET_EVENT_SW(RS_STACKDATA *, int);

/**
 * @mangled _SET_MONSTOR_ID__FP12RS_STACKDATAi
 * @address 0x1BC630
 * @size 0x1C0
 * @unknownret
 */
void _SET_MONSTOR_ID(RS_STACKDATA *, int);

/**
 * @mangled _CHK_ATRA_HAVE__FP12RS_STACKDATAi
 * @address 0x1BC7F0
 * @size 0x90
 * @unknownret
 */
void _CHK_ATRA_HAVE(RS_STACKDATA *, int);

/**
 * @mangled _SET_ATRA__FP12RS_STACKDATAi
 * @address 0x1BC880
 * @size 0x80
 * @unknownret
 */
void _SET_ATRA(RS_STACKDATA *, int);

/**
 * @mangled _SET_IBOX__FP12RS_STACKDATAi
 * @address 0x1BC900
 * @size 0x90
 * @unknownret
 */
void _SET_IBOX(RS_STACKDATA *, int);

/**
 * @mangled _GET_NOW_USER_ID__FP12RS_STACKDATAi
 * @address 0x1BC990
 * @size 0x60
 * @unknownret
 */
void _GET_NOW_USER_ID(RS_STACKDATA *, int);

/**
 * @mangled _RUN_SCRIPT_NO__FP12RS_STACKDATAi
 * @address 0x1BC9F0
 * @size 0xC0
 * @unknownret
 */
void _RUN_SCRIPT_NO(RS_STACKDATA *, int);

/**
 * @mangled _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi
 * @address 0x1BCAB0
 * @size 0x80
 * @unknownret
 */
void _CLEAN_MONSTOR_SCRIPT_NO(RS_STACKDATA *, int);

/**
 * @mangled _GET_NPC_OBJHDL__FP12RS_STACKDATAi
 * @address 0x1BCB30
 * @size 0xD0
 * @unknownret
 */
void _GET_NPC_OBJHDL(RS_STACKDATA *, int);

/**
 * @mangled _SET_MOTION_OBJHDL__FP12RS_STACKDATAi
 * @address 0x1BCC00
 * @size 0x140
 * @unknownret
 */
void _SET_MOTION_OBJHDL(RS_STACKDATA *, int);

/**
 * @mangled _SET_NPC_ON_OFF__FP12RS_STACKDATAi
 * @address 0x1BCD40
 * @size 0x90
 * @unknownret
 */
void _SET_NPC_ON_OFF(RS_STACKDATA *, int);

/**
 * @mangled _GET_GATEKEY_NO__FP12RS_STACKDATAi
 * @address 0x1BCDD0
 * @size 0x30
 * @unknownret
 */
void _GET_GATEKEY_NO(RS_STACKDATA *, int);

/**
 * @mangled _USER_WEAPON_DRAW__FP12RS_STACKDATAi
 * @address 0x1BCE00
 * @size 0x40
 * @unknownret
 */
void _USER_WEAPON_DRAW(RS_STACKDATA *, int);

/**
 * @mangled _SET_MAIN_CHR2__FP12RS_STACKDATAi
 * @address 0x1BCE40
 * @size 0xA0
 * @unknownret
 */
void _SET_MAIN_CHR2(RS_STACKDATA *, int);

/**
 * @mangled _RESET_MAIN_CHR__FP12RS_STACKDATAi
 * @address 0x1BCEE0
 * @size 0x50
 * @unknownret
 */
void _RESET_MAIN_CHR(RS_STACKDATA *, int);

/**
 * @mangled _SET_LIMMIT_ZONE__FP12RS_STACKDATAi
 * @address 0x1BCF30
 * @size 0x40
 * @unknownret
 */
void _SET_LIMMIT_ZONE(RS_STACKDATA *, int);

/**
 * @mangled _SET_DEAD_FLAG__FP12RS_STACKDATAi
 * @address 0x1BCF70
 * @size 0x30
 * @unknownret
 */
void _SET_DEAD_FLAG(RS_STACKDATA *, int);

/**
 * @mangled _ALL_DRAW_FLAG__FP12RS_STACKDATAi
 * @address 0x1BCFA0
 * @size 0x40
 * @unknownret
 */
void _ALL_DRAW_FLAG(RS_STACKDATA *, int);

/**
 * @mangled _SET_FLOOR_TITLE__FP12RS_STACKDATAi
 * @address 0x1BCFE0
 * @size 0x30
 * @unknownret
 */
void _SET_FLOOR_TITLE(RS_STACKDATA *, int);

/**
 * @mangled _GET_RUBY_ELEMENT__FP12RS_STACKDATAi
 * @address 0x1BD010
 * @size 0x30
 * @unknownret
 */
void _GET_RUBY_ELEMENT(RS_STACKDATA *, int);

/**
 * @mangled _SET_RUBY_ELEMENT__FP12RS_STACKDATAi
 * @address 0x1BD040
 * @size 0x30
 * @unknownret
 */
void _SET_RUBY_ELEMENT(RS_STACKDATA *, int);

/**
 * @mangled _SET_FLOOR_TITLE_OFF__FP12RS_STACKDATAi
 * @address 0x1BD070
 * @size 0x20
 * @unknownret
 */
void _SET_FLOOR_TITLE_OFF(RS_STACKDATA *, int);

/**
 * @mangled _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi
 * @address 0x1BD090
 * @size 0x50
 * @unknownret
 */
void _SET_RES_LIMMIT_ZONE(RS_STACKDATA *, int);

/**
 * @mangled _CLEAR_DEAMON_SHAFT__FP12RS_STACKDATAi
 * @address 0x1BD0E0
 * @size 0x30
 * @unknownret
 */
void _CLEAR_DEAMON_SHAFT(RS_STACKDATA *, int);

/**
 * @mangled _INIT_BEE__FP12RS_STACKDATAi
 * @address 0x1BD110
 * @size 0x70
 * @unknownret
 */
void _INIT_BEE(RS_STACKDATA *, int);

/**
 * @mangled _END_BEE__FP12RS_STACKDATAi
 * @address 0x1BD180
 * @size 0x20
 * @unknownret
 */
void _END_BEE(RS_STACKDATA *, int);

/**
 * @mangled _EASTKING_COMPLETE__FP12RS_STACKDATAi
 * @address 0x1BD1A0
 * @size 0x40
 * @unknownret
 */
void _EASTKING_COMPLETE(RS_STACKDATA *, int);

/**
 * @mangled _GET_ITEM_TRAPID__FP12RS_STACKDATAi
 * @address 0x1BD1E0
 * @size 0x50
 * @unknownret
 */
void _GET_ITEM_TRAPID(RS_STACKDATA *, int);

/**
 * @mangled _RESET_ITEM_TRAP__FP12RS_STACKDATAi
 * @address 0x1BD230
 * @size 0x40
 * @unknownret
 */
void _RESET_ITEM_TRAP(RS_STACKDATA *, int);

/**
 * @mangled _BOM_SET__FP12RS_STACKDATAi
 * @address 0x1BD270
 * @size 0x100
 * @unknownret
 */
void _BOM_SET(RS_STACKDATA *, int);

/**
 * @mangled _SET_STATUS_ERR__FP12RS_STACKDATAi
 * @address 0x1BD370
 * @size 0x90
 * @unknownret
 */
void _SET_STATUS_ERR(RS_STACKDATA *, int);

/**
 * @mangled _CHECK_MARDAN__FP12RS_STACKDATAi
 * @address 0x1BD400
 * @size 0x40
 * @unknownret
 */
void _CHECK_MARDAN(RS_STACKDATA *, int);

/**
 * @mangled _NO_RESET_CHARA_NO__FP12RS_STACKDATAi
 * @address 0x1BD440
 * @size 0x20
 * @unknownret
 */
void _NO_RESET_CHARA_NO(RS_STACKDATA *, int);

/**
 * @mangled _CHECK_CHR_HELP__FP12RS_STACKDATAi
 * @address 0x1BD460
 * @size 0x30
 * @unknownret
 */
void _CHECK_CHR_HELP(RS_STACKDATA *, int);

/**
 * @mangled _HOLD_ITEM_EVENT__FP12RS_STACKDATAi
 * @address 0x1BD490
 * @size 0x60
 * @unknownret
 */
void _HOLD_ITEM_EVENT(RS_STACKDATA *, int);

/**
 * @mangled _STOP_BATTLE_BGM__FP12RS_STACKDATAi
 * @address 0x1BD4F0
 * @size 0x30
 * @unknownret
 */
void _STOP_BATTLE_BGM(RS_STACKDATA *, int);

/**
 * @mangled _NO_STATUS_RECOVER__FP12RS_STACKDATAi
 * @address 0x1BD520
 * @size 0x20
 * @unknownret
 */
void _NO_STATUS_RECOVER(RS_STACKDATA *, int);

/**
 * @mangled _SET_QUEST_DUNGEON__FP12RS_STACKDATAi
 * @address 0x1BD540
 * @size 0x60
 * @unknownret
 */
void _SET_QUEST_DUNGEON(RS_STACKDATA *, int);

/**
 * @mangled _GET_MAP_CODE__FP12RS_STACKDATAi
 * @address 0x1BD5A0
 * @size 0x30
 * @unknownret
 */
void _GET_MAP_CODE(RS_STACKDATA *, int);

/**
 * @mangled _SET_ACTIVE_ITEM_ICON__FP12RS_STACKDATAi
 * @address 0x1BD5D0
 * @size 0x30
 * @unknownret
 */
void _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *, int);

/**
 * @mangled _GET_ITEM_UNIT_NO__FP12RS_STACKDATAi
 * @address 0x1BD600
 * @size 0xF0
 * @unknownret
 */
void _GET_ITEM_UNIT_NO(RS_STACKDATA *, int);

/**
 * @mangled _SET_IBOX_ANGLE__FP12RS_STACKDATAi
 * @address 0x1BD6F0
 * @size 0x50
 * @unknownret
 */
void _SET_IBOX_ANGLE(RS_STACKDATA *, int);

/**
 * @mangled _SET_IBOX_FINISH__FP12RS_STACKDATAi
 * @address 0x1BD740
 * @size 0x50
 * @unknownret
 */
void _SET_IBOX_FINISH(RS_STACKDATA *, int);

/**
 * @mangled _GET_PIERO_ITEM__FP12RS_STACKDATAi
 * @address 0x1BD790
 * @size 0x70
 * @unknownret
 */
void _GET_PIERO_ITEM(RS_STACKDATA *, int);

/**
 * @mangled AddSystemEventScript__Fv
 * @address 0x1BD800
 * @size 0x100
 * @unknownret
 */
void AddSystemEventScript(void);
