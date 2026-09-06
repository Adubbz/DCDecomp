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
#include "edit.hpp"
#include "editground.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"

/* Retail editloop.cpp: town-script parsing, map construction and pre-event editor state. */

extern int GameMode;
extern int LanguageCode;
extern int oldGameMode;
extern int sound_off_cnt;
extern float NowTime;
extern int EdDrawOffFlag;
extern int EdPauseFlag;
extern int exit_loop;
extern int goto_cmp_event;
extern int goto_dungeon;
extern int goto_menu;
extern int change_time_event;
extern int draw_npc_cursor;
extern float draw_day_cnt;
extern int draw_day_flag;
extern char EditDataDir[0x100];

INCLUDE_RODATA("asm/nonmatchings/editloop", @478);
INCLUDE_RODATA("asm/nonmatchings/editloop", @482__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @501__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @589);
INCLUDE_RODATA("asm/nonmatchings/editloop", @590);
INCLUDE_RODATA("asm/nonmatchings/editloop", @591);
INCLUDE_RODATA("asm/nonmatchings/editloop", @592);
INCLUDE_RODATA("asm/nonmatchings/editloop", @593__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @594);
INCLUDE_RODATA("asm/nonmatchings/editloop", @595);
INCLUDE_RODATA("asm/nonmatchings/editloop", @596__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @734__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @822__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @871);
INCLUDE_RODATA("asm/nonmatchings/editloop", @873__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @875__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @876__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @877);
INCLUDE_RODATA("asm/nonmatchings/editloop", @878);
INCLUDE_RODATA("asm/nonmatchings/editloop", @879);
INCLUDE_RODATA("asm/nonmatchings/editloop", @880__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @881__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @882);
INCLUDE_RODATA("asm/nonmatchings/editloop", @883);
INCLUDE_RODATA("asm/nonmatchings/editloop", @884__3);
INCLUDE_RODATA("asm/nonmatchings/editloop", @885);
INCLUDE_RODATA("asm/nonmatchings/editloop", @907);
INCLUDE_RODATA("asm/nonmatchings/editloop", @908);
INCLUDE_RODATA("asm/nonmatchings/editloop", @414__5);
INCLUDE_RODATA("asm/nonmatchings/editloop", @442__3);
INCLUDE_RODATA("asm/nonmatchings/editloop", @443__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @444__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @714);
INCLUDE_RODATA("asm/nonmatchings/editloop", @715);
INCLUDE_RODATA("asm/nonmatchings/editloop", @716);
INCLUDE_RODATA("asm/nonmatchings/editloop", @717);
INCLUDE_RODATA("asm/nonmatchings/editloop", @718);
INCLUDE_RODATA("asm/nonmatchings/editloop", @719);
INCLUDE_RODATA("asm/nonmatchings/editloop", @720);
INCLUDE_RODATA("asm/nonmatchings/editloop", @721);
INCLUDE_RODATA("asm/nonmatchings/editloop", @722);
INCLUDE_RODATA("asm/nonmatchings/editloop", @723__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @724);
INCLUDE_RODATA("asm/nonmatchings/editloop", @725__3);
INCLUDE_RODATA("asm/nonmatchings/editloop", @726__3);
INCLUDE_RODATA("asm/nonmatchings/editloop", @727__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @730__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @731__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @732__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @733__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @734__3);
INCLUDE_RODATA("asm/nonmatchings/editloop", @735__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @736__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @827);
INCLUDE_RODATA("asm/nonmatchings/editloop", @828);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1609);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1610);

