#include "btsysscript.hpp"

#include "btitem.hpp"
#include "btmisc.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "frame.hpp"
#include "runscript.hpp"

INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptEventInfoInit__Fv);
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetObjHDL__Fi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @579);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptLoad__Fi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @584);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptInit__Fv);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptAfter__Fv);
INCLUDE_ASM("asm/nonmatchings/btsysscript", BtSystemScriptRun__FiP14CDataAlloc2_1_);

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
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackInt__FP12RS_STACKDATA__2);
/**
 * Reads one script argument as a float, converting it where the slot holds an integer.
 *
 * @mangled GetStackFloat__FP12RS_STACKDATA__2
 * @address 0x1BB980
 * @size 0x2C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackFloat__FP12RS_STACKDATA__2);
/**
 * Reads one script argument as a string.
 *
 * @mangled GetStackString__FP12RS_STACKDATA__2
 * @address 0x1BB9B0
 * @size 0xC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/btsysscript", GetStackString__FP12RS_STACKDATA__2);
/**
 * Writes an integer back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAi__2
 * @address 0x1BB9C0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/btsysscript", SetStack__FP12RS_STACKDATAi__2);
/**
 * Writes a float back through a script argument that names a variable.
 *
 * @mangled SetStack__FP12RS_STACKDATAf__2
 * @address 0x1BB9E0
 * @size 0x20
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/btsysscript", SetStack__FP12RS_STACKDATAf__2);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_FLOOR_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_FLOOR_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ACTION_MODE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _ITEM_USE_WINDOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_EVENT_FLG__FP12RS_STACKDATAi);
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

INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_EVENT_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_EVENT_ROT__FP12RS_STACKDATAi);

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

INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_DUNGEON_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _LOAD_DUNGEON_MAP2__FP12RS_STACKDATAi);

int _LOAD_MONSTOR(RS_STACKDATA *stack, int argument_count) {
    BtLoadMonstor(0);
    BtArrengeMonstor();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_RANDOM_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_EVENT_SW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MONSTOR_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHK_ATRA_HAVE__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @809);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_ATRA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_NOW_USER_ID__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @817);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _RUN_SCRIPT_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_NPC_OBJHDL__FP12RS_STACKDATAi);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @833);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MOTION_OBJHDL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_NPC_ON_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_GATEKEY_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _USER_WEAPON_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_MAIN_CHR2__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _RESET_MAIN_CHR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_LIMMIT_ZONE__FP12RS_STACKDATAi);

int _SET_DEAD_FLAG(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->SetDead();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _ALL_DRAW_FLAG__FP12RS_STACKDATAi);

int _SET_FLOOR_TITLE(RS_STACKDATA *stack, int argument_count) {
    FloorTitleOn();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_RUBY_ELEMENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_RUBY_ELEMENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_FLOOR_TITLE_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi);

int _CLEAR_DEAMON_SHAFT(RS_STACKDATA *stack, int argument_count) {
    ((CDngStatusData *) UserStatus)->ClearDeamonShaft();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _INIT_BEE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _END_BEE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _EASTKING_COMPLETE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ITEM_TRAPID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _RESET_ITEM_TRAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _BOM_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_STATUS_ERR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_MARDAN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _NO_RESET_CHARA_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _CHECK_CHR_HELP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _HOLD_ITEM_EVENT__FP12RS_STACKDATAi);

int _STOP_BATTLE_BGM(RS_STACKDATA *stack, int argument_count) {
    BtBattleMusic_Stop();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _NO_STATUS_RECOVER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_QUEST_DUNGEON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_MAP_CODE__FP12RS_STACKDATAi);

int _SET_ACTIVE_ITEM_ICON(RS_STACKDATA *stack, int argument_count) {
    LoadActiveItemIcon();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_ITEM_UNIT_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _SET_IBOX_FINISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", _GET_PIERO_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/btsysscript", AddSystemEventScript__Fv);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @974);
INCLUDE_RODATA("asm/nonmatchings/btsysscript", @975);
