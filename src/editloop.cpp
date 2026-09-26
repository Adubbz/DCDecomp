#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 414
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
#include "editmapscript.hpp"
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
extern u8 EditCharaData[0x960];
extern u8 EditElementInfo[0x120];
#include "editmenu.hpp"
#include "wind.hpp"
#include "memcard.hpp"
#include "fishing.hpp"
#include "effectmacro.hpp"
#include "nowload.hpp"
#include "menu_draw.hpp"
extern u8 MesWinTexBuff_01[0x100];
extern u8 MesWinTexBuff_02[0x100];
extern CFrameVu1 *SkyFrame[4];
extern CFrame *SunFrame[4];
extern C3DSprite SystemEffect[8];
extern u8 def_light[0xC0];

void CommandIMGSub(int image_type, int image_number, char *name);
void EditSave();

/* editloop's own functions, in the order the unit defines them. Each is still
 * INCLUDE_ASM below; the prototypes are what lets the decompiled ones call
 * ahead of their definitions. */
/**
 * Starts a map event and optionally adopts a camera viewpoint.
 */
static int RunEvent(int event_no, CCamera *camera);
/**
 * Starts a system event and optionally adopts a camera viewpoint.
 */
static void RunSystemEvent(int event_no, CCamera *camera);
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
int LoadTexture(void);
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
int EditLoop(void);
void EditLoad(void);
void EditPartsObjectOnOff();
int EditInLoop(void);
void EditInInit(float time, char *name);
int EdMenuMode(void);
void EdExitMenu(void);
void MainMode(void);
void EditMode(void);
void EdMapJump(int hour, char *name);
void EdSelectVillager(VILLAGER_INFO *info, float time, EDIT_MAP_INFO *map);
void EdInitVilager(VILLAGER_INFO *info, CEditGround *ground, VILLAGER_INFO *walkers);
void EdInitVillagerOnOff(CNPCharacter *villagers, VILLAGER_INFO *info, CEditGround *ground);
void EdEventNPCStep(void);
void EdDoorOpenSe(int door_no, float *position);
void EdDoorCloseSe(int door_no, float *position);
void EdSetAmbientVol(float volume);
void EdSetSoundSrcVol(float time, CMapParts **parts, int count, float *position, float *direction);
int SndGetBgmNo(void);
void EdSaveFrameImageTask(void);
int SystemMesCheck(void);
int EdEventInit(int event_no, CDataAlloc2<1> *alloc, char *script);
void MapJump(int map_no, int entrance);
void PlayAmbient(float volume);
extern CCameraFollow TalkCamera;
extern CCameraFollow ViewCamera;
extern int MenuMapJumpMode;
extern int main_select_menu_no;
extern int chg_time_cnt;
extern int bgm_vol;
extern u_long128 Vu_prog0f;
extern CEffectGroup EdEffectGroup;
extern int binary;
extern CFrameVu1 *SkyBackFrame;
extern int NowSelectParts;
extern int NowSelectAngle;
extern float NowCursorRotY;
extern CTextureAnime TexAnime;
extern CTexAnimeData TexAnimeData;
extern CTexture *StayTexture;
extern CWind EdWind;
extern float NowPartsCursorPos[4];
extern int EdBeforeInBgmNo;
extern int EdDrawOffMap;
extern int EdThunderEffectFlag;
extern int EdInteriorFlag;
extern char EditEmptyText[];
extern int fobject_list;
extern int partseffect_list;
extern int objeffect_list;
extern int objtimer_list;
extern ED_EXCHANGE_INFO EdExchangeInfo;
extern int MenuMapJumpMode;
extern int main_select_menu_no;
extern int chg_time_cnt;
extern int bgm_vol;
extern u_long128 Vu_prog0f;
/* The ground the player has built on one map, as the save holds it. */
struct ED_GRD_DATA {
    u8 unk_00[0x64];
    int unk_64; /**< Zero until the map's own build event has been seen. */
};

/* The names of the interiors the debug menu offers. */
extern CMapParts *OldFocusParts;
extern int OldSelectAngle;
extern CCameraFollow EditCamera;
void EBDraw(void);
void EdDrawCharacter(CCharacter *chara, int detail, int count, CNPCharacter *villagers,
                     int *marks, int shadow, ED_EVENT_INFO *event);
void EdDrawItem(void);
void EdEventBackSpriteDraw(void);
void EdEventSpriteDraw(void);
void EffectMacroStep(float *wind);
void EffectWaterSpray(CEffectGroup *group, float *position, float *size, int count, int index);
void FishLineDraw(int kind);
void FishingDrawFish(void);
/* Mode the loop returns to once the debug menu closes. */
/* Buffer the parts archive is read into. */
/**
 * A part already built while the map loads, so later copies can share it.
 */