INCLUDE_ASM("asm/nonmatchings/editloop", CommandCD__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", test__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", InitInfo__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadEditMapData__FP13EDIT_MAP_INFOPci);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSCN__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandLIGHT_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandAMBIENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandLIGHT_C__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandFOG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBG_COL__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBG_COL2__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandDOF__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandIMGSub__FiiPc);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandGRD_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBLD_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSKY_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSUN_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandWATER_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandFIRE_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandFLER_IMG__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandIMG__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSKY__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSUN__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandGROUND__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBUILD__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandWATER__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandWATER_SURFACE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandWATER_SHAKE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandEDITAREA__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", GenMdsName__FP14MAP_PARTS_INFOPc);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBLD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandGRD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPARTS_INFO__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandROAD_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandROAD__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandRIVER_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandRIVER__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBRIDGE_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandLAKE_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandON_RIVER_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandOBJ_ANIME__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandFIRE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandFLAME__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBRIGHT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandOBJECT_TIMER__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandENTRANCE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandMAPJUMP__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPEOPLE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTIME_TABLE_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTIME_TABLE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTIME_STOP__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSKY_FOLLOW__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSHADOW_LEVEL__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandEDITAREA_RECT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandBGM_NO__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSOUND_SET__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandREVERBE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandMOTION_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPEOPLE2__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandSE_AMBIENT_OFF__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandWIND__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTALK_EVENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandCHARA_AMBIENT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTALK_ROT__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTALK_DIR__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPEOPLE_LIST__FPPv);
/**
 * Reports whether the current editor state should draw the fishing interface.
 */
int FishingDrawCheck() {
    switch (GameMode) {
    case 16:
        return 1;
    case 9:
        if (oldGameMode == 16) {
            return 1;
        }
    default:
        return 0;
    }
}
INCLUDE_ASM("asm/nonmatchings/editloop", EdLoadFile__FPc);
/**
 * Tests whether a motion crossed a nearby target time during the current step.
 */
int CheckMotionTime(float target, float previous, float current) {
    float difference = target - previous;
    if (difference < 0.0f) {
        difference = -difference;
    }
    if (difference > 1.5f) {
        return 0;
    }

    int crossed = 1;
    if (current < target) {
        crossed = 0;
    }
    if (crossed != 0) {
        crossed = 1;
        if (!(current < previous)) {
            crossed = 0;
        }
    }
    return crossed & 0xff;
}
INCLUDE_ASM("asm/nonmatchings/editloop", PlayAmbient__Ff);
/**
 * Provides the editor hook for stopping all currently managed sound.
 */
void StopAllSound() {
}

/**
 * Sets the editor sound-suppression counter within its valid range.
 */
void EdSetSoundOffCount(int count) {
    if (count >= 11) {
        count = 10;
    }
    if (count < 0) {
        count = 0;
    }
    sound_off_cnt = count;
}

/**
 * Appends the active language suffix used by editor resource names.
 */
void GetLanguageName(char *name) {
    if (LanguageCode > 0) {
        sprintf(name, "_%d", LanguageCode);
    } else {
        *name = '\0';
    }
}

/**
 * Copies the current editor resource directory into a caller buffer.
 */
void GetEditDataDir(char *name) {
    strcpy(name, EditDataDir);
}
INCLUDE_ASM("asm/nonmatchings/editloop", LoadScript__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", RunEvent__FiP7CCamera);
INCLUDE_ASM("asm/nonmatchings/editloop", RunSystemEvent__FiP7CCamera);
INCLUDE_ASM("asm/nonmatchings/editloop", FadeOutToEvent__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop", EditSave__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EditLoad__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EditExit__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", InitWorkBuffer__Fv);
/**
 * Reports whether any modal editor event currently blocks normal input.
 */
int run_event_check() {
    if (goto_dungeon != 0 || goto_menu != 0 || goto_cmp_event != 0 || change_time_event != 0 ||
        EdSystemMesCheck() != 0 || EdCheckItemOver() != 0) {
        return 1;
    }
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/editloop", CheckKeyLock__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EdSetFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EdGetMapFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop", EdSetMapFlag__Fii);
/**
 * Cancels editor pause while another modal event is active.
 */
void PauseOffCheck() {
    if (run_event_check() != 0) {
        EdPauseFlag = 0;
    }
}

/**
 * Requests that the main editor loop terminate.
 */
void EdExitLoop() {
    exit_loop = 1;
}

/**
 * Suppresses every editor scene draw pass.
 */
void EdDrawOffAll() {
    EdDrawOffFlag = 1;
}

/**
 * Restores normal editor scene drawing.
 */
void EdDrawOnAll() {
    EdDrawOffFlag = 0;
}

/**
 * Returns the editor clock converted to its displayed hour value.
 */
float EdGetClock() {
    return InvertTime(NowTime);
}

/**
 * Sets the editor clock from a valid displayed hour value.
 */
void EdSetClock(float time) {
    if (time < 0.0f || !(time <= 24.0f)) {
        return;
    }
    NowTime = ConvertTime(time);
}
INCLUDE_ASM("asm/nonmatchings/editloop", EdInitMesParam__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EditInit__FPv);
INCLUDE_ASM("asm/nonmatchings/editloop", cat_end__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EditLoop__Fv);

INCLUDE_RODATA("asm/nonmatchings/editloop", @1837__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1838__2);
INCLUDE_ASM("asm/nonmatchings/editloop", MainDraw__Fv);

INCLUDE_RODATA("asm/nonmatchings/editloop", @1871);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1872);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2122);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2151);
INCLUDE_ASM("asm/nonmatchings/editloop", ParamDraw__Fv);
/**
 * Enables or disables the cursor drawn over the controlled character.
 */
