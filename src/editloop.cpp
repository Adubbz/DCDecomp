#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 338
#pragma argument_flag_ones 0, 207, 208, 215

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
#include "camerafollow.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "collision.hpp"
#include "dataset.hpp"
#include "debugfont.hpp"
#include "editarea.hpp"
#include "effectgroup.hpp"
#include "menuitemstep.hpp"
#include "dataread.hpp"
#include "dataalloc.hpp"
#include "dngstatusdata.hpp"
#include "ebattle.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "edit.hpp"
#include "editpartsinfo.hpp"
#include "editground.hpp"
#include "effect.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mainselect.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "menu_misc.hpp"
#include "mglib.hpp"
#include "npcharacter.hpp"
#include "objanime.hpp"
#include "objectframe.hpp"
#include "rect.hpp"
#include "runeffect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

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
extern int goto_return_menu;
extern int debug_menu_mode;
extern int simple_event;
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
extern int EdDebugCameraFlag;
extern char *objframe;
extern CMapObject *mapobj;
extern CMapParts *mapparts;
extern CMapParts *ObjParts;
extern EDIT_WATER_INFO *water_info;
extern int edit_rect_list;
extern int motion_parts_list;
extern int people_list;
extern int now_parts_no;
extern int door_open;
extern int camera_dist_mode;
extern int EdDrawOffMapShadow;
void BtSetMapJumpFloor(int floor);
extern int key_counter;
extern int clear_screen;
extern int edit_mode_draw;
extern int edit_mode_grd_draw;
extern int depth_of_field;
extern int edit_mode_lighting;
extern int draw_sky;
extern int move_count;
extern u_int *EdNPCReadBuffer;
extern CFrameVu1 *TreasureCursor;
extern CFrameVu1 *TreasureCursorOpen;
extern int end_counter;
extern int EdStepTimeFlag;
extern int talk_villager;
extern CCameraFollow TalkCamera;
extern CCamera *NowCamera;
extern CCameraFollow ViewCamera;
extern "C" CDataAlloc2<1> *WorkBuffer__2;
extern CFrame *ECursorFrame;
extern int EdDebugMoveFlag;
extern CRunEffect RunEffect;
extern VILLAGER_INFO EdVillagerInfo;
extern CCameraFollow MainCamera;
extern CCameraFollow EditCamera;
extern CCameraFollow EditCamera;
extern CDataAlloc2<1> CharaBuffer;
extern int NowEditMap;
extern int MapNo;
extern int mapobj_list;
extern int water_list;
extern int objanime_list;
extern int event_list;
extern int mapjump_id;
extern char mapjump_name[0x20];
extern char EditDataDir[0x100];

/* Whether the editor is running the interior test map, and the map names it reads. */
extern int interior_test;
extern char **interior_name;

/* The background music the map started, and whether it has been asked for. */
extern int bgm_play_flag;
extern int bgm_play_start;

/* The arenas the map's own data is carved out of. */
extern CDataAlloc2<1> EtcDataBuffer;
extern CDataAlloc2<1> EPartsInfoBuff;
extern CDataAlloc2<1> MotionData;
extern CDataAlloc2<1> EdMesBuffer;
extern CDataAlloc2<1> DataBuffer__2;

/* The map the editor builds into, one array per kind of part. */
extern CEditArea *EditArea;
extern CCharacter *MotionParts;
extern CMapParts *RiverParts;
extern CMapParts *RoadParts;

/* The fog the map starts with, and the debug font the editor draws with. */
extern EDIT_FOG_INFO now_fog;
extern CDebugFont DebugFont__3;

/* The effects the editor plays, and the storage they come out of. */
extern CEffectGroup EdEffectGroup;
extern CEffect *EffectTable__3;

/* The message-window texture the monster-name window is drawn into. */
extern u8 MesWinTexBuff_11[0x100];

/* Whether an interior is being entered, and the item-volume step to check. */
extern u_char *EdInInfo;
extern CMenuItemStep ItemVolumeStep;

/* The interior the player is walking into, and the map file it is built from. */
extern char EdInteriorName[0x20];
extern char interior_map_name[0x40];
extern int EdInteriorPartsNo;
extern int EdInteriorJumpID;
extern int EdInteriorDoorSound;
extern int EdInteriorStartEvent;
extern int door_open_cnt;
extern int fix_pos_enble;
extern "C" char CurrentDir__3[0x40];
extern CEditGround *pEditGround;
extern CCharacter *Chara;
extern CMainChara MainChara;

/* The arenas the editor carves its own working memory out of. */
extern CDataAlloc2<1> EdNPCBuffer;
extern CDataAlloc2<1> EdVillagerBuffer;
extern CDataAlloc2<1> EdWorkBuffer;
extern CDataAlloc2<1> EdMenuBuffer;

/* Every villager the editor can place, one record each. */
extern CNPCharacter EdVillager[10];

/* The cursors drawn over a villager who can be talked to, one who cannot, and
   the character the event wants the player to notice. */
extern ClsMes CommonMenuMes2;
extern ClsMes CommonMenuMes3;
extern CFrame *CharaCursor0;
extern CFrame *CharaCursor1;
extern CFrame *CharaCursor2;

/* Where the player stands and faces while a door plays its motion. */
extern sceVu0FVECTOR fix_chara_pos;
extern sceVu0FVECTOR fix_chara_rot;
extern sceVu0FVECTOR fix_camera_pos;

/* Data whose shape the unit does not need yet. */
extern CTexAnimeData CharaTexAnimeData[0x80];
extern ED_MOVE_CHARA_INFO EdMoveCharaInfo;
extern u8 EditCharaData[0x960];
extern u8 EditElementInfo[0x120];
extern int EditMenuStatus[7];
extern u8 MesWinTexBuff_01[0x100];
extern u8 MesWinTexBuff_02[0x100];
extern u8 SkyFrame[0x10];
extern u8 SunFrame[0x10];
extern u8 SystemEffect[0x200];
extern u8 def_light[0xC0];

void CommandIMGSub(int image_type, int image_number, char *name);
void EditSave();

/* editloop's own functions, in the order the unit defines them. Each is still
 * INCLUDE_ASM below; the prototypes are what lets the decompiled ones call
 * ahead of their definitions. */
void CommandGROUND(void **arguments);
void CommandBUILD(void **arguments);
void CommandWATER(void **arguments);
void CommandWATER_SURFACE(void **arguments);
void CommandRIVER(void **arguments);
void CommandLIGHT_C(void **arguments);
void CommandPARTS_INFO(void **arguments);
void CommandOBJ_ANIME(void **arguments);
void CommandENTRANCE(void **arguments);
void CommandMAPJUMP(void **arguments);
void CommandREVERBE(void **arguments);
void CommandPEOPLE2(void **arguments);
void CopyCMapParts(CMapParts *from, CMapParts *to, CDataAlloc2<1> *arena);
EPARTS_INFO_HEADER *LoadPTS(CMapParts *parts, unsigned int *archive, MAP_PARTS_INFO *info,
                            OBJ_ANIME_SEQ *anime, EDIT_EFFECT_INFO *effects,
                            EDIT_OBJECT_TIMER *timers, ED_EVENT_POINT *points,
                            CMapParts *shadow);
void LoadPTS(CMapParts *parts, MAP_PARTS_INFO *info, OBJ_ANIME_SEQ *anime,
             EDIT_EFFECT_INFO *effects, EDIT_OBJECT_TIMER *timers, ED_EVENT_POINT *points);
void GenMdsName(MAP_PARTS_INFO *info, char *name);
int LoadEditMapData(EDIT_MAP_INFO *info, char *name, int kind);
void LoadScript(void);
void LoadObjectParts(void);
void LoadGroundData(void);
void LoadTexture(void);
void InitWorkBuffer(void);
void EdLoadMainChara(char *model, char *motion, CDataAlloc2<1> *arena);
void EdDeleteE05RoboParts(void);
int CheckEventPoint(ED_EVENT_POINT *point, float range);
int CheckEditToWalk(float *position);
int GotoInterior(char *name, int entrance, int direction, ED_EVENT_PARAM *param, int kind);
void MoveEditCursor(void);
int GetCollision(CCPoly *poly, CBoxVu0 *box);
void VillagerCollision(void);
void MoveChara(void);
void MainEditMode(void);
void OpenDoorMode(void);
void TalkMode(void);
void EventMode(void);
void ParamDraw(void);
void DrawDay(void);
void EdDrawSysCursor(ED_EVENT_POINT *points, int count);
void MainDraw(void);
int EditInit(void *param);
void EditLoop(void);
void EditLoad(void);
void EditPartsObjectOnOff();

INCLUDE_RODATA("asm/nonmatchings/editloop", @478);
INCLUDE_RODATA("asm/nonmatchings/editloop", @482__2);

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
/**
 * Clears the editor-map description and resets every reusable work record.
 */
void InitInfo() {
    memset(edit_info, 0, sizeof(EDIT_MAP_INFO));

    edit_info->work.obj_anime[0].type = -1;
    for (int i = 0; i < 128; i++) {
        edit_info->work.obj_anime[i].type = -1;
    }

    edit_info->work.effects.second[0].kind = 0;
    for (int i = 0; i < 64; i++) {
        edit_info->work.effects.second[i].kind = 0;
    }

    edit_info->work.effects.first[0].kind = 0;
    for (int i = 0; i < 64; i++) {
        edit_info->work.effects.first[i].kind = 0;
    }

    edit_info->work.object_timers.timers[0].active = 0;
    for (int i = 0; i < 128; i++) {
        edit_info->work.object_timers.timers[i].active = 0;
    }

    edit_info->work.events.points[0].event_type = 0;
    for (int i = 0; i < 256; i++) {
        edit_info->work.events.points[i].event_type = 0;
    }
}
INCLUDE_ASM("asm/nonmatchings/editloop", LoadEditMapData__FP13EDIT_MAP_INFOPci);
/**
 * Sets the scene resource used by the current editor map.
 */
void CommandSCN(void **arguments) {
    strcpy(edit_info->scene_name, (char *) arguments[0]);
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
    edit_info->ambient[light_no][0] = *(float *) arguments[0];
    edit_info->ambient[light_no][1] = *(float *) arguments[1];
    edit_info->ambient[light_no][2] = *(float *) arguments[2];
    edit_info->ambient[light_no][3] = 128.0f;
}
/**
 * Stores the direction and colour of one light within the selected preset.
 */
void CommandLIGHT_C(void **arguments) {
    sceVu0FVECTOR direction;
    int light = *(int *) arguments[6];
    int index;
    direction[0] = *(float *) arguments[0];
    direction[1] = *(float *) arguments[1];
    direction[2] = *(float *) arguments[2];
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);
    edit_info->light_direction[light_no][0][index = light - 1] = direction[0];
    edit_info->light_direction[light_no][1][index] = direction[1];
    edit_info->light_direction[light_no][2][index] = direction[2];
    edit_info->light_direction[light_no][3][index] = direction[3];
    edit_info->light_colour[light_no][index][0] = *(float *) arguments[3];
    edit_info->light_colour[light_no][index][1] = *(float *) arguments[4];
    edit_info->light_colour[light_no][index][2] = *(float *) arguments[5];
    edit_info->light_colour[light_no][index][3] = 128.0f;
}

/**
 * Stores fog distances, colour and falloff for the selected light preset.
 */
void CommandFOG(void **arguments) {
    edit_info->fog[light_no].near_distance = *(float *) arguments[0];
    edit_info->fog[light_no].far_distance = *(float *) arguments[1];
    edit_info->fog[light_no].red = *(int *) arguments[2];
    edit_info->fog[light_no].green = *(int *) arguments[3];
    edit_info->fog[light_no].blue = *(int *) arguments[4];
    edit_info->fog[light_no].intensity = *(float *) arguments[5];
    edit_info->fog[light_no].exponent = *(float *) arguments[6];
}
/**
 * Stores the primary background colour for the selected light preset.
 */
