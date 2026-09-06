#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 338

#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <sifdev.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "boxvu0.hpp"
#include "camera.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "debugfont.hpp"
#include "dngstatusdata.hpp"
#include "editloop3.hpp"
#include "editground.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"

/* Retail editloop3.cpp: event points, villagers and the main Georama editor loop. */

INCLUDE_RODATA("asm/nonmatchings/editloop3", @447__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @687);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @688);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @689);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @690__2);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @727__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @728__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @729__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @730__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @731__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1026);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1038);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1673);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1674);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1675);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1676);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @853);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1424);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2236);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2237);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2246);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2288);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2289);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2449);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2450);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2451);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2604);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2605);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2606);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2607);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2608);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2609);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2610);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2611);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2612);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2613);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2614);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetNewEventPoint__FP9CMapPartsP16EPARTS_FUNC_DATAP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventPoint__FP9CMapPartsPsP16EPARTS_FUNC_DATAiP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdGetEvent__FP14ED_EVENT_POINTiP14ED_EVENT_PARAMPfPff);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventPointDraw__FP14ED_EVENT_POINTif);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventPointCpPoly__FPfP14ED_EVENT_POINTiP6CCPolyf);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSearchEvent__FP14ED_EVENT_PARAMPcif);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMapJump__FiPc);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerControl__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCreateVillagerTable__FP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerTable__FfP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOut__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearIn__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOff__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOn__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearMove__Fiii);
INCLUDE_ASM("asm/nonmatchings/editloop3", RestoreVillagerInfo__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCheckVillagerIn__FiP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRandomVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRandomMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetNearVill__FP7CCameraP10CCharacterP12CNPCharacterPiPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMoveVillagerSubMap__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetVillagerNextPos__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCheckTime__Ffff);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdGetTime__Ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdLimitShadowLight__FPA4_ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdDrawSky__FfPP9CFrameVu1PP6CFrameP9CFrameVu1P7CCameraPi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdDrawLensFlare__FfPP6CFrame);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetLightParam__FfiP13EDIT_MAP_INFOP9CFrameVu1);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitToEPInfo__FP14INIT_PARTSINFOP18EPARTS_INFO_HEADER);
/** Colour and GS-scale alpha used to cover the screen during an editor fade. */
static float fade_col[4];

/** Direction and active-state flag for the editor fade. */
static int fade_in_out;

/** Target GS alpha for the active editor fade. */
static int fade_end;

/** GS alpha added on each frame of the active editor fade. */
static float fade_step;

void EdFadeInit() {
    fade_col[3] = 0.0f;
    fade_col[2] = 0.0f;
    fade_col[1] = 0.0f;
    fade_col[0] = 0.0f;
    fade_in_out = 0;
    fade_step = 0.0f;
    fade_end = 0;
}

/* A negative frame count means no step at all: the alpha is forced to the end this call starts
   from and stays there, which is how a colour is held over the screen rather than faded through. */
