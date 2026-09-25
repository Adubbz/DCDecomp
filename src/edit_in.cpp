#include "common.h"

#include <libvu0.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "boxvu0.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "collision.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "edit_in.hpp"
#include "editground.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "editpartsinfo.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mainselect.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "npcharacter.hpp"
#include "rect.hpp"
#include "scriptinterpreter.hpp"
#include "texture.hpp"
#include "water.hpp"

#ifdef NON_MATCHING // draft includes
#include <cmath>

#include "battlemenu.hpp"
#include "clsmes.hpp"
#include "dispctrl.hpp"
#include "ebattle.hpp"
#include "edit.hpp"
#include "effectgroup.hpp"
#include "effectmacro.hpp"
#include "gamemode.hpp"
#include "gamepad.hpp"
#include "menu_misc.hpp"
#include "objanime.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sysmes.hpp"
#endif

/* The arenas the interior carves the read buffer into. */
extern CDataAlloc2<1> EdWorkBuffer;
extern CDataAlloc2<1> EdMenuBuffer;

/* The keywords an interior's info script may use, and what each one does. */
extern TAG_PARAM Command[15];
extern void (*CommandExe[15])(void **);

/* Directory that names in the info script are relative to. */
extern char CurrentDir[0x80];

/* Records the info script has filled in so far, and whether it asked for debug drawing. */
extern int npc_count;
extern int objanime_list;
extern int effect_list;
extern int debug;
extern int motion_parts_list;
extern int water_list;
extern EDIT_WATER_INFO *water_info;

/* Numbers of object animations and effects the interior uses. */
extern int obj_anime_num;
extern int effect_num;

/* The interior's parts, how many it has, and the function points they define. */
extern CMapParts InteriorParts[10];
extern int parts_num;
extern EPARTS_FUNC_DATA *func_point;
extern int func_num;

/* The player's character in the interior, and the villagers who can stand in it. */
extern CCharacter *Chara;
extern CNPCharacter EdVillager[10];

/* Frame of the interior's animated texture, and the clock that advances it. */
extern int setTexAnimCnt;
extern float setTexAnimCntf;

/* Map jump the player arrives through when entering an interior. */
extern int EdInteriorJumpID;

#ifdef NON_MATCHING // draft declarations
/* Where the camera sits for one camera marker of the interior, and the box the player must stand in. */
struct INTERIOR_CAMERA {
    u8 unk_000[0x60];
    CFrame frame;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    int link_id;
    u8 unk_2e4[0xC];
};

extern int EdInteriorDoorSound;
extern int EdInteriorStartEvent;
extern int EdInteriorPartsNo;
extern char EdInteriorName[];
extern int EdDebugCameraFlag;
extern int EdDebugEventEnable;
extern int EdDrawOffFlag;
extern int EdDrawOffMapShadow;
extern int EdPauseFlag;
extern int MenuMapJumpMode;
extern CEffectGroup EdEffectGroup;
extern ED_MOVE_CHARA_INFO EdMoveCharaInfo;

static int GameMode;
static float NowTime;
static CCameraFollow MainCamera(0.0f, 0.0f, 0.0f, 0.0f);
static CCameraFollow ViewCamera(0.0f, 0.0f, 0.0f, 0.0f);
static CCamera *NowCamera;
static int loop_counter;
static int key_counter;
static int goto_menu;
static int goto_return_menu;
static int door_open_cnt;
static int camera_dist_mode;
static sceVu0FVECTOR fix_chara_pos;
static sceVu0FVECTOR fix_chara_rot;
static int fix_camera;
static int camera_num;
static INTERIOR_CAMERA *active_camera;
static int camera_change_count;
static int simple_event;
static CCharacter MotionParts[4];
static CTextureAnime TexAnime;
static CTexAnimeData TexAnimeData[64];

static void LoadScript();
static void LoadInfo(char *script, int size);
void EdDoorCloseSe(int door_sound, float *position);
void EdDoorOpenSe(int door_sound, float *position);
void EdSetCharaCursor(int on);
void EdEventNPCStep();
float EdAGetViewAngleH();
float EdAGetViewAngleV();
void EdASetViewAngle(float h, float v);
void EdEyeCamera(CCamera *camera, CCharacter *chara);
void EdViewModeOff();
void EdInitMesParam();
void EdDrawCharacter(CCharacter *chara, int detail, int count, CNPCharacter *villagers, int *marks, int shadow,
                     ED_EVENT_INFO *event);
void EdEventBackSpriteDraw();
void EdDrawItem();
void EdEventSpriteDraw();
static void setTexAnim();
static void RunEvent(int event_no, CCamera *camera);
static void RunSystemEvent(int event_no, CCamera *camera);
static void InitWorkBuffer();
static void StepWater();
static void MainDraw();
static void MoveCharacter();
static void MoveCamera(CCameraFollow *camera);
static int GetDoorPos(int door_no, float *position, float *rotation, int *parts_no, int *motion);
static void VillagerCollision();
static int LoadTexture();
static void LoadChara();
void LoadData();
int LoadPTS(CMapParts *parts, u_int *archive);
int GetFuncPoint(int parts_no, u_int *archive, EPARTS_FUNC_DATA *points);
void DrawWaterSurface(CCamera *camera);
void SetCameraPos(CFrame *frame, CCamera *camera, CCharacter *chara);

/* Word-aligned image of one function marker as stored in a part resource. */
struct EPARTS_FUNC_RECORD {
    int words[0x30];
};
#endif

/**
 * Identifies the kind of editor effect requested.
 */
// clang-format off
enum EFFECT_TYPE {
    EFFECT_FIRE = 1, /**< A fire. */
    EFFECT_FLAME,    /**< A flame. */
    EFFECT_BRIGHT,   /**< A glow. */
};
// clang-format on

/**
 * Splits one element's space-separated object names into the caller's name buffers.
 */
void GetElementObjName(EDITPARTS_INFO *info, char **names, int element, int mode) {
    names[0][0] = '\0';
    if (info == NULL) {
        return;
    }
    if (element < 0 || element >= 6) {
        return;
    }
    if (mode < 0 || mode >= 4) {
        return;
    }
    char *text = info->elements[element].names[mode];
    if (text == NULL) {
        return;
    }
    int word = 0;
    int length = 0;
    char c;
    while ((c = *text) != '\0') {
        if (c == ' ') {
            names[word][length] = '\0';
            length = 0;
            word++;
        } else {
            names[word][length] = c;
            length++;
        }
        text++;
    }
    names[word][length] = '\0';
    word++;
    names[word][0] = '\0';
}
/**
 * Reads one interior object's levels of detail and hangs them off its part.
 *
 * @mangled LoadMapObject__FP9CMapPartsPPUiP14CDataAlloc2_1_
 * @address 0x19B790
 * @size 0x204
 */
