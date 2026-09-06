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
#include "collision.hpp"
#include "debugfont.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "ebattle.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "edit.hpp"
#include "editground.hpp"
#include "effect.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mainselect.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"
#include "savedata.hpp"

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
extern int goto_cmp_event_level;
extern int goto_dungeon;
extern int goto_menu;
extern int change_time_event;
extern int draw_npc_cursor;
extern float draw_day_cnt;
extern int draw_day_flag;
extern int key_lock;
extern int light_no;
extern int loop_counter;
extern int week_no;
extern int texture_list;
extern int EdDebugEventEnable;
extern char EditDataDir[0x100];
extern "C" char CurrentDir__3[0x40];
extern CEditGround *pEditGround;
extern CCharacter *Chara;
extern CMainChara MainChara;

void CommandIMGSub(int image_type, int image_number, char *name);
void EditPartsObjectOnOff();
void MoveChara();
void MoveEditCursor();

INCLUDE_RODATA("asm/nonmatchings/editloop", @478);
INCLUDE_RODATA("asm/nonmatchings/editloop", @482__2);
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

/**
 * Sets the directory prefix used while parsing the current map script.
 */
void CommandCD(void **arguments) {
    strcpy(CurrentDir__3, (char *) arguments[0]);
}
/**
 * Returns the integer value addressed by a script argument slot.
 */
int test(void **argument) {
    return *(int *) *argument;
}
INCLUDE_ASM("asm/nonmatchings/editloop", InitInfo__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadEditMapData__FP13EDIT_MAP_INFOPci);
/**
 * Sets the scene resource used by the current editor map.
 */
void CommandSCN(void **arguments) {
    strcpy(EditMapInfo->scene_name, (char *) arguments[0]);
}
/**
 * Selects a zero-based light index from a one-based script value.
 */
void CommandLIGHT_NO(void **arguments) {
    light_no = *(int *) arguments[0];
    light_no--;
    if (light_no < 0) {
        light_no = 0;
    }
    if (light_no >= 12) {
        light_no = 11;
    }
}
/**
 * Stores the ambient light colour for the selected light preset.
 */
void CommandAMBIENT(void **arguments) {
    EditMapInfo->ambient[light_no][0] = *(float *) arguments[0];
    EditMapInfo->ambient[light_no][1] = *(float *) arguments[1];
    EditMapInfo->ambient[light_no][2] = *(float *) arguments[2];
    EditMapInfo->ambient[light_no][3] = 128.0f;
}
/**
 * Stores a normalized light direction and its colour for the selected preset.
 */
void CommandLIGHT_C(void **arguments) {
    int light_number = *(int *) arguments[6];
    sceVu0FVECTOR direction;
    direction[0] = *(float *) arguments[0];
    direction[1] = *(float *) arguments[1];
    direction[2] = *(float *) arguments[2];
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);

    int index = light_number - 1;
    EditMapInfo->light_direction[light_no][0][index] = direction[0];
    EditMapInfo->light_direction[light_no][1][index] = direction[1];
    EditMapInfo->light_direction[light_no][2][index] = direction[2];
    EditMapInfo->light_direction[light_no][3][index] = direction[3];
    EditMapInfo->light_colour[light_no][index][0] = *(float *) arguments[3];
    EditMapInfo->light_colour[light_no][index][1] = *(float *) arguments[4];
    EditMapInfo->light_colour[light_no][index][2] = *(float *) arguments[5];
    EditMapInfo->light_colour[light_no][index][3] = 128.0f;
}

/**
 * Stores fog distances, colour and falloff for the selected light preset.
 */
void CommandFOG(void **arguments) {
    EditMapInfo->fog[light_no].near_distance = *(float *) arguments[0];
    EditMapInfo->fog[light_no].far_distance = *(float *) arguments[1];
    EditMapInfo->fog[light_no].red = *(int *) arguments[2];
    EditMapInfo->fog[light_no].green = *(int *) arguments[3];
    EditMapInfo->fog[light_no].blue = *(int *) arguments[4];
    EditMapInfo->fog[light_no].intensity = *(float *) arguments[5];
    EditMapInfo->fog[light_no].exponent = *(float *) arguments[6];
}
/**
 * Stores the primary background colour for the selected light preset.
 */
void CommandBG_COL(void **arguments) {
    EditMapInfo->background_colour[light_no][0] = *(float *) arguments[0];
    EditMapInfo->background_colour[light_no][1] = *(float *) arguments[1];
    EditMapInfo->background_colour[light_no][2] = *(float *) arguments[2];
    EditMapInfo->background_colour[light_no][3] = 128.0f;
}

/**
 * Stores the secondary background colour for the selected light preset.
 */