void CommandBG_COL(void **arguments) {
    edit_info->background_colour[light_no][0] = *(float *) arguments[0];
    edit_info->background_colour[light_no][1] = *(float *) arguments[1];
    edit_info->background_colour[light_no][2] = *(float *) arguments[2];
    edit_info->background_colour[light_no][3] = 128.0f;
}

/**
 * Stores the secondary background colour for the selected light preset.
 */
void CommandBG_COL2(void **arguments) {
    edit_info->background_colour_2[light_no][0] = *(float *) arguments[0];
    edit_info->background_colour_2[light_no][1] = *(float *) arguments[1];
    edit_info->background_colour_2[light_no][2] = *(float *) arguments[2];
    edit_info->background_colour_2[light_no][3] = 128.0f;
}
/**
 * Stores the map's time-bounded depth-of-field settings.
 */
void CommandDOF(void **arguments) {
    edit_info->dof_start_time = ConvertTime(*(float *) arguments[0]);
    edit_info->dof_end_time = ConvertTime(*(float *) arguments[1]);
    edit_info->dof_near_level = *(int *) arguments[2];
    edit_info->dof_near = *(float *) arguments[3];
    edit_info->dof_far = *(float *) arguments[4];
    edit_info->dof_far_level = *(int *) arguments[5];
    edit_info->dof_alpha = *(int *) arguments[6];
}
/**
 * Appends an image-resource assignment to the current editor map.
 */
void CommandIMGSub(int image_type, int image_number, char *name) {
    edit_info->images[texture_list].type = image_type;
    edit_info->images[texture_list].number = image_number;
    sprintf(edit_info->images[texture_list].name, "%s%s", CurrentDir__3, name);
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
 * Assigns a sky image to a one-based sky layer from a parsed map-script command.
 */
void CommandSKY_IMG(void **arguments) {
    int index = *(int *) arguments[0] - 1;
    if (index < 0 || index > 3) {
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
/**
 * Selects a sky scene layer from a one-based script slot.
 */
void CommandSKY(void **arguments) {
    int index = **(int **) arguments;
    index--;
    if (index < 0 || index > 4) {
        return;
    }

    sprintf(edit_info->sky_layers[index].name, "%s%s", CurrentDir__3, (char *) arguments[1]);
    objframe = edit_info->sky_layers[index].name;
    mapobj = NULL;
    mapparts = NULL;
}

/**
 * Selects a sun scene layer from a one-based script slot.
 */
void CommandSUN(void **arguments) {
    int index = *(int *) arguments[0] - 1;
    if (index < 0 || index > 3) {
        return;
    }

    sprintf(edit_info->sun_layers[index].name, "%s%s", CurrentDir__3, (char *) arguments[1]);
    objframe = edit_info->sun_layers[index].name;
    mapobj = NULL;
    mapparts = NULL;
}
/**
 * Places one ground object, with its models, position and orientation.
 */
void CommandGROUND(void **arguments) {
    int i;
    MAP_PARTS_INFO *object = &edit_info->map_objects[mapobj_list];
    object->kind = 1;
    for (i = 0; i < 9; i++) {
        char *name = (char *) arguments[i];
        if (*name != '\0') {
            sprintf(object->name[i], "%s%s", CurrentDir__3, name);
        } else {
            object->name[i][0] = '\0';
        }
    }
    object->position[0] = *(float *) arguments[8];
    object->position[1] = *(float *) arguments[9];
    object->position[2] = *(float *) arguments[10];
    object->rotation[0] = 3.1415927f * *(float *) arguments[11] / 180.0f;
    object->rotation[1] = 3.1415927f * *(float *) arguments[12] / 180.0f;
    object->rotation[2] = 3.1415927f * *(float *) arguments[13] / 180.0f;
    objframe = NULL;
    mapobj = (CMapObject *) object;
    mapparts = NULL;
    mapobj_list++;
}
/**
 * Places one building object, with its models, position and orientation.
 */
void CommandBUILD(void **arguments) {
    int i;
    MAP_PARTS_INFO *object = &edit_info->map_objects[mapobj_list];
    object->kind = 2;
    for (i = 0; i < 9; i++) {
        char *name = (char *) arguments[i];
        if (*name != '\0') {
            sprintf(object->name[i], "%s%s", CurrentDir__3, name);
        } else {
            object->name[i][0] = '\0';
        }
    }
    object->position[0] = *(float *) arguments[8];
    object->position[1] = *(float *) arguments[9];
    object->position[2] = *(float *) arguments[10];
    object->rotation[0] = 3.1415927f * *(float *) arguments[11] / 180.0f;
    object->rotation[1] = 3.1415927f * *(float *) arguments[12] / 180.0f;
    object->rotation[2] = 3.1415927f * *(float *) arguments[13] / 180.0f;
    objframe = NULL;
    mapobj = (CMapObject *) object;
    mapparts = NULL;
    mapobj_list++;
}
/**
 * Places one water object, with its models, position and orientation.
 */
void CommandWATER(void **arguments) {
    int i;
    MAP_PARTS_INFO *object = &edit_info->map_objects[mapobj_list];
    object->kind = 0x15;
    for (i = 0; i < 9; i++) {
        char *name = (char *) arguments[i];
        if (*name != '\0') {
            sprintf(object->name[i], "%s%s", CurrentDir__3, name);
        } else {
            object->name[i][0] = '\0';
        }
    }
    object->position[0] = *(float *) arguments[8];
    object->position[1] = *(float *) arguments[9];
    object->position[2] = *(float *) arguments[10];
    object->rotation[0] = 3.1415927f * *(float *) arguments[11] / 180.0f;
    object->rotation[1] = 3.1415927f * *(float *) arguments[12] / 180.0f;
    object->rotation[2] = 3.1415927f * *(float *) arguments[13] / 180.0f;
    objframe = NULL;
    mapobj = (CMapObject *) object;
    mapparts = NULL;
    mapobj_list++;
}
/**
 * Places one water surface and the three corners that span it.
 */
void CommandWATER_SURFACE(void **arguments) {
    if (water_list < 8) {
        EDIT_WATER_INFO *surface = &edit_info->water_surfaces[water_list];
        water_list++;
        strcpy(surface->name, (char *) arguments[0]);
        surface->type = *(int *) arguments[1];
        surface->number = *(int *) arguments[2];
        surface->corner_a[0] = *(float *) arguments[3];
        surface->corner_a[1] = *(float *) arguments[4];
        surface->corner_a[2] = *(float *) arguments[5];
        surface->corner_a[3] = 1.0f;
        surface->corner_b[0] = *(float *) arguments[6];
        surface->corner_b[1] = *(float *) arguments[7];
        surface->corner_b[2] = *(float *) arguments[8];
        surface->corner_b[3] = 1.0f;
        surface->corner_c[0] = *(float *) arguments[9];
        surface->corner_c[1] = *(float *) arguments[10];
        surface->corner_c[2] = *(float *) arguments[11];
        surface->corner_c[3] = 1.0f;
        surface->texture_scroll[0] = *(float *) arguments[12];
        surface->texture_scroll[1] = *(float *) arguments[13];
        surface->texture_scroll[2] = *(float *) arguments[14];
        surface->texture_scroll[3] = *(float *) arguments[15];
        surface->unk_50 = *(int *) arguments[16];
        surface->unk_54 = *(int *) arguments[17];
        surface->unk_58 = *(int *) arguments[18];
        surface->unk_70 = *(int *) arguments[19];
        surface->unk_74 = *(int *) arguments[20];
        surface->unk_78 = *(int *) arguments[21];
        surface->parts_no = now_parts_no;
        water_info = surface;
    }
}
/**
 * Adds one water-wave parameter set to the first unused wave slot.
 */
FUZZY_MATCH("asm/matchings/editloop", CommandWATER_SHAKE__FPPv);
void CommandWATER_SHAKE(void **arguments) {
    EDIT_WATER_INFO *info = water_info;
    if (info != NULL) {
        int index = 0;
        while (1) {
            EDIT_WATER_WAVE_VIEW *wave =
                (EDIT_WATER_WAVE_VIEW *) ((u8 *) info + index * sizeof(sceVu0FVECTOR));
            if (wave->active == 0.0f && wave->z == 0.0f) {
                wave->x = (float) *(int *) arguments[0];
                wave->y = (float) *(int *) arguments[1];
                wave->z = *(float *) arguments[3];
                wave->active = *(float *) arguments[2];
                break;
            }
            index++;
        }
    }
}

/**
 * Stores one editable-area resource and its placement parameters.
 */
void CommandEDITAREA(void **arguments) {
    EDIT_AREA_INFO *area = &edit_info->parts_work.edit_areas[*(int *) arguments[0]];
    char *name = (char *) arguments[1];
    if (*name != '\0') {
        sprintf(area->name, "%s%s", CurrentDir__3, name);
    } else {
        area->name[0] = '\0';
    }
    area->width = *(int *) arguments[2];
    area->height = *(int *) arguments[3];
    area->unk_48 = *(float *) arguments[4];
    area->unk_4c = *(float *) arguments[5];
    area->unk_50 = *(float *) arguments[6];
    area->unk_54 = *(float *) arguments[7];
    area->unk_58 = *(float *) arguments[8];
}
/**
 * Expands a map-part resource name into the seven model files the loader reads,
 * or keeps it as it stands when the script named a part-definition file.
 */
void GenMdsName(MAP_PARTS_INFO *info, char *name) {
    char *c = name;
    c += strlen(name) - 3;
    if (c[0] == 'p' && c[1] == 't' && c[2] == 's') {
        char letter;
        for (c = name; (letter = *c) != '\0'; c++) {
            if (letter == '.') {
                *c = '\0';
            }
        }
        sprintf(info->name[0], "%s", name);
        return;
    }
    sprintf(info->name[0], "%s0.mds", name);
    sprintf(info->name[1], "%s1.mds", name);
    sprintf(info->name[2], "%s2.mds", name);
    sprintf(info->name[3], "%sm.mds", name);
    sprintf(info->name[4], "%ss.mds", name);
    sprintf(info->name[5], "%sa.mds", name);
    sprintf(info->name[6], "%sk.mds", name);
    sprintf(info->name[7], "");
}
/**
 * Defines one building map part from a parsed script command.
 */
void CommandBLD_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) {
        return;
    }
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else {
        parts->name[0][0] = '\0';
    }
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 2;
    parts->subtype = 0;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}

/**
 * Defines one ordinary ground map part from a parsed script command.
 */
void CommandGRD_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) {
        return;
    }
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else {
        parts->name[0][0] = '\0';
    }
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 0;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}
/**
 * Reads the cell grid and attached resources of the map part being defined.
 */
void CommandPARTS_INFO(void **arguments) {
    int index = now_parts_no;
    if (index < 0 || index >= 24) {
        return;
    }
    EDIT_PARTS_DEF *def = &edit_info->parts_work.parts_defs.defs[index];
    def->width = *(int *) arguments[0];
    def->height = *(int *) arguments[1];
    int at = 0;
    int count = 0;
    char *shape = (char *) arguments[2];
    for (int i = 0; i < 32; i++) {
        def->cells[i] = 0;
    }
    char c;
    while ((c = shape[at]) != '\0') {
        if (c >= '0' && c <= '9') {
            def->cells[count] = c - '0';
            count++;
        } else {
            switch (c) {
            case 'd':
                def->cells[count] = 0x81;
                count++;
                break;
            case 'x':
                def->cells[count] = 0x80;
                count++;
                break;
            }
        }
        if (count >= def->width * def->height) {
            break;
        }
        at++;
    }
    def->unk_48 = *(int *) arguments[3];
    int argument = 4;
    for (int i = 0; i < 6; i++) {
        def->values[i] = *(int *) arguments[argument++];
        strcpy(def->names[i], (char *) arguments[argument++]);
    }
}
/**
 * Defines a road-classified map part in the general part table.
 */
void CommandROAD_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 1;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}

/**
 * Defines one road map part in the dedicated road table.
 */