void LoadMapObject(CMapParts *parts, u_int **data, CDataAlloc2<1> *alloc) {
    CFrameVu1 *frames[4];
    int i;

    LoadMDSFileLOD(frames, data, alloc, 1);
    CFrameAttr attr;
    attr.fog_enable = 1;
    attr.unk_08 = 0;
    attr.unk_50 = 0x40;
    for (i = 1; i < 4; i++) {
        if (frames[i] != NULL) {
            frames[i]->SetAttr(attr, 1, 0x44);
            SetFrameAttr(frames[i], 1);
        }
    }
    attr.unk_04 = 100.0f;
    attr.unk_08 = 1;
    frames[0]->SetAttr(attr, 1, 0);
    SetFrameAttr(frames[0], 1);
    for (i = 0; i < 4; i++) {
        parts->SetFrame(frames[i], i);
    }
    if (data[4] != NULL) {
        parts->shadow_frame = LoadMDSFile(data[4], alloc, 14, NULL, NULL);
    }
    if (data[5] != NULL) {
        parts->collision_frame = LoadCollisionFile(data[5], alloc);
    } else {
        parts->collision_frame = NULL;
    }
    if (data[6] != NULL) {
        parts->shade_frame = LoadMDSFile(data[6], alloc, 0, NULL, NULL);
    }
    if (data[7] != NULL) {
        parts->unk_104 = LoadMDSFile(data[7], alloc, 0, NULL, NULL);
    }
    if (data[8] != NULL) {
        parts->unk_0DC = LoadCollisionFile(data[8], alloc);
    }
}
/**
 * Reads the interior's event script into the script arena.
 *
 * @mangled LoadScript__Fv__2
 * @address 0x19B9A0
 * @size 0x294
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void LoadScript() {
    char event_path[0x80];
    char directory[0x40];
    char message_path[0x40];
    char language[0x1c];
    int size;
    char *map_script;

    EdScriptBuffer.used = 0;
    EdEventData = (char *) (EdScriptBuffer.base + EdScriptBuffer.used * 16);
    sprintf(language, "_%d.mes", LanguageCode);
    strcpy(message_path, EdInInfo->name);
    int length = strlen(message_path);
    if (length > 0) {
        char last = message_path[length - 1];
        if (last == 'm' || last == 'n' || last == 'e') {
            message_path[length - 1] = '\0';
        }
    }
    strcat(message_path, language);
    printf("mes = %s\n", message_path);
    strcpy(directory, EdInInfo->name);
    char *p = directory;
    char *slash = p;
    char c;
    while ((c = *p) != '\0') {
        if (c == '/') {
            slash = p;
        }
        p++;
    }
    *slash = '\0';
    sprintf(event_path, "%s/event.stb", directory);
    if (LoadFile2(event_path, EdEventData, &size, 0) != 0) {
        EdScriptBuffer.Alloc((size >> 4) + 1);
        map_script = (char *) (EdScriptBuffer.base + EdScriptBuffer.used * 16);
        if (LoadFile2(message_path, map_script, &size, 0) != 0) {
            EdScriptBuffer.Alloc((size >> 4) + 1);
        } else {
            map_script = NULL;
        }
        EdSetEventScript(EdEventData, map_script, &EdScriptBuffer);
    } else {
        EdEventData = NULL;
        EdSetEventScript(NULL, NULL, &EdScriptBuffer);
        EdInitEventParam();
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
 * Starts an interior event, handing it the camera it is to play through.
 *
 * @mangled RunEvent__FiP7CCamera__2
 * @address 0x19BC40
 * @size 0xB4
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void RunEvent(int event_no, CCamera *camera) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;

    if (start_event_no <= 0) {
        if (camera != NULL) {
            camera->GetPos(position);
            camera->GetRef(reference);
            EventCamera.SetPos(position);
            EventCamera.SetRef(reference);
            EventCamera.FollowOff();
            EventCamera.SetRoll(0.0f);
        }
        start_event_no = event_no;
    }
}
/**
 * Starts an interior system event, handing it the camera it is to play through.
 *
 * @mangled RunSystemEvent__FiP7CCamera__2
 * @address 0x19BD00
 * @size 0xA0
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void RunSystemEvent(int event_no, CCamera *camera) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;

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
 * Divides the read buffer into the interior's work, NPC and menu arenas.
 *
 * @mangled InitWorkBuffer__Fv__2
 * @address 0x19BDA0
 * @size 0x90
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void InitWorkBuffer() {
    u_char *free_start = EdNPCBuffer.base + EdNPCBuffer.used * 16;
    int free_quads = EdNPCBuffer.limit - EdNPCBuffer.used;
    free_start = (u_char *) ((((int) free_start >> 6) + 1) << 6);
    EdWorkBuffer.base = free_start;
    EdWorkBuffer.limit = free_quads - 4;
    EdWorkBuffer.used = 0;
    int villagers_loaded;
    if (EdVillagerBuffer.used > 0) {
        villagers_loaded = 1;
    }
    free_start = (u_char *) read_buffer;
    EdMenuBuffer.base = free_start - 0x180000;
    EdMenuBuffer.limit = 0x3A2E0;
    EdMenuBuffer.used = 0;
}
/**
 * Builds everything one interior runs on: its data, models, script and camera.
 *
 * @mangled EditInInit__FfPc
 * @address 0x19BE30
 * @size 0x478
 */
#ifdef NON_MATCHING
int EditInInit(float time, char *name) {
    float density = 255.0f;
    MGSetFogParm(10000.0f, 50000.0f, 0, 0, 0, density, density);
    memset(EdInInfo, 0, sizeof(EDIT_IN_INFO));
    EdInInfo->projection = 800.0f;
    strcpy(EdInInfo->name, name);
    PlayTimeCountFlag(1);
    simple_event = 0;
    LoadScript();
    NowTime = time;
    int hour = (int) (time / 3.0f);
    EdNPCBuffer.used = 0;
    for (int i = 0; i < 10; i++) {
        EdVillager[i].Initialize();
        EdVillager[i].unk_148C = 0x36;
    }
    LoadTexture();
    BG_READ_INFO *info = GetReadBGFile(1);
    if (info != NULL) {
        char *text = (char *) EdNPCBuffer.Alloc((info->size >> 4) + 1);
        memcpy(text, info->buffer, (int) info->size);
        LoadInfo(text, info->size);
    }
    LoadData();
    int remaining;
    u_char *base = EdNPCBuffer.base + EdNPCBuffer.used * 16;
    remaining = EdNPCBuffer.limit - EdNPCBuffer.used;
    EdVillagerBuffer.base = base;
    EdVillagerBuffer.limit = remaining;
    EdVillagerBuffer.used = 0;
    printf("buffer %d\n", remaining);
    LoadChara();
    MGSetRenderInfo(EdInInfo->projection, 5.0f, 65535.0f);
    MGSetPLight(EdInInfo->light_direction, EdInInfo->light_colour);
    MGSetAmbient(EdInInfo->ambient);
    MGSetBGColor(EdInInfo->background_colour);
    Chara = EdExchangeInfo.player;
    camera_dist_mode = 1;
    if (Chara != NULL) {
        Chara->SetPosition(0.0f, 0.0f, 0.0f);
    }
    float zero1 = 0.0f;
    EdFadeIn(0x40, zero1, zero1, zero1);
    door_open_cnt = 0;
    GameMode = 0;
    Chara->unk_C98 = 0;
    Chara->SetPosition(0.0f, 0.0f, 0.0f);
    float zero3 = 0.0f;
    Chara->SetRotation(zero3, zero3, zero3);
    GetMapJumpPos(Chara);
    Chara->ClothStep(-1);
    if (EdInteriorDoorSound >= 0) {
        sceVu0FVECTOR position;
        sceVu0FVECTOR reference = {0.0f, 0.0f, 0.0f, 0.0f};
        Chara->GetPosition(position);
        position[2] -= 10.0f;
        SndSetCamera(position, reference);
        Chara->GetPosition(position);
        EdDoorCloseSe(EdInteriorDoorSound, position);
    }
    EdMoveCharaInit();
    active_camera = NULL;
    camera_change_count = 0;
    MainCamera.FollowOff();
    NowCamera = &MainCamera;
    start_event_no = EdInteriorStartEvent;
    start_system_event = -1;
    goto_menu = 0;
    goto_return_menu = 0;
    key_counter = 0;
    loop_counter = 0;
    EdEventInfo.interior_parts_count = parts_num;
    EdEventInfo.interior_parts = InteriorParts;
    EdInitEventParam();
    InitWorkBuffer();
    printf("buffer %d\n", EdWorkBuffer.limit - EdWorkBuffer.used);
    EdSaveFrameImageInit();
    EdInitMenu(-1);
    EdInitSoundSrc();
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInInit__FfPc);
#endif
INCLUDE_RODATA("asm/nonmatchings/edit_in", @469__4);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @886__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @891__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @892__2);
/**
 * Runs one frame of the interior and reports when it is to be left.
 *
 * @mangled EditInLoop__Fv
 * @address 0x19C2B0
 * @size 0x1014
 */