void CommandBG_COL2(void **arguments) {
    EditMapInfo->background_colour_2[light_no][0] = *(float *) arguments[0];
    EditMapInfo->background_colour_2[light_no][1] = *(float *) arguments[1];
    EditMapInfo->background_colour_2[light_no][2] = *(float *) arguments[2];
    EditMapInfo->background_colour_2[light_no][3] = 128.0f;
}
/**
 * Stores the map's time-bounded depth-of-field settings.
 */
void CommandDOF(void **arguments) {
    EditMapInfo->dof_start_time = ConvertTime(*(float *) arguments[0]);
    EditMapInfo->dof_end_time = ConvertTime(*(float *) arguments[1]);
    EditMapInfo->dof_near_level = *(int *) arguments[2];
    EditMapInfo->dof_near = *(float *) arguments[3];
    EditMapInfo->dof_far = *(float *) arguments[4];
    EditMapInfo->dof_far_level = *(int *) arguments[5];
    EditMapInfo->dof_alpha = *(int *) arguments[6];
}
/**
 * Appends an image-resource assignment to the current editor map.
 */
void CommandIMGSub(int image_type, int image_number, char *name) {
    EditMapInfo->images[texture_list].type = image_type;
    EditMapInfo->images[texture_list].number = image_number;
    sprintf(EditMapInfo->images[texture_list].name, "%s%s", CurrentDir__3, name);
    texture_list++;
}
/**
 * Assigns a ground image from a parsed map-script command.
 */
void CommandGRD_IMG(void **arguments) {
    CommandIMGSub(1, *(int *) arguments[1], (char *) arguments[0]);
}

/**
 * Assigns a building image from a parsed map-script command.
 */
void CommandBLD_IMG(void **arguments) {
    CommandIMGSub(2, *(int *) arguments[1], (char *) arguments[0]);
}
/**
 * Assigns one of the four indexed sky images from a parsed map-script command.
 */
void CommandSKY_IMG(void **arguments) {
    int index = *(int *) arguments[0] - 1;
    if (index < 0 || index >= 4) {
        return;
    }
    CommandIMGSub(index + 3, *(int *) arguments[2], (char *) arguments[1]);
}
/**
 * Assigns a sun image from a parsed map-script command.
 */
void CommandSUN_IMG(void **arguments) {
    CommandIMGSub(7, *(int *) arguments[1], (char *) arguments[0]);
}

/**
 * Assigns a water image from a parsed map-script command.
 */
void CommandWATER_IMG(void **arguments) {
    CommandIMGSub(21, *(int *) arguments[1], (char *) arguments[0]);
}

/**
 * Assigns a fire image from a parsed map-script command.
 */
void CommandFIRE_IMG(void **arguments) {
    CommandIMGSub(24, *(int *) arguments[1], (char *) arguments[0]);
}

/**
 * Assigns a flare image from a parsed map-script command.
 */
void CommandFLER_IMG(void **arguments) {
    CommandIMGSub(23, *(int *) arguments[1], (char *) arguments[0]);
}
/**
 * Assigns an image whose script-provided slot is also its image number.
 */
void CommandIMG(void **arguments) {
    int image_type = *(int *) arguments[2];
    CommandIMGSub(image_type, image_type, (char *) arguments[1]);
}
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
/**
 * Accepts the legacy fire command, which has no runtime effect.
 */
void CommandFIRE(void **arguments) {
}

/**
 * Accepts the legacy flame command, which has no runtime effect.
 */
void CommandFLAME(void **arguments) {
}

/**
 * Accepts the legacy brightness command, which has no runtime effect.
 */
void CommandBRIGHT(void **arguments) {
}

/**
 * Accepts the legacy object-timer command, which has no runtime effect.
 */
void CommandOBJECT_TIMER(void **arguments) {
}
INCLUDE_ASM("asm/nonmatchings/editloop", CommandENTRANCE__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandMAPJUMP__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPEOPLE__FPPv);
/**
 * Selects the weekly time table referenced by subsequent script entries.
 */
void CommandTIME_TABLE_NO(void **arguments) {
    int table_no = *(int *) arguments[0];
    if (table_no < 0 || table_no >= 7) {
        table_no = 0;
    }
    week_no = table_no;
}
INCLUDE_ASM("asm/nonmatchings/editloop", CommandTIME_TABLE__FPPv);
/**
 * Stops time progression for the current editor map.
 */
void CommandTIME_STOP(void **arguments) {
    EditMapInfo->time_stop = 1;
}

/**
 * Stores the three sky-follow parameters parsed for the current map.
 */
void CommandSKY_FOLLOW(void **arguments) {
    EditMapInfo->sky_follow[0] = *(int *) arguments[0];
    EditMapInfo->sky_follow[1] = *(int *) arguments[1];
    EditMapInfo->sky_follow[2] = *(int *) arguments[2];
}
/**
 * Stores the shadow distances, quality level and modes for the current map.
 */