void EdFadeIn(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 128.0f;
    fade_in_out = 1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

void EdFadeOut(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 0.0f;
    fade_in_out = -1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

int EdFadeOutCheck() {
    return fade_end;
}

void EdGetFadeColor(float *col) {
    col[0] = fade_col[0];
    col[1] = fade_col[1];
    col[2] = fade_col[2];
    col[3] = fade_col[3];
}

/* The rectangle is in the sixteenths of a pixel the coordinate registers count in, which is what
   the multiplications are; why the cover is 70 boxes rather than one the code does not say. */
void EdFadeInOut() {
    int r;
    int g;
    int b;
    int a;
    int x;
    int y;
    CRect_i_ rect;

    if (fade_in_out == 0)
        return;
    r = (int) fade_col[0];
    g = (int) fade_col[1];
    b = (int) fade_col[2];
    a = (int) fade_col[3];
    if (fade_in_out > 0) {
        fade_col[3] -= fade_step;
        if (fade_col[3] <= 0.0f) {
            fade_col[3] = 0.0f;
            fade_in_out = 0;
            fade_end = 1;
        }
    } else {
        fade_col[3] += fade_step;
        if (fade_col[3] >= 128.0f) {
            fade_col[3] = 128.0f;
            fade_end = 1;
        }
    }
    for (x = 0; x < 640; x += 64) {
        for (y = 0; y < 224; y += 32) {
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, r, g, b, a);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/editloop3", GetMaxHeightCursor__FPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", LimitEditCursorPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSePlay__F11ED_SOUND_IDi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetSprite__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", InitSprite__FP9ED_SPRITE);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetObjAnime__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", ClearObjAnime__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventPause__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetWorkFlag__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorkFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetStackInt__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetStackFloat__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetStackString__FP12RS_STACKDATA);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetStack__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetStack__FP12RS_STACKDATAf);
INCLUDE_ASM("asm/nonmatchings/editloop3", PrintMemory__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetObjHandle__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetObjHandle__FiP9CMapPartsPc);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetObjHandle__FiP10CCharacterPc);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetObjHandle__FiP6CFrame);
INCLUDE_ASM("asm/nonmatchings/editloop3", obj_draw__FP10OBJ_HANDLEi);
INCLUDE_ASM("asm/nonmatchings/editloop3", set_obj_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_obj_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_obj_world_pos__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", set_obj_rot__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_obj_rot__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", set_obj_scale__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_obj_scale__FP10OBJ_HANDLEPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", init_obj_anime__FiiiiPfPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", sync_obj_obj__FP10OBJ_HANDLEP10OBJ_HANDLE);
INCLUDE_ASM("asm/nonmatchings/editloop3", release_obj_obj__FP10OBJ_HANDLE);
INCLUDE_ASM("asm/nonmatchings/editloop3", set_attr_obj__FP10OBJ_HANDLER10CFrameAttrii);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetActSeq__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", turn_chara__FP10CCharacterPff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetScene__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetNPC__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetChara__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", DeleteItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetVillagerInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetWorldCoord__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRotation__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetRotation__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetFileName__FPcPc);
INCLUDE_ASM("asm/nonmatchings/editloop3", _TEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", exch_ok_cancel__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_PADON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_PADDOWN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_PADUP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_APAD__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_RANDOM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_RETURN_CODE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NEXT_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_INTERIOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WORLD_COORD__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INITIALIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EXIT_CODE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_EXCLAMATION_MARK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_USE_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NAME_REGISTRY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _WORLD_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SKIP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_OUTSIDE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FINISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OLD_MAPNO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADEOUT_TO_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP_BGM_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP_BGM_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FP_CHANGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FISH_RANKING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_CHANGE_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CURRENT_DIR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_pack_file__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_buffer__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ACTIVE_FILE_BUFFER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHR_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHARA_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_BG_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_IN_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_OUT_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_IN_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_ON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_VILLAGER_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_EVENT_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_EVENT_EXBUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SCENE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _TURN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_POS_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_PARTS_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _TURN_NPC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_FOOT_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_FLOOR_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_COL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW_BEFORE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_NPC_CLOTH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_CLOTH_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_CLOTH_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_PLIGHT_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_PLIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetMes__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_MAKE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_CLOSE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_NEXTPAGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_AUTOSET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_SHIPPO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_DRAWSPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_CURSOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_OKURI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_WIN_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES_COMPLETE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES_WAIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_FUKIDASHI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ITEM_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_SYS_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SKILL_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_MAXITEM_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_COMPLETE_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_EDIT_PARTS_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NOW_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SCHECK_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_PLACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_ROBO_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_FIXPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_EDITPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_INTERIORPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_BT_HOBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_FOG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_INFO_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_SELECT_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EVERY_TALK_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetCamera__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_SPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_FOLLOW_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_HEIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_DIST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CAMERA_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_PROJECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ITEM_GET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RESET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RESET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_BG_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_BACK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CLIP_POINT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_EDIT_WATER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_WATER_SURFACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SCREEN_FILTER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_THUNDER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_LIGHT_COLOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SAVE_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_DOF_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_TEX__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_RGBA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_TITLE_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WIND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SYNC_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOVE_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_CLEAR_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_WAIT_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_DELAY_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", asq_motion_play__FiP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_NEXT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ANIME_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_ANIME_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_CHECK_ALL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_DUNGEON_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_REQUEST_EVENT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_VISIT_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSKILL_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_EQUIP_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_MAXITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_LOST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SATRA_PARTS_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SATRA_CHIP_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_ATRA_PARTS_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SEQUIP_DEFAULT_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SND_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SOUND_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_VOICE_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_BGM_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _BGM_FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _BGM_FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_BGM_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_AMB_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SPECIAL_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SOUND_OFF_COUNT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_V_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_I_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_F_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_SET_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_SET_KEY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_START__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_END__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_DEBUG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_FINISH_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_MAIN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_FISHING_DATA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_FISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EXIT_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_FISHING_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetEventScript__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParamSimple__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParam__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventInit__FiP14CDataAlloc2_1_Pc);
INCLUDE_ASM("asm/nonmatchings/editloop3", RunEvent__FP10CRunScriptiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdRunEvent__FiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdResumeEvent__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventSkip__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventAllClear__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventFinish__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventMode__FP13CCameraFollowi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventNPCStep__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventBackSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSearchNearNPC__FP10CCharacterP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdTalkModeInit__FP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdNowTalkChara__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdNowTalkCharaInfoID__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdTalkMode__FP10CCharacterP13CCameraFollowiPi);
INCLUDE_ASM("asm/nonmatchings/editloop3", __ct__9ED_SPRITEFv);
INCLUDE_ASM("asm/nonmatchings/editloop3", CheckPartsInfo__FP14EDITPARTS_INFO);