#ifdef NON_MATCHING
int EditInLoop() {
    sceVu0FMATRIX view;
    sceVu0FVECTOR position;
    sceVu0FVECTOR eye;
    sceVu0FVECTOR dir;
    CMapParts *parts[10];
    static int old_mode;

    if (EdSystemMesCheck() != 0 || EdCheckItemOver() != 0) {
        EdSetKeyMode(0);
    } else {
        EdSetKeyMode(0xFFFF);
    }
    if (EdPadDown(0x800, 4) != 0) {
        goto_return_menu = 1;
    }
    int hour = (int) (NowTime / 3.0f);
    if (GameMode != 14) {
        if (EdCheckViewMode() == 0) {
            MGSetRenderInfo(EdInInfo->projection, 5.0f, 65535.0f);
        } else {
            MGSetRenderInfo(600.0f, 4.0f, 65535.0f);
        }
    }
    Chara->GetPosition(position);
    if (GameMode != 5 && GameMode != 7 && GameMode != 6) {
        OBJ_ANIME_SEQ *anime = EdInInfo->obj_anime;
        for (int i = 0; i < obj_anime_num; i++, anime++) {
            int flag = anime->completion_flag;
            if (flag <= 0 || EdGetMapFlag(flag) == 0) {
                ObjAnimePlay(anime);
            }
        }
        StepWater();
    }
    if (fix_camera != 0 && camera_num > 0 && GameMode == 0) {
        SetCameraPos((CFrame *) InteriorParts[0].frame[0], &MainCamera, Chara);
    }
    EdSetCharaCursor(0);
    switch (GameMode) {
    case 0:
        if (loop_counter > 0) {
            MoveCharacter();
        }
        EdSetCharaCursor(1);
        for (int i = 0; i < 10; i++) {
            CNPCharacter *villager = &EdVillager[i];
            villager->Step();
            villager->ShadowStep();
            villager->chara.ClothStep(0);
        }
        NowCamera = &MainCamera;
        if (EdCheckViewMode() != 0) {
            NowCamera = &ViewCamera;
        }
        break;
    case 4: {
        NowCamera = &EventCamera;
        Chara->SetVelocity(CVector3_f_(0.0f, 0.0f, 0.0f));
        EdEventInfo.current_time = NowTime;
        int result = EdEventMode(&EventCamera, 0);
        if (result != 0) {
            GameMode = 0;
            NowCamera = &MainCamera;
            switch (result) {
            case 7:
                if (MapNo == 3 && strcmp(EdInteriorName, "i04h04") == 0) {
                    EdInteriorDoorSound = -1;
                }
                return 1;
            case 8:
                return 99;
            case 9:
                GameMode = 3;
            default:
                if (EdEventInfo.reset_camera_angle < 0) {
                    sceVu0FVECTOR pos;
                    sceVu0FVECTOR ref;
                    EventCamera.GetPos(pos);
                    EventCamera.GetRef(ref);
                    MainCamera.SetPos(pos);
                    MainCamera.SetRef(ref);
                }
                camera_change_count = 0;
                break;
            }
        }
        VillagerCollision();
        EdEventNPCStep();
        goto_return_menu = 0;
        break;
    }
    case 1: {
        NowCamera = &MainCamera;
        Chara->SetVelocity(CVector3_f_(0.0f, 0.0f, 0.0f));
        Chara->Step();
        Chara->ShadowStep();
        Chara->SetPosition(fix_chara_pos);
        Chara->SetRotation(fix_chara_rot[0], fix_chara_rot[1], fix_chara_rot[2]);
        Chara->ClothStep(0);
        for (int i = 0; i < 10; i++) {
            CNPCharacter *villager = &EdVillager[i];
            villager->Step();
            villager->ShadowStep();
            villager->chara.ClothStep(0);
        }
        door_open_cnt--;
        if (door_open_cnt == 100 && EdInteriorDoorSound >= 0) {
            sceVu0FVECTOR pos;
            Chara->GetPosition(pos);
            EdDoorOpenSe(EdInteriorDoorSound, pos);
        }
        if (door_open_cnt < 0) {
            door_open_cnt = 0;
            GameMode = 2;
        }
        break;
    }
    case 2:
        NowCamera = &MainCamera;
        EdStopSoundSrc();
        if (EdEventInfo.map_jump_bgm_stop != 0) {
            SndBgmFadeOutStop();
        } else {
            EdBeforeInBgmNo = -1;
        }
        return 1;
    case 3: {
        sceVu0FVECTOR direction;
        NowCamera = &MainCamera;
        if (EdCheckViewMode() != 0) {
            NowCamera = &ViewCamera;
        }
        Chara->SetMotion(0, 0);
        Chara->SetVelocity(CVector3_f_(0.0f, 0.0f, 0.0f));
        Chara->Step();
        Chara->ShadowStep();
        Chara->ClothStep(0);
        for (int i = 0; i < 10; i++) {
            CNPCharacter *villager = &EdVillager[i];
            villager->Step();
            villager->ShadowStep();
            villager->chara.ClothStep(0);
        }
        CNPCharacter *talker = EdNowTalkChara();
        float distance = Chara->GetDistance(talker->chara);
        Chara->GetDir(talker->chara, direction);
        float pitch = -atan2f(-Chara->body_height + (1.3f + talker->chara.body_height + direction[1]), distance);
        float yaw = atan2f(direction[0], direction[2]);
        float h = EdAGetViewAngleH();
        float v = EdAGetViewAngleV();
        h = AngleInterpolate(h, yaw, 0.05f, 0);
        v = AngleInterpolate(v, pitch, 0.03f, 0);
        EdASetViewAngle(h, v);
        EdEyeCamera(&ViewCamera, Chara);
        int settled = 1;
        if (EdCheckViewMode() != 0) {
            float d = h - yaw;
            if (d < 0.0f) {
                d = -d;
            }
            settled = 0;
            if (d < 0.001f) {
                d = v - pitch;
                if (d < 0.0f) {
                    d = -d;
                }
                if (d < 0.001f) {
                    settled = 1;
                }
            }
        }
        if (settled) {
            int event_no;
            EdASetViewAngle(yaw, pitch);
            event_no = 0;
            int result = EdTalkMode(Chara, NULL, EdCheckViewMode(), &event_no);
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
                GameMode = 0;
            }
        }
        break;
    }
    case 6:
        Chara->SetMotion(Chara->motion_no, 1);
        Chara->Step();
        Chara->ShadowStep();
        for (int i = 0; i < 10; i++) {
            CNPCharacter *villager = &EdVillager[i];
            villager->chara.SetMotion(villager->chara.motion_no, 1);
            villager->Step();
            villager->ShadowStep();
        }
        break;
    case 7:
        MenuMapJumpMode = -1;
        if (EdMenuMode() != 0) {
            GameMode = 0;
            EdExitMenu();
            if (GetInteriorOutFlag() != 0) {
                EdViewModeOff();
                return 1;
            }
            for (int i = 0; i < 10; i++) {
                CNPCharacter *villager = &EdVillager[i];
                villager->chara.SetMotion(villager->chara.motion_no, 0);
                villager->Step();
                villager->ShadowStep();
            }
            return 0;
        }
        break;
    }
    if (EdEventInfo.lighting_override != 0) {
        MGSetPLight(EdEventInfo.light_direction, EdEventInfo.light_color);
        MGSetAmbient(EdEventInfo.ambient_color);
    }
    NowCamera->Step(1);
    NowCamera->GetCameraMatrix(view);
    NowCamera->GetPos(eye);
    NowCamera->GetDir(dir);
    MGSetViewMatrix(view, eye);
    for (int i = 0; i < parts_num; i++) {
        parts[i] = &InteriorParts[i];
    }
    EdSetSoundSrcVol(NowTime, parts, parts_num, eye, dir);
    if (GameMode != 7) {
        MainDraw();
    } else {
        EdFadeInOut();
    }
    if (GameMode == 6 && EdInitModeFinish(NowCamera, TexManager.GetTexture("frame_image", -1)) != 0) {
        GameMode = 7;
    }
    EdSaveFrameImageTask();
    if (GameMode == 0 && ((EdPadDown(0x10, 1) != 0 && loop_counter >= 2) || goto_menu != 0 ||
                          (SystemMesCheck() == 0 && EdCheckItemOver() != 0))) {
        int menu = 2;
        if (goto_menu != 0) {
            menu = goto_menu;
            goto_menu = 0;
            printf("%d\n", menu);
        }
        if (EdInitMenu(menu) != 0) {
            SndSePlay(1, -1, 0);
            GameMode = 6;
        }
    }
    static int event_text = 0;
    if (GamePad.Down2(0x80) != 0) {
        event_text = 4;
        EdEventAllClear();
        simple_event = 0;
    }
    event_text--;
    if (event_text < 0) {
        event_text = 0;
    }
    if (event_text == 1) {
        start_event_no = 150;
    }
    if (GameMode != 4 && ((CMainChara *) Chara)->in_trigger != 0) {
        int trigger = ((CMainChara *) Chara)->trigger_event;
        if (trigger > 0) {
            start_event_no = trigger;
        }
    }
    if (EdDebugEventEnable != 0 && (start_event_no > 0 || start_system_event > 0)) {
        if (start_system_event > 0) {
            if (EdEventInit(start_system_event, &EdNPCBuffer, EdSystemEventData) != 0) {
                EdInitMesParam();
                GameMode = 4;
            }
        } else if (EdEventInit(start_event_no, &EdNPCBuffer, EdEventData) != 0) {
            EdInitMesParam();
            GameMode = 4;
        } else if (EdEventInfo.return_code == 9) {
            EdInitMesParam();
            GameMode = 3;
            simple_event = 0;
        }
        start_event_no = -1;
        start_system_event = -1;
    } else {
        simple_event = 0;
    }
    if (GameMode == 5 && GamePad.Down(0x800) != 0) {
        GameMode = old_mode;
        EdSePlay((ED_SOUND_ID) 2, -1);
        PlayTimeCountFlag(1);
    } else if (GameMode != 4 && goto_return_menu != 0 && loop_counter >= 2 && GameMode == 0) {
        old_mode = GameMode;
        GameMode = 5;
        EdSePlay((ED_SOUND_ID) 1, -1);
        PlayTimeCountFlag(0);
    }
    goto_return_menu = 0;
    static int end_count = 0;
    if (GamePad.AllOn() != 0) {
        key_counter = 0;
    }
    if (end_count == 1) {
        end_count = 0;
        MapJump(800, -1);
        return 99;
    }
    end_count--;
    if (end_count < 0) {
        end_count = 0;
    }
    key_counter++;
    loop_counter++;
    SndStep();
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInLoop__Fv);
#endif
/**
 * Draws the interior for one frame.
 *
 * @mangled MainDraw__Fv__2
 * @address 0x19D2D0
 * @size 0x6AC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void MainDraw() {
    sceVu0FVECTOR position;
    sceVu0FVECTOR light = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR ref;
    sceVu0FVECTOR wind = {0.0f, 0.0f, 0.0f, 0.0f};
    int marks_store[10];

    if (EdDrawOffFlag != 0) {
        return;
    }
    if (GameMode == 5) {
        CTextureAnime::stop_anime = 1;
    } else {
        CTextureAnime::stop_anime = 0;
    }
    EdDrawOffMap = EdEventInfo.suppress_background;
    EdDrawOffMapShadow = EdEventInfo.suppress_shadows;
    Chara->GetPosition(position);
    int hour = (int) (NowTime / 3.0f);
    if (EdDrawOffMap == 0) {
        TexManager.ReloadTexture(GetVif1Packet(), 15);
        TexAnime.TexAnime(15);
        setTexAnim();
        for (int i = 0; i < parts_num; i++) {
            InteriorParts[i].DrawParts(NowTime, light, 0, 0, NULL);
        }
    }
    sceGsTex0 frame;
    CRect_i_ screen;
    sceGsTex0 water;
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
    DrawWaterSurface(NowCamera);
    MGSetGsZBUF(&mgZBuffer);
    if (GameMode == 4) {
        EdEventBackSpriteDraw();
    }
    if (GameMode == 4) {
        EdDrawItem();
    }
    ED_EVENT_INFO *event = NULL;
    int detail = 3;
    int *marks = marks_store;
    if (EdCheckViewMode() != 0) {
        detail = 0;
    }
    if (GameMode == 2) {
        marks = NULL;
    } else {
        for (int i = 0; i < 10; i++) {
            marks_store[i] = 3;
        }
    }
    if (GameMode == 4) {
        event = &EdEventInfo;
        detail = 3;
    }
    EdDrawCharacter(Chara, detail, 10, EdVillager, marks, 1, event);
    TexManager.ReloadTexture(GetVif1Packet(), 0x18);
    if (GameMode != 5 || EdPauseFlag == 0) {
        EditEffectStep();
        EffectMacroStep(wind);
        EdEffectGroup.Step(1);
        for (int i = 0; i < 4; i++) {
            MotionParts[i].Step();
        }
    }
    EditEffectStep2();
    if (EdDrawOffMap == 0) {
        EDIT_EFFECT_INFO *effect = EdInInfo->effects;
        for (int i = 0; i < effect_num; i++, effect++) {
            if (CheckEditEffect(effect, NowTime) != 0) {
                DrawEditEffect(effect, NowCamera, &EdEffectGroup);
            }
        }
    }
    EdEffectGroup.Draw();
    for (int i = 0; i < 4; i++) {
        TexManager.ReloadTexture(GetVif1Packet(), i + 0x32);
        MotionParts[i].Draw();
    }
    TexManager.ReloadTexture(Vif1Packet, 0x14);
    EdDrawSysCursor(EdInInfo->event_points, 32);
    if (GameMode == 4) {
        EdEventSpriteDraw();
    }
    if ((unsigned int) (GameMode - 3) < 2U) {
        TexManager.ReloadTexture(Vif1Packet, EditMes1.tex_block);
        EditMes1.DrawMesWin();
        if (GameMode == 4) {
            EditEventMes1.DrawMesWin();
            EditSystemMes.DrawMesWin();
        }
    }
    if (GameMode == 0) {
        MonsterNameDraw();
    } else {
        MonsterNameMake(-1);
    }
    EdSystemMesStep();
    EdSystemMesDraw();
    static int debug_flag = 0;
    static int debug_menu_mode = 0;
    char pause_texture[] = "pause";
    if (EdDebugParamDrawOff == 0 && (GameMode == 5 || EdPauseFlag != 0)) {
        TexManager.ReloadTexture(GetVif1Packet(), 0x14);
        CRect_i_ fade;
        fade.x = 0;
        fade.y = 0;
        fade.width = 0x2800;
        fade.height = 0xE00;
        MGFillBox(fade, 0, 0, 0, 0x40);
        setbilinear(0);
        CRect_i_ texel;
        CRect_i_ place;
        texel.x = 0;
        texel.y = 0;
        texel.width = 0x80;
        texel.height = 0x28;
        place.x = 0x100;
        place.y = 0xCC;
        place.width = 0x80;
        place.height = 0x28;
        sceVif1Packet *packet = GetVif1Packet();
        set2DSprite(packet, TexManager.GetTexture(pause_texture, -1), place, texel, 0x80);
    }
    EdFadeInOut();
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", MainDraw__Fv__2);
#endif
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1082__2);
/**
 * Draws the interior's water surfaces, ordered back to front from the camera.
 *
 * @mangled DrawWaterSurface__FP7CCamera
 * @address 0x19D980
 * @size 0x15C
 */