void CommandROAD(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 6) return;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.roads.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 1;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}

/**
 * Defines a river-classified map part in the general part table.
 */
void CommandRIVER_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 2;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}
/**
 * Defines one river, bridge or lake part in the dedicated river table.
 */
void CommandRIVER(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 16) return;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.rivers.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    if (index == 7) {
        parts->kind = 0x15;
    }
    parts->subtype = 2;
    if (index == 6) {
        parts->subtype = 3;
    }
    if (index + 8 < 16) {
        char *second_name = (char *) arguments[4];
        if (*second_name != '\0') {
            sprintf(parts->name[7], "%s%s", CurrentDir__3, second_name);
        } else {
            parts->name[7][0] = '\0';
        }
        objframe = NULL;
        mapobj = NULL;
        mapparts = (CMapParts *) parts;
    }
}
/**
 * Defines a bridge-classified map part in the general part table.
 */
void CommandBRIDGE_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 3;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}

/**
 * Defines a lake-classified map part and its secondary resource.
 */
void CommandLAKE_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
        sprintf(parts->name[7], "%s%s", CurrentDir__3, (char *) arguments[4]);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 4;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}

/**
 * Defines an on-river map part and its secondary resource.
 */
void CommandON_RIVER_PARTS(void **arguments) {
    int index = *(int *) arguments[0];
    if (index < 0 || index >= 24) return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
        sprintf(parts->name[7], "%s%s", CurrentDir__3, (char *) arguments[4]);
    } else parts->name[0][0] = '\0';
    parts->parts_no = *(int *) arguments[2];
    parts->unk_264 = *(float *) arguments[3];
    parts->kind = 1;
    parts->subtype = 5;
    objframe = NULL;
    mapobj = NULL;
    mapparts = (CMapParts *) parts;
}
/**
 * Attaches one object animation to the map part or object being defined.
 */
void CommandOBJ_ANIME(void **arguments) {
    if (objanime_list >= 128) {
        printf("obj_anime over!!!\n");
        return;
    }
    OBJ_ANIME_SEQ *anime = &edit_info->work.obj_anime[objanime_list];
    s16 *slots;
    anime->type = *(int *) arguments[0];
    if (anime->type < 0 || anime->type >= 4) {
        return;
    }
    anime->number = *(int *) arguments[1];
    strcpy(anime->name, (char *) arguments[2]);
    anime->range[0] = *(float *) arguments[3];
    anime->range[1] = *(float *) arguments[4];
    anime->range[2] = *(float *) arguments[5];
    anime->offset[0] = *(float *) arguments[6];
    anime->offset[1] = *(float *) arguments[7];
    anime->offset[2] = *(float *) arguments[8];
    anime->speed[0] = *(float *) arguments[9];
    anime->speed[1] = *(float *) arguments[10];
    anime->speed[2] = *(float *) arguments[11];
    if (objframe != NULL) {
        slots = (s16 *) (objframe + 0x98);
    }
    if (mapobj != NULL) {
        slots = ((MAP_PARTS_INFO *) mapobj)->anime;
    }
    if (mapparts != NULL) {
        slots = ((MAP_PARTS_INFO *) mapparts)->anime;
    }
    for (int i = 0; i < 8; i++) {
        if (slots[i] <= 0) {
            slots[i] = objanime_list;
            break;
        }
    }
    objanime_list++;
}
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
/**
 * Places the entrance the last map-jump command named, on the side the script
 * chose, and attaches it to the part or object being defined.
 */
void CommandENTRANCE(void **arguments) {
    if (event_list >= 256) {
        printf("event over!!!\n");
        return;
    }
    event_list--;
    ED_EVENT_POINT *point = &edit_info->work.events.points[event_list];
    s16 *slots;
    point->event_type = 1;
    char *side = (char *) arguments[0];
    strcpy(point->destination, mapjump_name);
    point->map_no = mapjump_id;
    point->side = 0;
    switch (*side) {
    case 'r':
    case 'R':
        point->side = 1;
        break;
    case 'l':
    case 'L':
        point->side = -1;
        break;
    }
    point->position[0] = *(float *) arguments[1];
    point->position[1] = *(float *) arguments[2];
    point->position[2] = *(float *) arguments[3];
    point->rotation[0] = *(float *) arguments[4];
    point->rotation[1] = *(float *) arguments[5];
    point->rotation[2] = *(float *) arguments[6];
    point->unk_60[0] = *(float *) arguments[7];
    point->unk_60[1] = *(float *) arguments[8];
    point->unk_60[2] = *(float *) arguments[9];
    if (objframe == NULL) {
        if (mapobj != NULL) {
            slots = ((MAP_PARTS_INFO *) mapobj)->events;
        }
        if (mapparts != NULL) {
            slots = ((MAP_PARTS_INFO *) mapparts)->events;
        }
        for (int i = 0; i < 8; i++) {
            if (slots[i] <= 0) {
                slots[i] = event_list;
                break;
            }
        }
        event_list++;
    }
}
/**
 * Names the map that the entrances defined after it lead to.
 */
void CommandMAPJUMP(void **arguments) {
    mapjump_id = *(int *) arguments[0];
    strcpy(mapjump_name, (char *) arguments[1]);
    if (event_list >= 256) {
        printf("event over!!!\n");
        return;
    }
    ED_EVENT_POINT *point = &edit_info->work.events.points[event_list];
    s16 *slots;
    point->event_type = 1;
    strcpy(point->destination, mapjump_name);
    point->map_no = mapjump_id;
    point->side = 0;
    point->unk_60[0] = 10.0f;
    point->unk_60[1] = 10.0f;
    point->unk_60[2] = 10.0f;
    if (mapobj != NULL) {
        slots = ((MAP_PARTS_INFO *) mapobj)->events;
    }
    if (mapparts != NULL) {
        slots = ((MAP_PARTS_INFO *) mapparts)->events;
    }
    for (int i = 0; i < 8; i++) {
        if (slots[i] <= 0) {
            slots[i] = event_list;
            break;
        }
    }
    event_list++;
}
/**
 * Appends one villager definition to the map's parsed villager list.
 */
void CommandPEOPLE(void **arguments) {
    if (people_list < 16) {
        VILLAGER_INFO *villager = &edit_info->villagers[people_list];
        villager->index = people_list;
        strcpy(villager->name, (char *) arguments[0]);
        villager->character_no = *(int *) arguments[1];
        villager->model_no = *(int *) arguments[2];
        villager->weapon_no = *(int *) arguments[3];
        villager->initial_motion = *(int *) arguments[4];
        villager->move_speed = *(float *) arguments[5];
        villager->position[0] = *(float *) arguments[6];
        villager->position[1] = *(float *) arguments[7];
        villager->position[2] = *(float *) arguments[8];
        villager->position[3] = 1.0f;
        villager->rotation[0] = 0.0f;
        villager->rotation[1] = *(float *) arguments[9];
        villager->rotation[2] = 0.0f;
        people_list++;
    }
}
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
/**
 * Replaces one weekly villager time-table row from a script command.
 */
void CommandTIME_TABLE(void **arguments) {
    int table = **(int **) arguments;
    if (table >= 0) {
        int *entries = edit_info->time_tables[week_no][table];
        for (int i = 0; i < 16; i++) {
            entries[i] = -1;
        }
        for (int i = 0; i < 6; i++) {
            entries[i] = *(int *) arguments[i + 1];
        }
    }
}
/**
 * Stops time progression for the current editor map.
 */
void CommandTIME_STOP(void **arguments) {
    edit_info->time_stop = 1;
}

/**
 * Stores the three sky-follow parameters parsed for the current map.
 */
void CommandSKY_FOLLOW(void **arguments) {
    edit_info->sky_follow[0] = *(int *) arguments[0];
    edit_info->sky_follow[1] = *(int *) arguments[1];
    edit_info->sky_follow[2] = *(int *) arguments[2];
}
/**
 * Stores the shadow distances, quality level and modes for the current map.
 */
void CommandSHADOW_LEVEL(void **arguments) {
    edit_info->shadow_level = *(int *) arguments[0];
    edit_info->shadow_near = *(float *) arguments[1];
    edit_info->shadow_far = *(float *) arguments[2];
    edit_info->shadow_mode = *(int *) arguments[3];
    edit_info->shadow_mode_2 = *(int *) arguments[4];
}
/**
 * Appends a rectangular editor region with its corners ordered component-wise.
 */
void CommandEDITAREA_RECT(void **arguments) {
    if (edit_rect_list < 8) {
        EDIT_AREA_RECT_INFO *rect = &edit_info->edit_area_rects[edit_rect_list];
        edit_rect_list++;
        sceVu0FVECTOR second;
        sceVu0FVECTOR first;
        first[0] = *(float *) arguments[0];
        first[1] = *(float *) arguments[1];
        first[2] = *(float *) arguments[2];
        second[0] = *(float *) arguments[3];
        second[1] = *(float *) arguments[4];
        second[2] = *(float *) arguments[5];
        VectorMaxMin(rect->maximum, rect->minimum, second, first);
    }
}
/**
 * Selects and reports the background-music number for the current map.
 */
void CommandBGM_NO(void **arguments) {
    edit_info->bgm_no = *(int *) arguments[0];
    printf("bgm = %d\n", edit_info->bgm_no);
}

/**
 * Selects and reports the environmental sound set for the current map.
 */
void CommandSOUND_SET(void **arguments) {
    edit_info->sound_set_no = *(int *) arguments[0];
    printf("sound set = %d\n", edit_info->sound_set_no);
}

/**
 * Selects the two environmental reverb presets and their strengths.
 */
void CommandREVERBE(void **arguments) {
    static char *rev[] = {
        "OFF", "ROOM", "STUDIO_A", "STUDIO_B", "STUDIO_C", "HALL",
        "SPACE", "ECHO", "DELAY", "PIPE", "MAX", ""
    };

    int mode = 0;
    char *name = (char *) arguments[0];
    while (*rev[mode] != '\0') {
        if (strcasecmp(rev[mode], name) == 0)
            break;
        mode++;
    }
    if (10 < mode)
        mode = 0;
    edit_info->reverb_mode[0] = mode;
    edit_info->reverb_depth[0] = *(int *) arguments[1];

    mode = 0;
    name = (char *) arguments[2];
    while (*rev[mode] != '\0') {
        if (strcasecmp(rev[mode], name) == 0)
            break;
        mode++;
    }
    if (10 < mode)
        mode = 0;
    edit_info->reverb_mode[1] = mode;
    edit_info->reverb_depth[1] = *(int *) arguments[3];

    printf("rev0 = %s %d\n", rev[edit_info->reverb_mode[0]], edit_info->reverb_depth[0]);
    printf("rev1 = %s %d\n", rev[edit_info->reverb_mode[1]], edit_info->reverb_depth[1]);
}
/**
 * Appends a named map-part motion range to the current map.
 */
void CommandMOTION_PARTS(void **arguments) {
    if (motion_parts_list < 4) {
        EDIT_MOTION_PARTS_INFO *motion = &edit_info->motion_parts[motion_parts_list];
        motion_parts_list++;
        strcpy(motion->name, (char *) arguments[0]);
        motion->values[0] = *(float *) arguments[1];
        motion->values[1] = *(float *) arguments[2];
        motion->values[2] = *(float *) arguments[3];
        motion->values[3] = *(float *) arguments[4];
        motion->values[4] = *(float *) arguments[5];
        motion->values[5] = *(float *) arguments[6];
    }
}
/**
 * Appends one villager placed by a second-format script entry.
 */
