#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDataAlloc2_1_;
struct RS_STACKDATA;


/* ?ret */ void BtSystemScriptEventInfoInit(void); // @ 0x1BB060 (0x1A0 bytes) -- mangled: BtSystemScriptEventInfoInit__Fv
/* ?ret */ void GetObjHDL(int); // @ 0x1BB200 (0x60 bytes) -- mangled: GetObjHDL__Fi
/* ?ret */ void BtSystemScriptLoad(int); // @ 0x1BB260 (0xB0 bytes) -- mangled: BtSystemScriptLoad__Fi
/* ?ret */ void BtSystemScriptInit(void); // @ 0x1BB310 (0x2D0 bytes) -- mangled: BtSystemScriptInit__Fv
/* ?ret */ void BtSystemScriptAfter(void); // @ 0x1BB5E0 (0x310 bytes) -- mangled: BtSystemScriptAfter__Fv
/* ?ret */ void BtSystemScriptRun(int, CDataAlloc2_1_ *); // @ 0x1BB8F0 (0x30 bytes) -- mangled: BtSystemScriptRun__FiP14CDataAlloc2_1_
/* ?ret */ void BtSetMapJumpFloor(int); // @ 0x1BB920 (0x10 bytes) -- mangled: BtSetMapJumpFloor__Fi
/* ?ret */ void GetStackInt(RS_STACKDATA *); // @ 0x1BB930 (0x50 bytes) -- mangled: GetStackInt__FP12RS_STACKDATA__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void GetStackFloat(RS_STACKDATA *); // @ 0x1BB980 (0x30 bytes) -- mangled: GetStackFloat__FP12RS_STACKDATA__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void GetStackString(RS_STACKDATA *); // @ 0x1BB9B0 (0x10 bytes) -- mangled: GetStackString__FP12RS_STACKDATA__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void SetStack(RS_STACKDATA *, int); // @ 0x1BB9C0 (0x20 bytes) -- mangled: SetStack__FP12RS_STACKDATAi__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void SetStack(RS_STACKDATA *, float); // @ 0x1BB9E0 (0x20 bytes) -- mangled: SetStack__FP12RS_STACKDATAf__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void _GET_FLOOR_LEVEL(RS_STACKDATA *, int); // @ 0x1BBA00 (0x30 bytes) -- mangled: _GET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* ?ret */ void _SET_FLOOR_LEVEL(RS_STACKDATA *, int); // @ 0x1BBA30 (0x40 bytes) -- mangled: _SET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* ?ret */ void _GET_OLD_FLOOR_LEVEL(RS_STACKDATA *, int); // @ 0x1BBA70 (0x30 bytes) -- mangled: _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi
/* ?ret */ void _GET_ACTION_MODE(RS_STACKDATA *, int); // @ 0x1BBAA0 (0x30 bytes) -- mangled: _GET_ACTION_MODE__FP12RS_STACKDATAi
/* ?ret */ void _ITEM_USE_WINDOW(RS_STACKDATA *, int); // @ 0x1BBAD0 (0xF0 bytes) -- mangled: _ITEM_USE_WINDOW__FP12RS_STACKDATAi
/* ?ret */ void _CHECK_EVENT_FLG(RS_STACKDATA *, int); // @ 0x1BBBC0 (0x50 bytes) -- mangled: _CHECK_EVENT_FLG__FP12RS_STACKDATAi
/* ?ret */ void _SET_EVENT_FLG(RS_STACKDATA *, int); // @ 0x1BBC10 (0x70 bytes) -- mangled: _SET_EVENT_FLG__FP12RS_STACKDATAi
/* ?ret */ void _GET_OBJHDL(RS_STACKDATA *, int); // @ 0x1BBC80 (0x130 bytes) -- mangled: _GET_OBJHDL__FP12RS_STACKDATAi
/* ?ret */ void _SET_OBJHDL_POS(RS_STACKDATA *, int); // @ 0x1BBDB0 (0x100 bytes) -- mangled: _SET_OBJHDL_POS__FP12RS_STACKDATAi
/* ?ret */ void _SET_OBJHDL_ROT(RS_STACKDATA *, int); // @ 0x1BBEB0 (0x180 bytes) -- mangled: _SET_OBJHDL_ROT__FP12RS_STACKDATAi
/* ?ret */ void _SET_OBJHDL_DRAW_FLAG(RS_STACKDATA *, int); // @ 0x1BC030 (0xD0 bytes) -- mangled: _SET_OBJHDL_DRAW_FLAG__FP12RS_STACKDATAi
/* ?ret */ void _GET_OBJHDL_POS(RS_STACKDATA *, int); // @ 0x1BC100 (0xF0 bytes) -- mangled: _GET_OBJHDL_POS__FP12RS_STACKDATAi
/* ?ret */ void _GET_OBJHDL_ROT(RS_STACKDATA *, int); // @ 0x1BC1F0 (0x110 bytes) -- mangled: _GET_OBJHDL_ROT__FP12RS_STACKDATAi
/* ?ret */ void _SET_URA_DUNGEON(RS_STACKDATA *, int); // @ 0x1BC300 (0x20 bytes) -- mangled: _SET_URA_DUNGEON__FP12RS_STACKDATAi
/* ?ret */ void _GET_EVENT_POS(RS_STACKDATA *, int); // @ 0x1BC320 (0x60 bytes) -- mangled: _GET_EVENT_POS__FP12RS_STACKDATAi
/* ?ret */ void _GET_EVENT_ROT(RS_STACKDATA *, int); // @ 0x1BC380 (0x60 bytes) -- mangled: _GET_EVENT_ROT__FP12RS_STACKDATAi
/* ?ret */ void _OPEN_ENTRANCE_WINDOW(RS_STACKDATA *, int); // @ 0x1BC3E0 (0x40 bytes) -- mangled: _OPEN_ENTRANCE_WINDOW__FP12RS_STACKDATAi
/* ?ret */ void _OPEN_ESCAPE_WINDOW(RS_STACKDATA *, int); // @ 0x1BC420 (0x60 bytes) -- mangled: _OPEN_ESCAPE_WINDOW__FP12RS_STACKDATAi
/* ?ret */ void _GO_DUNGEON(RS_STACKDATA *, int); // @ 0x1BC480 (0x20 bytes) -- mangled: _GO_DUNGEON__FP12RS_STACKDATAi
/* ?ret */ void _SET_DUNGEON_MAP(RS_STACKDATA *, int); // @ 0x1BC4A0 (0x70 bytes) -- mangled: _SET_DUNGEON_MAP__FP12RS_STACKDATAi
/* ?ret */ void _LOAD_DUNGEON_MAP2(RS_STACKDATA *, int); // @ 0x1BC510 (0x40 bytes) -- mangled: _LOAD_DUNGEON_MAP2__FP12RS_STACKDATAi
/* ?ret */ void _LOAD_MONSTOR(RS_STACKDATA *, int); // @ 0x1BC550 (0x30 bytes) -- mangled: _LOAD_MONSTOR__FP12RS_STACKDATAi
/* ?ret */ void _SET_RANDOM_MAP(RS_STACKDATA *, int); // @ 0x1BC580 (0x50 bytes) -- mangled: _SET_RANDOM_MAP__FP12RS_STACKDATAi
/* ?ret */ void _SET_EVENT_SW(RS_STACKDATA *, int); // @ 0x1BC5D0 (0x60 bytes) -- mangled: _SET_EVENT_SW__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_ID(RS_STACKDATA *, int); // @ 0x1BC630 (0x1C0 bytes) -- mangled: _SET_MONSTOR_ID__FP12RS_STACKDATAi
/* ?ret */ void _CHK_ATRA_HAVE(RS_STACKDATA *, int); // @ 0x1BC7F0 (0x90 bytes) -- mangled: _CHK_ATRA_HAVE__FP12RS_STACKDATAi
/* ?ret */ void _SET_ATRA(RS_STACKDATA *, int); // @ 0x1BC880 (0x80 bytes) -- mangled: _SET_ATRA__FP12RS_STACKDATAi
/* ?ret */ void _SET_IBOX(RS_STACKDATA *, int); // @ 0x1BC900 (0x90 bytes) -- mangled: _SET_IBOX__FP12RS_STACKDATAi
/* ?ret */ void _GET_NOW_USER_ID(RS_STACKDATA *, int); // @ 0x1BC990 (0x60 bytes) -- mangled: _GET_NOW_USER_ID__FP12RS_STACKDATAi
/* ?ret */ void _RUN_SCRIPT_NO(RS_STACKDATA *, int); // @ 0x1BC9F0 (0xC0 bytes) -- mangled: _RUN_SCRIPT_NO__FP12RS_STACKDATAi
/* ?ret */ void _CLEAN_MONSTOR_SCRIPT_NO(RS_STACKDATA *, int); // @ 0x1BCAB0 (0x80 bytes) -- mangled: _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi
/* ?ret */ void _GET_NPC_OBJHDL(RS_STACKDATA *, int); // @ 0x1BCB30 (0xD0 bytes) -- mangled: _GET_NPC_OBJHDL__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOTION_OBJHDL(RS_STACKDATA *, int); // @ 0x1BCC00 (0x140 bytes) -- mangled: _SET_MOTION_OBJHDL__FP12RS_STACKDATAi
/* ?ret */ void _SET_NPC_ON_OFF(RS_STACKDATA *, int); // @ 0x1BCD40 (0x90 bytes) -- mangled: _SET_NPC_ON_OFF__FP12RS_STACKDATAi
/* ?ret */ void _GET_GATEKEY_NO(RS_STACKDATA *, int); // @ 0x1BCDD0 (0x30 bytes) -- mangled: _GET_GATEKEY_NO__FP12RS_STACKDATAi
/* ?ret */ void _USER_WEAPON_DRAW(RS_STACKDATA *, int); // @ 0x1BCE00 (0x40 bytes) -- mangled: _USER_WEAPON_DRAW__FP12RS_STACKDATAi
/* ?ret */ void _SET_MAIN_CHR2(RS_STACKDATA *, int); // @ 0x1BCE40 (0xA0 bytes) -- mangled: _SET_MAIN_CHR2__FP12RS_STACKDATAi
/* ?ret */ void _RESET_MAIN_CHR(RS_STACKDATA *, int); // @ 0x1BCEE0 (0x50 bytes) -- mangled: _RESET_MAIN_CHR__FP12RS_STACKDATAi
/* ?ret */ void _SET_LIMMIT_ZONE(RS_STACKDATA *, int); // @ 0x1BCF30 (0x40 bytes) -- mangled: _SET_LIMMIT_ZONE__FP12RS_STACKDATAi
/* ?ret */ void _SET_DEAD_FLAG(RS_STACKDATA *, int); // @ 0x1BCF70 (0x30 bytes) -- mangled: _SET_DEAD_FLAG__FP12RS_STACKDATAi
/* ?ret */ void _ALL_DRAW_FLAG(RS_STACKDATA *, int); // @ 0x1BCFA0 (0x40 bytes) -- mangled: _ALL_DRAW_FLAG__FP12RS_STACKDATAi
/* ?ret */ void _SET_FLOOR_TITLE(RS_STACKDATA *, int); // @ 0x1BCFE0 (0x30 bytes) -- mangled: _SET_FLOOR_TITLE__FP12RS_STACKDATAi
/* ?ret */ void _GET_RUBY_ELEMENT(RS_STACKDATA *, int); // @ 0x1BD010 (0x30 bytes) -- mangled: _GET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* ?ret */ void _SET_RUBY_ELEMENT(RS_STACKDATA *, int); // @ 0x1BD040 (0x30 bytes) -- mangled: _SET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* ?ret */ void _SET_FLOOR_TITLE_OFF(RS_STACKDATA *, int); // @ 0x1BD070 (0x20 bytes) -- mangled: _SET_FLOOR_TITLE_OFF__FP12RS_STACKDATAi
/* ?ret */ void _SET_RES_LIMMIT_ZONE(RS_STACKDATA *, int); // @ 0x1BD090 (0x50 bytes) -- mangled: _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi
/* ?ret */ void _CLEAR_DEAMON_SHAFT(RS_STACKDATA *, int); // @ 0x1BD0E0 (0x30 bytes) -- mangled: _CLEAR_DEAMON_SHAFT__FP12RS_STACKDATAi
/* ?ret */ void _INIT_BEE(RS_STACKDATA *, int); // @ 0x1BD110 (0x70 bytes) -- mangled: _INIT_BEE__FP12RS_STACKDATAi
/* ?ret */ void _END_BEE(RS_STACKDATA *, int); // @ 0x1BD180 (0x20 bytes) -- mangled: _END_BEE__FP12RS_STACKDATAi
/* ?ret */ void _EASTKING_COMPLETE(RS_STACKDATA *, int); // @ 0x1BD1A0 (0x40 bytes) -- mangled: _EASTKING_COMPLETE__FP12RS_STACKDATAi
/* ?ret */ void _GET_ITEM_TRAPID(RS_STACKDATA *, int); // @ 0x1BD1E0 (0x50 bytes) -- mangled: _GET_ITEM_TRAPID__FP12RS_STACKDATAi
/* ?ret */ void _RESET_ITEM_TRAP(RS_STACKDATA *, int); // @ 0x1BD230 (0x40 bytes) -- mangled: _RESET_ITEM_TRAP__FP12RS_STACKDATAi
/* ?ret */ void _BOM_SET(RS_STACKDATA *, int); // @ 0x1BD270 (0x100 bytes) -- mangled: _BOM_SET__FP12RS_STACKDATAi
/* ?ret */ void _SET_STATUS_ERR(RS_STACKDATA *, int); // @ 0x1BD370 (0x90 bytes) -- mangled: _SET_STATUS_ERR__FP12RS_STACKDATAi
/* ?ret */ void _CHECK_MARDAN(RS_STACKDATA *, int); // @ 0x1BD400 (0x40 bytes) -- mangled: _CHECK_MARDAN__FP12RS_STACKDATAi
/* ?ret */ void _NO_RESET_CHARA_NO(RS_STACKDATA *, int); // @ 0x1BD440 (0x20 bytes) -- mangled: _NO_RESET_CHARA_NO__FP12RS_STACKDATAi
/* ?ret */ void _CHECK_CHR_HELP(RS_STACKDATA *, int); // @ 0x1BD460 (0x30 bytes) -- mangled: _CHECK_CHR_HELP__FP12RS_STACKDATAi
/* ?ret */ void _HOLD_ITEM_EVENT(RS_STACKDATA *, int); // @ 0x1BD490 (0x60 bytes) -- mangled: _HOLD_ITEM_EVENT__FP12RS_STACKDATAi
/* ?ret */ void _STOP_BATTLE_BGM(RS_STACKDATA *, int); // @ 0x1BD4F0 (0x30 bytes) -- mangled: _STOP_BATTLE_BGM__FP12RS_STACKDATAi
/* ?ret */ void _NO_STATUS_RECOVER(RS_STACKDATA *, int); // @ 0x1BD520 (0x20 bytes) -- mangled: _NO_STATUS_RECOVER__FP12RS_STACKDATAi
/* ?ret */ void _SET_QUEST_DUNGEON(RS_STACKDATA *, int); // @ 0x1BD540 (0x60 bytes) -- mangled: _SET_QUEST_DUNGEON__FP12RS_STACKDATAi
/* ?ret */ void _GET_MAP_CODE(RS_STACKDATA *, int); // @ 0x1BD5A0 (0x30 bytes) -- mangled: _GET_MAP_CODE__FP12RS_STACKDATAi
/* ?ret */ void _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *, int); // @ 0x1BD5D0 (0x30 bytes) -- mangled: _SET_ACTIVE_ITEM_ICON__FP12RS_STACKDATAi
/* ?ret */ void _GET_ITEM_UNIT_NO(RS_STACKDATA *, int); // @ 0x1BD600 (0xF0 bytes) -- mangled: _GET_ITEM_UNIT_NO__FP12RS_STACKDATAi
/* ?ret */ void _SET_IBOX_ANGLE(RS_STACKDATA *, int); // @ 0x1BD6F0 (0x50 bytes) -- mangled: _SET_IBOX_ANGLE__FP12RS_STACKDATAi
/* ?ret */ void _SET_IBOX_FINISH(RS_STACKDATA *, int); // @ 0x1BD740 (0x50 bytes) -- mangled: _SET_IBOX_FINISH__FP12RS_STACKDATAi
/* ?ret */ void _GET_PIERO_ITEM(RS_STACKDATA *, int); // @ 0x1BD790 (0x70 bytes) -- mangled: _GET_PIERO_ITEM__FP12RS_STACKDATAi
/* ?ret */ void AddSystemEventScript(void); // @ 0x1BD800 (0x100 bytes) -- mangled: AddSystemEventScript__Fv