void DrawWaterSurface(CCamera *camera) {
    sceVu0FVECTOR eye;
    sceVu0FVECTOR position;
    sceVu0FVECTOR dir;
    int i;
    CGroundWater *surface = Water;

    camera->GetPos(eye);
    camera->GetDir(dir);
    dir[1] = 0.0f;
    sceVu0Normalize(dir, dir);
    for (i = 0; i < 1; i++, surface++) {
        if (surface->draw == 0) {
            continue;
        }
        CWater *water = &surface->water;
        sceVu0CopyVector(position, surface->offset);
        if (surface->follow_x) {
            position[0] = eye[0] + 50.0f * dir[0];
        }
        if (surface->follow_y) {
            position[1] = eye[1];
        }
        if (surface->follow_z) {
            position[2] = eye[2] + 50.0f * dir[2];
        }
        CVector3_f_ rotation;
        rotation.x = rotation.y = rotation.z = 0.0f;
        water->frame.SetRotation(rotation.x, rotation.y, rotation.z);
        water->frame.SetPosition(position);
        DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(water, &mgRenderInfo, GetVif1Packet(), NULL);
    }
}
/**
 * Advances the ripples of the interior's water surfaces.
 *
 * @mangled StepWater__Fv
 * @address 0x19DAE0
 * @size 0x204
 */