struct LOADED_PARTS {
    char name[0x20];  /**< Resource name the part was built from. */
    CMapParts *parts; /**< Part built from that name. */
};
void LoadMapObject(CMapParts *parts, u_int **data, CDataAlloc2<1> *alloc);
#ifdef NON_MATCHING
static char *InteriorList[64];
static int old_mode;
static u_int *parts_read_buffer;
#endif

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
static int RunEvent(int event_no, CCamera *camera) {
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
static void RunSystemEvent(int event_no, CCamera *camera) {
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
    free_start = (u_char *) ((((int) free_start >> 6) + 1) << 6);
    EdWorkBuffer.base = free_start;
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
    EdEventInfo.fixed_parts = ground->fixed_parts;
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
    EditMenuStatus.mode = -1;
    EditMenuStatus.parts = -1;
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
/**
 * Runs one frame of the editor and reports what it is to do next.
 *
 * @mangled EditLoop__Fv
 * @address 0x1797E0
 * @size 0x1FE8
 */
#ifdef NON_MATCHING
int EditLoop(void) {
    goto_return_menu = 0;
    if (EdPadDown(0x800, 4) != 0) {
        goto_return_menu = 1;
    }
    if (MapNo < 5 && loop_counter == 60 && GameMode == 1) {
        EdWalkToEditMes(0);
    }
    static int end_count = -1;
    if (GameMode != 0xE) {
        if (EdCheckViewMode() != 0) {
            MGSetRenderInfo(800.0f, 4.0f, 0x1FFFE);
            MGScisioringForce(1);
        } else {
            MGSetRenderInfo(800.0f, 5.0f, 0x1FFFE);
            MGScisioringForce(0);
        }
    }
    EdExchangeInfo.player = Chara;
    EdExchangeInfo.ground = pEditGround;
    EdExchangeInfo.camera = (CCameraFollow *) NowCamera;
    EdExchangeInfo.event_marker = TreasureCursor;
    EdExchangeInfo.system_effect = SystemEffect;
    sceVif1PkCall(Vif1Packet, &Vu_prog0f, 0);
    EdSetFlag();
    EdEventInfo.current_time = NowTime;
    pEditGround->focus_parts_id = -1;
    if (((int *) SaveData->GetConfigData())[4] != 0) {
        EditMes1.text_rate_set = 0.6f;
    } else {
        EditMes1.text_rate_set = 0.3f;
    }
    int mode = GameMode;

    if (mode == 0xC) {
        EdInteriorFlag = 1;

        int inside = EditInLoop();

        if (inside != 0) {
            if (inside == 0x63) {
                EditExit();
                return 1;
            }
            sceGsSyncV(0);
            sceGsSyncV(0);
            sceGsSyncV(0);
            sceGsSyncV(0);
            simple_event = 0;
            LoadScript();

            CRect_i_ screen;

            screen.x = 0;
            screen.y = 0;
            screen.width = 0x2800;
            screen.height = 0xE00;
            MGFillBox(screen, 0, 0, 0, 0x80);
            MGEndFrame();
            TexManager.DeleteTextureBlock(0xF);
            EdNPCBuffer.used = 0;
            EdVillagerBuffer.used = 0;
            InitWorkBuffer();
            EdSelectVillager(&EdVillagerInfo, NowTime, EditMapInfo);
            EdInitVilager(&EdVillagerInfo, EdExchangeInfo.ground, NULL);
            EdInitVilagerPosition(EdVillager, &EdVillagerInfo, pEditGround, NULL);
            MGBeginFrame();

            CRect_i_ cover;

            cover.x = 0;
            cover.y = 0;
            cover.width = 0x2800;
            cover.height = 0xE00;
            MGFillBox(cover, 0, 0, 0, 0x80);

            ED_EVENT_PARAM entry;

            if (EdSearchEvent(&entry, EdInteriorName, EdInteriorJumpID, NowTime) != 0) {
                sceVu0CopyVector(fix_chara_pos, entry.position);
                sceVu0CopyVector(fix_chara_rot, entry.rotation);
                sceVu0CopyVector(fix_camera_pos, entry.camera_pos);
            }
            Chara->SetPosition(fix_chara_pos);

            float turn = fix_chara_rot[1] + 3.141592f;

            if (!(turn <= 3.141592f)) {
                turn -= 6.2831855f;
            }
            Chara->SetRotation(fix_chara_rot[0], turn, fix_chara_rot[2]);
            MainCamera.FollowOff();
            MainCamera.SetPos(fix_camera_pos);
            MainCamera.SetRef(fix_chara_pos[0], 14.0f + fix_chara_pos[1], fix_chara_pos[2]);
            MainCamera.Step(-1);

            sceVu0FVECTOR direction;

            MainCamera.GetDir(direction);

            float angle = MainCamera.GetAngleH();

            MainCamera.FollowOn();
            MainCamera.SetAngleSoon(angle);
            Chara->ClothStep(-1);
            sceGsSyncV(0);
            sceGsSyncV(0);
            EdInitSoundSrc();
            PlayAmbient(NowTime);
            EdSetAmbientVol(1.0f);
            if (EdBeforeInBgmNo >= 0) {
                SndBgmLoad(EdBeforeInBgmNo);
            }
            sceGsSyncV(0);
            sceGsSyncV(0);
            EdFadeIn(0x40, 0.0f, 0.0f, 0.0f);
            GameMode = 1;
            if (EdInteriorDoorSound >= 0) {
                SndSetCamera((CCamera *) &MainCamera);
                EdDoorCloseSe(EdInteriorDoorSound, fix_chara_pos);
            }
            if (MapNo < 5) {
                EdWalkToEditMes(60);
            }
            if (EdEventInfo.outside_map_no >= 0) {
                RunEvent(EdEventInfo.outside_map_no, NULL);
            }
        }
        return 0;
    }
    EdInteriorFlag = 0;
    if (interior_test != 0) {
        static int top = 0;
        static int select = 0;
        static int cur = 0;
        for (int i = 0; i < 64; i++) {
            InteriorList[i] = interior_name[i];
        }

        int count;

        for (count = 0; InteriorList[count][0] != '\0'; count++) {
        }
        GamePad.SetAutoRepeat(0x5000, 20, 5);
        if (GamePad.Down(0x4000) != 0) {
            select++;
        }
        if (GamePad.Down(0x1000) != 0) {
            select--;
        }
        if (select < 0) {
            select = 0;
        }
        if (select >= count) {
            select = count - 1;
        }
        top = 0;
        if (select >= 14) {
            top = select - 13;
        }

        char *mark[2] = {" ", ">"};

        DebugFont__3.len = 0;
        for (int i = top; i < top + 14; i++) {
            DebugFont__3.len += sprintf(&DebugFont__3.text[DebugFont__3.len], "%s %s\n",
                                        mark[i == select], InteriorList[i]);
        }
        TexManager.ReloadTexture(GetVif1Packet(), 0x1F);
        DebugFont__3.Draw();
        if (GamePad.Down(0x20) != 0) {
            float hour = NowTime / 3.0f;
            int jump = (int) hour;

            EdMapJump((int) hour, InteriorList[select]);
            GameMode = 0xC;
            while (ReadBGSync() != 0) {
            }
            strcpy(interior_map_name, InteriorList[select]);
            EditInInit(NowTime, interior_map_name);
        }
        if (GamePad.On(0x100) != 0 && GamePad.On(0x800) != 0) {
            return 1;
        }
        return 0;
    }
    switch (mode) {
    case 16:
        draw_clock = 0;
        MainMode();
        MainEditMode();
        if (EdCheckViewMode() == 0) {
            NowCamera = (CCamera *) &MainCamera;
        } else {
            NowCamera = (CCamera *) &ViewCamera;
        }
        if (EdCheckViewMode() == 0) {
            NowCamera->Step(1);
        }
        break;
    case 1:
        if (loop_counter > 0) {
            MainMode();
        }
        MainEditMode();
        if (EdCheckViewMode() == 0) {
            NowCamera = (CCamera *) &MainCamera;
        } else {
            NowCamera = (CCamera *) &ViewCamera;
        }
        if (EdCheckViewMode() == 0) {
            NowCamera->Step(1);
        }
        if (goto_cmp_event != 0) {
            goto_return_menu = 0;
            if (EdFadeOutCheck() != 0) {
                if (goto_cmp_event < 0) {
                    EdExitLoop();
                } else {
                    RunEvent(goto_cmp_event, NULL);
                    EdFadeIn(60, 0.0f, 0.0f, 0.0f);
                }
                goto_cmp_event = 0;
            }
        }
        break;
    case 14:
        NowCamera = (CCamera *) &EventCamera;
        MainEditMode();
        EventMode();
        VillagerCollision();
        EdEventNPCStep();
        NowCamera->Step(1);
        draw_npc_cursor = 0;
        draw_clock = 0;
        goto_return_menu = 0;
        break;
    case 2:
        NowCamera = (CCamera *) &TalkCamera;
        TalkMode();
        MainEditMode();
        NowCamera->Step(1);
        draw_npc_cursor = 0;
        draw_clock = 0;
        break;
    case 4:
        GamePad.SetAutoRepeat(0xF000, 20, 5);
        NowCamera = (CCamera *) &EditCamera;
        MainEditMode();
        EditMode();
        NowCamera->Step(1);
        pEditGround->EditAreaClip(NowCamera, -1.0f);
        if (goto_cmp_event != 0) {
            goto_return_menu = 0;
            if (EdFadeOutCheck() != 0) {
                RunEvent(goto_cmp_event, NULL);
                EdFadeIn(60, 0.0f, 0.0f, 0.0f);
                goto_cmp_event = 0;
            }
        }
        break;
    case 11:
        if (door_open_cnt == 0x9C) {
            EdMapJump(EdGetTime(NowTime), interior_map_name);
        }
        if (door_open_cnt < 0x9C) {
            ReadBG();
        }
        if (door_open != 0) {
            NowCamera = (CCamera *) &MainCamera;
        }
        OpenDoorMode();
        MainEditMode();
        door_open_cnt--;
        NowCamera->Step(1);
        if (door_open_cnt == 100 && EdInteriorDoorSound >= 0) {
            sceVu0FVECTOR here;

            Chara->GetPosition(here);
            EdDoorOpenSe(EdInteriorDoorSound, here);
        }
        if (door_open_cnt < 0x96 && EdFadeOutCheck() != 0) {
            door_open_cnt = -1;
        }
        if (door_open_cnt < 0) {
            door_open_cnt = 0;
            GameMode = 0xC;
            EdStopSoundSrc();
            EdSetAmbientVol(0.3f);
            SndStep();
            EdBeforeInBgmNo = SndGetBgmNo();
            if (old_main_mode == 5) {
                EdBeforeInBgmNo = 0;
            }
            bgm_vol >>= 1;
            if (bgm_vol <= 0) {
                bgm_vol = 1;
            }
            if (EdEventInfo.map_jump_bgm_stop != 0) {
                SndBgmFadeOutStop();
            }
            SndStep();

            CRect_i_ screen;

            screen.x = 0;
            screen.y = 0;
            screen.width = 0x2800;
            screen.height = 0xE00;
            MGFillBox(screen, 0, 0, 0, 0x80);
            MGEndFrame();
            for (int i = 0; i < 10; i++) {
                TexManager.DeleteTextureBlock(i + 0x36);
            }
            TexManager.CleanUpBuffer();
            while (ReadBGSync() != 0) {
            }
            sceGsSyncV(0);
            EdSelectVillager(&EdVillagerInfo, NowTime, EditMapInfo);
            EditInInit(NowTime, interior_map_name);
            MGBeginFrame();

            CRect_i_ cover;

            cover.x = 0;
            cover.y = 0;
            cover.width = 0x2800;
            cover.height = 0xE00;
            MGFillBox(cover, 0, 0, 0, 0x80);
            ItemVolumeStep.CheckItemVolume();
            return 0;
        }
        break;
    case 6:
        if (EditMenuLoop() != 0) {
            GameMode = 4;
            NowSelectParts = -1;
            switch (EditMenuStatus.mode) {
            case 0:
                NowSelectParts = EditMenuStatus.parts;
                break;
            case 3:
                NowSelectParts = -1;
                break;
            case 5:
                FadeOutToEvent(EditMenuStatus.event_no + 0xC8, 0);
                break;
            }
            EdExitMenu();
            return 0;
        }
        break;
    case 8:
        TexManager.ReloadTexture(GetVif1Packet(), 0x10);
        MenuMapJumpMode = -1;
        EditPartsObjectOnOff();
        if (EdMenuMode() != 0) {
            GameMode = 1;
            EdExitMenu();
            if (MenuMapJumpMode >= 0) {
                MapJump(MenuMapJumpMode, -1);
                EdEventInfo.integer_arguments[0] = MenuMapJumpMode;
                RunSystemEvent(2, NowCamera);
                MenuMapJumpMode = -1;
            }
            EdInitVillagerOnOff(EdVillager, &EdVillagerInfo, pEditGround);
            return 0;
        }
        break;
    case 3:
        if (chg_time_cnt < 0x8C) {
            ReadBG();
        }
        for (int i = 0; i < 10; i++) {
            if (EdVillager[i].CheckDraw() != 0) {
                EdVillager[i].Step();
            } else {
                EdVillager[i].initialized = 0;
            }
        }
        if (chg_time_cnt == 0x8C) {
            EdVillagerBuffer.used = 0;
            StartReadBG();
            EdSelectVillager(&EdVillagerInfo, NowTime, EditMapInfo);
            EdInitVilager(&EdVillagerInfo, pEditGround, (VILLAGER_INFO *) EdNPCReadBuffer);
        }
        NowCamera = (CCamera *) &MainCamera;
        Chara->GetVelocity()->y = 0.0f;

        CCharacter *chara = Chara;

        chara->motion_no = 0;
        chara->flags = 0;
        chara->motion_speed = -1.0f;
        Chara->Step();
        Chara->ClothStep(0);
        Chara->ShadowStep();
        MainEditMode();
        chg_time_cnt--;
        NowCamera->Step(1);
        if (chg_time_cnt < 0) {
            while (ReadBGSync() != 0) {
            }
            for (int i = 0x36; i < 0x40; i++) {
                TexManager.DeleteTextureBlock(i);
            }
            TexManager.CleanUpBuffer();
            for (int i = 0; i < 10; i++) {
                BG_READ_INFO *file = GetReadBGFile(i);

                if (file != NULL) {
                    EdLoadVillager((u_int *) file->buffer,
                               (char *) EdVillager[i].resource_name,
                               &EdVillager[i],
                                   &EdVillagerBuffer);
                }
            }
            EdInitVilagerPosition(EdVillager, &EdVillagerInfo, pEditGround, NULL);
            chg_time_cnt = 0;
            GameMode = 1;
            EdFadeIn(0x40, 0.0f, 0.0f, 0.0f);
        }
        break;
    case 5:
    case 7:
        draw_clock = 0;
        MGFlipWaitVSync(1);
        pEditGround->EditAreaClip(NowCamera, -1.0f);
        break;
    case 0:
    case 9:
    case 10:
    case 12:
    case 13:
    case 15:
        break;
    }

    sceVu0FMATRIX view;
    sceVu0FVECTOR eye;

    NowCamera->GetCameraMatrix(view);
    NowCamera->GetPos(eye);
    MGSetViewMatrix(view, eye);
    if (GameMode != 4 && GameMode != 5 && GameMode != 0xA) {
        if (move_count > 0) {
            pEditGround->EditAreaClip(NowCamera, -1.0f);
        } else {
            pEditGround->EditAreaClip(NowCamera, 20000.0f);
        }
    }
    switch (GameMode) {
    case 4:
        depth_of_field = 0;
        edit_mode_lighting = 1;
        draw_sky = 0;
        edit_mode_draw = 1;
        edit_mode_grd_draw = 1;
        MainDraw();
        break;
    case 0:
    case 1:
    case 2:
    case 14:
    case 16:
        depth_of_field = 1;
        edit_mode_lighting = 0;
        draw_sky = 1;
        edit_mode_draw = 0;
        if (move_count <= 10) {
            edit_mode_grd_draw = 0;
        }
        /* fallthrough */
    case 3:
    case 5:
    case 7:
    case 9:
    case 10:
    case 11:
        MainDraw();
        break;
    case 6:
    case 8:
        EditNameMes.MakeMesWin(-1);
        EdFadeInOut();
        break;
    }
    CheckKeyLock();

    sceVu0FVECTOR here;

    if (GameMode == 1) {
        Chara->GetPosition(here);
    } else {
        sceVu0CopyVector(here, ECursorFrame->position);
    }
    if ((EdDebugMoveFlag > 0 || MapNo < 5) && EdPadDown(0x100, 2) != 0 &&
        EdCheckViewMode() == 0 && change_time_event == 0) {
        if (GameMode == 1) {
            sceVu0FVECTOR at;

            move_count = 30;
            GameMode = 4;
            EditCamera.SetAngleSoon(MainCamera.GetAngle());
            MainCamera.GetPos(at);
            EditCamera.SetPos(at);
            MainCamera.GetRef(at);
            EditCamera.SetRef(at);
            Chara->GetPosition(at);
            NowSelectAngle = 0;
            OldSelectAngle = 0;
            NowCursorRotY = 0.0f;
            Chara->GetPosition(at);
            ECursorFrame->SetPosition(at);
            sceVu0CopyVector(NowPartsCursorPos, ECursorFrame->position);
            sceVu0CopyVector(NowCursorPos, ECursorFrame->position);
            sceVu0CopyVector(NextCursorPos, ECursorFrame->position);
            NowFocusParts = NULL;
            OldFocusParts = NULL;
            PartsNameNum = -1;
            DrawPartsNameCount = 30;
            EditMenuStatus.mode = -1;
            EditMenuStatus.parts = -1;
            NowSelectParts = -1;
        } else if (GameMode == 4 && pEditGround->CheckEffect() == 0) {
            sceVu0FVECTOR at;

            move_count = 30;
            GamePad.AutoRepeatOff();
            if (CheckEditToWalk(at) != 0) {
                GameMode = 1;
                Chara->SetPosition(at);
                MainCamera.SetAngleSoon(EditCamera.GetAngle());
                EditCamera.GetPos(at);
                MainCamera.SetPos(at);
                EditCamera.GetRef(at);
                MainCamera.SetRef(at);

                int built = 0;
                ED_GRD_DATA *grd = (ED_GRD_DATA *) SaveData->GetGrdData(MapNo);

                if (grd != NULL && grd->unk_64 == 0) {
                    for (int i = 0; i < 24; i++) {
                        if (EditPartsInfo.request[i] != 0) {
                            built++;
                        }
                    }
                    if (built == EditPartsInfo.parts_max) {
                        FadeOutToEvent(0x83, 9);
                    }
                }
                if (MapNo == 1 && SaveData->GetGameFlag(0x14) == 0 &&
                    EditPartsInfo.request[16] != 0) {
                    FadeOutToEvent(0xB, 0xA);
                }
            }
            EdInitVilagerPosition(EdVillager, &EdVillagerInfo, pEditGround, (float (*)[4]) at);
        }
    }
    if (move_count > 0) {
        EditCamera.SetSpeed(10.0f);
    } else {
        EditCamera.SetSpeed(8.0f);
    }
    if (move_count < 0) {
        move_count = 0;
    }
    move_count--;
    if (GameMode == 5 || GameMode == 7) {
        int next = EdInitModeFinish(NowCamera, TexManager.GetTexture("frame_image", -1));

        if (next != 0) {
            GameMode = next;
        }
    }
    EdSaveFrameImageTask();
    if (GameMode == 4 && (EdStopSoundSrc(), EdPadDown(0x10, 2) != 0 || EdPadDown(0x20, 2) != 0) &&
        EdInitMenu(1) != 0) {
        NowSelectParts = -1;
        GameMode = 5;
        SndSePlay(1, -1, 0);
    }
    if (GameMode == 1 && (EdPadDown(0x10, 1) != 0 || goto_menu != 0 ||
                          (SystemMesCheck() == 0 && EdCheckItemOver() != 0))) {
        int menu = 2;

        if (goto_menu != 0) {
            menu = goto_menu;
            goto_menu = 0;
        }
        if (EdInitMenu(menu) != 0) {
            if (EdCheckItemOver() != 0) {
                if (loop_counter > 10) {
                    SndSePlay(1, -1, 0);
                }
            } else {
                SndSePlay(1, -1, 0);
            }
            GameMode = 7;
        }
    }
    static int debug_flag = 0;
    if (GameMode != 6 && GameMode != 4 && loop_counter > 10) {
        sceVu0FVECTOR eye_pos;
        sceVu0FVECTOR eye_dir;
        sceVu0FVECTOR maximum;
        sceVu0FVECTOR minimum;
        CMapParts *nearby[64];

        NowCamera->GetPos(eye_pos);
        NowCamera->GetDir(eye_dir);

        float reach = 550;

        minimum[0] = eye_pos[0] - reach;
        minimum[1] = eye_pos[1] - reach;
        minimum[2] = eye_pos[2] - reach;
        minimum[3] = 1.0f;
        maximum[0] = reach + eye_pos[0];
        maximum[1] = reach + eye_pos[1];
        maximum[2] = reach + eye_pos[2];
        maximum[3] = 1.0f;

        int found = pEditGround->GetNearParts(nearby, 64, (CBoxVu0 *) maximum, NULL);

        for (int i = 0; i < found; i++) {
            if (nearby[i]->subtype == 2 && pEditGround->suppress_water != 0) {
                nearby[i] = NULL;
            }
        }
        if (sound_off_cnt <= 0) {
            EdSetSoundSrcVol(NowTime, nearby, found, eye_pos, eye_dir);
        }
    }
    if (change_time_event != 0 && move_count <= 0 && RunEvent(0x84, NowCamera) != 0) {
        change_time_event = 0;
    }
    static int event_next = 0;
    if (GamePad.Down2(0x80) != 0) {
        event_next = 4;
        EdEventAllClear();
        simple_event = 0;
    }
    event_next--;
    if (event_next < 0) {
        event_next = 0;
    }
    if (event_next == 1) {
        start_event_no = 0x96;
    }
    if (GameMode != 0xE) {
        if (((CMainChara *) Chara)->in_trigger != 0 && loop_counter > 10) {
            if (((CMainChara *) Chara)->trigger_event > 0) {
                RunEvent(((CMainChara *) Chara)->trigger_event, NowCamera);
                ((CMainChara *) Chara)->trigger_event = 0;
            }
        }
    }
    if (EdDebugEventEnable != 0 && (start_event_no > 0 || start_system_event > 0)) {
        sceVu0FVECTOR from;
        sceVu0FVECTOR to;

        NowCamera->GetPos(from);
        NowCamera->GetRef(to);
        EventCamera.FollowOff();
        EventCamera.SetPos(from);
        EventCamera.SetRef(to);
        EventCamera.Step(-1);
        if (start_system_event > 0) {
            if (EdEventInit(start_system_event, &EdWorkBuffer, EdSystemEventData) != 0) {
                EdInitMesParam();
                GameMode = 0xE;
            }
        } else {
            if (EdEventInit(start_event_no, &EdWorkBuffer, EdEventData) != 0) {
                EdInitMesParam();
                GameMode = 0xE;
                ItemVolumeStep.CheckItemVolume();
            }
            if (EdEventInfo.return_code == 9) {
                EdInitMesParam();
                GameMode = 2;
                simple_event = 0;
                ItemVolumeStep.CheckItemVolume();
            }
        }
        start_event_no = -1;
        start_system_event = -1;
    } else {
        simple_event = 0;
    }
    PauseOffCheck();
    if ((unsigned int) (GameMode - 9) < 2U && EdPadDown(0x800, 0xFFFF) != 0) {
        GameMode = old_mode;
        EdSePlay((ED_SOUND_ID) 2, -1);
        PlayTimeCountFlag(1);
    } else if (goto_return_menu != 0) {
        switch (GameMode) {
        case 1:
        case 16:
            old_mode = GameMode;
            oldGameMode = GameMode;
            GameMode = 9;
            EdSePlay((ED_SOUND_ID) 1, -1);
            PlayTimeCountFlag(0);
            break;
        case 4:
            old_mode = GameMode;
            GameMode = 0xA;
            EdSePlay((ED_SOUND_ID) 1, -1);
            PlayTimeCountFlag(0);
            break;
        }
    }
    goto_return_menu = 0;
    static int end_code = 0;
    if (goto_dungeon != 0 && end_counter == 0) {
        main_select_menu_no = NowEditMap;
        MapJump(NowEditMap + 0xC8, -1);
        end_counter = 1;
        end_code = 1;
    }
    key_counter = 0;
    if (exit_loop != 0) {
        EditExit();
        return 1;
    }
    if (end_counter == 1) {
        EditExit();
        return end_code;
    }
    end_counter--;
    if (end_counter < 0) {
        end_counter = 0;
    }
    SndStep();
    loop_counter++;
    key_counter++;
    sound_off_cnt--;
    if (sound_off_cnt < 0) {
        sound_off_cnt = 0;
    }
    DebugFont__3.len = 0;
    if (GamePad.On(0x20) != 0) {
        cat_end();
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop", EditLoop__Fv);
#endif

INCLUDE_RODATA("asm/nonmatchings/editloop", @1837__2);
INCLUDE_RODATA("asm/nonmatchings/editloop", @1838__2);
/**
 * Draws the editor's world for one frame.
 *
 * @mangled MainDraw__Fv
 * @address 0x17B7D0
 * @size 0x11D8
 */
#ifdef NON_MATCHING
void MainDraw() {
    int i;

    if (EdDrawOffFlag == 0) {
        if (EdPauseFlag != 0 || (unsigned int) (GameMode - 9) < 2U) {
            CTextureAnime::stop_anime = 1;
        } else {
            CTextureAnime::stop_anime = 0;
            if (EdThunderEffectFlag != 0) {
                EdThunderEffect(MapNo, pEditGround);
            }
        }
        EdDrawOffMap = EdEventInfo.suppress_background;
        EdDrawOffMapShadow = EdEventInfo.suppress_shadows;
        if (EdDrawOffMap == 0) {
            if (draw_sky != 0) {
                EdDrawSky(NowTime, SkyFrame, SunFrame, SkyBackFrame, NowCamera,
                          (int *) &EditMapInfo->sky_layers[0]);
            }
            TexManager.ReloadTexture(Vif1Packet, 1);
            TexAnime.TexAnime(1);
            pEditGround->DrawBaseGround();

            float lod[4] = {50.0f, 350.0f, 600.0f, 1000.0f};
            float near_lod = 2.0f;
            float far_lod = 0.0f;
            float mid_lod = 0.0f;

            if (edit_mode_grd_draw != 0) {
                near_lod = 3.0f;
                far_lod = 3.0f;
                mid_lod = 3.0f;
            }
            pEditGround->Draw(NowTime, 1, (int) far_lod, (int) near_lod, (int) mid_lod,
                              (int) near_lod);
            if (edit_mode_grd_draw != 0) {
                sceVu0FVECTOR at;
                sceVu0FVECTOR colour = {0.0f, 0.0f, 0.0f, 0.0f};

                sceVu0CopyVector(at, ECursorFrame->position);
                colour[1] = NowCursorRotY;
                at[1] = pEditGround->GetAlt(at[0], at[1], at[2]);
                pEditGround->DrawPartsCursor(NowSelectParts, at, NowPartsCursorPos,
                                             NowSelectAngle, colour, 1);
            }
            TexManager.ReloadTexture(Vif1Packet, 2);
            TexAnime.TexAnime(2);
            pEditGround->Draw(NowTime, 2, (int) far_lod, (int) near_lod, 0, 3);
            if (edit_mode_grd_draw != 0) {
                sceVu0FVECTOR at2;
                sceVu0FVECTOR colour2 = {0.0f, 0.0f, 0.0f, 0.0f};

                sceVu0CopyVector(at2, ECursorFrame->position);
                colour2[1] = NowCursorRotY;
                at2[1] = pEditGround->GetAlt(at2[0], at2[1], at2[2]);
                pEditGround->DrawPartsCursor(NowSelectParts, at2, NowPartsCursorPos,
                                             NowSelectAngle, colour2, 2);
            }
            if (FishingDrawCheck() != 0) {
                FishingDrawFish();
                FishLineDraw(0);
            }
            TexManager.ReloadTexture(Vif1Packet, 0x15);
            TexAnime.TexAnime(0x15);
            pEditGround->DrawWater(0x15);

            switch (GameMode) {
            case 1:
            case 0x10:
            case 4:
            case 2:
            case 0xE:
            case 3:
            case 0:
            case 9:
            case 7:
            case 5:
            case 0xA: {
                sceGsTex0 frame;
                CRect_i_ screen;
                sceGsTex0 water;
                float ref[4];
                sceGsZbuf zbuf;

                MGGetFBuffTex(&frame);
                screen.x = 0;
                screen.y = 0;
                screen.width = 0x280;
                screen.height = 0xE0;
                *(u_long *) &water = TexManager.GetTexture("water_buff", -1)->tex0;
                MGMoveImage(&frame, screen, &water, 0, 0, 0);
                MainCamera.GetRef(ref);
                zbuf = mgZBuffer;
                zbuf.bits.zmsk = 1;
                MGSetGsZBUF(&zbuf);
                pEditGround->DrawWaterSurface(NowCamera);
                MGSetGsZBUF(&mgZBuffer);
                break;
            }
            }
            pEditGround->DrawRipple(0x15);

            float dof_range[2] = {400.0f, 1000.0f};

            if (depth_of_field != 0) {
                int level = 2;

                if (((int *) SaveData->GetConfigData())[6] != 0) {
                    level = 1;
                }
                EdDrawDOF(level);
            }
        }
        if (FishingDrawCheck() != 0) {
            FishLineDraw(1);
        }
        if (GameMode == 0xE) {
            EdEventBackSpriteDraw();
        }
        PolyCount = 0;
        if (GameMode == 0xE) {
            EdDrawItem();
        }
        switch (GameMode) {
        case 9:
        case 7:
            CCharacter::MotionStopFlag = 1;
            Chara->Step();
            Chara->ShadowStep();
            for (i = 0; i < 10; i++) {
                CNPCharacter *villager = &EdVillager[i];
                unsigned char addressable = villager->initialized != 0;

                if (addressable != 0) {
                    addressable = villager->draw_enabled != 0;
                }
                if (addressable != 0) {
                    int saved = villager->sequence_enabled;

                    villager->sequence_enabled = 0;
                    villager->chara.Step();
                    villager->chara.ShadowStep();
                    villager->sequence_enabled = saved;
                }
            }
            CCharacter::MotionStopFlag = 0;
            /* fallthrough */
        case 1:
        case 16:
        case 2:
        case 14:
        case 3:
        case 11: {
            ED_EVENT_INFO *event = NULL;
            int shadow_on = 1;
            int detail = 3;
            int marks_store[10];
            int *marks = marks_store;
            float here[4];
            CBoxVu0 box;
            CMapParts *near_parts[0x40];

            if (GameMode == 2 || EdSystemMesCheck() != 0) {
                shadow_on = 0;
            }
            if (EdCheckViewMode() != 0) {
                detail = 0;
            }
            if (GameMode == 0xB) {
                marks = NULL;
            } else {
                for (i = 0; i < 10; i++) {
                    marks_store[i] = 3;
                }
            }
            if (GameMode == 0xE) {
                event = &EdEventInfo;
            }
            Chara->GetPosition(here);
            here[1] += 10.0f;
            box.min[0] = here[0] - 100.0f;
            box.min[1] = here[1] - 100.0f;
            box.min[2] = here[2] - 100.0f;
            box.min[3] = 1.0f;
            box.max[0] = 100.0f + here[0];
            box.max[1] = 100.0f + here[1];
            box.max[2] = 100.0f + here[2];
            box.max[3] = 1.0f;

            int found = pEditGround->GetNearParts(near_parts, 0x40, &box, NULL);

            Chara->ClearPointLight();
            for (i = 0; i < found; i++) {
                CMapParts *parts = near_parts[i];
                CFrame *frame = (CFrame *) parts->frame[0];

                if (frame != NULL) {
                    float where[4];

                    parts->GetPosition(where);
                    frame->SetPosition(where);
                    near_parts[i]->GetRotation(where);
                    frame->SetRotation(where[0], where[1], where[2]);
                    for (int j = 0; j < 0x18; j++) {
                        EDIT_EFFECT_INFO *effect = near_parts[i]->effect[j];

                        if (near_parts[i]->effect_on[j] != 0 && effect != NULL &&
                            (effect->kind == 1 || effect->kind == 3 || effect->kind == 2) &&
                            effect->frame != NULL &&
                            CheckEditEffect(effect, NowTime) != 0) {
                            float lit[4];

                            effect->frame->GetWorldPosition(lit, effect->offset);

                            float away = DistVector(here, lit);

                            if (away <= 40.0f) {
                                float bright = 80.0f + (float) (rand() % 48);

                                lit[3] = away;
                                Chara->SetPointLight(lit, 5.0f, 40.0f, bright, bright, bright,
                                                     128.0f);
                            }
                        }
                    }
                }
            }
            EdDrawCharacter(Chara, detail, 0xA, EdVillager, marks, shadow_on, event);
            break;
        }
        }
        if (EdDrawOffMapShadow == 0 && EdDrawOffMap == 0) {
            float light[4][4];
            float kept[4][4];
            float colour[4][4];

            MGGetPLight(light, colour);
            sceVu0CopyMatrix(kept, light);
            EdLimitShadowLight(kept, 3.0f);
            MGSetPLight(kept, colour);
            TexManager.ReloadTexture(Vif1Packet, 0x16);

            float range[4] = {-100.0f, EditMapInfo->shadow_near, EditMapInfo->shadow_far, 0.0f};

            if (edit_mode_draw != 0) {
                MGBeginDrawShadow(*(sceGsTex0 *) &TexManager.GetTexture("shadow_buff", -1)->tex0);
                pEditGround->DrawShadow(1, 0.0f, 100000.0f);
                MGEndDrawShadow(0x20);
            } else {
                if (EditMapInfo->shadow_level > 0) {
                    MGBeginDrawShadow(
                        *(sceGsTex0 *) &TexManager.GetTexture("shadow_buff", -1)->tex0);
                    pEditGround->DrawShadow(0, range[0], range[1]);
                    MGEndDrawShadow(EditMapInfo->shadow_mode);
                }
                if (EditMapInfo->shadow_level >= 2) {
                    MGBeginDrawShadow(
                        *(sceGsTex0 *) &TexManager.GetTexture("shadow_buff", -1)->tex0);
                    pEditGround->DrawShadow(0, range[1], range[2]);
                    MGEndDrawShadow(EditMapInfo->shadow_mode_2);
                }
            }
            MGSetPLight(light, colour);
        }
        for (i = 0; i < 4; i++) {
            TexManager.ReloadTexture(Vif1Packet, i + 0x1B);
            MotionParts[i].TextureAnime(i + 0x1B);
            MotionParts[i].Draw();
        }
        if (EdDrawOffMap == 0) {
            TexManager.ReloadTexture(Vif1Packet, 0x18);
            RunEffect.Lighting(1);
            RunEffect.Draw();
            switch (GameMode) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 7:
            case 11:
            case 14:
            case 16:
                if (EdPauseFlag == 0) {
                    float wind[4];

                    EditEffectStep();
                    EdWind.GetWind(wind);
                    EffectMacroStep(wind);
                    RunEffect.Step();
                    EdEffectGroup.Step(1);
                    if (NowEditMap == 1) {
                        sceVu0FVECTOR spray = {800.0f, -20.0f, 1300.0f, 1.0f};
                        sceVu0FVECTOR size = {10.0f, 7.0f, 10.0f, 1.0f};

                        for (i = 0; i < 5; i++) {
                            EffectWaterSpray(&EdEffectGroup, spray, size, 0xA, i);
                            spray[0] += 20.0f;
                        }
                    }
                }
                /* fallthrough */
            case 9:
            case 10:
                EditEffectStep2();
                pEditGround->DrawEffect((CCameraFollow *) NowCamera, NowTime,
                                        &EdEffectGroup);
                EdEffectGroup.Draw();
                break;
            }
            if (edit_mode_draw == 0) {
                EdDrawLensFlare(NowTime, SunFrame);
            }
        }
        if (GameMode == 0xE) {
            EdEventSpriteDraw();
            EBDraw();
            if (EdEventInfo.screen_filter != 0) {
                float fade[4];
                CRect_i_ screen;

                sceVu0CopyVector(fade, EdEventInfo.screen_filter_color);
                screen.x = 0;
                screen.y = 0;
                screen.width = 0x2800;
                screen.height = 0xE00;
                MGFillBox(screen, (int) fade[0] & 0xFF, (int) fade[1] & 0xFF,
                          (int) fade[2] & 0xFF, (int) fade[3] & 0xFF);
            }
        }
        if (GameMode != 2) {
            DrawSysGra();
        }
        if (GameMode == 4) {
            ParamDraw();
            TexManager.ReloadTexture(Vif1Packet, EditMes1.tex_block);
            EditNameMes.Step();
            EditNameMes.DrawMesWin();
        }

        int mes_mode = GameMode;

        if (mes_mode == 2 || mes_mode == 0x10 || mes_mode == 0xE || mes_mode == 4) {
            TexManager.ReloadTexture(Vif1Packet, EditMes1.tex_block);
            EditMes1.DrawMesWin();
            if (GameMode == 0xE) {
                EditEventMes1.DrawMesWin();
                EditSystemMes.DrawMesWin();
            }
        }
        if (GameMode == 1) {
            MonsterNameDraw();
        } else {
            MonsterNameMake(-1);
        }
        EdSystemMesStep();
        EdSystemMesDraw();
        if (GameMode == 4 && EditMenuStatus.mode < 2) {
            EDITPARTS_INFO *info = EditPartsInfo.GetPartsInfo(NowSelectParts);

            if (info != NULL) {
                int total = info->stock;
                int done = (total - info->placed) * 100 / total;
                CRect_i_ back;
                CRect_i_ bar;
                CRect_i_ fill;

                back.x = 0x1CA0;
                back.y = 0xBF8;
                back.width = 0x680;
                back.height = 0x70;
                MGFillBox(back, 0x14, 0x14, 0x14, 0x80);
                bar.x = 0x1CC0;
                bar.y = 0xC08;
                bar.width = 0x640;
                bar.height = 0x50;
                MGFillBox(bar, 0x64, 0x64, 0x64, 0x80);
                fill.x = 0x1CC0;
                fill.y = 0xC08;
                fill.width = done * 0x10;
                fill.height = 0x50;
                MGFillBox(fill, 0xB4, 0x64, 0x28, 0x80);
                DrawAtraBuildNum(info, 0x1CC, 0x181, 0x80);
            }
        }
        EdFadeInOut();
        if (clear_screen != 0) {
            CRect_i_ screen;

            screen.x = 0;
            screen.y = 0;
            screen.width = 0x2800;
            screen.height = 0xE00;
            MGFillBox(screen, 0, 0, 0, 0x80);
        }
        clear_screen = 0;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop", MainDraw__Fv);
#endif

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
/**
 * Gives a rectangle that starts at zero.
 *
 * The four words come out back to front, which `CRect_i_`'s own constructor
 * does not do, and `rect.hpp` cannot serve both orders from one constructor
 * without moving the generated-name counter in every unit that includes it.
 */
class CRectZero : public CRect_i_ {
public:
    CRectZero() {
        height = 0;
        width = 0;
        y = 0;
        x = 0;
    }

    CRectZero(s32 x, s32 y, s32 width, s32 height) {
        this->x = x;
        this->y = y;
        this->width = width;
        this->height = height;
    }
};
void DrawDay() {
    if (draw_day_flag != 0) {
        int week;
        int x;
        int width;
        int alpha;
        int day;
        int digit[4];
        CTexture *texture;
        int count;
        int drawn;
        int remain;
        int value;

        draw_day_cnt -= 0.02f;
        if (draw_day_cnt < 0.0f) {
            draw_day_cnt = 0.0f;
            draw_day_flag = 0;
        }
        day = SaveData->GetDay() + 1;
        week = EdGetTime(NowTime);
        week++;
        if (week > 3) {
            week = 0;
        }
        x = 0x140;
        if (draw_day_cnt > 4.0f) {
            alpha = (int) (128.0f * (5.0f - draw_day_cnt));
        } else if (draw_day_cnt > 1.0f) {
            alpha = 0x80;
        } else {
            alpha = (int) (128.0f * draw_day_cnt);
        }
        count = 1;
        digit[3] = day / 1000;
        digit[2] = day % 1000 / 100;
        digit[1] = day % 100 / 10;
        digit[0] = day % 10;
        width = 0xA8;
        if (day >= 10) {
            width += 0x18;
            count++;
        }
        if (day >= 100) {
            width += 0x18;
            count++;
        }
        if (day >= 1000) {
            width += 0x18;
            count++;
        }
        x -= width >> 1;
        setbilinear(0);
        texture = TexManager.GetTexture("whatsday", -1);

        CRect_i_ title(0x30, 0x58, 0x30, 0x18);
        CRect_i_ nichi(0x64, 0x40, 0x10, 0x18);
        CRect_i_ weekday(0, 0x40, 0x18, 0x18);
        CRect_i_ dai(0, 0x58, 0x30, 0x18);
        CRect_i_ bar_left(0, 0x70, 0x10, 0x10);
        CRect_i_ bar_middle(0x10, 0x70, 0x10, 0x10);
        CRect_i_ bar_right(0x20, 0x70, 0x10, 0x10);
        CRect_i_ word(0x78, 0x62, 0x65, 0x20);
        CRect_i_ word_end(0xDD, 0x62, 0x22, 0x20);
        CRectZero week_name[4];
        week_name[0].x = 0x78;
        week_name[0].y = 2;
        week_name[0].width = 0x50;
        week_name[0].height = 0x20;
        week_name[1].x = 0x78;
        week_name[1].y = 0x22;
        week_name[1].width = 0x68;
        week_name[1].height = 0x20;
        week_name[2].x = 0x78;
        week_name[2].y = 0x42;
        week_name[2].width = 0x38;
        week_name[2].height = 0x20;
        week_name[3].x = 0xC8;
        week_name[3].y = 0x42;
        week_name[3].width = 0x38;
        week_name[3].height = 0x20;
        CRectZero week_word;
        week_word = week_name[week];
        CRectZero cell(0, 0, 0x18, 0x20);
        CRectZero number;

        if (texture != NULL) {
            switch (LanguageCode) {
            case 0:
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xD4, title.width, title.height), title, alpha);
                x += 0x30;
                break;
            case 1:
                width = week_word.width +
                        (word_end.width + (word.width + ((count - 1) * 32)) + 0x48);
                x = 0x140 - (int) (width >> 1);
                set2DSprite(GetVif1Packet(), texture, CRect_i_(x, 0xD4, word.width, word.height),
                            word, alpha);
                x += word.width + 0xC;
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xD4, word_end.width, word_end.height), word_end, alpha);
                x += word_end.width + 0xC;
                break;
            default:
                break;
            }
            int n;
            for (n = count; n > 0; n--) {
                number = cell;
                value = digit[n - 1];

                number.x += number.width * (value % 5);
                number.y += number.height * (value / 5);
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xD2, number.width, number.height), number, alpha);
                x += number.width;
            }
            switch (LanguageCode) {
            case 0:
                set2DSprite(GetVif1Packet(), texture, CRect_i_(x, 0xD4, dai.width, dai.height),
                            dai, alpha);
                x += dai.width;
                set2DSprite(GetVif1Packet(), texture, CRect_i_(x, 0xD4, nichi.width, nichi.height),
                            nichi, alpha);
                x += nichi.width;
                weekday.x += week * 0x18;
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xD4, weekday.width, weekday.height), weekday, alpha);
                break;
            case 1:
                set2DSprite(GetVif1Packet(), texture, CRect_i_(x, 0xD4, nichi.width, nichi.height),
                            nichi, alpha);
                x += nichi.width;
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xD4, week_word.width, week_word.height), week_word,
                            alpha);
                break;
            }
            drawn = 0;
            x = 0x13C - (int) (width >> 1);
            set2DSprite(GetVif1Packet(), texture,
                        CRect_i_(x, 0xEC, bar_left.width, bar_left.height), bar_left, alpha);
            drawn += bar_left.width;
            x += bar_left.width;
            remain = width - bar_right.width;
            while (drawn < width - bar_right.width) {
                set2DSprite(GetVif1Packet(), texture,
                            CRect_i_(x, 0xEC, bar_middle.width, bar_middle.height), bar_middle,
                            alpha);
                x += bar_middle.width;
                remain -= bar_middle.width;
                drawn += bar_middle.width;
            }
            bar_right.x += bar_right.width - remain;
            bar_right.width = remain;
            set2DSprite(GetVif1Packet(), texture,
                        CRect_i_(x, 0xEC, bar_right.width, bar_right.height), bar_right, alpha);
        }
    }
}
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
/**
 * Runs the editing mode: the cursor, the part list and the placement rules.
 *
 * @mangled MainEditMode__Fv
 * @address 0x17DEA0
 * @size 0x7A4
 */