void EdSetCharaCursor(int on) {
    draw_npc_cursor = on;
}
INCLUDE_ASM("asm/nonmatchings/editloop", EdDrawSysCursor__FP14ED_EVENT_POINTi);
/**
 * Starts the day-transition overlay at its initial counter value.
 */
void EdStartDrawDay() {
    draw_day_cnt = 5.0f;
    draw_day_flag = 1;
}

/**
 * Resets the day-transition overlay state.
 */
void EdInitDrawDay() {
    draw_day_cnt = 0.0f;
    draw_day_flag = 0;
}
INCLUDE_ASM("asm/nonmatchings/editloop", DrawDay__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", DrawSysGra__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EdDrawClock__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop", MainMode__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", FrameOnOff__FP6CFramePci);
INCLUDE_ASM("asm/nonmatchings/editloop", EditPartsObjectOnOff__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EditMode__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", MainEditMode__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", OpenDoorMode__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", TalkMode__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EventMode__Fv);

INCLUDE_RODATA("asm/nonmatchings/editloop", @2362);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2363);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2364);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2389);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2390);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2488);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2533);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2737);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2738);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2739);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2740);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2741);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2742);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2747);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2748);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2749);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2750);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2751);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2752);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2753);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2754);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2755);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2756);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2803);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2804);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2805);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2806);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2807);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2808);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2809);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2810);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2811);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2812);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2813);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2814);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2815);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2816);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2817);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2818);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2819);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2820);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2821);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2822);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2850);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2851);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2852);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2853);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2999);
INCLUDE_RODATA("asm/nonmatchings/editloop", @3000);
INCLUDE_RODATA("asm/nonmatchings/editloop", @3001);
INCLUDE_RODATA("asm/nonmatchings/editloop", @3002);
INCLUDE_RODATA("asm/nonmatchings/editloop", @3003);
INCLUDE_RODATA("asm/nonmatchings/editloop", @3004);
INCLUDE_ASM("asm/nonmatchings/editloop", GotoDungeon__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EdDeleteE05RoboParts__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", GotoInterior__FPciiP14ED_EVENT_PARAMi);
INCLUDE_ASM("asm/nonmatchings/editloop", MoveCamera__FP13CCameraFollow);
INCLUDE_ASM("asm/nonmatchings/editloop", GetCollision__FP6CCPolyP7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/editloop", MoveChara__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", VillagerCollision__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", CheckEditToWalk__FPf);
INCLUDE_ASM("asm/nonmatchings/editloop", MoveEditCursor__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadTexture__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", EdLoadMainChara__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadGroundData__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadObjectParts__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadPTS__FP9CMapPartsPUiP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINTP9CMapParts);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadPTS__FP9CMapPartsP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINT);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadMapObject__FP9CMapPartsPPc);
INCLUDE_ASM("asm/nonmatchings/editloop", set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc);
INCLUDE_ASM("asm/nonmatchings/editloop", __ct__9C3DSpriteFv);
INCLUDE_ASM("asm/nonmatchings/editloop", CopyCMapParts__FP9CMapPartsP9CMapPartsP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop", GetPosRot__FP10CMapObjectPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop", GetNewEventPoint__FP14ED_EVENT_POINTi);
INCLUDE_ASM("asm/nonmatchings/editloop", CheckEventPoint__FP14ED_EVENT_POINTf);