static void StepWater() {
    int i;
    int j;
    CGroundWater *surface = Water;

    for (i = 0; i < 1; i++, surface++) {
        if (surface->draw == 0) {
            continue;
        }
        if (surface->water.CheckClip()) {
            continue;
        }
        for (j = 0; j < 4; j++) {
            if (surface->ripples[j].power == 0.0f && surface->ripples[j].range == 0.0f) {
                break;
            }
            int row = surface->ripples[j].row;
            int column = surface->ripples[j].column;
            if (row < 0) {
                int rows = surface->water.rows;
                row = rows * (float) rand() / 2.1474836e9f;
            }
            if (column < 0) {
                int rows = surface->water.rows;
                column = rows * (float) rand() / 2.1474836e9f;
            }
            surface->water.Shake(row, column,
                                 surface->ripples[j].power +
                                     surface->ripples[j].range * (float) rand() / 2.1474836e9f);
        }
        surface->water.Hamon();
    }
}
/**
 * Moves the player and the villagers through the interior for one frame.
 *
 * @mangled MoveCharacter__Fv
 * @address 0x19DCF0
 * @size 0x38C
 */
#ifdef NON_MATCHING
static void MoveCharacter() {
    sceVu0FVECTOR follow;
    static sceVu0FVECTOR fix_pos;

    EdMoveCharaInfo.time = NowTime;
    EdMoveCharaInfo.camera = &MainCamera;
    EdMoveCharaInfo.follow = &ViewCamera;
    EdMoveCharaInfo.key_lock = 0;
    EdMoveCharaInfo.chara = Chara;
    EdMoveCharaInfo.interior = 1;
    EdMoveCharaInfo.parts = InteriorParts;
    EdMoveCharaInfo.parts_count = parts_num;
    EdMoveCharaInfo.points = EdInInfo->event_points;
    EdMoveCharaInfo.point_count = 32;
    EdMoveCharaInfo.unk_a0 = 0;
    EdMoveChara();
    if (EdDebugCameraFlag != 0 && GamePad.Down(0x20) != 0) {
        fix_camera = fix_camera == 0;
        MainCamera.GetPos(fix_pos);
    }
    if (fix_camera != 0) {
        MainCamera.FollowOff();
    } else {
        MainCamera.FollowOn();
        Chara->GetPosition(follow);
        MainCamera.SetFollow(follow[0], 14.0f + follow[1], follow[2]);
        MoveCamera(&MainCamera);
    }
    if (EdMoveCharaInfo.system_event_no > 0) {
        RunSystemEvent(EdMoveCharaInfo.system_event_no, &MainCamera);
        return;
    }
    if (EdMoveCharaInfo.event_no > 0) {
        RunEvent(EdMoveCharaInfo.event_no, &MainCamera);
        return;
    }
    if (EdMoveCharaInfo.unk_a0 == 0 && EdPadDown(0x40, 1) != 0) {
        sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 0.0f};
        sceVu0FVECTOR rotation = {0.0f, 0.0f, 0.0f, 0.0f};
        Chara->GetPosition(position);
        Chara->GetRotation(rotation);
        EPARTS_FUNC_DATA *jump = SearchMapJump(position, rotation);
        if (jump != NULL) {
            int motion;
            EdMoveCharaInit();
            motion = 0;
            door_open_cnt = 140;
            if (jump != NULL) {
                GetDoorPos(jump->link_id, position, rotation, &EdInteriorDoorSound, &motion);
            }
            Chara->SetMotion(motion, 6);
            sceVu0CopyVector(fix_chara_pos, position);
            sceVu0CopyVector(fix_chara_rot, rotation);
            Chara->SetPosition(fix_chara_pos);
            Chara->SetRotation(fix_chara_rot[0], fix_chara_rot[1], fix_chara_rot[2]);
            Chara->Step();
            Chara->ClothStep(-1);
            GameMode = 1;
            EdFadeOut(100, 0.0f, 0.0f, 0.0f);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCharacter__Fv);
#endif
/**
 * Applies the right stick to the interior camera, holding its height and distance in
 * range.
 *
 * @mangled MoveCamera__FP13CCameraFollow__2
 * @address 0x19E080
 * @size 0x164
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void MoveCamera(CCameraFollow *camera) {
    static float camera_distance[3] = {50.0f, 80.0f, 110.0f};

    float horizontal = GamePad.GetRXf();
    camera->AddHeight(-GamePad.GetRYf());
    if (!(camera->GetHeight() <= 30.0f)) {
        camera->SetHeight(30.0f);
    }
    camera->AddAngle(0.04f * -horizontal);
    if (GamePad.On(8) != 0) {
        camera->AddAngle(-0.0174533f);
    }
    if (GamePad.On(4) != 0) {
        camera->AddAngle(0.0174533f);
    }
    camera->SetDistance(camera_distance[camera_dist_mode]);
    if (GamePad.Down(0x10) != 0) {
        camera_dist_mode++;
    }
    if (camera_dist_mode >= 3) {
        camera_dist_mode = 0;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCamera__FP13CCameraFollow__2);
#endif
/**
 * Finds the map jump the player is standing on.
 *
 * @mangled SearchMapJump__FPfPf
 * @address 0x19E1F0
 * @size 0xF4
 */
EPARTS_FUNC_DATA *SearchMapJump(float *position, float *rotation) {
    sceVu0FVECTOR world;
    int i;
    EPARTS_FUNC_DATA *point = func_point;

    for (i = 0; i < func_num; i++, point++) {
        if (point->kind == 2) {
            CFrame *frame = (CFrame *) point->parts;
            point->position[3] = 1.0f;
            frame->GetWorldPosition(world, point->position);
            EdInteriorJumpID = point->link_id;
            if (DistVector(position, world) < 10.0f &&
                AngleCmp(rotation[1], point->rotation[1], 0.87f) == 0) {
                return point;
            }
        }
    }
    return NULL;
}
/**
 * Puts the player where the interior's map jump says they arrive.
 *
 * @mangled GetMapJumpPos__FP10CCharacter
 * @address 0x19E2F0
 * @size 0x12C
 */
void GetMapJumpPos(CCharacter *chara) {
    EPARTS_FUNC_DATA *point = func_point;

    for (int i = 0; i < func_num; i++, point++) {
        if (point->kind == 2 && point->link_id == EdInteriorJumpID) {
            chara->SetPosition(point->position[0], point->position[1], point->position[2]);
            printf("%f %f %f\n", point->position[0], point->position[1], point->position[2]);
            chara->SetRotation(0.0f, AngleLimit(3.141592f + point->rotation[1]), 0.0f);
            return;
        }
    }
}
/**
 * Gives the position, heading and part of one of the interior's doors.
 *
 * @mangled GetDoorPos__FiPfPfPiPi
 * @address 0x19E420
 * @size 0xF8
 */
static int GetDoorPos(int door_no, float *position, float *rotation, int *parts_no, int *motion) {
    EPARTS_FUNC_DATA *point = func_point;

    for (int i = 0; i < func_num; i++, point++) {
        if ((point->kind == 10 || point->kind == 11) && point->link_id == door_no) {
            sceVu0CopyVector(position, point->position);
            sceVu0CopyVector(rotation, point->rotation);
            *parts_no = point->values[0];
            *motion = EdGetDoorMotion(*parts_no, point->kind == 10);
            return point->kind == 11;
        }
    }
    return -1;
}
/**
 * Places the interior camera so that the player stays in view and the walls do not.
 *
 * @mangled SetCameraPos__FP6CFrameP7CCameraP10CCharacter
 * @address 0x19E520
 * @size 0x3F8
 */
#ifdef NON_MATCHING
void SetCameraPos(CFrame *frame, CCamera *camera, CCharacter *chara) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR local;
    INTERIOR_CAMERA cameras[8];
    sceVu0FMATRIX matrix;
    EPARTS_FUNC_DATA *point = func_point;
    int count;

    chara->GetPosition(position);
    count = 0;
    for (int i = 0; i < func_num; i++, point++) {
        if (point->kind == 7) {
            INTERIOR_CAMERA *entry = &cameras[count];
            entry->link_id = point->link_id;
            CFrame *owner = (CFrame *) point->parts;
            sceVu0CopyVector(entry->min, point->position);
            sceVu0CopyVector(entry->max, point->rotation);
            sceVu0UnitMatrix(matrix);
            if (owner != NULL) {
                CFrame *found = owner->SearchFrame(point->frame_name);
                if (found != NULL) {
                    found->GetLWMatrix(matrix);
                }
            }
            sceVu0MulMatrix(matrix, matrix, point->matrix);
            entry->frame.SetTransMatrix(matrix);
            count++;
            if (count >= 8) {
                break;
            }
        }
    }
    if (count <= 0) {
        return;
    }
    INTERIOR_CAMERA *inside = NULL;
    static int cnt = 0;
    for (int i = 0; i < count; i++) {
        INTERIOR_CAMERA *entry = &cameras[i];
        if (entry->link_id == 0) {
            inside = entry;
            continue;
        }
        position[3] = 1.0f;
        sceVu0ApplyMatrix(local, entry->frame.GetInverseMatrix(), position);
        if (!(local[0] < entry->min[0]) && !(local[1] < entry->min[1]) && !(local[2] < entry->min[2]) &&
            local[0] <= entry->max[0] && local[1] <= entry->max[1] && local[2] <= entry->max[2]) {
            inside = entry;
            break;
        }
    }
    cnt++;
    if (cnt >= 61) {
        cnt = 0;
    }
    if (active_camera == NULL) {
        active_camera = inside;
    }
    if (inside == NULL) {
        return;
    }
    if (camera_change_count <= 0) {
        active_camera = inside;
        camera_change_count = 0;
    }
    if (inside == active_camera) {
        camera_change_count = 20;
    } else {
        camera_change_count--;
    }
    if (active_camera != NULL) {
        sceVu0FVECTOR eye = {0.0f, 0.0f, 0.0f, 0.0f};
        active_camera->frame.GetWorldPosition(eye, eye);
        position[1] += 17.0f;
        camera->SetPos(eye);
        camera->SetRef(position);
        camera->SetNextPos(NULL, eye[0], eye[1], eye[2]);
        camera->SetNextRef(NULL, position[0], position[1], position[2]);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", SetCameraPos__FP6CFrameP7CCameraP10CCharacter);
#endif
/**
 * Collects the collision polygons of the interior parts meeting a box.
 *
 * @mangled GetCollision__FP6CCPolyP7CBoxVu0__2
 * @address 0x19E920
 * @size 0xBC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static int GetCollision(CCPoly *poly, CBoxVu0 *box) {
    int count = 0;

    for (int i = 0; i < parts_num; i++) {
        CFrame *frame = InteriorParts[i].GetCollisionFrame();
        if (frame != NULL) {
            count += frame->PickUpNearPoly(&poly[count], *box);
        }
    }
    return count;
}
/**
 * Pushes the player and the interior's villagers out of one another.
 *
 * @mangled VillagerCollision__Fv__2
 * @address 0x19E9E0
 * @size 0x2D0
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void VillagerCollision() {
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
        box.max[1] = 1000.0f;
        box.min[1] = -1000.0f;
        if (i >= 0) {
            chara = &villager->chara;
        } else {
            chara = Chara;
        }
        chara->FootSoundEnable(0);
        int count = GetCollision(polys, &box);
        if (count > 300) {
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
 * Enters the interior's textures once they have been read.
 *
 * @mangled LoadTexture__Fv__2
 * @address 0x19ECB0
 * @size 0x20C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static int LoadTexture() {
    static LOADTEXTURE_INFO2 texdata;

    BG_READ_INFO *file = GetReadBGFile(2);
    if (file == NULL) {
        return 0;
    }
    char *ext = file->name;
    char c;
    while ((c = *ext) != '\0') {
        if (c == '.') {
            ext++;
            break;
        }
        ext++;
    }
    u_int *data = NULL;
    int size;
    TexAnime.Initialize(NULL, 0);
    if (strcmp(ext, "img") == 0) {
        texdata.name = (char *) file->buffer;
    } else {
        u_int *found;
        int cfg_size;
        if (GetPackFileExt((u_int *) file->buffer, "img", &found, 1, NULL, NULL) > 0) {
            texdata.name = (char *) found;
        }
        if (GetPackFileExt((u_int *) file->buffer, "cfg", &found, 1, &cfg_size, NULL) > 0) {
            TexAnime.Initialize(TexAnimeData, 64);
            data = found;
            size = cfg_size;
            for (int i = 0; i < 64; i++) {
                TexAnimeData[i].Initialize();
            }
        }
    }
    TexManager.LoadTextureBlockEX(15, &texdata);
    if (data != NULL) {
        TexAnime.LoadCFGFile((char *) data, size);
    }
    EdNPCBuffer.Alloc((file->size >> 4) + 1);
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadTexture__Fv__2);
#endif
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1399);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1400);

/**
 * Reserved character-loading hook with no operation.
 */
static void LoadChara() {
}
/**
 * Reads the interior's parts, objects and function points out of its archive.
 *
 * @mangled LoadData__Fv
 * @address 0x19EED0
 * @size 0x818
 */
#ifdef NON_MATCHING
void LoadData() {
    CFrame *frames[9];

    func_point = new ((u_long128 *) (EdNPCBuffer.base + EdNPCBuffer.used * 16)) EPARTS_FUNC_DATA[128];
    EdNPCBuffer.Alloc(0x600);
    for (int i = 0; i < 128; i++) {
        func_point[i].kind = 0;
    }
    func_num = 0;
    BG_READ_INFO *file = GetReadBGFile(0);
    u_int *archive = NULL;
    if (file != NULL) {
        archive = (u_int *) file->buffer;
    }
    int count;
    u_int *pts;
    for (count = 0; (pts = SearchPTS(archive, count)) != NULL; count++) {
        CMapParts *parts = &InteriorParts[count];
        LoadPTS(parts, pts);
        parts->handle = count;
        parts->unk_0E4 = 15;
        int first = func_num;
        func_num += GetFuncPoint(count, pts, &func_point[first]);
        if (EdInteriorPartsNo >= 0) {
            EDITPARTS_INFO *info = EditPartsInfo.GetPartsInfo(EdInteriorPartsNo);
            if (info != NULL) {
                EDITPARTS_INFO copy = *info;
                EdPartsObjectOnOff(parts, info, EdInteriorJumpID + 1);
            }
        }
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
        CFrame *extra = parts->unk_0DC;
        if (extra != NULL) {
            extra->SetPosition(parts->pos[0], parts->pos[1], parts->pos[2]);
            parts->unk_0DC->SetRotation(parts->rotation.x, parts->rotation.y, parts->rotation.z);
            extra = parts->unk_0DC;
        }
        frames[8] = extra;
        EPARTS_FUNC_DATA *point = &func_point[first];
        effect_num = 32;
        for (int i = 0; i < 24; i++) {
            parts->effect_on[i] = 0;
            parts->effect[i] = NULL;
        }
        for (; first < func_num; first++, point++) {
            EnterPartsEffect(parts, point, EdInInfo->effects, 32);
            if (obj_anime_num < 32 && InitObjAnime(frames, 9, point, &EdInInfo->obj_anime[obj_anime_num]) != 0) {
                obj_anime_num++;
            }
        }
        EdInitEventPoint(parts, NULL, func_point, func_num, EdInInfo->event_points, 32);
    }
    parts_num = count;
    for (int i = 0; i < func_num; i++) {
        EPARTS_FUNC_DATA *point = &func_point[i];
        point->parts = (CMapParts *) InteriorParts[(int) point->parts].frame[0];
        int flag = func_point[i].completion_flag;
        if (flag > 0 && SaveData->GetMapInitFlag(MapNo, flag) == 0) {
            SaveData->SetMapInitFlag(MapNo, func_point[i].completion_flag, 1);
            EPARTS_FUNC_DATA *set = &func_point[i];
            SaveData->SetMapFlag(MapNo, set->completion_flag, (s8) set->unk_28[0] == 0);
        }
    }
    camera_num = 0;
    EPARTS_FUNC_DATA *point = func_point;
    for (int i = 0; i < func_num; i++, point++) {
        if (point->kind == 7) {
            camera_num++;
        }
    }
    for (int i = 0; i < 4; i++) {
        EDIT_MOTION_PARTS_INFO *motion = &EdInInfo->motion_parts[i];
        CCharacter *chara = &MotionParts[i];
        chara->Initialize();
        if (motion->name[0] != '\0') {
            LoadFile(motion->name, read_buffer, NULL);
            chara->LoadPackData2((u_int *) read_buffer, "info.cfg", &EdNPCBuffer, i + 0x32, &EdNPCBuffer, 0);
            chara->SetPosition(motion->values[0], motion->values[1], motion->values[2]);
            chara->SetRotation(motion->values[3], motion->values[4], motion->values[5]);
            chara->SetScale(motion->values[6], motion->values[7], motion->values[8]);
        }
    }
    for (int i = 0; i < 1; i++) {
        Water[i].draw = 0;
    }
    for (int i = 0; i < 1; i++) {
        EDIT_WATER_INFO *info = &EdInInfo->water_surfaces[i];
        if (info->type > 0) {
            CGroundWater *surface = &Water[i];
            CWater *water = &surface->water;
            sceVu0FVECTOR near_left = {info->corner_a[0], info->corner_a[1], info->corner_a[2], 1.0f};
            sceVu0FVECTOR near_right = {info->corner_b[0], info->corner_a[1], info->corner_a[2], 1.0f};
            sceVu0FVECTOR far_left = {info->corner_a[0], info->corner_a[1], info->corner_c[2], 1.0f};
            sceVu0FVECTOR far_right = {info->corner_b[0], info->corner_a[1], info->corner_c[2], 1.0f};

            surface->draw = 1;
            strcpy(surface->name, info->name);
            surface->parts_no = info->parts_no;
            sceVu0CopyVector(surface->offset, info->corner_c);
            for (int j = 0; j < 3; j++) {
                (&surface->follow_x)[j] = (&info->follow_x)[j];
            }
            for (int j = 0; j < 4; j++) {
                sceVu0CopyVector((float *) &surface->ripples[j], (float *) &info->wave[j]);
            }
            water->SetVertex(near_left, near_right, far_left, far_right);
            water->frame.SetPosition(info->corner_c);
            water->SetSize(info->type, info->number, &EdNPCBuffer);
            water->SetParam(info->texture_scroll[0], info->texture_scroll[1], info->texture_scroll[2],
                            info->texture_scroll[3]);
            water->SetColor(info->unk_50, info->unk_54, info->unk_58, 0x80);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadData__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1537);
/**
 * Builds one interior part from its archive entry.
 *
 * @mangled LoadPTS__FP9CMapPartsPUi
 * @address 0x19F6F0
 * @size 0x238
 */
#ifdef NON_MATCHING
int LoadPTS(CMapParts *parts, u_int *archive) {
    EPARTS_INFO_HEADER *header = (EPARTS_INFO_HEADER *) ((char *) archive + archive[1]);
    u_int *names[10] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    EPARTS_ARCHIVE *pack = (EPARTS_ARCHIVE *) archive;

    if (pack->size_58 > 0) {
        names[0] = (u_int *) ((char *) archive + pack->offset_48);
    } else {
        return 0;
    }
    if (pack->size_5c > 0) {
        names[1] = (u_int *) ((char *) archive + pack->offset_4c);
    }
    if (pack->size_60 > 0) {
        names[2] = (u_int *) ((char *) archive + pack->offset_50);
    }
    if (pack->size_64 > 0) {
        names[3] = (u_int *) ((char *) archive + pack->offset_54);
    }
    if (pack->size_94 > 0) {
        names[4] = (u_int *) ((char *) archive + pack->offset_90);
    }
    if (pack->size_7c > 0) {
        names[5] = (u_int *) ((char *) archive + pack->offset_78);
    }
    if (pack->size_ac > 0) {
        names[6] = (u_int *) ((char *) archive + pack->offset_a8);
    }
    if (pack->size_dc > 0) {
        names[7] = (u_int *) ((char *) archive + pack->offset_d8);
    }
    if (pack->size_c4 > 0) {
        names[8] = (u_int *) ((char *) archive + pack->offset_c0);
    }
    parts->SetFrame(LoadMDSFile(names[0], &EdNPCBuffer, 0, NULL, NULL), 0);
    if (names[5] != NULL) {
        parts->collision_frame = LoadCollisionFile(names[5], &EdNPCBuffer);
    }
    if (names[8] != NULL) {
        parts->unk_0DC = LoadCollisionFile(names[8], &EdNPCBuffer);
    } else {
        parts->unk_0DC = NULL;
    }
    sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 0.0f};
    position[0] = header->position[0];
    position[1] = header->position[1];
    position[2] = header->position[2];
    parts->SetPosition(position);
    parts->SetRotation(header->rotation[0], header->rotation[1], header->rotation[2]);
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadPTS__FP9CMapPartsPUi);
#endif
/**
 * Collects the function points one interior part defines.
 *
 * @mangled GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA
 * @address 0x19F930
 * @size 0x74
 */
#ifdef NON_MATCHING
int GetFuncPoint(int parts_no, u_int *archive, EPARTS_FUNC_DATA *points) {
    EPARTS_INFO_HEADER *header = (EPARTS_INFO_HEADER *) ((char *) archive + archive[1]);
    int i;
    EPARTS_FUNC_DATA *source = (EPARTS_FUNC_DATA *) ((char *) header + (int) header->func);

    for (i = 0; i < header->func_count; points++) {
        *(EPARTS_FUNC_RECORD *) points = *(EPARTS_FUNC_RECORD *) source;
        source++;
        points->parts = (CMapParts *) parts_no;
        i++;
    }
    return header->func_count;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA);
#endif
/**
 * Uploads the interior's texture-animation state to the graphics synthesizer.
 *
 * @mangled setTexAnim__Fv
 * @address 0x19F9B0
 * @size 0x1C0
 */
static void setTexAnim() {
    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    if (setTexAnimCntf >= 7.0f) {
        setTexAnimCntf = 0.0f;
    } else {
        setTexAnimCntf += 0.2f;
    }

    setTexAnimCnt = (int) setTexAnimCntf;

    CTexture *strip = TexManager.GetTexture("i01e01_a", -1);
    CTexture *plate = TexManager.GetTexture("i01e01", -1);

    if (strip == 0 || plate == 0) {
        return;
    }

    MGMoveImage((sceGsTex0 *) &strip->tex0, CRect_i_(0, setTexAnimCnt * 64, 64, 64),
                (sceGsTex0 *) &plate->tex0, 0, 0, 0);
    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1592);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1593);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1594);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1595);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1596);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1597);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1598);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1599);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1600);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1601);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1602);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1603);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1604);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1605);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1606);