void MainEditMode() {
    if (EdEventInfo.lighting_override != 0) {
        MGSetPLight(EdEventInfo.light_direction, EdEventInfo.light_color);
        MGSetAmbient(EdEventInfo.ambient_color);
    } else {
        EdSetLightParam(NowTime, edit_mode_lighting, EditMapInfo, SkyBackFrame);
    }
    pEditGround->StepWater();

    sceVu0FVECTOR wind;

    sceVu0CopyVector(wind, EditMapInfo->wind);
    if (EdEventInfo.wind[3] > 0.0f) {
        sceVu0CopyVector(wind, EdEventInfo.wind);
    }

    float left_x = GamePad.GetLXf2();
    float left_y = GamePad.GetLYf2();
    float camera_angle = MainCamera.GetAngle();
    sceVu0FVECTOR direction;

    direction[0] = wind[0] + (left_x * cosf(camera_angle) + left_y * sinf(camera_angle));
    direction[2] = wind[2] + (left_y * cosf(camera_angle) - left_x * sinf(camera_angle));
    direction[1] = wind[1];
    direction[3] = 0.0f;
    EdWind.SetDir(direction);
    EdWind.SetVelocity(wind[3]);
    EdWind.Step();
    Chara->unk_C98 = (int) &EdWind;
    for (int i = 0; i < 4; i++) {
        MotionParts[i].Step();
    }
    for (int i = 0; i < EditMapInfo->obj_anime_count; i++) {
        OBJ_ANIME_SEQ *anime = &EditMapInfo->work.obj_anime[i];

        if (anime->completion_flag <= 0 || EdGetMapFlag(anime->completion_flag) == 0) {
            ObjAnimePlay(anime);
        }
    }

    float saved_time = SaveData->GetNowTime();
    int clock_kept = 1;
    int old_hour = EdGetTime(NowTime);

    if (NowTime != SaveData->GetNowTime()) {
        clock_kept = 0;
    }
    SaveData->SetNowTime(NowTime);
    static int time_flag = 1;

    float step = 0.0011133334f;

    if (((int *) SaveData->GetConfigData())[3] == 0) {
        step /= 2.0f;
    }
    if (change_time_event != 0) {
        step = 0.0f;
    }
    if (time_flag != 0 && GameMode == 1) {
        SaveData->AddNowTime(step);
    }
    if (GamePad.Down2(0x4000) != 0) {
        time_flag = (u8) !time_flag;
    }
    if (!(NowTime < 12.0f)) {
        NowTime = 0.0f;
    }
    if (GamePad.On2(0x2000) != 0) {
        SaveData->AddNowTime(0.021f);
    }
    if (GamePad.On2(0x8000) != 0) {
        SaveData->AddNowTime(-0.02f);
    }

    int hour_set = 0;

    if (GamePad.Down2(0x1000) != 0) {
        NowTime = 1.0f + (float) (int) NowTime;
        if (!(NowTime < 12.0f)) {
            NowTime = 0.0f;
        }
        hour_set = 1;
        SaveData->SetNowTime(NowTime);
    }
    NowTime = SaveData->GetNowTime();
    if (EditMapInfo->time_stop != 0) {
        NowTime = 0.0f;
        SaveData->SetNowTime(saved_time);
    }
    int new_hour = EdGetTime(NowTime);

    if (clock_kept != 0 && time_flag != 0 && old_hour != new_hour && hour_set == 0) {
        if (MapNo < 4) {
            change_time_event = 1;
        } else {
            EdStartDrawDay();
        }
    }
    if (GameMode == 1) {
        ItemVolumeStep.LoopStep(60);
        if (sound_off_cnt <= 0) {
            if (EditMapInfo->time_stop == 0) {
                EdSetBgmVol(NowTime);
            } else {
                SndBgmPlay(0);
            }
            PlayAmbient(NowTime);
        }
    }

    int lit = EdGetTime(NowTime) == 2;

    static int parts = 0;

    int level;
    int day_on = 1;
    int night_on = 2;

    if (lit != 0) {
        day_on = night_on;
        night_on = 1;
    }

    char day_window[10] = "win1";
    char night_window[10] = "win2";

    for (level = 0; level < 4; level++) {
        CMapParts *obj = &ObjParts[parts];
        CFrame *frame = obj->frame[level];

        FrameOnOff(frame, day_window, day_on);
        FrameOnOff(frame, night_window, night_on);
    }
    parts++;
    if (!(parts < 24)) {
        parts = 0;
    }
    static int now_obj = 0;

    EDIT_OBJECT_TIMER *timers = EditMapInfo->work.object_timers.timers;

    for (int i = 0; i < 2; i++, now_obj++) {
        if (!(now_obj < EditMapInfo->object_timer_count)) {
            now_obj = 0;
        }

        EDIT_OBJECT_TIMER *timer = &timers[now_obj];

        if (timer->name[0] != '\0') {
            int on = 1;

            if (EdCheckTime(NowTime, timer->start_time, timer->end_time) == 0) {
                on = 2;
            }
            if (timer->object != NULL) {
                timer->object->FrameObjectOnOff(timer->name, on);
            } else if (timer->frame != NULL) {
                CFrame *found = timer->frame->SearchFrame(timer->name);

                if (found != NULL) {
                    found->attr.draw_on = on;
                }
            }
        }
    }
}
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
/**
 * Loads the interior a door leads to and places the player and camera in it.
 */