void CommandPEOPLE2(void **arguments) {
    if (people_list < 16) {
        VILLAGER_INFO *villager = &edit_info->villagers[people_list];
        villager->index = people_list;
        strcpy(villager->name, (char *) arguments[0]);
        villager->character_no = -1;
        villager->model_no = -1;
        villager->weapon_no = *(int *) arguments[1];
        villager->initial_motion = *(int *) arguments[2];
        villager->move_speed = *(float *) arguments[3];
        villager->position[0] = 0.0f;
        villager->position[1] = 0.0f;
        villager->position[2] = 0.0f;
        villager->position[3] = 1.0f;
        villager->rotation[0] = 0.0f;
        villager->rotation[1] = 0.0f;
        villager->rotation[2] = 0.0f;
        villager->talk_event_no = -1;
        villager->talk_event_level = 0;
        now_villinfo = villager;
        people_list++;
    }
}
/**
 * Disables ambient sound for the current editor map.
 */
void CommandSE_AMBIENT_OFF(void **arguments) {
    edit_info->ambient_sound_off = 1;
}

/**
 * Stores the four wind parameters parsed for the current editor map.
 */
void CommandWIND(void **arguments) {
    edit_info->wind[0] = *(float *) arguments[0];
    edit_info->wind[1] = *(float *) arguments[1];
    edit_info->wind[2] = *(float *) arguments[2];
    edit_info->wind[3] = *(float *) arguments[3];
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
/**
 * Stores a character ambient colour selected by a one-based script slot.
 */
FUZZY_MATCH("asm/matchings/editloop", CommandCHARA_AMBIENT__FPPv);
void CommandCHARA_AMBIENT(void **arguments) {
    int index = *(int *) arguments[0] - 1;
    if (index < 0 || index >= 4) {
        return;
    }

    float red = *(float *) arguments[1];
    float *ambient = edit_info->character_ambient[index];
    ambient[0] = red;
    edit_info->character_ambient[index][1] = *(float *) arguments[2];
    edit_info->character_ambient[index][2] = *(float *) arguments[3];
    edit_info->character_ambient[index][3] = 0.0f;
}
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
        edit_info->people_list[i] = *(int *) arguments[i];
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

/**
 * Reads the shared and map-specific event scripts into the script arena.
 */
void LoadScript() {
    char common_path[0x40];
    char map_path[0x40];
    char language[0x1c];
    int size;
    char *map_script;

    EdScriptBuffer.used = 0;
    EdEventData = (char *) (EdScriptBuffer.base + EdScriptBuffer.used * 16);
    sprintf(language, "_%d.mes", LanguageCode);
    GetEditDataDir(common_path);
    GetEditDataDir(map_path);
    strcat(common_path, "event.stb");
    strcat(map_path, EditMapName);
    strcat(map_path, language);
    if (LoadFile2(common_path, EdEventData, &size, 0) != 0) {
        EdScriptBuffer.Alloc((size >> 4) + 1);
        map_script = (char *) (EdScriptBuffer.base + EdScriptBuffer.used * 16);
        if (LoadFile2(map_path, map_script, &size, 0) != 0) {
            EdScriptBuffer.Alloc((size >> 4) + 1);
        } else {
            map_script = NULL;
        }
        EdSetEventScript(EdEventData, map_script, &EdScriptBuffer);
    } else {
        EdEventData = NULL;
    }
    EdScriptBuffer.Align64();
    EdSystemEventData = (char *) (EdScriptBuffer.base + EdScriptBuffer.used * 16);
    if (LoadFile2("gedit/system/event.stb", EdSystemEventData, &size, 0) != 0) {
        EdScriptBuffer.Alloc((size >> 4) + 1);
        return;
    }
    EdSystemEventData = NULL;
}
/**
 * Starts a map event and copies an optional source camera into the event camera.
 */
int RunEvent(int event_no, CCamera *camera) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;

    if (start_event_no > 0 && simple_event == 0) {
        return 0;
    }
    if (camera != NULL) {
        camera->GetPos(position);
        camera->GetRef(reference);
        EventCamera.SetPos(position);
        EventCamera.SetRef(reference);
        EventCamera.FollowOff();
        EventCamera.SetRoll(0.0f);
    }
    start_event_no = event_no;
    return 1;
}

/**
 * Starts a system event and copies an optional source camera into the event camera.
 */
void RunSystemEvent(int event_no, CCamera *camera) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;

    start_event_no = -1;
    if (start_system_event <= 0) {
        if (camera != NULL) {
            camera->GetPos(position);
            camera->GetRef(reference);
            EventCamera.SetPos(position);
            EventCamera.SetRef(reference);
            EventCamera.FollowOff();
        }
        start_system_event = event_no;
    }
}
/**
 * Begins a fade into a comparison event unless a higher-priority request is active.
 */
int FadeOutToEvent(int event_no, int level) {
    if (EdDebugEventEnable == 0) {
        return 0;
    }
    if (goto_cmp_event != 0) {
        if (level > goto_cmp_event_level) {
        } else {
            return 0;
        }
    }
    goto_cmp_event = event_no;
    goto_cmp_event_level = level;
    float zero = 0.0f;
    EdFadeOut(60, zero, zero, zero);
    return 1;
}
/**
 * Writes the editor's part progress and clock back to the save data.
 */
void EditSave() {
    int map_no = MapNo;
    if (map_no < 5 && map_no >= 0) {
        pEditGround->Save(NowEditMap, SaveData);
        EditPartsInfo.Save(NowEditMap, SaveData);
    }
    EDIT_MAP_INFO *info = EditMapInfo;
    if (info != NULL && info->time_stop == 0) {
        SaveData->SetNowTime(NowTime);
    }
}
/**
 * Restores the editor's part progress and clock from the save data.
 */
void EditLoad() {
    if (MapNo < 5) {
        EditPartsInfo.Load(NowEditMap, SaveData, 0);
        pEditGround->Load(NowEditMap, SaveData);
    }
    EditPartsObjectOnOff();
    pEditGround->MakePartsBox();
    NowTime = 0.01f * (float) ((int) (100.0f * SaveData->GetNowTime()) % 1200);
}
/**
 * Saves the map and quiets everything the editor was running before it leaves.
 */
void EditExit() {
    sceVu0FVECTOR fade;

    EditSave();
    MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
    StopAllSound();
    while (ReadBGSync() != 0) {
    }
    SndAmbientStop();
    if (EdEventInfo.map_jump_bgm_stop != 0) {
        SndBgmFadeOutStop();
        SndBgmStop();
        SndBgmInit();
    }
    EdStopSoundSrc();
    SndStopAllSe();
    SndStep();
    MGScisioringForce(0);
    GamePad.KeyLock(0);
    EdGetFadeColor(fade);
    MGSetBGColor(fade);
}
/**
 * Carves the villager, work and menu arenas out of what the NPC arena left.
 */
void InitWorkBuffer() {
    u_char *free_start = EdNPCBuffer.base + EdNPCBuffer.used * 16;
    int free_quads = EdNPCBuffer.limit - EdNPCBuffer.used;
    EdVillagerBuffer.base = free_start;
    EdVillagerBuffer.limit = free_quads;
    EdVillagerBuffer.used = 0;
    EdWorkBuffer.base = (u_char *) ((((int) free_start >> 6) + 1) << 6);
    EdWorkBuffer.limit = free_quads - 4;
    EdWorkBuffer.used = 0;
    EdMenuBuffer.base = (u_char *) read_buffer - 0x180000;
    EdMenuBuffer.limit = 0x3A2E0;
    EdMenuBuffer.used = 0;
}
/**
 * Reports whether any modal editor event currently blocks normal input.
 */