/**
 * Runs the interior's info script through the interpreter.
 *
 * @mangled LoadInfo__FPci
 * @address 0x19FB70
 * @size 0xD8
 */
static void LoadInfo(char *script, int size) {
    CScriptInterpreter interpreter;
    int command;

    interpreter.SetScript(script, size);
    interpreter.SetTAG(Command, 15);
    CurrentDir[0] = '\0';
    npc_count = 0;
    objanime_list = 0;
    effect_list = 0;
    motion_parts_list = 0;
    water_list = 0;
    water_info = NULL;
    debug = 0;
    for (;;) {
        command = interpreter.GetNextTAG();
        if (command < 0) {
            break;
        }
        CommandExe[command](interpreter.arguments);
    }
    obj_anime_num = objanime_list;
    effect_num = effect_list;
}
/**
 * Sets the interior's ambient light colour.
 *
 * @mangled CommandAMBIENT__FPPv__2
 * @address 0x19FC50
 * @size 0x44
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandAMBIENT(void **arguments) {
    EdInInfo->ambient[0] = *(float *) arguments[0];
    EdInInfo->ambient[1] = *(float *) arguments[1];
    EdInInfo->ambient[2] = *(float *) arguments[2];
    EdInInfo->ambient[3] = 128.0f;
}
/**
 * Sets the colour and direction of one of the interior's lights.
 *
 * @mangled CommandLIGHT_C__FPPv__2
 * @address 0x19FCA0
 * @size 0x128
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void CommandLIGHT_C(void **arguments) {
    sceVu0FVECTOR direction;
    int light = *(int *) arguments[6];

    direction[0] = *(float *) arguments[0];
    direction[1] = *(float *) arguments[1];
    direction[2] = *(float *) arguments[2];
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);
    light--;
    EdInInfo->light_direction[0][light] = direction[0];
    EdInInfo->light_direction[1][light] = direction[1];
    EdInInfo->light_direction[2][light] = direction[2];
    EdInInfo->light_direction[3][light] = direction[3];
    EdInInfo->light_colour[light][0] = *(float *) arguments[3];
    EdInInfo->light_colour[light][1] = *(float *) arguments[4];
    EdInInfo->light_colour[light][2] = *(float *) arguments[5];
    EdInInfo->light_colour[light][3] = 128.0f;
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandLIGHT_C__FPPv__2);
#endif
/**
 * Sets the interior's fog distances and colour.
 *
 * @mangled CommandFOG__FPPv__2
 * @address 0x19FDD0
 * @size 0x78
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandFOG(void **arguments) {
    EdInInfo->fog.near_distance = *(float *) arguments[0];
    EdInInfo->fog.far_distance = *(float *) arguments[1];
    EdInInfo->fog.red = *(int *) arguments[2];
    EdInInfo->fog.green = *(int *) arguments[3];
    EdInInfo->fog.blue = *(int *) arguments[4];
    EdInInfo->fog.intensity = *(float *) arguments[5];
    EdInInfo->fog.exponent = *(float *) arguments[6];
}
/**
 * Sets the colour the interior clears to.
 *
 * @mangled CommandBG_COL__FPPv__2
 * @address 0x19FE50
 * @size 0x44
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandBG_COL(void **arguments) {
    EdInInfo->background_colour[0] = *(float *) arguments[0];
    EdInInfo->background_colour[1] = *(float *) arguments[1];
    EdInInfo->background_colour[2] = *(float *) arguments[2];
    EdInInfo->background_colour[3] = 128.0f;
}
/**
 * Sets the interior's projection distance.
 *
 * @mangled CommandPROJECTION__FPPv
 * @address 0x19FEA0
 * @size 0x18
 */
