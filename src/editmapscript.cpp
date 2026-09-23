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
#include "camerafollow.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "collision.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "debugfont.hpp"
#include "dngstatusdata.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "editarea.hpp"
#include "editground.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "editmapscript.hpp"
#include "editpartsinfo.hpp"
#include "effect.hpp"
#include "effectgroup.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "menu_misc.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "npcharacter.hpp"
#include "objanime.hpp"
#include "objectframe.hpp"
#include "rect.hpp"
#include "runeffect.hpp"
#include "savedata.hpp"
#include "scriptinterpreter.hpp"
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

/** Scene archive the map's models are read out of. */
extern u_int *scn_data;

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

/** One default villager entry stored for each map and list position. */
struct EDIT_CHARA_DATA_ENTRY {
    char *name;       /**< Villager resource name. */
    s16 character_no; /**< Character definition selected for the villager. */
    s16 model_no;     /**< Model variant selected for the villager. */
    u8 unk_08[8];
    s16 hide_when_complete; /**< Whether completed town progress hides the villager. */
    u8 unk_12[2];
};

STATIC_ASSERT(sizeof(EDIT_CHARA_DATA_ENTRY) == 0x14);

extern EDIT_CHARA_DATA_ENTRY EditCharaData[5][16];
extern u8 EditElementInfo[0x120];
#include "editmenu.hpp"
extern u8 MesWinTexBuff_01[0x100];
extern u8 MesWinTexBuff_02[0x100];
extern CFrameVu1 *SkyFrame[4];
extern CFrame *SunFrame[4];
extern C3DSprite SystemEffect[8];
extern float def_light[12][4];

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
u_int *SearchPTS(u_int *archive, char *name);
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

typedef void (*EDIT_SCRIPT_COMMAND)(void **arguments);

extern "C" TAG_PARAM Command__5[61];
extern "C" EDIT_SCRIPT_COMMAND CommandExe__5[61];
extern "C" SPI_FUNC_PARAM func_table;
extern int binary;
extern int fobject_list;
extern int partseffect_list;
extern int objeffect_list;
extern int objtimer_list;

INCLUDE_RODATA("asm/nonmatchings/editmapscript", @478);
INCLUDE_RODATA("asm/nonmatchings/editmapscript", @482__2);

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

    edit_info->work.object_timers.timers[0].name[0] = 0;
    for (int i = 0; i < 128; i++) {
        edit_info->work.object_timers.timers[i].name[0] = 0;
    }

    edit_info->work.events.points[0].event_type = 0;
    for (int i = 0; i < 256; i++) {
        edit_info->work.events.points[i].event_type = 0;
    }
}

/**
 * Reads one editor map's description through the script interpreter.
 *
 * @mangled LoadEditMapData__FP13EDIT_MAP_INFOPci
 * @address 0x174390
 * @size 0x74C
 */