int run_event_check() {
    if (goto_dungeon != 0 || goto_menu != 0 || goto_cmp_event != 0 || debug_menu_mode != 0 ||
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
/**
 * Settles the editor's input lock and the overlays it allows for this frame.
 */
void EdSetFlag() {
    key_lock = 0;
    if (run_event_check() != 0) {
        key_lock = 1;
    }
    if (key_lock != 0) {
        EdSetKeyMode(0);
    } else {
        EdSetKeyMode(0xFFFF);
    }

    draw_npc_cursor = GameMode == 1;
    if (key_lock != 0) {
        draw_npc_cursor = 0;
    }

    EDIT_CONFIG_VIEW *config = (EDIT_CONFIG_VIEW *) SaveData->GetConfigData();

    draw_clock = !(bool) config->clock_hidden;
    if (key_lock != 0) {
        draw_clock = 0;
    }
}
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
        goto_return_menu = 0;
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
/**
 * Applies the editor-specific layout and reveal settings to its message windows.
 */
void EdInitMesParam() {
    float text_rate;
    EDIT_CONFIG_VIEW *config = (EDIT_CONFIG_VIEW *) SaveData->GetConfigData();
    if (config->message_speed != 0) {
        text_rate = 0.6f;
    } else {
        text_rate = 0.3f;
    }

    EditMes1.columns = 21;
    EditMes1.rows = 4;
    EditMes1.text_rate = text_rate;
    EditMes1.text_rate_set = text_rate;
    EditMes1.tex_block = 26;
    EditMes1.style = 0;
    EditMes1.page_arrow = 0;
    EditMes1.centre_rows = 1;
    float fade_speed = 0.1f;
    EditMes1.fade_speed = fade_speed;
    EditMes1.page_arrow = 1;

    EditEventMes1.columns = 21;
    EditEventMes1.rows = 4;
    EditEventMes1.text_rate = text_rate;
    EditEventMes1.text_rate_set = text_rate;
    EditEventMes1.tex_block = 26;
    EditEventMes1.style = 0;
    EditEventMes1.page_arrow = 0;
    EditEventMes1.centre_rows = 1;
    EditEventMes1.fade_speed = fade_speed;
    EditEventMes1.page_arrow = 1;

    EditSystemMes.Preset(1);
    EditSystemMes.fukidashi = 0;
    EditSystemMes.stay_frame = 1;
    EditSystemMes.text_rate = 0.0f;
    EditSystemMes.text_rate_set = 0.0f;
    EditSystemMes.page_arrow = 0;
    EditSystemMes.fade_speed = 1.0f;
    EditSystemMes.columns = 26;
    EditSystemMes.rows = 1;
    EditSystemMes.centre_rows = 0;
    EditSystemMes.style = 3;

    EditNameMes.Preset(4);
    EditNameMes.tex_block = 26;
    EditNameMes.rows = 4;
    EditNameMes.fukidashi = 0;
    EditNameMes.stay_frame = 0;
    EditNameMes.style = 3;
}
/**
 * Builds every buffer, camera, message window and map the editor loop runs on.
 */
int EditInit(void *) {
    char map_path[0x80];
    char save_path[0x80];
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    sceVu0FVECTOR fade;
    char mes_path[0x40];
    char sys_path[0x40];
    char language[0x10];
    char win_path[0x40];
    int size;
    int mes_size;

    oldGameMode = -1;
    NowTime = 0.0f;
    SaveData->VisitMap(MapNo, 1);
    PlayTimeCountFlag(1);
    MGFlipWaitVSync(0);
    EdSetKeyMode(0xFFFF);
    GamePad.MenuModeOff();
    GamePad.AutoRepeatOff();
    int map_no = MapNo;
    NowEditMap = map_no;
    interior_test = 0;
    if (map_no < 9)
        sprintf(EditMapName, "e0%d", map_no + 1);
    int outside = MapNo;
    if (outside > 10) {
        int interior = outside - 10;
        if (interior < 10)
            sprintf(EditMapName, "s0%d", interior);
        else
            sprintf(EditMapName, "s%d", interior);
    }
    if (NowEditMap == 99) {
        strcpy(EditDataDir, "\0");
        interior_test = 1;
    } else {
        strcpy(EditDataDir, "gedit/");
        strcat(EditDataDir, EditMapName);
        strcat(EditDataDir, "/");
    }
    bgm_play_flag = 0;
    bgm_play_start = 0;
    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 100);
    SetDataBuffer(&EtcDataBuffer, 40000);
    SetDataBuffer(&EdScriptBuffer, 16000);
    SetDataBuffer(&EPartsInfoBuff, 8000);
    SetDataBuffer(&CharaBuffer, 115000);
    SetDataBuffer(&TextureData, 10);
    SetDataBuffer(&MotionData, 7900);
    SetDataBuffer(&EdMesBuffer, 13000);
    SetDataBuffer(&DataBuffer__2, 1216000);
    EdNPCBuffer.base = DataBuffer__2.base + DataBuffer__2.used * 16 + 0xCF8500;
    EdNPCBuffer.limit = 326000;
    EdNPCBuffer.used = 0;
    SetPacketReadBuffer(30000, 140000);
    EPartsInfoBuff.used = 0;
    EditArea = new ((u_long128 *) EtcDataBuffer.Alloc(0x81C)) CEditArea[4];
    pEditGround = new ((u_long128 *) EtcDataBuffer.Alloc(0x2097)) CEditGround;
    ObjParts = new ((u_long128 *) EtcDataBuffer.Alloc(0x3F1)) CMapParts[24];
    MotionParts = new ((u_long128 *) EtcDataBuffer.Alloc(0x470)) CCharacter[4];
    RiverParts = new ((u_long128 *) EtcDataBuffer.Alloc(0x2B0)) CMapParts[16];
    RoadParts = new ((u_long128 *) EtcDataBuffer.Alloc(0x102)) CMapParts[6];
    float near = 10.0f;
    MGSetRenderInfo(800.0f, near, 65535.0f);
    GetEditDataDir(map_path);
    strcat(map_path, "mapinfo.cfb");
    EditMapInfo = (EDIT_MAP_INFO *) EtcDataBuffer.Alloc(0x2C27);
    EdInInfo = EtcDataBuffer.Alloc(0x44D);
    if (interior_test == 0) {
        LoadEditMapData(EditMapInfo, map_path, MapNo);
    } else {
        LoadEditMapData(EditMapInfo, "gedit/interior/mapinfo.cfg", MapNo);
        LoadFile("gedit/interior/interior.cfg", read_buffer, &size);
        int c;
        int column;
        int row;
        int count;
        int read;
        u8 *data;

        data = (u8 *) read_buffer;
        read = 0;
        count = size;
        column = 0;
        row = 0;
        while (c = data[read++], (count < read) ? 0 : 1) {
            if (c >= 'a' && c < '{') {
                interior_name[row][column] = c;
                column++;
                continue;
            }
            if (c >= '0' && c < ':') {
                interior_name[row][column] = c;
                column++;
                continue;
            }
            if (c == '/' || c == '_') {
                interior_name[row][column] = c;
                column++;
                continue;
            }
            if (column > 1) {
                interior_name[row][column] = '\0';
                column = 0;
                row++;
            }
            if (row >= 63)
                break;
        }
        interior_name[row][0] = '\0';
    }
    SndSetReadBuffer(read_buffer);
    if (StartEventNo < 0) {
        int bgm = EditMapInfo->bgm_no;
        if (bgm >= 0) {
            if (old_main_mode == 5)
                SndBgmLoad(0);
            else
                SndBgmLoad(bgm);
            if (EditMapInfo->time_stop == 0)
                EdSetBgmVol(SaveData->GetNowTime());
            else
                SndBgmPlay(0);
            SndStep();
        }
    }
    int sound_set = EditMapInfo->sound_set_no;
    if (sound_set < 0) {
        if (SndGetNowSetNo() < 0)
            SndSoundLoad(0);
    } else {
        SndSoundLoad(sound_set);
    }
    EdInitSoundSrc();
    EdEventInfo.unk_004 = 0;
    EdEventInfo.main_character = Chara;
    EdEventInfo.main_texture_animation = CharaTexAnimeData;
    EdEventInfo.main_texture_animation_count = 128;
    EdEventInfo.npcs = EdVillager;
    EdEventInfo.npc_count = 10;
    EdEventInfo.messages[0] = &EditMes1;
    EdEventInfo.villagers = EditMapInfo->villagers;
    CEditGround *ground = pEditGround;
    EdEventInfo.edit_ground = ground;
    EdEventInfo.fixed_parts_count = 64;
    EdEventInfo.fixed_parts = (CMapParts *) &ground->unk_15f30[0x10];
    EdEventInfo.edit_parts_count = 24;
    EdEventInfo.edit_parts = ObjParts;
    EdEventInfo.player_texture_block = 8;
    EdEventInfo.npc_texture_block = 54;
    EdEventInfo.messages[0] = &EditMes1;
    EdEventInfo.messages[1] = &EditEventMes1;
    EdEventInfo.messages[4] = &EditSystemMes;
    EdInitEventParam();
    EdEventData = NULL;
    simple_event = 0;
    LoadScript();
    now_fog = EditMapInfo->fog[0];
    MainCamera.SetFollow(0.0f, 0.0f, 0.0f);
    MainCamera.Step(10);
    MainCamera.SetSpeed(7.0f);
    EditCamera.SetFollow(0.0f, 0.0f, 0.0f);
    EditCamera.SetSpeed(8.0f);
    EditCamera.snap_range = 1.0f;
    EditCamera.Step(10);
    MainCamera.SetHeight(-10.0f);
    MainCamera.FollowOff();
    LoadTexture();
    if (interior_test == 0)
        LoadGroundData();
    EdSetDOF((DEPTH_OF_FIELD_INFO *) &EditMapInfo->dof_start_time);
    camera_dist_mode = 1;
    NowCamera = &MainCamera;
    EditMenuStatus[0] = -1;
    EditMenuStatus[1] = -1;
    DebugFont__3.texture = "font_buff";
    DebugFont__3.x = 16;
    DebugFont__3.y = 16;
    DebugFont__3.w = 280;
    DebugFont__3.h = 224;
    DebugFont__3.alpha = 64;
    EdDSetFont(&DebugFont__3);
    if (interior_test == 0) {
        if (old_main_mode != 7 || main_select_padrup != 0) {
            EditLoad();
        } else {
            GetEditDataDir(save_path);
            strcat(save_path, "gdata0.edt");
            int loaded = LoadFile2(save_path, read_buffer, NULL, 0);
            for (int i = 0; i < 22; i++) {
                EditPartsInfo.parts[i].unk_08 = 1;
                EDITPARTS_INFO *info = EditPartsInfo.GetPartsInfo(i);
                for (int j = 0; j < 6; j++)
                    info->elements[j].enabled = 1;
            }
            for (int i = 0; i < 36; i++)
                *(int *) (EditElementInfo + 4 + i * 8) = i % 15 + 1;
            short element_table[40] = {
                0, 3, 12, 0, 11, 4, 1, 0, 16, 2, 0, 5, 17, 6, 1, 10, 2, 2, 0, 15,
                1, 1, 1, 2, 1, 2, 12, 3, 14, 7, 8, 9, 1, 2, 1, 8, 13, 0, 0, -1,
            };
            short *elem = SaveData->GetElemData(0);
            if (loaded != 0)
                pEditGround->Load((char *) read_buffer);
            pEditGround->MakePartsBox();
            for (int i = 0; i < 128; i++) {
                *elem = -1;
                elem++;
            }
        }
        EditPartsObjectOnOff();
    }
    pEditGround->RemakeGrid();
    GameMode = 0;
    EdMoveCharaInit();
    end_counter = 0;
    door_open_cnt = 0;
    EdStepTimeFlag = 1;
    int free_start = (int) DataBuffer__2.base + (int) (DataBuffer__2.used * 16);
    int free_quads = DataBuffer__2.limit - DataBuffer__2.used;
    if (free_quads < 326000)
        printf("Allocation error!!\n");
    int align = free_start & 0x3F;
    if (free_start < 0 && align != 0)
        align -= 0x40;
    if (align != 0)
        free_start += ((0x40 - align) >> 4) * 16;
    EdNPCBuffer.base = (u_char *) free_start;
    EdNPCBuffer.limit = free_quads - 4;
    EdNPCBuffer.used = 0;
    EdVillagerBuffer.base = (u_char *) free_start;
    EdVillagerBuffer.limit = free_quads - 4;
    EdVillagerBuffer.used = 0;
    EdNPCReadBuffer = (u_int *) (EdNPCBuffer.base + EdNPCBuffer.used * 16 + (free_quads >> 1) * 16);
    int read_align = (int) EdNPCReadBuffer & 0x3F;
    if ((int) EdNPCReadBuffer < 0 && read_align != 0)
        read_align -= 0x40;
    if (read_align != 0)
        EdNPCReadBuffer += ((0x40 - read_align) >> 4) * 4;
    EdCreateVillagerTable(EditMapInfo);
    EdInitVillagerControl();
    EdInitVillagerTable(NowTime, EditMapInfo);
    EdLoadMainChara("chara/c01d.chr", "info.cfg", &CharaBuffer);
    sceVu0FVECTOR start_position = {0.0f, 0.0f, 0.0f, 1.0f};
    sceVu0FVECTOR start_rotation = {0.0f, 0.0f, 0.0f, 0.0f};
    GameMode = 1;
    EdGetFadeColor(fade);
    EdFadeIn(128, (float) (int) fade[0], (float) (int) fade[1], (float) (int) fade[2]);
    Chara->SetPosition(start_position);
    Chara->SetRotation(start_rotation);
    float yaw = start_rotation[1] - 3.141592f;
    if (yaw < 3.141592f)
        yaw -= 6.2831855f;
    MainCamera.SetAngleSoon(yaw);
    MainCamera.SetFollow(start_position[0], 14.0f + start_position[1], start_position[2]);
    MainCamera.Step(-1);
    EffectTable__3 = (CEffect *) EtcDataBuffer.Alloc(0x800);
    EdEffectGroup.Initialize(EffectTable__3, 128);
    EdEffectGroup.Clear();
    EdInitMesParam();
    EditMes1.tex_block = 26;
    EditEventMes1.tex_block = 26;
    EditMes1.unk_17B0 = MesWinTexBuff_01;
    EditEventMes1.unk_17B0 = MesWinTexBuff_02;
    short *buffer = (short *) (EdMesBuffer.base + EdMesBuffer.used * 16);
    GetEditDataDir(sys_path);
    GetEditDataDir(mes_path);
    strcat(mes_path, EditMapName);
    strcat(mes_path, "talk");
    GetLanguageName(language);
    strcat(mes_path, language);
    strcat(mes_path, ".mes");
    strcat(sys_path, "fconv.bin");
    if (LoadFile2(mes_path, buffer, &mes_size, 0) == 0 &&
        LoadFile2(sys_path, buffer, &mes_size, 0) == 0) {
        LoadFile("gedit/e01/fconv.bin", buffer, &mes_size);
    }
    EdMesBuffer.Alloc((mes_size >> 4) + 1);
    EditMes1.SetBuff(buffer);
    EdMesBuffer.Align64();
    short *system = (short *) (EdMesBuffer.base + EdMesBuffer.used * 16);
    LoadFile("gedit/system/editsys.bin", system, &mes_size);
    EdMesBuffer.Alloc((mes_size >> 4) + 1);
    EditSystemMes.unk_17B0 = MesWinTexBuff_01;
    EditSystemMes.tex_block = 26;
    EditSystemMes.SetBuff(system);
    static ClsMes name_mes;
    name_mes.fukidashi = 0;
    name_mes.stay_frame = 1;
    MonsterNameInit(&name_mes, system, MesWinTexBuff_11);
    EditNameMes.tex_block = 26;
    EditNameMes.unk_17B0 = MesWinTexBuff_11;
    EditNameMes.SetBuff(system);
    EdMesBuffer.Align64();
    short *window = (short *) (EdMesBuffer.base + EdMesBuffer.used * 16);
    char window_path[0x40] = "meswin/system14";
    int language_no = LanguageCode;
    if (language_no > 0)
        sprintf(window_path, "meswin/system14_%d", language_no);
    strcat(window_path, ".mes");
    if (LoadFile2(window_path, window, &mes_size, 0) == 0)
        LoadFile("meswin/system14e.bin", window, &mes_size);
    EdMesBuffer.Alloc((mes_size >> 4) + 1);
    EditMes1.SetBuff_system(window);
    EditEventMes1.SetBuff_system(window);
    EditNameMes.SetBuff_system(window);
    EditSystemMes.SetBuff_system(window);
    CommonMenuMes1.SetBuff_system(SystemMes);
    CommonMenuMes2.SetBuff_system(SystemMes);
    CommonMenuMes3.SetBuff_system(SystemMes);
    EdClearSystemMes();
    EdInitOpenItemBox(TreasureCursorOpen, TreasureCursor);
    exit_loop = 0;
    loop_counter = 0;
    key_counter = 0;
    sound_off_cnt = 1;
    clear_screen = 0;
    goto_dungeon = 0;
    key_lock = 0;
    goto_menu = 0;
    draw_npc_cursor = 0;
    edit_mode_draw = 0;
    edit_mode_grd_draw = 0;
    depth_of_field = 1;
    edit_mode_lighting = 0;
    draw_sky = 1;
    goto_cmp_event = 0;
    goto_cmp_event_level = -1;
    change_time_event = 0;
    start_event_no = -1;
    start_system_event = -1;
    move_count = 0;
    EdBeforeInBgmNo = -1;
    EdDrawOffFlag = 0;
    EdDrawOffMap = 0;
    EdDrawOffMapShadow = 0;
    EdThunderEffectFlag = 1;
    EdPauseFlag = 0;
    debug_menu_mode = 0;
    EdSaveFrameImageInit();
    EdInitMenu(-1);
    BtSetMapJumpFloor(-1);
    EBInitialize();
    EdInitThunderEffect();
    EdInitDrawDay();
    InitWorkBuffer();
    int event_no = StartEventNo;
    if (event_no < 0)
        RunEvent(128, NULL);
    else
        RunEvent(event_no, NULL);
    StartEventNo = -1;
    SaveData->GetDngStatus()->unk_04 = 0;
    static int debug_flag_set = 0;
    if (debug_flag_set == 0) {
        EdDebugCameraFlag = 0;
        EdDebugMoveFlag = 0;
    }
    debug_flag_set = 1;
    ItemVolumeStep.CheckItemVolume();
    return 0;
}
INCLUDE_RODATA("asm/nonmatchings/editloop", @827);
INCLUDE_RODATA("asm/nonmatchings/editloop", @828);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1609);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1610);


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