int GotoInterior(char *name, int entrance, int direction, ED_EVENT_PARAM *param, int kind) {
    char *suffix[5] = {"m", "e", "n", "m", "\0"};
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
        int forward = direction > 0;
        Chara->SetMotion(EdGetDoorMotion(param->point->linked_value, forward), 6);
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
    EdMoveCharaInfo.interior = 0;
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
                if (parts != NULL && parts->subtype == 1) {
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
/**
 * Moves the placement cursor across the ground with the pad.
 *
 * @mangled MoveEditCursor__Fv
 * @address 0x1800C0
 * @size 0xB40
 */
void MoveEditCursor() {
    float pos[4];
    float camera_distance[3] = {1000.0f, 2000.0f, 4000.0f};
    float camera_height[3] = {1000.0f, 1400.0f, 2000.0f};

    static int camera_dist_mode = 0;

    float cursor_scale[3] = {1.0f, 1.2f, 1.5f};

    if (MapNo == 4) {
        cursor_scale[0] *= 0.6f;
    }

    float step_z;
    float camera_angle;
    float step_x;
    float forward;
    float right;

    camera_angle = EditCamera.GetAngle();
    right = EdGetLXf(2);
    forward = EdGetLYf(2);

    sceVu0CopyVector(pos, ECursorFrame->position);

    int area_code = pEditGround->GetAreaCode(pos[0], pos[1], pos[2]);
    CEditArea *area = NULL;

    if (EdPadDown(0xF000, 2) != 0) {
        if (area_code >= 0) {
            area = pEditGround->areas[area_code];
        }
        if (area != NULL) {
            float unit = area->GetUnitSize();

            if (EdPadDown(0x1000, 2) != 0) {
                forward = -unit;
            }
            if (EdPadDown(0x4000, 2) != 0) {
                forward = unit;
            }
            if (EdPadDown(0x2000, 2) != 0) {
                right = unit;
            }
            if (EdPadDown(0x8000, 2) != 0) {
                right = -unit;
            }
        }
    }

    step_x = right * cosf(camera_angle) + forward * sinf(camera_angle);
    step_z = forward * cosf(camera_angle) - right * sinf(camera_angle);

    sceVu0CopyVector(pos, ECursorFrame->position);
    if (area != NULL) {
        if (pEditGround->GetAreaCode(pos[0] + step_x, pos[1], pos[2] + step_z) < 0) {
            step_x = 0.0f;
            step_z = 0.0f;
        }
    } else {
        float scale = cursor_scale[camera_dist_mode];

        step_x = 10.0f * step_x * scale;
        step_z = 10.0f * step_z * scale;
    }

    float move[4] = {step_x, 0.0f, step_z, 0.0f};

    LimitEditCursorPos(pos, move);
    if (move[0] != 0.0f || move[2] != 0.0f) {
        DrawPartsNameCount = 0;
    }
    if (area != NULL) {
        CVector3_f_ grid;

        area->GetGrid(&grid, pos[0], pos[1], pos[2]);

        float half = area->GetUnitSize() / 2.0f;

        pos[0] = grid.x + half;
        pos[2] = grid.z + half;
        ECursorFrame->SetPosition(pos);
    }
    MoveCamera(&EditCamera);
    EditCamera.SetDistance(camera_distance[camera_dist_mode]);
    EditCamera.SetHeight(camera_height[camera_dist_mode]);
    if (MapNo == 4) {
        EditCamera.SetDistance(0.2f * camera_distance[camera_dist_mode]);
        EditCamera.SetHeight(0.6f * camera_height[camera_dist_mode]);
        cursor_scale[0] *= 0.6f;
    }

    float scale = cursor_scale[camera_dist_mode];

    ECursorFrame->SetScale(scale, scale, scale);
    if (!(camera_dist_mode < 2)) {
        camera_dist_mode = 0;
    }
    ECursorFrame->SetPosition(pos[0], pos[1], pos[2]);
    float parts_pos[4];

    sceVu0CopyVector(parts_pos, ECursorFrame->position);
    if (3.141592f * (float) NowSelectAngle / 2.0f == NowCursorRotY) {
        if (EdPadDown(2, 2) != 0) {
            OldSelectAngle = NowSelectAngle;
            NowSelectAngle = NowSelectAngle - 1;
        } else if (EdPadDown(1, 2) != 0) {
            OldSelectAngle = NowSelectAngle;
            NowSelectAngle = NowSelectAngle + 1;
        }
    }
    if (NowSelectAngle > 2) {
        NowSelectAngle = -1;
    }
    if (NowSelectAngle < -1) {
        NowSelectAngle = 2;
    }
    NowCursorRotY = AngleInterpolate(NowCursorRotY, 3.141592f * (float) NowSelectAngle / 2.0f,
                                     0.1f, 0);

    int menu = EditMenuStatus.mode;

    OldFocusParts = NowFocusParts;
    NowFocusParts = pEditGround->GetParts(pos[0], pos[1], pos[2]);
    static int parts_no = 0;
    if ((u_int) EditMenuStatus.mode < 2 && EdPadDown(0x40, 2) != 0) {
        int sound = 13;

        if (MapNo == 4) {
            sound = 333;
        }

        int plot = pEditGround->SetMapParts(NowSelectParts, parts_pos[0], parts_pos[1],
                                            parts_pos[2], NowSelectAngle);

        if (plot >= 0) {
            pEditGround->SetBuildEffect(plot);
            SndSePlay(sound, -1, 0);

            EDITPARTS_INFO *info = EditPartsInfo.GetPartsInfo(NowSelectParts);

            if (EditMenuStatus.mode == 1 ||
                (info != NULL && info->stock > 0 && info->placed == info->stock)) {
                menu = 3;
                NowSelectParts = -1;
                NowSelectAngle = 0;
                OldSelectAngle = 0;
            }
        }
    }
    if (EditMenuStatus.mode == 3) {
        int deleted_parts;
        int deleted_angle;

        if (EdPadDown(0x80, 2) != 0 &&
            pEditGround->DeleteMapParts(&deleted_parts, &deleted_angle, parts_pos[0],
                                        parts_pos[1], parts_pos[2]) >= 0) {
            EdSePlay((ED_SOUND_ID) 0xE, -1);
        }
        pEditGround->SetFocusParts(parts_pos[0], parts_pos[1], parts_pos[2]);
        if (EdPadDown(0x40, 2) != 0) {
            int taken_parts;
            int taken_angle;

            if (NowFocusParts != NULL) {
                int width = NowFocusParts->GetWidth();

                if (width * NowFocusParts->GetHeight() > 0) {
                    NowFocusParts->GetPosition(NowCursorPos);
                    NowFocusParts->GetPosition(NowPartsCursorPos);
                    NowPartsCursorPos[1] = pEditGround->GetAlt(pos[0], pos[1], pos[2]);

                    float alt = pos[1];

                    NowFocusParts->GetPosition(pos);
                    pos[1] = alt;
                    NowCursorPos[1] = alt;
                }
            }
            if (pEditGround->DeleteMapParts(&taken_parts, &taken_angle, parts_pos[0],
                                            parts_pos[1], parts_pos[2]) >= 0) {
                menu = 1;
                NowSelectParts = taken_parts;
                NowSelectAngle = taken_angle;
                NowCursorRotY = 3.141592f * (float) taken_angle / 2.0f;
                OldSelectAngle = taken_angle;
                EditMenuStatus.parts = taken_parts;
            }
        }
    }
    EditMenuStatus.mode = menu;
    if (GamePad.Down2(0x40) != 0) {
        pEditGround->Clear();
    }
    if (GamePad.Down2(0x20) != 0) {
        pEditGround->Save(NULL);
    }
    if (GamePad.Down2(0x10) != 0) {
        pEditGround->Load(NULL);
    }
    if (pEditGround->GetAreaCode(pos[0], pos[1], pos[2]) >= 0) {
        if (pos[1] < pEditGround->GetAlt(pos[0], pos[1], pos[2])) {
            pos[1] = pEditGround->GetAlt(pos[0], pos[1], pos[2]);
        }
    }
    ECursorFrame->SetPosition(pos[0], pos[1], pos[2]);
    sceVu0CopyVector(NextCursorPos, pos);
    if (NowFocusParts != NULL) {
        if (NowFocusParts->GetWidth() > 1) {
            NowFocusParts->GetHeight();
        }
        EditNameMes.mes_no[0] = GetAtraMsgNo(MapNo, NowFocusParts->parts_no);
        if (OldFocusParts != NowFocusParts) {
            EditNameMes.MakeMesWin(-1);
        }
        if (DrawPartsNameCount > 0) {
            EditNameMes.MakeMesWin(-1);
            PartsNameNum = -1;
        } else {
            EditNameMes.MakeMesWin(1);
            PartsNameNum = EditNameMes.text_columns;
        }
    } else {
        EditNameMes.MakeMesWin(-1);
    }
    DrawPartsNameCount--;
    if (DrawPartsNameCount < 0) {
        DrawPartsNameCount = 0;
    }
    EditCamera.FollowOn();
    EditCamera.SetFollow(pos[0], pos[1], pos[2]);
    if (EditMenuStatus.mode == -1) {
        float walk[4];

        EdEditMainHelpMes(CheckEditToWalk(walk));
    }
    if ((u_int) EditMenuStatus.mode < 2) {
        EdEditBuildHelpMes(NowSelectParts);
    }
    if (EditMenuStatus.mode == 3) {
        EdEditMoveHelpMes();
    }
}
/**
 * Enters the editor map's textures once they have been read.
 *
 * @mangled LoadTexture__Fv
 * @address 0x180C00
 * @size 0x878
 */
int LoadTexture() {
    int entered;
    int image;
    u_long128 *buffer = (u_long128 *) (DataBuffer__2.base + DataBuffer__2.used * 16);

    TexManager.Initialize(0x3FE0);
    TexManager.SetBuffer(buffer, 0x4E200);

    LOADTEXTURE_INFO2 mes_blocks[8] = {
        {"#mes_frame_buff#640#448#4", 0x1A, 0},
        {"#fukidashibase#640#224#4", 0x1A, 0},
        {"#fontbase#512#256#1", 0x1A, 0},
        {"meswin/gaiji.img", 0x1A, 0},
        {"meswin/fuki256.img", 0x1A, 0},
        {"meswin/syst04.img", 0x1A, 0},
    };

    LoadFile("meswin/mes_tex.pak", read_buffer, NULL);
    wait_now_loading_vsync();
    mes_blocks[3].name = (char *) GetPackFile(read_buffer, "gaiji.img", NULL);
    mes_blocks[4].name = (char *) GetPackFile(read_buffer, "fuki256.img", NULL);
    mes_blocks[5].name = (char *) GetPackFile(read_buffer, "syst04.img", NULL);
    TexManager.LoadTextureBlock(-1, mes_blocks);

    char system_path[64] = "gedit/system/esys.pak";

    if (LanguageCode > 0) {
        sprintf(system_path, "gedit/system/esys_%d.pak", LanguageCode);
    }
    LoadFile(system_path, read_buffer, NULL);
    wait_now_loading_vsync();
    TexManager.EnterIMGFile((u_char *) GetPackFile(read_buffer, "e01t02.img", NULL), -1, 0, 0);
    TexManager.EnterIMGFile((u_char *) GetPackFile(read_buffer, "cursor.img", NULL), -1, 0, 0);

    LOADTEXTURE_INFO2 blocks[64] = {
        {"#water_buff#640#224#4", 0x15, 0},
        {"#shadow_buff#640#224#4", 0x16, 0},
        {"#blender#640#224#4", 0x18, 0},
        {"#font_buff#640#224#4", 0x1F, 0},
        {"img/system.img", 0x14, 0},
        {"img/pause.img", 0x14, 0},
        {"s_eff.img", 0x14, 0},
        {"whatsday.img", 0x14, 0},
        {"img/ankfont.img", 0x1F, 0},
        {"#frame_image#640#448#4", 0x13, 0},
    };

    blocks[4].name = (char *) GetPackFile(read_buffer, "system.img", NULL);
    blocks[5].name = (char *) GetPackFile(read_buffer, "pause.img", NULL);
    blocks[6].name = (char *) GetPackFile(read_buffer, "s_eff.img", NULL);
    blocks[7].name = (char *) GetPackFile(read_buffer, "whatsday.img", NULL);
    blocks[8].name = (char *) GetPackFile(read_buffer, "ankfont.img", NULL);
    TexManager.LoadTextureBlock(-1, blocks);
    wait_now_loading_vsync();

    CFrameAttr cursor_attr;

    cursor_attr.unk_14 = 1;
    CharaCursor0 = LoadMDSFile(GetPackFile(read_buffer, "cursor01.mds", NULL), &EtcDataBuffer, 0,
                               NULL, NULL);
    CharaCursor0->SetAttr(cursor_attr, 1, 0x200);
    CharaCursor1 = LoadMDSFile(GetPackFile(read_buffer, "cursor02.mds", NULL), &EtcDataBuffer, 0,
                               NULL, NULL);
    CharaCursor1->SetAttr(cursor_attr, 1, 0x200);

    CharaCursor1->SetScale(2.5f, 2.5f, 2.5f);
    CharaCursor2 = LoadMDSFile(GetPackFile(read_buffer, "bic.mds", NULL), &EtcDataBuffer, 0,
                               NULL, NULL);
    CharaCursor2->SetAttr(cursor_attr, 1, 0x200);
    TreasureCursor = LoadMDSFile(GetPackFile(read_buffer, "ibox_0.mds", NULL), &EtcDataBuffer, 0,
                                 NULL, NULL);
    TreasureCursorOpen = LoadMDSFile(GetPackFile(read_buffer, "ibox_1.mds", NULL), &EtcDataBuffer,
                                     0, NULL, NULL);

    CFrameAttr box_attr;

    box_attr.unk_08 = 0;
    box_attr.fog_enable = 1;
    if (TreasureCursor != NULL) {
        TreasureCursor->SetAttr(box_attr, 1, 0x44);
    }
    if (TreasureCursorOpen != NULL) {
        TreasureCursorOpen->SetAttr(box_attr, 1, 0x44);
    }
    SystemEffect[0].texture = TexManager.GetTexture("s_ef01", -1);

    char stay_path[128];
    LOADTEXTURE_INFO map_blocks[64];
    CRect_i_ effect_rect;

    effect_rect.x = 0;
    effect_rect.y = 0;
    effect_rect.width = 0x20;
    effect_rect.height = 0x20;
    SystemEffect[0].texel = effect_rect;
    SystemEffect[0].alpha_blend = 1;
    SystemEffect[0].disable_z_write = 1;

    GetEditDataDir(stay_path);
    strcat(stay_path, "img.pak");

    u_int *menu_data = (u_int *) (EdNPCBuffer.base + EdNPCBuffer.used * 16);

    LoadFileMenuData("stayframe.img", menu_data);
    wait_now_loading_vsync();
    TexManager.EnterFixTextureZ((u_char *) menu_data);
    StayTexture = TexManager.GetTexture("stayframe", -1);

    if (LoadFile2(stay_path, menu_data, NULL, 0) != 0) {
        wait_now_loading_vsync();

        entered = 0;
        image = 0;
        while (EditMapInfo->images[image].name[0] != '\0') {
            blocks[entered].name =
                (char *) GetPackFile(menu_data, EditMapInfo->images[image].name, NULL);
            blocks[entered].block_no = EditMapInfo->images[image].type;
            blocks[entered].unk_08 = EditMapInfo->images[image].number;
            entered++;
            image++;
        }
        blocks[entered].name = NULL;
        blocks[entered].block_no = 0;
        blocks[entered].unk_08 = 0;
        TexManager.LoadTextureBlock(-1, blocks);
        TexAnime.Initialize(&TexAnimeData, 0x40);

        int anime_size;
        char *anime = (char *) GetPackFile(menu_data, "texanime.cfg", &anime_size);

        if (anime != NULL) {
            for (int i = 0; i < 64; i++) {
                (&TexAnimeData)[i].Initialize();
            }
            TexAnime.LoadCFGFile(anime, anime_size);
        }
    } else {
        TexAnime.Initialize(NULL, 0);

        entered = 0;
        image = 0;
        while (EditMapInfo->images[image].name[0] != '\0') {
            map_blocks[entered].name = EditMapInfo->images[image].name;
            map_blocks[entered].block_no = EditMapInfo->images[image].type;
            map_blocks[entered].unk_08 = EditMapInfo->images[image].number;
            image++;
            entered++;
        }
        map_blocks[entered].name = EditMapInfo->images[image].name;
        map_blocks[entered].block_no = EditMapInfo->images[image].type;
        map_blocks[entered].unk_08 = EditMapInfo->images[image].number;
        TexManager.LoadTextureBlock(-1, map_blocks, read_buffer);
    }
    TexManager.buffer_size = TexManager.buffer_used;
    DataBuffer__2.Alloc((int) (TexManager.buffer + TexManager.buffer_size - buffer) + 16);
    DataBuffer__2.Align64();
    return 0;
}
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
/**
 * Reads the editor map's ground, areas and grid.
 *
 * @mangled LoadGroundData__Fv
 * @address 0x1815E0
 * @size 0xDA8
 */
#ifdef NON_MATCHING
void LoadGroundData() {
    parts_read_buffer = read_buffer;

    char pack_path[64];

    GetEditDataDir(pack_path);
    strcat(pack_path, "mds.pak");
    LoadPackFile(pack_path, parts_read_buffer, NULL);
    wait_now_loading_vsync();

    u_int *data;
    OBJ_ANIME_SEQ *anime = EditMapInfo->work.obj_anime;
    EDIT_EFFECT_INFO *effects = EditMapInfo->work.effects.second;
    EDIT_OBJECT_TIMER *timers = EditMapInfo->work.object_timers.timers;
    ED_EVENT_POINT *points = EditMapInfo->work.events.points;

    pEditGround->Initialize();
    pEditGround->map_no = NowEditMap;

    char *sun_names[4] = {"sun1", "sun2", "sun3", "moon"};

    for (int i = 0; i < 4; i++) {
        SkyFrame[i] = NULL;

        CFrameAttr layer_attr;

        layer_attr.unk_54 = 0;
        if (EditMapInfo->sky_layers[i].name[0] != '\0') {
            data = (u_int *) EdLoadFile(EditMapInfo->sky_layers[i].name);

            SkyFrame[i] = LoadMDSFile(data, &DataBuffer__2, 0, NULL, NULL);
            SkyFrame[i]->SetAttr(layer_attr, 1, 0x1000);
            for (int j = 0; j < 8; j++) {
                short no = EditMapInfo->sky_layers[i].obj_anime[j];

                if (no > 0) {
                    InitObjAnime(SkyFrame[i], &anime[no]);
                }
            }
        }
        SunFrame[i] = NULL;
        if (EditMapInfo->sun_layers[i].name[0] != '\0') {
            data = (u_int *) EdLoadFile(EditMapInfo->sun_layers[i].name);

            SunFrame[i] = LoadMDSFile(data, &DataBuffer__2, 0, NULL, NULL);
            SunFrame[i]->SetAttr(layer_attr, 1, 0x1000);
        }
        if (SunFrame[i] != NULL) {
            sceVu0FMATRIX world;

            sceVu0UnitMatrix(world);
            SunFrame[i]->SetTransMatrix(world);
            SunFrame[i]->SetRotation(0.5f, 0.0f, 0.0f);
            SunFrame[i] = SunFrame[i]->SearchFrame(sun_names[i]);
        }
    }
    SkyBackFrame = NULL;
    if (EditMapInfo->sky_layers[4].name[0] != '\0') {
        data = (u_int *) EdLoadFile(EditMapInfo->sky_layers[4].name);

        CFrameAttr back_attr;

        back_attr.unk_54 = 0;
        back_attr.unk_14 = 1;
        SkyBackFrame = LoadMDSFile(data, &DataBuffer__2, 6, NULL, NULL);
        SkyBackFrame->SetAttr(back_attr, 1, 0x1200);
    }
    for (int i = 0; i < 4; i++) {
        EDIT_AREA_INFO *info = &EditMapInfo->parts_work.edit_areas[i];

        pEditGround->areas[i] = NULL;
        if (info->name[0] != '\0') {
            data = (u_int *) EdLoadFile(info->name);
            EditArea[i].SetMapInfo(NowEditMap, i);
            EditArea[i].SetSize(info->width, info->height, info->unk_48, info->unk_4c);
            EditArea[i].SetOffset(info->unk_50 - 0.01f * (float) info->width, info->unk_54,
                                  info->unk_58 - 0.01f * (float) info->height);
            EditArea[i].SetGridFrame(LoadMDSFile(data, &DataBuffer__2, 6, NULL, NULL));

            CFrameAttr grid_attr;

            grid_attr.fog_enable = 1;
            EditArea[i].GetGridFrame()->SetAttr(grid_attr, 1, 0x40);
            pEditGround->areas[i] = &EditArea[i];
        }
    }
    if (MapNo < 6) {
        data = (u_int *) EdLoadFile("gedit/e01/mds/e01a03_0.mds");

        pEditGround->cursor.pieces[0] = LoadMDSFile(data, &DataBuffer__2, 0, NULL, NULL);

        data = (u_int *) EdLoadFile("gedit/e01/mds/e01a04_0.mds");

        pEditGround->cursor.pieces[1] = LoadMDSFile(data, &DataBuffer__2, 0, NULL, NULL);

        data = (u_int *) EdLoadFile("gedit/e01/mds/e01a05_0.mds");

        pEditGround->cursor.pieces[2] = LoadMDSFile(data, &DataBuffer__2, 0, NULL, NULL);
        pEditGround->cursor.area = 2;
    } else {
        pEditGround->cursor.pieces[0] = NULL;
        pEditGround->cursor.pieces[1] = NULL;
        pEditGround->cursor.pieces[2] = NULL;
    }
    wait_now_loading_vsync();
    for (int i = 0; i < 4; i++) {
        EDIT_MOTION_PARTS_INFO *info = &EditMapInfo->motion_parts[i];

        MotionParts[i].Initialize();
        if (info->name[0] != '\0') {
            data = (u_int *) EdLoadFile(info->name);
            MotionParts[i].InitializeTexAnime(&TexAnimeData, 64);
            MotionParts[i].LoadPackData2(data, "info.cfg", &DataBuffer__2, i + 0x1B,
                                         &DataBuffer__2, 0);
            MotionParts[i].SetPosition(info->values[0], info->values[1], info->values[2]);
            MotionParts[i].SetRotation(info->values[3], info->values[4], info->values[5]);
        }
    }
    scn_data = (u_int *) (EdNPCBuffer.base + EdNPCBuffer.used * 16);

    char scene_path[64];
    int scene_size;

    GetEditDataDir(scene_path);
    strcat(scene_path, EditMapInfo->scene_name);
    if (LoadFile2(scene_path, (void *) scn_data, &scene_size, 0) == 0) {
        scn_data = NULL;
        scene_size = 0;
    }
    if (scn_data != NULL) {
        parts_read_buffer = (u_int *) ((char *) scn_data + (((scene_size >> 6) + 1) << 6));
    } else {
        parts_read_buffer = read_buffer;
    }
    while (check_now_loading() == 0) {
    }
    EditPartsInfo.Initialize(NowEditMap);
    LoadObjectParts();
    pEditGround->plot_parts = ObjParts;
    pEditGround->river_parts = RiverParts;
    pEditGround->road_parts = RoadParts;
    pEditGround->parts_info = &EditPartsInfo;
    ((float *) ObjParts)[0x828] = 490.0f;

    LOADED_PARTS built[64];

    for (int i = 0; i < 64; i++) {
        built[i].name[0] = '\0';
    }

    int found = 0;

    for (int i = 0; ; i++) {
        MAP_PARTS_INFO *info = &EditMapInfo->map_objects[i];

        if (info->name[0][0] == '\0' && info->name[1][0] == '\0' &&
            info->name[2][0] == '\0' && info->name[3][0] == '\0') {
            break;
        }

        CMapParts *parts = &pEditGround->parts[i];

        parts->Initialize();

        u_int *pts = SearchPTS(scn_data, info->name[0]);

        if (pts != NULL) {
            CMapParts *shared = NULL;

            for (int j = 0; j < found; j++) {
                if (strcmp(info->name[0], built[j].name) == 0) {
                    shared = built[j].parts;
                    break;
                }
            }
            LoadPTS(parts, pts, info, anime, effects, timers, points, shared);

            char *base = info->name[0];
            char letter;

            for (char *c = info->name[0]; (letter = *c) != '\0'; c++) {
                if (letter == '/') {
                    base = c + 1;
                }
            }
            if (strcmp(base, "e02c13") == 0) {
                CFrameAttr door_attr;

                door_attr.fog_enable = 1;

                CFrame *door = parts->unk_104;

                if (door != NULL) {
                    door = door->SearchFrame("cube1");
                }
                if (door != NULL) {
                    door->SetAttr(door_attr, 1, 0x40);
                }
            }

            sceVu0FVECTOR position = {info->position[0], info->position[1], info->position[2],
                                      1.0f};

            parts->SetPosition(position);
            parts->SetRotation(info->rotation[0], info->rotation[1], info->rotation[2]);
            if (shared == NULL) {
                strcpy(built[found].name, info->name[0]);
                built[found].parts = parts;
                found++;
            }
        } else {
            LoadPTS(parts, info, anime, effects, timers, points);

            sceVu0FVECTOR position = {info->position[0], info->position[1], info->position[2],
                                      1.0f};

            parts->SetPosition(position);
            parts->SetRotation(info->rotation[0], info->rotation[1], info->rotation[2]);
        }

        int kind = info->kind;

        parts->handle = i;
        parts->unk_0E4 = kind;
    }
    for (int i = 0; i < 4; i++) {
        EDIT_WATER_INFO *info = &EditMapInfo->water_surfaces[i];

        if (info->type > 0) {
            CGroundWater *surface = &pEditGround->water_surfaces[i];
            CWater *water = &pEditGround->water_surfaces[i].water;
            sceVu0FVECTOR near_left = {info->corner_a[0], info->corner_a[1], info->corner_a[2],
                                       1.0f};
            sceVu0FVECTOR near_right = {info->corner_b[0], info->corner_a[1], info->corner_a[2],
                                        1.0f};
            sceVu0FVECTOR far_left = {info->corner_a[0], info->corner_a[1], info->corner_c[2],
                                      1.0f};
            sceVu0FVECTOR far_right = {info->corner_b[0], info->corner_a[1], info->corner_c[2],
                                       1.0f};

            surface->draw = 1;
            strcpy(surface->name, info->name);
            surface->parts_no = info->parts_no;
            sceVu0CopyVector(surface->offset, info->corner_c);
            for (int j = 0; j < 3; j++) {
                (&surface->follow_x)[j] = (&info->follow_x)[j];
            }
            for (int j = 0; j < 4; j++) {
                sceVu0CopyVector((float *) &surface->ripples[j], &info->wave[j].x);
            }
            water->SetVertex(near_left, near_right, far_left, far_right);
            water->frame.SetPosition(info->corner_c);
            water->SetSize(info->type, info->number, &DataBuffer__2);
            water->SetParam(info->texture_scroll[0], info->texture_scroll[1],
                            info->texture_scroll[2], info->texture_scroll[3]);
            water->SetColor(info->unk_50, info->unk_54, info->unk_58, 0x80);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop", LoadGroundData__Fv);
#endif
/**
 * Builds every map part the script placed -- the objects, then the roads and
 * rivers -- and hands a part that names a model already loaded the part that
 * loaded it, so the two share one set of frames.
 */
void LoadObjectParts(void) {
    char name_buffer[7][0x40];
    char *names[7];
    struct LOADED_PARTS {
        char name[0x20];
        CMapParts *parts;
    } loaded[64];

    OBJ_ANIME_SEQ *anime = EditMapInfo->work.obj_anime;
    EDIT_EFFECT_INFO *effects = EditMapInfo->work.effects.second;
    EDIT_OBJECT_TIMER *timers = EditMapInfo->work.object_timers.timers;
    ED_EVENT_POINT *points = EditMapInfo->work.events.points;

    for (int i = 0; i < 7; i++) {
        names[i] = name_buffer[i];
        *names[i] = '\0';
    }

    int i;
    int river = 0;
    int road = 0;

    for (i = 0; i < 64; i++)
        loaded[i].name[0] = '\0';

    int count = 0;
    for (i = 0; i < 46; i++) {
        CMapParts *shadow = NULL;
        int found = 0;
        CMapParts *parts;
        MAP_PARTS_INFO *info = &EditMapInfo->parts_work.general.parts[i];
        EDITPARTS_INFO *plot = NULL;
        int index = i;
        int slot;

        if (i >= 24) {
            info = &EditMapInfo->parts_work.roads.parts[road];
            if (i >= 30)
                info = &EditMapInfo->parts_work.rivers.parts[river];
            switch (info->subtype) {
            case 2:
            case 3:
                parts = &RiverParts[river];
                slot = river;
                river++;
                break;
            case 1:
                parts = &RoadParts[road];
                slot = road;
                road++;
                break;
            default:
                continue;
            }
        } else {
            parts = &ObjParts[i];
            plot = EditPartsInfo.GetPartsInfo(i);
            slot = i;
        }

        for (int j = 0; j < count; j++) {
            if (strcmp(info->name[0], loaded[j].name) == 0) {
                shadow = loaded[j].parts;
                break;
            }
        }

        u_int *archive = SearchPTS(scn_data, info->name[0]);
        if (archive != NULL)
            found = 1;
        parts->Initialize();
        if (plot == NULL) {
            for (int j = 0; j < 24; j++) {
                if (info->subtype == ObjParts[j].subtype) {
                    index = j;
                    break;
                }
            }
        }
        int kind = info->kind;
        parts->handle = slot;
        parts->unk_0E4 = kind;
        parts->parts_no = index;
        parts->subtype = info->subtype;
        parts->unk_11C = info->unk_264;
        parts->unk_114 = info->parts_no;

        EPARTS_INFO_HEADER *header;
        if (found != 0) {
            header = LoadPTS(parts, archive, info, anime, effects, timers, points, shadow);
        } else {
            if (plot != NULL) {
                header = (EPARTS_INFO_HEADER *) (EPartsInfoBuff.base + EPartsInfoBuff.used * 16);
                EPartsInfoBuff.Alloc((EdInitToEPInfo(
                    (INIT_PARTSINFO *) &EditMapInfo->parts_work.parts_defs.defs[i], header) >> 4) + 1);
            }
            LoadPTS(parts, info, anime, effects, timers, points);
        }
        if (plot != NULL)
            EditPartsInfo.Initialize(i, header);
        parts->info = EditPartsInfo.GetPartsInfo(index);
        if (parts->frame[3] != NULL) {
            parts->unk_0FC = (int) parts->frame[3];
        } else if (parts->frame[2] != NULL) {
            parts->unk_0FC = (int) parts->frame[2];
        } else if (parts->frame[1] != NULL) {
            parts->unk_0FC = (int) parts->frame[1];
        } else if (parts->frame[0] != NULL) {
            parts->unk_0FC = (int) parts->frame[0];
        }
        if (shadow == NULL) {
            strcpy(loaded[count].name, info->name[0]);
            loaded[count].parts = parts;
            count++;
        }
    }
}
/**
 * Builds one map part from its archive entry, sharing the models of a part already
 * built.
 *
 * @mangled LoadPTS__FP9CMapPartsPUiP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINTP9CMapParts
 * @address 0x1828B0
 * @size 0x754
 */
#ifdef NON_MATCHING
EPARTS_INFO_HEADER *LoadPTS(CMapParts *parts, unsigned int *archive, MAP_PARTS_INFO *info,
                            OBJ_ANIME_SEQ *anime, EDIT_EFFECT_INFO *effects,
                            EDIT_OBJECT_TIMER *timers, ED_EVENT_POINT *points,
                            CMapParts *shared) {
    EPARTS_INFO_HEADER *source = (EPARTS_INFO_HEADER *) ((char *) archive + archive[1]);
    EPARTS_INFO_HEADER *header =
        (EPARTS_INFO_HEADER *) EPartsInfoBuff.Alloc((source->data_size >> 4) + 1);

    memcpy(header, source, source->data_size);
    header->cell = (u8 *) header + (int) source->cell;
    for (int i = 0; i < 6; i++) {
        if (header->element_name[i] != NULL) {
            header->element_name[i] = (char *) header + (int) source->element_name[i];
        }
    }
    header->func = (EPARTS_FUNC_DATA *) ((char *) header + (int) source->func);

    EPARTS_FUNC_DATA *walk = header->func;

    for (int i = 0; i < header->func_count; i++) {
        walk++;
    }
    parts->unk_10C = header->func_count;
    parts->unk_110 = (int) header->func;
    if (shared != NULL) {
        CopyCMapParts(parts, shared, &DataBuffer__2);
    } else {
        u_int *names[9] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};

        if (((EPARTS_ARCHIVE *) archive)->size_58 > 0) {
            names[0] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_48);
        } else {
            return header;
        }
        if (((EPARTS_ARCHIVE *) archive)->size_5c > 0) {
            names[1] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_4c);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_60 > 0) {
            names[2] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_50);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_64 > 0) {
            names[3] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_54);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_94 > 0) {
            names[4] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_90);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_7c > 0) {
            names[5] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_78);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_ac > 0) {
            names[6] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_a8);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_dc > 0) {
            names[7] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_d8);
        }
        if (((EPARTS_ARCHIVE *) archive)->size_c4 > 0) {
            names[8] = (u_int *) ((char *) archive + ((EPARTS_ARCHIVE *) archive)->offset_c0);
        }
        LoadMapObject(parts, names, &DataBuffer__2);
    }

    CFrame *frames[9];
    CBoxVu0 bound;
    CBoxVu0 part_bound;

    for (int i = 0; i < 9; i++) {
        frames[i] = NULL;
    }
    for (int i = 0; i < 4; i++) {
        frames[i] = (CFrame *) parts->frame[i];
    }
    frames[4] = parts->shadow_frame;
    frames[5] = parts->GetCollisionFrame();
    frames[6] = parts->shade_frame;
    frames[7] = parts->unk_104;

    CFrame *shadow = parts->unk_0DC;

    if (shadow == NULL) {
        shadow = NULL;
    } else {
        shadow->SetPosition(parts->pos[0], parts->pos[1], parts->pos[2]);
        parts->unk_0DC->SetRotation(parts->rotation.x, parts->rotation.y, parts->rotation.z);
        shadow = parts->unk_0DC;
    }
    frames[8] = shadow;
    if (frames[0] == NULL) {
        return NULL;
    }

    frames[0]->GetBoundBox(&bound, 1);

    CFrame *collision = parts->GetCollisionFrame();

    if (collision != NULL) {
        collision->GetBoundBox(&part_bound, 1);
        VectorMaxMin(bound.max, bound.min, bound.max, bound.min, part_bound.max, part_bound.min);
    }

    CFrame *shade = parts->unk_0DC;

    if (shade == NULL) {
        shade = NULL;
    } else {
        shade->SetPosition(parts->pos[0], parts->pos[1], parts->pos[2]);
        parts->unk_0DC->SetRotation(parts->rotation.x, parts->rotation.y, parts->rotation.z);
        shade = parts->unk_0DC;
    }
    if (shade != NULL) {
        shade->GetBoundBox(&part_bound, 1);
        VectorMaxMin(bound.max, bound.min, bound.max, bound.min, part_bound.max, part_bound.min);
    }
    memcpy(&parts->bound, &bound, sizeof(CBoxVu0));
    for (int i = 0; i < 8; i++) {
        short no = info->anime[i];

        if (no > 0) {
            InitObjAnime(frames, &anime[no]);
        }
    }
    EditMapInfo->event_count +=
        EdInitEventPoint(parts, info->events, (EPARTS_FUNC_DATA *) header->func,
                         header->func_count, points, 0x100);

    EPARTS_FUNC_DATA *func = header->func;

    for (int i = 0; i < header->func_count; i++, func += 1) {
        if (func->completion_flag > 0 && SaveData->GetMapInitFlag(MapNo, func->completion_flag) == 0) {
            SaveData->SetMapInitFlag(MapNo, func->completion_flag, 1);
            SaveData->SetMapFlag(MapNo, func->completion_flag, (u8) !func->unk_28);
        }
        EnterPartsEffect(parts, func, effects, 0x40);

        int count = EditMapInfo->obj_anime_count;

        if (count < 128 && InitObjAnime(frames, 9, func, &anime[count]) != 0) {
            EditMapInfo->obj_anime_count++;
        }
        if (func->kind == 9) {
            int timer_no = EditMapInfo->object_timer_count++;
            EDIT_OBJECT_TIMER *timer = &timers[timer_no];

            if (EditMapInfo->object_timer_count < 129) {
                strcpy(timer->name, func->frame_name);
                timer->start_time = ConvertTime(func->start_time);
                timer->end_time = ConvertTime(func->end_time);
                timer->object = parts;
            } else {
                continue;
            }
        }
        if (func->kind == 1) {
            pEditGround->people[pEditGround->people_count++] = func;
            func->parts = parts;
        }
    }

    sceVu0FVECTOR position = {source->position[0], source->position[1], source->position[2],
                              1.0f};

    parts->SetPosition(position);
    parts->SetRotation(source->rotation[0], source->rotation[1], source->rotation[2]);
    return header;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop", LoadPTS__FP9CMapPartsPUiP14MAP_PARTS_INFOP13OBJ_ANIME_SEQP16EDIT_EFFECT_INFOP17EDIT_OBJECT_TIMERP14ED_EVENT_POINTP9CMapParts);