static void CommandPROJECTION(void **arguments) {
    EdInInfo->projection = *(float *) arguments[0];
}
/**
 * Accepts the villager command and does nothing with it.
 *
 * @mangled CommandPEOPLE__FPPv__2
 * @address 0x19FEC0
 * @size 0x8
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandPEOPLE(void **) {
}
/**
 * Moves the script's current directory to one below the interior's own.
 *
 * @mangled CommandCD__FPPv__2
 * @address 0x19FED0
 * @size 0x60
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandCD(void **arguments) {
    GetEditDataDir(CurrentDir);
    strcat(CurrentDir, "in/");
    strcat(CurrentDir, (char *) arguments[0]);
}
/**
 * Accepts the object-animation command and does nothing with it.
 *
 * @mangled CommandOBJ_ANIME__FPPv__2
 * @address 0x19FF30
 * @size 0x8
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandOBJ_ANIME(void **) {
}

/**
 * Reserved effect-setup hook with no operation.
 */
static void SetEffect(EFFECT_TYPE, char *, float *, float *, float *) {
}
/**
 * Places a fire effect in the interior.
 *
 * @mangled CommandFIRE__FPPv__2
 * @address 0x19FF50
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void CommandFIRE(void **arguments) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR scale;
    sceVu0FVECTOR rotation = {0.0f, 0.0f, 0.0f, 0.0f};

    position[0] = *(float *) arguments[1];
    position[1] = *(float *) arguments[2];
    position[2] = *(float *) arguments[3];
    position[3] = 1.0f;
    scale[0] = *(float *) arguments[4];
    scale[1] = *(float *) arguments[4];
    scale[2] = *(float *) arguments[4];
    SetEffect(EFFECT_FIRE, (char *) arguments[0], position, scale, rotation);
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFIRE__FPPv__2);
#endif
/**
 * Places a flame effect in the interior.
 *
 * @mangled CommandFLAME__FPPv__2
 * @address 0x19FFF0
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void CommandFLAME(void **arguments) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR scale;
    sceVu0FVECTOR rotation = {0.0f, 0.0f, 0.0f, 0.0f};

    position[0] = *(float *) arguments[1];
    position[1] = *(float *) arguments[2];
    position[2] = *(float *) arguments[3];
    position[3] = 1.0f;
    scale[0] = *(float *) arguments[4];
    scale[1] = *(float *) arguments[4];
    scale[2] = *(float *) arguments[4];
    SetEffect(EFFECT_FLAME, (char *) arguments[0], position, scale, rotation);
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFLAME__FPPv__2);
#endif
/**
 * Places a glow effect in the interior.
 *
 * @mangled CommandBRIGHT__FPPv__2
 * @address 0x1A0090
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void CommandBRIGHT(void **arguments) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR scale;
    sceVu0FVECTOR rotation = {0.0f, 0.0f, 0.0f, 0.0f};

    position[0] = *(float *) arguments[1];
    position[1] = *(float *) arguments[2];
    position[2] = *(float *) arguments[3];
    position[3] = 1.0f;
    scale[0] = *(float *) arguments[4];
    scale[1] = *(float *) arguments[4];
    scale[2] = *(float *) arguments[4];
    SetEffect(EFFECT_BRIGHT, (char *) arguments[0], position, scale, rotation);
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandBRIGHT__FPPv__2);
#endif
/**
 * Turns the interior's debug drawing on.
 *
 * @mangled CommandDEBUG__FPPv
 * @address 0x1A0130
 * @size 0x10
 */