void CommandSHADOW_LEVEL(void **arguments) {
    EditMapInfo->shadow_level = *(int *) arguments[0];
    EditMapInfo->shadow_near = *(float *) arguments[1];
    EditMapInfo->shadow_far = *(float *) arguments[2];
    EditMapInfo->shadow_mode = *(int *) arguments[3];
    EditMapInfo->shadow_mode_2 = *(int *) arguments[4];
}
INCLUDE_ASM("asm/nonmatchings/editloop", CommandEDITAREA_RECT__FPPv);
/**
 * Selects and reports the background-music number for the current map.
 */
void CommandBGM_NO(void **arguments) {
    EditMapInfo->bgm_no = *(int *) arguments[0];
    printf("bgm = %d\n", EditMapInfo->bgm_no);
}

/**
 * Selects and reports the environmental sound set for the current map.
 */
void CommandSOUND_SET(void **arguments) {
    EditMapInfo->sound_set_no = *(int *) arguments[0];
    printf("sound set = %d\n", EditMapInfo->sound_set_no);
}
INCLUDE_ASM("asm/nonmatchings/editloop", CommandREVERBE__FPPv__2);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandMOTION_PARTS__FPPv);
INCLUDE_ASM("asm/nonmatchings/editloop", CommandPEOPLE2__FPPv);
/**
 * Disables ambient sound for the current editor map.
 */
void CommandSE_AMBIENT_OFF(void **arguments) {
    EditMapInfo->ambient_sound_off = 1;
}

/**
 * Stores the four wind parameters parsed for the current editor map.
 */
void CommandWIND(void **arguments) {
    EditMapInfo->wind[0] = *(float *) arguments[0];
    EditMapInfo->wind[1] = *(float *) arguments[1];
    EditMapInfo->wind[2] = *(float *) arguments[2];
    EditMapInfo->wind[3] = *(float *) arguments[3];
}
/**
 * Assigns the event number and level used when the current villager is addressed.
 */
void CommandTALK_EVENT(void **arguments) {
    if (now_villinfo != NULL) {
        now_villinfo->talk_event_no = *(int *) arguments[0];
        now_villinfo->talk_event_level = *(int *) arguments[1];
    }
}
INCLUDE_ASM("asm/nonmatchings/editloop", CommandCHARA_AMBIENT__FPPv);
/**
 * Sets the rotation constraint used while the current villager talks.
 */
void CommandTALK_ROT(void **arguments) {
    if (now_villinfo != NULL) {
        now_villinfo->talk_rotation = *(int *) arguments[0];
    }
}

/**
 * Sets the direction constraint used while the current villager talks.
 */
void CommandTALK_DIR(void **arguments) {
    if (now_villinfo != NULL) {
        now_villinfo->talk_direction = *(int *) arguments[0];
    }
}
/**
 * Copies the fifteen villager identifiers parsed for the current editor map.
 */
void CommandPEOPLE_LIST(void **arguments) {
    for (int i = 0; i < 15; i++) {
        EditMapInfo->people_list[i] = *(int *) arguments[i];
    }
}
/**
 * Reports whether the current editor state should draw the fishing interface.
 */
int FishingDrawCheck() {
    if (GameMode == 16) {
        return 1;
    }
    if (GameMode == 9 && oldGameMode == 16) {
        return 1;
    }
    return 0;
}
/**
 * Finds a file in the active pack or loads it into the shared read buffer.
 */
void *EdLoadFile(char *name) {
    void *file = GetPackFile(name, NULL);
    if (file != NULL) {
        return file;
    }
    if (LoadFile2(name, read_buffer, NULL, 0) == 0) {
        return NULL;
    }
    return read_buffer;
}
/**
 * Tests whether a motion crossed a nearby target time during the current step.
 */
int CheckMotionTime(float target, float previous, float current) {
    float difference = target - previous;
    difference = difference < 0.0f ? -difference : difference;
    if (difference > 1.5f) {
        return 0;
    }

    return (current >= target && current < previous) & 0xff;
}
/**
 * Starts ambient playback unless the current map disables ambient sound.
 */
void PlayAmbient(float volume) {
    if (EditMapInfo->ambient_sound_off == 0) {
        EdAmbientPlay(volume);
    }
}
/**
 * Provides the editor hook for stopping all currently managed sound.
 */
void StopAllSound() {
}

/**
 * Sets the editor sound-suppression counter within its valid range.
 */
