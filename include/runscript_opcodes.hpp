#pragma once

#include "common.h"

/* ?ret */ void GetStackInt(RS_STACKDATA *); // @ 0x1E1640 (0x50 bytes) -- mangled: GetStackInt__FP12RS_STACKDATA__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void GetStackFloat(RS_STACKDATA *); // @ 0x1E1690 (0x30 bytes) -- mangled: GetStackFloat__FP12RS_STACKDATA__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void GetStackString(RS_STACKDATA *); // @ 0x1E16C0 (0x10 bytes) -- mangled: GetStackString__FP12RS_STACKDATA__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void SetStack(RS_STACKDATA *, int); // @ 0x1E16D0 (0x20 bytes) -- mangled: SetStack__FP12RS_STACKDATAi__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void SetStack(RS_STACKDATA *, float); // @ 0x1E16F0 (0x20 bytes) -- mangled: SetStack__FP12RS_STACKDATAf__3  // disambiguated by disassembler ("__3" suffix); real retail name has no suffix
/* ?ret */ void _SET_MOTION(RS_STACKDATA *, int); // @ 0x1E1710 (0x480 bytes) -- mangled: _SET_MOTION__FP12RS_STACKDATAi
/* ?ret */ void _CHK_MOTION_FRM(RS_STACKDATA *, int); // @ 0x1E1B90 (0xD0 bytes) -- mangled: _CHK_MOTION_FRM__FP12RS_STACKDATAi
/* ?ret */ void _GET_MOTION_FRM(RS_STACKDATA *, int); // @ 0x1E1C60 (0x50 bytes) -- mangled: _GET_MOTION_FRM__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOTION_FRM(RS_STACKDATA *, int); // @ 0x1E1CB0 (0x50 bytes) -- mangled: _SET_MOTION_FRM__FP12RS_STACKDATAi
/* ?ret */ void _GET_DISTANCE(RS_STACKDATA *, int); // @ 0x1E1D00 (0xF0 bytes) -- mangled: _GET_DISTANCE__FP12RS_STACKDATAi
/* ?ret */ void _GET_POSITION(RS_STACKDATA *, int); // @ 0x1E1DF0 (0xF0 bytes) -- mangled: _GET_POSITION__FP12RS_STACKDATAi
/* ?ret */ void _SET_ROTATION(RS_STACKDATA *, int); // @ 0x1E1EE0 (0x1D0 bytes) -- mangled: _SET_ROTATION__FP12RS_STACKDATAi
/* ?ret */ void _CHK_ROTATION(RS_STACKDATA *, int); // @ 0x1E20B0 (0x70 bytes) -- mangled: _CHK_ROTATION__FP12RS_STACKDATAi
/* ?ret */ void _CHK_MOVE(RS_STACKDATA *, int); // @ 0x1E2120 (0x100 bytes) -- mangled: _CHK_MOVE__FP12RS_STACKDATAi
/* ?ret */ void _CHK_USER_INNER_PRODUCT(RS_STACKDATA *, int); // @ 0x1E2220 (0x210 bytes) -- mangled: _CHK_USER_INNER_PRODUCT__FP12RS_STACKDATAi
/* ?ret */ void _GET_VECTOR(RS_STACKDATA *, int); // @ 0x1E2430 (0x210 bytes) -- mangled: _GET_VECTOR__FP12RS_STACKDATAi
/* ?ret */ void _GET_DIRECTION(RS_STACKDATA *, int); // @ 0x1E2640 (0x180 bytes) -- mangled: _GET_DIRECTION__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOVE(RS_STACKDATA *, int); // @ 0x1E27C0 (0x160 bytes) -- mangled: _SET_MOVE__FP12RS_STACKDATAi
/* ?ret */ void _CHK_MOVE_INFO(RS_STACKDATA *, int); // @ 0x1E2920 (0x140 bytes) -- mangled: _CHK_MOVE_INFO__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOVE_CANSEL(RS_STACKDATA *, int); // @ 0x1E2A60 (0x40 bytes) -- mangled: _SET_MOVE_CANSEL__FP12RS_STACKDATAi
/* ?ret */ void _SET_ROT_CANSEL(RS_STACKDATA *, int); // @ 0x1E2AA0 (0x40 bytes) -- mangled: _SET_ROT_CANSEL__FP12RS_STACKDATAi
/* ?ret */ void _SET_POSITION(RS_STACKDATA *, int); // @ 0x1E2AE0 (0x90 bytes) -- mangled: _SET_POSITION__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_FALL(RS_STACKDATA *, int); // @ 0x1E2B70 (0x60 bytes) -- mangled: _STATUS_SET_FALL__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_MUTEKI(RS_STACKDATA *, int); // @ 0x1E2BD0 (0x90 bytes) -- mangled: _STATUS_SET_MUTEKI__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_ALPHA(RS_STACKDATA *, int); // @ 0x1E2C60 (0xC0 bytes) -- mangled: _STATUS_SET_ALPHA__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_CHK_ALPHA(RS_STACKDATA *, int); // @ 0x1E2D20 (0x110 bytes) -- mangled: _STATUS_CHK_ALPHA__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_DEAD(RS_STACKDATA *, int); // @ 0x1E2E30 (0x50 bytes) -- mangled: _STATUS_SET_DEAD__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_EVENT(RS_STACKDATA *, int); // @ 0x1E2E80 (0x30 bytes) -- mangled: _STATUS_SET_EVENT__FP12RS_STACKDATAi
/* ?ret */ void _RUN_SCRIPT(RS_STACKDATA *, int); // @ 0x1E2EB0 (0x40 bytes) -- mangled: _RUN_SCRIPT__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_COL_OFF(RS_STACKDATA *, int); // @ 0x1E2EF0 (0x60 bytes) -- mangled: _STATUS_SET_COL_OFF__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_LIFE_RATE(RS_STACKDATA *, int); // @ 0x1E2F50 (0x90 bytes) -- mangled: _STATUS_GET_LIFE_RATE__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_USER_VECTOR(RS_STACKDATA *, int); // @ 0x1E2FE0 (0x110 bytes) -- mangled: _STATUS_GET_USER_VECTOR__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_HEIGHT(RS_STACKDATA *, int); // @ 0x1E30F0 (0x50 bytes) -- mangled: _STATUS_GET_HEIGHT__FP12RS_STACKDATAi
/* ?ret */ void _GET_RAND(RS_STACKDATA *, int); // @ 0x1E3140 (0x90 bytes) -- mangled: _GET_RAND__FP12RS_STACKDATAi
/* ?ret */ void _GET_RANDF(RS_STACKDATA *, int); // @ 0x1E31D0 (0x90 bytes) -- mangled: _GET_RANDF__FP12RS_STACKDATAi
/* ?ret */ void _SIN_DEG(RS_STACKDATA *, int); // @ 0x1E3260 (0x60 bytes) -- mangled: _SIN_DEG__FP12RS_STACKDATAi
/* ?ret */ void _COS_DEG(RS_STACKDATA *, int); // @ 0x1E32C0 (0x60 bytes) -- mangled: _COS_DEG__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_PALLET(RS_STACKDATA *, int); // @ 0x1E3320 (0x1E0 bytes) -- mangled: _STATUS_SET_PALLET__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_CLIPLEVEL(RS_STACKDATA *, int); // @ 0x1E3500 (0x60 bytes) -- mangled: _STATUS_SET_CLIPLEVEL__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_HITDMG_VOL(RS_STACKDATA *, int); // @ 0x1E3560 (0x50 bytes) -- mangled: _STATUS_GET_HITDMG_VOL__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_MOTION_ID(RS_STACKDATA *, int); // @ 0x1E35B0 (0x50 bytes) -- mangled: _STATUS_GET_MOTION_ID__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_GET_DMG_ID(RS_STACKDATA *, int); // @ 0x1E3600 (0x50 bytes) -- mangled: _STATUS_GET_DMG_ID__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_LOCKON_DIST(RS_STACKDATA *, int); // @ 0x1E3650 (0x60 bytes) -- mangled: _STATUS_SET_LOCKON_DIST__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_SHADOW_LEN(RS_STACKDATA *, int); // @ 0x1E36B0 (0x60 bytes) -- mangled: _STATUS_SET_SHADOW_LEN__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_LOCKON_TRG(RS_STACKDATA *, int); // @ 0x1E3710 (0x130 bytes) -- mangled: _STATUS_SET_LOCKON_TRG__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOV_COL(RS_STACKDATA *, int); // @ 0x1E3840 (0x1B0 bytes) -- mangled: _SET_MOV_COL__FP12RS_STACKDATAi
/* ?ret */ void _SET_BODY_COL(RS_STACKDATA *, int); // @ 0x1E39F0 (0x2B0 bytes) -- mangled: _SET_BODY_COL__FP12RS_STACKDATAi
/* ?ret */ void _SET_BODY_COL_PARA(RS_STACKDATA *, int); // @ 0x1E3CA0 (0x110 bytes) -- mangled: _SET_BODY_COL_PARA__FP12RS_STACKDATAi
/* ?ret */ void _SET_DMG_COL(RS_STACKDATA *, int); // @ 0x1E3DB0 (0x220 bytes) -- mangled: _SET_DMG_COL__FP12RS_STACKDATAi
/* ?ret */ void _SET_DMG_PARA(RS_STACKDATA *, int); // @ 0x1E3FD0 (0x150 bytes) -- mangled: _SET_DMG_PARA__FP12RS_STACKDATAi
/* ?ret */ void _SET_SHOT(RS_STACKDATA *, int); // @ 0x1E4120 (0x1F0 bytes) -- mangled: _SET_SHOT__FP12RS_STACKDATAi
/* ?ret */ void _SET_SHOT2(RS_STACKDATA *, int); // @ 0x1E4310 (0x210 bytes) -- mangled: _SET_SHOT2__FP12RS_STACKDATAi
/* ?ret */ void _SET_SND_FRM(RS_STACKDATA *, int); // @ 0x1E4520 (0x150 bytes) -- mangled: _SET_SND_FRM__FP12RS_STACKDATAi
/* ?ret */ void _SET_LOOP_SND(RS_STACKDATA *, int); // @ 0x1E4670 (0xD0 bytes) -- mangled: _SET_LOOP_SND__FP12RS_STACKDATAi
/* ?ret */ void _STOP_LOOP_SND(RS_STACKDATA *, int); // @ 0x1E4740 (0x70 bytes) -- mangled: _STOP_LOOP_SND__FP12RS_STACKDATAi
/* ?ret */ void _DEL_LOOP_SND(RS_STACKDATA *, int); // @ 0x1E47B0 (0x40 bytes) -- mangled: _DEL_LOOP_SND__FP12RS_STACKDATAi
/* ?ret */ void _SET_SND_NOW(RS_STACKDATA *, int); // @ 0x1E47F0 (0x40 bytes) -- mangled: _SET_SND_NOW__FP12RS_STACKDATAi
/* ?ret */ void _STOP_SND_NOW(RS_STACKDATA *, int); // @ 0x1E4830 (0x40 bytes) -- mangled: _STOP_SND_NOW__FP12RS_STACKDATAi
/* ?ret */ void _GET_CHR_ID(RS_STACKDATA *, int); // @ 0x1E4870 (0x30 bytes) -- mangled: _GET_CHR_ID__FP12RS_STACKDATAi
/* ?ret */ void _GET_COL_HIT_ID(RS_STACKDATA *, int); // @ 0x1E48A0 (0x50 bytes) -- mangled: _GET_COL_HIT_ID__FP12RS_STACKDATAi
/* ?ret */ void _GET_SCRIPT_ID(RS_STACKDATA *, int); // @ 0x1E48F0 (0x30 bytes) -- mangled: _GET_SCRIPT_ID__FP12RS_STACKDATAi
/* ?ret */ void _GET_MONSTOR_POS(RS_STACKDATA *, int); // @ 0x1E4920 (0xA0 bytes) -- mangled: _GET_MONSTOR_POS__FP12RS_STACKDATAi
/* ?ret */ void _GET_MONSTOR_FRM(RS_STACKDATA *, int); // @ 0x1E49C0 (0x60 bytes) -- mangled: _GET_MONSTOR_FRM__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_POS(RS_STACKDATA *, int); // @ 0x1E4A20 (0xA0 bytes) -- mangled: _SET_MONSTOR_POS__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_MOVE(RS_STACKDATA *, int); // @ 0x1E4AC0 (0x140 bytes) -- mangled: _SET_MONSTOR_MOVE__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_LINK_MOVE(RS_STACKDATA *, int); // @ 0x1E4C00 (0xC0 bytes) -- mangled: _SET_MONSTOR_LINK_MOVE__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_MOVE_CANSEL(RS_STACKDATA *, int); // @ 0x1E4CC0 (0x50 bytes) -- mangled: _SET_MONSTOR_MOVE_CANSEL__FP12RS_STACKDATAi
/* ?ret */ void _SET_LOCKON_DIST(RS_STACKDATA *, int); // @ 0x1E4D10 (0x60 bytes) -- mangled: _SET_LOCKON_DIST__FP12RS_STACKDATAi
/* ?ret */ void _SET_LOCKON_SW(RS_STACKDATA *, int); // @ 0x1E4D70 (0x60 bytes) -- mangled: _SET_LOCKON_SW__FP12RS_STACKDATAi
/* ?ret */ void _SET_MONSTOR_MOTION(RS_STACKDATA *, int); // @ 0x1E4DD0 (0x3C0 bytes) -- mangled: _SET_MONSTOR_MOTION__FP12RS_STACKDATAi
/* ?ret */ void _SET_GLOBAL_INT(RS_STACKDATA *, int); // @ 0x1E5190 (0x60 bytes) -- mangled: _SET_GLOBAL_INT__FP12RS_STACKDATAi
/* ?ret */ void _GET_GLOBAL_INT(RS_STACKDATA *, int); // @ 0x1E51F0 (0x50 bytes) -- mangled: _GET_GLOBAL_INT__FP12RS_STACKDATAi
/* ?ret */ void _GET_OBJ_POS(RS_STACKDATA *, int); // @ 0x1E5240 (0xD0 bytes) -- mangled: _GET_OBJ_POS__FP12RS_STACKDATAi__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void _SET_ROTATION_X(RS_STACKDATA *, int); // @ 0x1E5310 (0x170 bytes) -- mangled: _SET_ROTATION_X__FP12RS_STACKDATAi
/* ?ret */ void _LOOKAT(RS_STACKDATA *, int); // @ 0x1E5480 (0x340 bytes) -- mangled: _LOOKAT__FP12RS_STACKDATAi
/* ?ret */ void _SET_MOTION_CHANGE_STEP(RS_STACKDATA *, int); // @ 0x1E57C0 (0xB0 bytes) -- mangled: _SET_MOTION_CHANGE_STEP__FP12RS_STACKDATAi
/* ?ret */ void _GET_MONSTOR_VECTOR(RS_STACKDATA *, int); // @ 0x1E5870 (0x220 bytes) -- mangled: _GET_MONSTOR_VECTOR__FP12RS_STACKDATAi
/* ?ret */ void _STATUS_SET_LIFE(RS_STACKDATA *, int); // @ 0x1E5A90 (0x90 bytes) -- mangled: _STATUS_SET_LIFE__FP12RS_STACKDATAi
/* ?ret */ void _SET_BIN2(RS_STACKDATA *, int); // @ 0x1E5B20 (0x60 bytes) -- mangled: _SET_BIN2__FP12RS_STACKDATAi
/* ?ret */ void _SET_STATUS_CHANGE(RS_STACKDATA *, int); // @ 0x1E5B80 (0xD0 bytes) -- mangled: _SET_STATUS_CHANGE__FP12RS_STACKDATAi
/* ?ret */ void _SET_TEX_ANIME_SW(RS_STACKDATA *, int); // @ 0x1E5C50 (0x110 bytes) -- mangled: _SET_TEX_ANIME_SW__FP12RS_STACKDATAi
/* ?ret */ void _GET_STATUS_BIN2(RS_STACKDATA *, int); // @ 0x1E5D60 (0x60 bytes) -- mangled: _GET_STATUS_BIN2__FP12RS_STACKDATAi
/* ?ret */ void _SET_COLLISION_WIDTH(RS_STACKDATA *, int); // @ 0x1E5DC0 (0x60 bytes) -- mangled: _SET_COLLISION_WIDTH__FP12RS_STACKDATAi
/* ?ret */ void _GET_NEAR_MONSTER(RS_STACKDATA *, int); // @ 0x1E5E20 (0x1A0 bytes) -- mangled: _GET_NEAR_MONSTER__FP12RS_STACKDATAi
/* ?ret */ void _BOSS_FADE_OUT(RS_STACKDATA *, int); // @ 0x1E5FC0 (0x50 bytes) -- mangled: _BOSS_FADE_OUT__FP12RS_STACKDATAi
/* ?ret */ void _CHEKC_FADE_OUT(RS_STACKDATA *, int); // @ 0x1E6010 (0x40 bytes) -- mangled: _CHEKC_FADE_OUT__FP12RS_STACKDATAi
/* ?ret */ void _SET_GRAVITY(RS_STACKDATA *, int); // @ 0x1E6050 (0x60 bytes) -- mangled: _SET_GRAVITY__FP12RS_STACKDATAi
/* ?ret */ void _SET_GUARD_FRAME(RS_STACKDATA *, int); // @ 0x1E60B0 (0x150 bytes) -- mangled: _SET_GUARD_FRAME__FP12RS_STACKDATAi
/* ?ret */ void _GUARD_SEARCH(RS_STACKDATA *, int); // @ 0x1E6200 (0x160 bytes) -- mangled: _GUARD_SEARCH__FP12RS_STACKDATAi
/* ?ret */ void _GET_MOVE_VEC(RS_STACKDATA *, int); // @ 0x1E6360 (0x60 bytes) -- mangled: _GET_MOVE_VEC__FP12RS_STACKDATAi
/* ?ret */ void _PUSH_IGLOBAL(RS_STACKDATA *, int); // @ 0x1E63C0 (0xA0 bytes) -- mangled: _PUSH_IGLOBAL__FP12RS_STACKDATAi
/* ?ret */ void _POP_IGLOBAL(RS_STACKDATA *, int); // @ 0x1E6460 (0x90 bytes) -- mangled: _POP_IGLOBAL__FP12RS_STACKDATAi
/* ?ret */ void _GET_USER_STATUS(RS_STACKDATA *, int); // @ 0x1E64F0 (0x80 bytes) -- mangled: _GET_USER_STATUS__FP12RS_STACKDATAi
/* ?ret */ void _SET_REFERENCE(RS_STACKDATA *, int); // @ 0x1E6570 (0xC0 bytes) -- mangled: _SET_REFERENCE__FP12RS_STACKDATAi
/* ?ret */ void _DEL_REFERENCE(RS_STACKDATA *, int); // @ 0x1E6630 (0x60 bytes) -- mangled: _DEL_REFERENCE__FP12RS_STACKDATAi
/* ?ret */ void _SET_SHADOW_FLAG(RS_STACKDATA *, int); // @ 0x1E6690 (0x60 bytes) -- mangled: _SET_SHADOW_FLAG__FP12RS_STACKDATAi
/* ?ret */ void BtSetEventScript(CRunScript *, char *, CDataAlloc2_1_ *); // @ 0x1E66F0 (0xB0 bytes) -- mangled: BtSetEventScript__FP10CRunScriptPcP14CDataAlloc2_1_
/* ?ret */ void BtSetEventExtendTable(void); // @ 0x1E67A0 (0x130 bytes) -- mangled: BtSetEventExtendTable__Fv
/* ?ret */ void GetItemShopList(int); // @ 0x1E68D0 (0x20 bytes) -- mangled: GetItemShopList__Fi
/* ?ret */ void InitShopItemListData(SHOP_ITEMLIST *); // @ 0x1E68F0 (0x40 bytes) -- mangled: InitShopItemListData__FP13SHOP_ITEMLIST