static void CommandDEBUG(void **) {
    debug = 1;
}
/**
 * Names one of the interior's four moving parts.
 *
 * @mangled CommandMOTION_PARTS__FPPv__2
 * @address 0x1A0140
 * @size 0xF4
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandMOTION_PARTS(void **arguments) {
    if (motion_parts_list < 4) {
        EDIT_MOTION_PARTS_INFO *motion = &EdInInfo->motion_parts[motion_parts_list];
        motion_parts_list++;
        strcpy(motion->name, CurrentDir);
        strcat(motion->name, (char *) arguments[0]);
        motion->values[0] = *(float *) arguments[1];
        motion->values[1] = *(float *) arguments[2];
        motion->values[2] = *(float *) arguments[3];
        motion->values[3] = *(float *) arguments[4];
        motion->values[4] = *(float *) arguments[5];
        motion->values[5] = *(float *) arguments[6];
        motion->values[6] = *(float *) arguments[7];
        motion->values[7] = *(float *) arguments[8];
        motion->values[8] = *(float *) arguments[9];
    }
}
/**
 * Names one of the interior's eight water surfaces.
 *
 * @mangled CommandWATER_SURFACE__FPPv__2
 * @address 0x1A0240
 * @size 0x184
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static void CommandWATER_SURFACE(void **arguments) {
    if (water_list < 8) {
        EDIT_WATER_INFO *surface = &EdInInfo->water_surfaces[water_list];
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
        surface->parts_no = -1;
        water_info = surface;
    }
}
/**
 * Starts a ripple on the interior's water surface.
 *
 * @mangled CommandWATER_SHAKE__FPPv__2
 * @address 0x1A03D0
 * @size 0x9C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static void CommandWATER_SHAKE(void **arguments) {
    EDIT_WATER_INFO *info = water_info;

    if (info != NULL) {
        int i = 0;
        while (1) {
            if (info->wave[i].active == 0.0f && info->wave[i].z == 0.0f) {
                EDIT_WATER_WAVE_VIEW *wave = (EDIT_WATER_WAVE_VIEW *) &((EDIT_WATER_WAVE_INFO *) info)[i];
                wave->x = (float) *(int *) arguments[0];
                wave->y = (float) *(int *) arguments[1];
                wave->z = *(float *) arguments[3];
                wave->active = *(float *) arguments[2];
                break;
            }
            i++;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SHAKE__FPPv__2);
#endif