/**
 * Draws the editor's map cursor, and the plate that names the part under it.
 */
void ParamDraw() {
    sceVu0IVECTOR screen;
    if (EdDebugParamDrawOff != 0) {
        return;
    }
    TexManager.ReloadTexture(Vif1Packet, 20);
    VectorInterpolate(NowCursorPos, NowCursorPos, NextCursorPos, 4.0f, 1);
    NowCursorPos[3] = 1.0f;
    MGRotTransPers2D(screen, NowCursorPos, 0);
    CRect_i_ cursor(screen[0] - 10, screen[1] - 32, 32, 32);
    set2DSprite(Vif1Packet, TexManager.GetTexture("syst08", -1), cursor, 0, 0);
    screen[0] = 320;
    screen[1] = 224;
    if (NowFocusParts != NULL && DrawPartsNameCount == 0) {
        int names = PartsNameNum;
        if (names > 0) {
            int top;
            int step;
            int few = 6;
            int many = 9;
            step = 20;
            top = 0;
            if (LanguageCode > 0) {
                few = 12;
                many = 18;
                step = 10;
            }
            if (names < 7) {
                top += 48;
                step = step + ((step * (few - names)) >> 1);
            } else {
                step = step + ((step * (many - names)) >> 1);
            }
            setbilinear(0);
            CRect_i_ plate;
            CRect_i_ source;
            int plate_y = screen[1];
            int text_y = plate_y + 14;
            EditNameMes.line_pos[0].x = screen[0] + step;
            EditNameMes.line_pos[0].y = text_y;
            source.x = 0;
            source.y = top;
            source.width = 220;
            source.height = 48;
            plate.x = screen[0];
            plate.y = screen[1];
            plate.width = 220;
            plate.height = 48;
            set2DSprite(Vif1Packet, TexManager.GetTexture("pnplate", -1), plate, source, 0x60);
        }
    }
}
/**
 * Enables or disables the cursor drawn over the controlled character.
 */
void EdSetCharaCursor(int on) {
    draw_npc_cursor = on;
}
INCLUDE_RODATA("asm/nonmatchings/editloop", @2122);
/**
 * Draws the villager cursors, the attention marker and the event points.
 */
void EdDrawSysCursor(ED_EVENT_POINT *points, int count) {
    if (EdDebugParamDrawOff != 0)
        return;

    static float offset = 2.5f;
    offset -= 0.1f;
    if (offset < 0.0f)
        offset = 2.5f;
    SetMonsterNameDrawFlag(0);
    for (int i = 0; i < 10 && draw_npc_cursor != 0; i++) {
        int shown = EdVillager[i].initialized != 0 && EdVillager[i].draw_enabled != 0;
        if (shown) {
            sceVu0FVECTOR position;
            sceVu0CopyVector(position, EdVillager[i].chara.pos);
            position[1] += 2.0f + EdVillager[i].chara.body_height;
            if (EdInteriorFlag == 0 && EdVillager[i].CheckDraw() == 0 &&
                EdVillager[i].unk_1468 == 0) {
                if (MapNo != 3 || EdVillager[i].villager_id != 8) {
                    position[1] += offset;
                    CharaCursor1->SetPosition(position);
                    float yaw = 0.0f;
                    CharaCursor1->SetRotation(0.0f, yaw, 0.0f);
                    MGDraw(CharaCursor1);
                }
            } else if (EdVillager[i].CheckDraw() != 0 && EdVillager[i].unk_1468 != 0 &&
                       EdCheckViewMode() == 0) {
                CharaCursor0->SetPosition(position);
                MGDraw(CharaCursor0);
                position[3] = 1.0f;
                sceVu0IVECTOR screen;
                if (MGRotTransPers2D(screen, position, 0) != 0) {
                    MonsterNameMake(MapNo * 100 - 2000 + EdVillager[i].villager_id);
                    MonsterNamePosSet(screen[0], screen[1] - 70);
                    SetMonsterNameDrawFlag(1);
                }
            }
        }
    }
    if (EdEventInfo.draw_exclamation_mark != 0) {
        if (CharaCursor2 != NULL) {
            sceVu0FVECTOR position;
            Chara->GetPosition(position);
            static float a = 0.0f;
            position[1] += 3.0f + Chara->body_height + 0.5f * sinf(a);
            a += 0.1f;
            if (!(a <= 3.141592f))
                a -= 6.2831855f;
            CharaCursor2->SetPosition(position);
            CFrame *marker = CharaCursor2;
            marker->attr.unk_58 = 2;
            MGDraw(CharaCursor2);
        }
        EdEventInfo.draw_exclamation_mark = 0;
    }
    EdEventPointDraw(points, count, NowTime);
    EdDrawOpenItemBox();
}

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
/**
 * Draws the editor's clock, day display, event cursors, and pause overlay.
 */
void DrawSysGra() {
    if (EdDebugParamDrawOff == 0) {
        TexManager.ReloadTexture(Vif1Packet, 20);
        EdDrawSysCursor(EditMapInfo->work.events.points, 256);
        if (FishingDrawCheck() == 0) {
            EdDrawClock(0, 0);
        }
        DrawDay();

        char pause_texture[] = "pause";
        if ((unsigned int) (GameMode - 9) <= 1 || EdPauseFlag != 0) {
            CRect_i_ fade;
            fade.x = 0;
            fade.y = 0;
            fade.width = 0x2800;
            fade.height = 0xe00;
            MGFillBox(fade, 0, 0, 0, 0x40);
            setbilinear(0);

            CRect_i_ screen;
            CRect_i_ texel;
            texel.x = 0;
            texel.y = 0;
            texel.width = 0x80;
            texel.height = 0x28;
            screen.x = 0x100;
            screen.y = 0xcc;
            screen.width = 0x80;
            screen.height = 0x28;
            set2DSprite(GetVif1Packet(), TexManager.GetTexture(pause_texture, -1), screen, texel,
                        0x80);
        }
    }
}
/**
 * Draws the town-clock face and its hand at the current editor time.
 */
void EdDrawClock(int x, int y) {
    if (draw_clock != 0 && EditMapInfo->time_stop == 0) {
        TexManager.ReloadTexture(Vif1Packet, 20);
        setbilinear(0);

        CRect_i_ clock_screen;
        CRect_i_ clock_texel;
        clock_texel.x = 0;
        clock_texel.y = 0;
        clock_texel.width = 88;
        clock_texel.height = 80;
        clock_screen.x = x + 520;
        clock_screen.y = y + 14;
        clock_screen.width = 88;
        clock_screen.height = 80;
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("dayclock", -1), clock_screen,
                    clock_texel, 128);

        float scale = 2.0f * (NowTime / 12.0f);
        float pi = 3.141592f;
        float angle = pi * scale;
        angle = 0.5235987f + (pi - angle);
        CRect_i_ hand_screen;
        CRect_i_ hand_texel;
        hand_texel.x = 88;
        hand_texel.y = 0;
        hand_texel.width = 22;
        hand_texel.height = 40;
        hand_screen.x = x + 564;
        hand_screen.y = y + 54;
        hand_screen.width = 22;
        hand_screen.height = 40;
        set2DSpriteRot(GetVif1Packet(), TexManager.GetTexture("dayclock", -1), hand_screen,
                       hand_texel, 12, 40, angle, 128);
    }
}
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
/**
 * Synchronizes object visibility for every active editable map part.
 */
void EditPartsObjectOnOff() {
    int parts = EditPartsInfo.GetNextParts(-1);
    while (parts >= 0) {
        EdPartsObjectOnOff(&ObjParts[parts], EditPartsInfo.GetPartsInfo(parts), 0);
        parts = EditPartsInfo.GetNextParts(parts);
    }
    pEditGround->RequestCheck();
}
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
/**
 * Steps the player while a door plays its motion, holding them and the camera
 * at the place the door fixed.
 */
void OpenDoorMode() {
    Chara->SetVelocity(CVector3_f_(0.0f, 0.0f, 0.0f));
    Chara->Step();
    Chara->ShadowStep();
    Chara->ClothStep(0);
    if (door_open) {
        Chara->SetPosition(fix_chara_pos);
        Chara->SetRotation(fix_chara_rot[0], fix_chara_rot[1], fix_chara_rot[2]);
        MainCamera.SetPos(fix_camera_pos);
        MainCamera.SetRef(fix_chara_pos[0], 14.0f + fix_chara_pos[1], fix_chara_pos[2]);
    }
}
/**
 * Steps the villager the player is talking to, and leaves the mode when the
 * conversation asks for a menu or an event.
 */
void TalkMode() {
    int i;
    int event_no;
    if (talk_villager < 0 || talk_villager >= 10) {
        GameMode = 1;
        return;
    }
    CCharacter *chara = Chara;
    chara->motion_no = 0;
    chara->flags = 0;
    chara->motion_speed = -1.0f;
    Chara->SetVelocity(CVector3_f_(0.0f, 0.0f, 0.0f));
    Chara->Step();
    Chara->ShadowStep();
    Chara->ClothStep(0);
    for (i = 0; i < 10; i++) {
        EdVillager[i].unk_1488 = 128;
        EdVillager[i].near_camera = 0;
    }
    int result = EdTalkMode(Chara, &TalkCamera, 0, &event_no);
    if (result != 0) {
        if (result == 2) {
            goto_menu = 3;
        }
        if (result == 3) {
            goto_menu = 4;
        }
        if (result == 4 && event_no > 0) {
            RunEvent(event_no, NowCamera);
        }
        GameMode = 1;
        NowCamera = &MainCamera;
    } else {
        for (i = 0; i < 10; i++) {
            EdVillager[i].Step();
            EdVillager[i].chara.ClothStep(0);
        }
    }
}
/**
 * Steps a running editor event, and follows it into whatever it asks for: a
 * building, a dungeon, the menu, or the camera it wants to look through.
 */