void EdSetSoundOffCount(int count) {
    if (count > 10) {
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
INCLUDE_RODATA("asm/nonmatchings/editloop", @414__5);
void GetLanguageName(char *name) {
    if (LanguageCode > 0) {
        sprintf(name, "_%d", LanguageCode);
    } else {
        *name = '\0';
    }
}

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

/**
 * Copies the current editor resource directory into a caller buffer.
 */
void GetEditDataDir(char *name) {
    strcpy(name, EditDataDir);
}
INCLUDE_ASM("asm/nonmatchings/editloop", LoadScript__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", RunEvent__FiP7CCamera);
INCLUDE_ASM("asm/nonmatchings/editloop", RunSystemEvent__FiP7CCamera);
/**
 * Begins a fade into a comparison event unless a higher-priority request is active.
 */
FUZZY_MATCH("asm/matchings/editloop", FadeOutToEvent__Fii);
int FadeOutToEvent(int event_no, int level) {
    if (EdDebugEventEnable == 0) {
        return 0;
    }
    if (goto_cmp_event != 0) {
        if (goto_cmp_event_level < level) {
        } else {
            return 0;
        }
    }
    goto_cmp_event = event_no;
    goto_cmp_event_level = level;
    EdFadeOut(60, 0.0f, 0.0f, 0.0f);
    return 1;
}
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
/**
 * Disables editor input while an event is active or the loop is starting.
 */
void CheckKeyLock() {
    if (run_event_check() != 0) {
        key_lock = 1;
    }
    if (key_lock != 0 || loop_counter < 2) {
        EdSetKeyMode(0);
    }
}
INCLUDE_ASM("asm/nonmatchings/editloop", EdSetFlag__Fv);
/**
 * Returns a flag from the current town's persistent map state.
 */
int EdGetMapFlag(int flag_no) {
    if (flag_no <= 0) {
        return 0;
    }
    return SaveData->GetMapFlag(MapNo, flag_no);
}

/**
 * Writes a flag in the current town's persistent map state.
 */
int EdSetMapFlag(int flag_no, int value) {
    if (flag_no <= 0) {
        return 0;
    }
    return SaveData->SetMapFlag(MapNo, flag_no, value);
}
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
int EdExitLoop() {
    return exit_loop = 1;
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
/**
 * Returns the sum of the editor category indices from zero through nine.
 */
int cat_end() {
    int total = 0;
    for (int category = 0; category < 10; category++) {
        total += category;
    }
    return total;
}
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
/**
 * Selects the main character and advances normal character movement.
 */
void MainMode() {
    Chara = &MainChara;
    MoveChara();
}
/**
 * Changes whether a named child frame participates in drawing.
 */
int FrameOnOff(CFrame *root, char *name, int on) {
    if (root == NULL) {
        return 0;
    }
    if (name == NULL) {
        return 0;
    }
    CFrame *frame = root->SearchFrame(name);
    if (frame == NULL) {
        return 0;
    }
    frame->attr.draw_on = on;
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/editloop", EditPartsObjectOnOff__Fv);
/**
 * Advances the editable ground effects, collision boxes, cursor and object visibility.
 */
void EditMode() {
    pEditGround->EffectTask();
    pEditGround->MakePartsBox();
    MoveEditCursor();
    EditPartsObjectOnOff();
}
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
/**
 * Requests a transition from the editor into a dungeon.
 */
int GotoDungeon() {
    return goto_dungeon = 1;
}
INCLUDE_ASM("asm/nonmatchings/editloop", EdDeleteE05RoboParts__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", GotoInterior__FPciiP14ED_EVENT_PARAMi);
INCLUDE_ASM("asm/nonmatchings/editloop", MoveCamera__FP13CCameraFollow);
/**
 * Selects collision polygons around the centre of an axis-aligned box.
 */
void GetCollision(CCPoly *poly, CBoxVu0 *box) {
    sceVu0FVECTOR centre;
    sceVu0AddVector(centre, box->max, box->min);
    sceVu0ScaleVector(centre, centre, 0.5f);
    pEditGround->PickUpPoly(poly, centre[0], centre[1], centre[2]);
}
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
/**
 * Provides the empty map-object loading hook used by this editor loop.
 */
void LoadMapObject(CMapParts *map_parts, char **script) {
}
INCLUDE_ASM("asm/nonmatchings/editloop", set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc);
C3DSprite::C3DSprite() {
    texel.x = texel.y = texel.width = texel.height = 0;
    Initialize();
}
INCLUDE_ASM("asm/nonmatchings/editloop", CopyCMapParts__FP9CMapPartsP9CMapPartsP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop", GetPosRot__FP10CMapObjectPfPf);
/**
 * Returns the first unused event-point slot after the reserved first entry.
 */
ED_EVENT_POINT *GetNewEventPoint(ED_EVENT_POINT *points, int count) {
    for (int i = 1; i < count; i++) {
        if (points[i].event_type == 0) {
            return &points[i];
        }
    }
    return NULL;
}
INCLUDE_ASM("asm/nonmatchings/editloop", CheckEventPoint__FP14ED_EVENT_POINTf);