#ifdef NON_MATCHING
int LoadEditMapData(EDIT_MAP_INFO *info, char *name, int map_no) {
    edit_info = info;

    char *extension = name;
    while (*extension != '\0') {
        if (*extension++ == '.') {
            break;
        }
    }

    int file_size;
    if (LoadFile2(name, read_buffer, &file_size, 0) == 0) {
        extension[2] = 'g';
        LoadFile(name, read_buffer, &file_size);
    }

    u8 *script = (u8 *) read_buffer;
    light_no = 0;
    CurrentDir__3[0] = '\0';
    binary = 0;
    InitInfo();
    texture_list = 0;
    fobject_list = 0;
    mapobj_list = 0;
    objanime_list = 1;
    partseffect_list = 1;
    objeffect_list = 1;
    objtimer_list = 1;
    event_list = 1;
    water_list = 0;
    people_list = 0;
    objframe = NULL;
    mapobj = NULL;
    now_villinfo = NULL;
    now_parts_no = -1;
    mapjump_id = 0;
    mapjump_name[0] = '\0';
    week_no = 0;
    water_info = NULL;
    edit_rect_list = 0;
    motion_parts_list = 0;

    strcpy(edit_info->scene_name, "scene.scn");
    edit_info->sky_follow[0] = 1;
    edit_info->sky_follow[1] = 0;
    edit_info->sky_follow[2] = 1;
    edit_info->shadow_near = 320.0f;
    edit_info->shadow_far = 740.0f;
    edit_info->shadow_level = 2;
    edit_info->shadow_mode = 0x34;
    edit_info->shadow_mode_2 = 0x20;
    edit_info->bgm_no = -1;
    edit_info->sound_set_no = -1;
    edit_info->reverb_mode[0] = 2;
    edit_info->reverb_mode[1] = 4;
    edit_info->reverb_depth[0] = 5;
    edit_info->reverb_depth[1] = 0x1E;
    edit_info->ambient_sound_off = 0;
    edit_info->wind[0] = 0.3f;
    edit_info->wind[1] = 0.0f;
    edit_info->wind[2] = 0.1f;
    edit_info->wind[3] = 0.4f;
    for (int i = 0; i < 16; i++) {
        edit_info->people_list[i] = -1;
    }

    if (strcmp(extension, "cfb") == 0) {
        binary = 1;
        u8 *cursor = script;
        u8 *end = script + file_size;
        while (cursor < end) {
            int command = *(int *) cursor;
            cursor += sizeof(int);
            if (command < 0) {
                break;
            }

            void *arguments[32];
            int argument_count = 0;
            for (;;) {
                int type = *(int *) cursor;
                cursor += sizeof(int);
                if (type < 0) {
                    break;
                }
                arguments[argument_count++] = cursor;
                if (type == 0) {
                    cursor += (strlen((char *) cursor) + 4) & ~3;
                } else {
                    cursor += sizeof(int);
                }
            }
            CommandExe__5[command](arguments);
        }
    } else {
        int command_cache[16000];
        int *cache = command_cache;
        CScriptInterpreter interpreter;
        interpreter.SetScript((char *) script, file_size);
        interpreter.SetTAG(Command__5, 61);
        interpreter.SetFunction(&func_table, 1);

        int command;
        while ((command = interpreter.GetNextTAG()) >= 0) {
            CommandExe__5[command](interpreter.arguments);
            *cache++ = command;

            int argument = 0;
            for (int *type = Command__5[command].argument_types; *type >= 0; type++, argument++) {
                *cache++ = *type;
                if (*type == 0) {
                    int bytes = (strlen((char *) interpreter.arguments[argument]) + 4) & ~3;
                    memset(cache, 0, bytes);
                    strcpy((char *) cache, (char *) interpreter.arguments[argument]);
                    cache += bytes / 4;
                } else {
                    *cache++ = *(int *) interpreter.arguments[argument];
                }
            }
            *cache++ = -1;
        }
        *cache = -1;
    }

    edit_info->images[texture_list].name[0] = '\0';
    edit_info->images[texture_list].type = -1;
    for (int i = 0; i < 4; i++) {
        edit_info->map_objects[mapobj_list].name[i][0] = '\0';
    }
    edit_info->obj_anime_count = objanime_list;
    edit_info->object_effect_count = objeffect_list;
    edit_info->parts_effect_count = partseffect_list;
    edit_info->object_timer_count = objtimer_list;
    edit_info->event_count = event_list;

    if (map_no >= 0 && map_no < 5) {
        for (int i = 0; i < 16; i++) {
            VILLAGER_INFO *villager = &edit_info->villagers[i];
            EDIT_CHARA_DATA_ENTRY *defaults = &EditCharaData[map_no][i];
            strcpy(villager->name, defaults->name);
            villager->index = i;
            villager->character_no = defaults->character_no;
            villager->model_no = defaults->model_no;
            villager->hide_when_complete = defaults->hide_when_complete;
        }
    }

    if (edit_info->time_stop == 0) {
        for (int i = 0; i < 12; i++) {
            edit_info->light_direction[i][0][0] = def_light[i][0];
            edit_info->light_direction[i][1][0] = def_light[i][1];
            edit_info->light_direction[i][2][0] = def_light[i][2];
        }
    }
    if (edit_info->sound_set_no < 0) {
        edit_info->ambient_sound_off = 1;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmapscript", LoadEditMapData__FP13EDIT_MAP_INFOPci);
#endif
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
        surface->follow_x = *(int *) arguments[19];
        surface->follow_y = *(int *) arguments[20];
        surface->follow_z = *(int *) arguments[21];
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
    if (index < 0 || index >= 24)
        return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 6)
        return;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.roads.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 24)
        return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 16)
        return;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.rivers.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 24)
        return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 24)
        return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
        sprintf(parts->name[7], "%s%s", CurrentDir__3, (char *) arguments[4]);
    } else
        parts->name[0][0] = '\0';
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
    if (index < 0 || index >= 24)
        return;
    now_parts_no = index;
    MAP_PARTS_INFO *parts = &edit_info->parts_work.general.parts[index];
    char *source_name = (char *) arguments[1];
    if (*source_name != '\0') {
        char name[0x80];
        sprintf(name, "%s%s", CurrentDir__3, source_name);
        GenMdsName(parts, name);
        sprintf(parts->name[7], "%s%s", CurrentDir__3, (char *) arguments[4]);
    } else
        parts->name[0][0] = '\0';
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
        "SPACE", "ECHO", "DELAY", "PIPE", "MAX", ""};

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