void EventMode() {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR ref;

    int result = EdEventMode(&EventCamera, 0);
    if (result == 0) {
        return;
    }
    switch (result) {
    case 4:
        GotoInterior(EdEventInfo.unk_2b0, EdEventInfo.unk_2ac, 0, NULL, EdEventInfo.unk_2d0);
        break;
    case 5:
        GotoDungeon();
        break;
    case 6:
        break;
    case 8:
        EdExitLoop();
        break;
    case 10:
        EdExitLoop();
        break;
    case 9:
        GameMode = 2;
        break;
    case 11:
        GameMode = 16;
        break;
    default:
        GameMode = 1;
        if (EdEventInfo.reset_camera_angle > 0) {
            Chara->GetPosition(pos);
            Chara->GetRotation(ref);
            MainCamera.FollowOn();
            MainCamera.SetAngleSoon(AngleLimit(ref[1] + EdEventInfo.reset_camera_yaw));
            MainCamera.SetFollow(pos[0], pos[1] + Chara->body_height - 3.0f, pos[2]);
            EdInitCameraParam(&MainCamera);
            MainCamera.Step(-1);
        }
        if (EdEventInfo.reset_camera_angle < 0) {
            EventCamera.GetPos(pos);
            EventCamera.GetRef(ref);
            MainCamera.FollowOff();
            MainCamera.SetPos(pos);
            MainCamera.SetRef(ref);
            MainCamera.Step(-1);
            MainCamera.Step(1);
            MainCamera.FollowOn();
            MainCamera.SetHeight(pos[1] - ref[1]);
            MainCamera.SetFollow(ref[0], ref[1], ref[2]);
            MainCamera.SetAngleSoon(atan2(pos[0] - ref[0], pos[2] - ref[2]));
            MainCamera.Step(-1);
            MainCamera.Step(1);
        }
        if (EdEventInfo.fadeout_event_no >= 0) {
            FadeOutToEvent(EdEventInfo.fadeout_event_no, 0);
        }
        CEditGround *ground = pEditGround;
        ground->clip_plane[3] = -1.0f;
        break;
    }
}

INCLUDE_RODATA("asm/nonmatchings/editloop", @2362);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2363);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2364);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2389);
INCLUDE_RODATA("asm/nonmatchings/editloop", @2390);
/**
 * Requests a transition from the editor into a dungeon.
 */
int GotoDungeon() {
    return goto_dungeon = 1;
}
/**
 * Clears the parts, elements and plots of the robot's workshop map, so that
 * the story can build it again.
 */
void EdDeleteE05RoboParts() {
    int count;
    for (int i = 0; i < 14; i++) {
        SV_EDIT_PARTS_INFO *plot = SaveData->GetEditPartsInfo(4, i);
        if (plot != NULL) {
            plot->flag = 0;
            plot->unk_6 = 0;
            plot->progress = 0;
        }
    }
    s16 *elements = SaveData->GetElemData(4);
    if (elements != NULL) {
        for (int i = 0; i < 128; i++) {
            *elements = -1;
            elements++;
        }
    }
    SV_GRD_PART *parts = SaveData->GetParts(4, &count);
    for (int i = 0; i < count; i++, parts++) {
        parts->part_id = -1;
    }
}
#ifdef NON_MATCHING
/**
 * Loads the interior a door leads to and places the player and camera in it.
 */