#endif
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

/**
 * Draws one textured rectangle rotated about a caller-supplied pivot.
 */
void set2DSpriteRot(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen,
                    const CRect_i_ &texel, int pivot_x, int pivot_y, float angle,
                    unsigned char alpha) {
    float x[4];
    float y[4];
    sceGsTest test;
    sceGsZbuf zbuf;
    float q;
    int i;

    q = 1.0f;
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, 0x41);
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, SCE_GS_SET_PRIM(4, 0, 1, 0, 1, 1, 1, 0, 0));
    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = SCE_GS_ALWAYS;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;

    x[0] = x[2] = pivot_x * -16;
    x[1] = x[3] = ((screen.width - pivot_x) << 4) - 1;
    y[0] = y[1] = pivot_y * -16;
    y[2] = y[3] = ((screen.height - pivot_y) << 4) - 1;
    for (i = 0; i < 4; i++) {
        float turned_x = y[i] * cosf(angle) + x[i] * sinf(angle);
        float turned_y = x[i] * cosf(angle) - y[i] * sinf(angle);

        x[i] = (int) turned_x + (screen.x << 4) + 27648;
        y[i] = (int) (0.5f * turned_y) + (screen.y << 3) + 30976;
    }

    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &zbuf);
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, alpha, *(u_int *) &q));
    sceVif1PkAddGsAD(packet, SCE_GS_TEX0_1, texture->tex0);
    sceVif1PkAddGsAD(packet, SCE_GS_UV, SCE_GS_SET_UV(texel.x << 4, texel.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x[0], y[0], 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     SCE_GS_SET_UV((texel.x + screen.width) << 4, texel.y << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x[1], y[1], 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     SCE_GS_SET_UV(texel.x << 4, (texel.y + texel.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x[2], y[2], 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_UV,
                     SCE_GS_SET_UV((texel.x + texel.width) << 4, (texel.y + texel.height) << 4));
    sceVif1PkAddGsAD(packet, SCE_GS_XYZF2, SCE_GS_SET_XYZF2(x[3], y[3], 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}
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