int GotoInterior(char *name, int entrance, int direction, ED_EVENT_PARAM *param, int kind) {
    char *suffix[5] = {"m", "e", "n", "m", ""};
    char path[0x40];
    ED_EVENT_PARAM entry;
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;

    int period = EdGetTime(NowTime);
    strcpy(EdInteriorName, name);
    sprintf(path, "%sin/%s/%s%s", EditDataDir, name, name, suffix[period]);
    sprintf(interior_map_name, "%s", path);
    EdInteriorPartsNo = entrance;
    EdNPCBuffer.used = 0;
    if (param == NULL)
        direction = 0;
    EdInteriorJumpID = 0;
    if (param != NULL)
        EdInteriorJumpID = param->point->map_no;
    door_open = direction;
    door_open_cnt = 160;
    GameMode = 11;
    EdInteriorDoorSound = -1;
    if (direction != 0) {
        fix_pos_enble = 1;
        EdInteriorDoorSound = param->point->linked_value;
        Chara->SetMotion(EdGetDoorMotion(param->point->linked_value, direction > 0), 6);
        sceVu0CopyVector(fix_chara_pos, param->position);
        sceVu0CopyVector(fix_chara_rot, param->rotation);
        Chara->SetPosition(fix_chara_pos);
        Chara->SetRotation(fix_chara_rot[0], fix_chara_rot[1], fix_chara_rot[2]);
        Chara->ClothStep(-1);
        sceVu0CopyVector(fix_camera_pos, param->camera_pos);
        MainCamera.SetPos(fix_camera_pos);
        MainCamera.SetRef(fix_chara_pos[0], 14.0f + fix_chara_pos[1], fix_chara_pos[2]);
        MainCamera.FollowOff();
        MainCamera.Step(10);
        MainCamera.Step(-1);
    } else {
        fix_pos_enble = 0;
        sound_off_cnt = 160;
        if (EdSearchEvent(&entry, name, 0, NowTime) != 0) {
            sceVu0CopyVector(fix_chara_pos, entry.position);
            sceVu0CopyVector(fix_chara_rot, entry.rotation);
            Chara->SetPosition(fix_chara_pos);
            Chara->SetRotation(fix_chara_rot[0], fix_chara_rot[1], fix_chara_rot[2]);
            sceVu0CopyVector(fix_camera_pos, entry.camera_pos);
            MainCamera.SetPos(fix_camera_pos);
            MainCamera.SetRef(fix_chara_pos[0], 14.0f + fix_chara_pos[1], fix_chara_pos[2]);
        } else {
            Chara->GetPosition(position);
            Chara->GetRotation(rotation);
            sceVu0CopyVector(fix_chara_pos, position);
            sceVu0CopyVector(fix_chara_rot, rotation);
            MainCamera.GetPos(position);
            MainCamera.GetRef(rotation);
            sceVu0CopyVector(fix_camera_pos, position);
            MainCamera.SetRef(fix_chara_pos[0], 14.0f + fix_chara_pos[1], fix_chara_pos[2]);
        }
    }
    EdFadeOut(100, 0.0f, 0.0f, 0.0f);
    for (int i = 0; i < 10; i++)
        EdVillager[i].near_camera = 0;
    EdInteriorStartEvent = kind;
    if (kind < 0)
        EdInteriorStartEvent = 128;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop", GotoInterior__FPciiP14ED_EVENT_PARAMi);
#endif

/**
 * Applies right-stick and digital-pad input to an editor follow camera.
 */
void MoveCamera(CCameraFollow *camera) {
    float horizontal = GamePad.GetRXf();
    camera->AddHeight(-GamePad.GetRYf());
    if (EdDebugCameraFlag == 0 && !(camera->GetHeight() <= 30.0f)) {
        camera->SetHeight(30.0f);
    }
    camera->AddAngle(0.03f * -horizontal);
    if (horizontal == 0.0f) {
        if (GamePad.On(8) != 0) {
            camera->AddAngle(-0.017453292f);
        }
        if (GamePad.On(4) != 0) {
            camera->AddAngle(0.017453292f);
        }
    }
}
/**
 * Selects collision polygons around the centre of an axis-aligned box.
 */
int GetCollision(CCPoly *poly, CBoxVu0 *box) {
    sceVu0FVECTOR centre;
    sceVu0AddVector(centre, box->max, box->min);
    sceVu0ScaleVector(centre, centre, 0.5f);
    return pEditGround->PickUpPoly(poly, centre[0], centre[1], centre[2]);
}
/**
 * Steps the player: walking, the events they stand in, and the doors they open.
 */
void MoveChara() {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR part_rot;
    sceVu0FVECTOR part_pos;
    sceVu0FMATRIX world;
    sceVu0FMATRIX inverse;
    sceVu0FVECTOR run_pos;
    sceVu0FVECTOR splash_pos;

    EdMoveCharaInfo.time = NowTime;
    EdMoveCharaInfo.camera = &MainCamera;
    ViewCamera.FollowOff();
    EdMoveCharaInfo.follow = &ViewCamera;
    EdMoveCharaInfo.key_lock = key_lock;
    EdMoveCharaInfo.chara = Chara;
    EdMoveCharaInfo.unk_18 = 0;
    EdMoveCharaInfo.ground = pEditGround;
    EDIT_MAP_INFO *info = EditMapInfo;
    EdMoveCharaInfo.points = info->work.events.points;
    EdMoveCharaInfo.point_count = info->event_count;
    EdMoveCharaInfo.in_event = (GameMode == 16);
    EdMoveChara();
    if (EdMoveCharaInfo.system_event_no > 0) {
        RunSystemEvent(EdMoveCharaInfo.system_event_no, &MainCamera);
    } else if (EdMoveCharaInfo.event_no > 0) {
        RunEvent(EdMoveCharaInfo.event_no, &MainCamera);
    } else if (EdMoveCharaInfo.event_ready != 0) {
        ED_EVENT_PARAM *param = &EdMoveCharaInfo.param;
        if (param->kind == 1) {
            if (strcmp(param->point->destination, "dungeon") == 0) {
                RunEvent(130, &MainCamera);
            } else if (EdPadDown(0x40, 1) != 0 && EdCheckViewMode() == 0 && key_lock == 0) {
                ED_EVENT_POINT *point = param->point;
                if (point->minimum_progress > 0) {
                    RunEvent(EdInitGotoInterior(&EdEventInfo, param), NowCamera);
                } else {
                    GotoInterior(point->destination, param->entrance, point->side, param, -1);
                }
            }
        }
    } else {
        if (loop_counter > 60) {
            Chara->GetPosition(pos);
            CMapParts *parts = pEditGround->GetParts(pos[0], pos[1], pos[2]);
            if (parts != NULL) {
                int plot = parts->parts_no;
                EDITPARTS_INFO *plot_info = EditPartsInfo.GetPartsInfo(plot);
                if (plot_info != NULL && plot_info->kind == 2 && !(plot_info->completion_flags & 1) &&
                    EditPartsInfo.CheckComplete(plot) != 0) {
                    FadeOutToEvent(plot + 200, 0);
                }
            }
        }
        if (GamePad.Down(0x40) != 0) {
            Chara->GetPosition(pos);
            CMapParts *parts = pEditGround->GetParts(pos[0], pos[1], pos[2]);
            if (parts != NULL) {
                parts->GetPosition(part_pos);
                parts->GetRotation(part_rot);
                sceVu0UnitMatrix(world);
                sceVu0RotMatrixY(world, world, part_rot[1]);
                sceVu0CopyVector(world[3], part_pos);
                world[3][3] = 1.0f;
                sceVu0InversMatrix(inverse, world);
                pos[3] = 1.0f;
                sceVu0ApplyMatrix(pos, inverse, pos);
                Chara->GetRotation(pos);
                pos[1] = pos[1] - part_rot[1];
                if (!(pos[1] <= 3.141592025756836f)) {
                    pos[1] -= 6.283184051513672f;
                }
                if (pos[1] < -3.141592025756836f) {
                    pos[1] += 6.283184051513672f;
                }
            } else {
                Chara->GetRotation(pos);
            }
        }
    }
    if (CheckMotionTime(EdMoveCharaInfo.motion_current, EdMoveCharaInfo.motion_previous, 74.0f) != 0) {
        Chara->GetPosition(run_pos);
        RunEffect.Set(run_pos);
    }
    if (CheckMotionTime(EdMoveCharaInfo.motion_current, EdMoveCharaInfo.motion_previous, 84.0f) != 0) {
        Chara->GetPosition(splash_pos);
        RunEffect.Set(splash_pos);
    }
    if (GameMode == 1) {
        if (MapNo < 10) {
            EdMoveVillager(&EdVillagerInfo);
        } else {
            EdMoveVillagerSubMap(&EdVillagerInfo);
        }
    }
}
/**
 * Drops the player and every drawn villager onto the ground under them, and
 * takes the surface's foot sound and lighting from the polygon they stand on.
 */
void VillagerCollision() {
    sceVu0FVECTOR pos;
    CBoxVu0 box;
    sceVu0FVECTOR ground;
    CCPoly poly;

    for (int i = -1; i < 10; i++) {
        int move;
        CCharacter *chara;
        CNPCharacter *villager = NULL;
        int sound;
        if (i >= 0) {
            villager = &EdVillager[i];
            move = EdEventInfo.npc_collision[i];
            if (villager->CheckDraw() == 0) {
                continue;
            }
            villager->chara.GetPosition(pos);
            sound = EdEventInfo.npc_foot_sound[i];
        } else {
            move = EdEventInfo.player_collision;
            Chara->GetPosition(pos);
            sound = EdEventInfo.player_foot_sound;
        }
        WorkBuffer__2->used = 0;
        CCPoly *polys = (CCPoly *) WorkBuffer__2->Alloc(2000);
        box.max[0] = 1.0f + pos[0];
        box.min[0] = pos[0] - 1.0f;
        box.max[2] = 1.0f + pos[2];
        box.min[2] = pos[2] - 1.0f;
        float height = pos[1];
        float top = 1000.0f + height;
        box.max[1] = 10.0f + top;
        box.min[1] = 10.0f + (height - 1000.0f);
        if (i >= 0) {
            chara = &villager->chara;
        } else {
            chara = Chara;
        }
        if (sound == 1) {
            chara->FootSoundEnable(0);
        }
        int count = GetCollision(polys, &box);
        if (count > 200) {
            printf("cpoly over!!!! %d\n", count);
        }
        if (count > 0) {
            pos[1] += 20.0f;
            if (GetFootPoly(pos, 1000.0f, &poly, ground, polys, count, 0) != 0) {
                sceVu0CopyVector(pos, ground);
                chara->FootSoundEnable(sound);
                if (sound == 1) {
                    chara->SetFootSoundID(poly.attr.foot_sound);
                }
                sceVu0CopyVector(chara->unk_CB0[0], EditMapInfo->character_ambient[0]);
                sceVu0CopyVector(chara->unk_CB0[1], EditMapInfo->character_ambient[1]);
                chara->unk_CA0 = -1;
                chara->unk_C9C = 0;
                switch (poly.attr.unk_44) {
                case 2:
                    chara->unk_C9C = 1;
                    break;
                case 3:
                case 4:
                    chara->unk_CA0 = poly.attr.unk_44 - 3;
                    break;
                }
            } else {
                pos[1] = 0.0f;
            }
        } else {
            pos[1] = 0.0f;
        }
        if (move != 0) {
            if (i >= 0) {
                villager->chara.SetPosition(pos);
            } else {
                Chara->SetPosition(pos);
            }
        }
    }
}
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
 * Says whether the ground under the editor's cursor can be walked on, and
 * gives back the place on it the player would stand.
 */
int CheckEditToWalk(float *position) {
    sceVu0FVECTOR pos;
    CBoxVu0 box;
    sceVu0FVECTOR hit;
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;

    sceVu0CopyVector(pos, ECursorFrame->position);
    pos[3] = 1.0f;
    WorkBuffer__2->used = 0;
    CCPoly *polys = (CCPoly *) WorkBuffer__2->Alloc(1024);
    box.max[0] = 100.0f + pos[0];
    box.min[0] = pos[0] - 100.0f;
    float z = pos[2];
    box.max[2] = 100.0f + z;
    box.min[2] = z - 100.0f;
    box.max[1] = 20000.0f;
    box.min[1] = -20000.0f;
    pos[1] += 500.0f;
    int count = pEditGround->PickUpPoly(polys, box, 0);
    int walkable = 1;
    for (int i = 0; i < 4; i++) {
        sceVu0CopyVector(from, pos);
        if (i == 1) {
            from[0] += 0.10000000149011612f;
        }
        if (i == 1) {
            from[2] += 0.597599983215332f;
        }
        if (i == 2) {
            from[0] -= 0.5809999704360962f;
        }
        if (i == 2) {
            from[2] -= 0.29760000109672546f;
        }
        if (i == 3) {
            from[0] += 0.35100001096725464f;
        }
        if (i == 3) {
            from[2] -= 2.6775999069213867f;
        }
        sceVu0CopyVector(to, from);
        to[1] -= 1000.0f;
        if (CheckHit(polys, count, from, to, hit, 1, 0) >= 0) {
            if (EdDebugMoveFlag <= 0) {
                float alt = pEditGround->GetAlt(from[0], from[1], from[2]);
                int area = pEditGround->GetAreaCode(from[0], from[1], from[2]);
                float drop;
                drop = hit[1] - alt;
                drop = drop < 0.0f ? -drop : drop;
                if (drop < 0.10000000149011612f && area >= 0) {
                    pos[1] = 1.0f + hit[1];
                } else {
                    walkable = 0;
                }
                CMapParts *parts = pEditGround->GetParts(pos[0], pos[1], pos[2]);
                if (parts != NULL && parts->unk_118 == 1) {
                    pos[1] = 1.0f + hit[1];
                    walkable = 1;
                }
            } else {
                pos[1] = 1.0f + hit[1];
                walkable = 1;
            }
        } else {
            walkable = 0;
        }
    }
    sceVu0CopyVector(position, pos);
    return walkable;
}
INCLUDE_ASM("asm/nonmatchings/editloop", MoveEditCursor__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadTexture__Fv);
/**
 * Loads the player's model and motions into the arena the caller names, or
 * into the character arena when it names none.
 */
void EdLoadMainChara(char *pack, char *name, CDataAlloc2<1> *arena) {
    int i;
    if (arena == NULL) {
        arena = &CharaBuffer;
        CharaBuffer.used = 0;
    }
    LoadFile(pack, read_buffer, NULL);
    MainChara.Initialize();
    for (i = 0; i < 128; i++) {
        CharaTexAnimeData[i].Initialize();
    }
    MainChara.InitializeTexAnime(CharaTexAnimeData, 128);
    MainChara.LoadPackData2(read_buffer, name, arena, 8, arena, 0);
    CFrameAttr attr;
    attr.unk_08 = 0;
    attr.fog_enable = 1;
    MainChara.frame->SetAttr(attr, 1, 4);
    float origin = 0.0f;
    MainChara.SetPosition(origin, origin, origin);
    Chara = &MainChara;
}
INCLUDE_ASM("asm/nonmatchings/editloop", LoadGroundData__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadObjectParts__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop", LoadPTS__FP9CMapPartsPUiP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINTP9CMapParts);
/**
 * Builds one map part that has no part-definition file: its models are loaded
 * straight from the names the script gave, and its bound comes from them.
 */
void LoadPTS(CMapParts *parts, MAP_PARTS_INFO *info, OBJ_ANIME_SEQ *anime,
             EDIT_EFFECT_INFO *effects, EDIT_OBJECT_TIMER *timers, ED_EVENT_POINT *points) {
    char *names[9];
    CFrameVu1 *frames[4];
    CBoxVu0 bound;
    CBoxVu0 part_bound;
    if (info == NULL || info->name[0][0] == '\0') {
        return;
    }
    for (int i = 0; i < 9; i++) {
        names[i] = info->name[i];
    }
    LoadMapObject(parts, names);
    for (int i = 0; i < 4; i++) {
        CFrameVu1 *frame = parts->frame[i];
        frames[i] = frame;
    }
    if (frames[0] != NULL) {
        frames[0]->GetBoundBox(&bound, 1);
        CFrame *collision = parts->GetCollisionFrame();
        if (collision != NULL) {
            collision->GetBoundBox(&part_bound, 1);
            VectorMaxMin(bound.max, bound.min, bound.max, bound.min,
                         part_bound.max, part_bound.min);
        }
        CFrame *shadow = parts->unk_0DC;
        if (shadow == NULL) {
            shadow = NULL;
        } else {
            shadow->SetPosition(parts->pos[0], parts->pos[1], parts->pos[2]);
            parts->unk_0DC->SetRotation(parts->rotation.x, parts->rotation.y, parts->rotation.z);
            shadow = parts->unk_0DC;
        }
        if (shadow != NULL) {
            shadow->GetBoundBox(&part_bound, 1);
            VectorMaxMin(bound.max, bound.min, bound.max, bound.min,
                         part_bound.max, part_bound.min);
        }
        parts->bound = bound;
    }
}
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
/**
 * Gives one map part its own copy of every frame another one draws with.
 */
void CopyCMapParts(CMapParts *to, CMapParts *from, CDataAlloc2<1> *arena) {
    for (int i = 0; i < 4; i++) {
        to->SetFrame(CopyFrameVu1(from->frame[i], arena), i);
    }
    to->collision_frame = CopyFrame(from->GetCollisionFrame(), arena);
    to->shadow_frame = (CFrame *) CopyFrameVu1((CFrameVu1 *) from->shadow_frame, arena);
    to->shade_frame = (CFrame *) CopyFrameVu1((CFrameVu1 *) from->shade_frame, arena);
    CFrame *shadow = from->unk_0DC;
    if (shadow == NULL) {
        shadow = NULL;
    } else {
        shadow->SetPosition(from->pos[0], from->pos[1], from->pos[2]);
        from->unk_0DC->SetRotation(from->rotation.x, from->rotation.y, from->rotation.z);
        shadow = from->unk_0DC;
    }
    to->unk_0DC = CopyFrame(shadow, arena);
    to->unk_104 = (CFrame *) CopyFrameVu1((CFrameVu1 *) from->unk_104, arena);
}
/**
 * Derives an object's world position and normalized yaw from its first frame.
 */
int GetPosRot(CMapObject *object, float *position, float *rotation) {
    if (object == NULL) {
        return 0;
    }
    CFrame *frame = object->frame[0];
    if (frame == NULL) {
        return 0;
    }

    sceVu0FVECTOR local_position;
    sceVu0CopyVector(local_position, object->pos);
    frame->SetPosition(local_position);
    position[3] = 1.0f;
    frame->GetWorldPosition(position, position);
    sceVu0FVECTOR frame_rotation;
    frame->GetRotation(frame_rotation);
    rotation[0] = 0.0f;
    rotation[1] = frame_rotation[1] + rotation[1];
    rotation[2] = 0.0f;
    if (!(rotation[1] <= 3.141592f)) {
        rotation[1] -= 6.283184f;
    }
    if (rotation[1] < -3.141592f) {
        rotation[1] += 6.283184f;
    }
    return 1;
}
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
/**
 * Says whether one event point is ready to fire at the given time of day.
 */
int CheckEventPoint(ED_EVENT_POINT *point, float time) {
    if (point == NULL) return 0;
    if (point->enabled == 0) return 0;
    if (point->event_type <= 0) return 0;
    int flag = point->completion_flag;
    if (flag > 0 && EdGetMapFlag(flag) != 0) return 0;
    CFrame *frame = point->frame;
    if (frame != NULL && !(frame->attr.draw_on & 1)) return 0;
    if (EdCheckTime(time, point->start_time, point->end_time) == 0) return 0;
    if (point->event_type == 2) {
        int dungeon = MapNo;
        if (dungeon == 11) dungeon = 1;
        if (dungeon == 13) dungeon = 1;
        if (dungeon == 33) dungeon = 1;
        if (dungeon == 19) dungeon = 2;
        if (dungeon == 42) dungeon = 3;
        if (dungeon == 23) dungeon = 4;
        if (dungeon == 38) dungeon = 5;
        if (dungeon == 40) dungeon = 5;
        if (dungeon < 5) {
            CDngStatusData *status = SaveData->GetDngStatus();
            int reached = status->floor_reached[dungeon] + 1;
            int wanted = point->minimum_progress;
            if (wanted > 0 && reached < wanted) return 0;
        }
    }
    return 1;
}
