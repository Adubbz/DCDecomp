#include "common.h"

#include <libvu0.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "boxvu0.hpp"
#include "camera.hpp"
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
#include "mapparts.hpp"
#include "mainselect.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "npcharacter.hpp"
#include "rect.hpp"
#include "scriptinterpreter.hpp"
#include "texture.hpp"
#include "water.hpp"

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

/**
 * Identifies the kind of editor effect requested.
 */
// clang-format off
enum EFFECT_TYPE {
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
INCLUDE_ASM("asm/nonmatchings/edit_in", RunEvent__FiP7CCamera__2);
/**
 * Starts an interior system event, handing it the camera it is to play through.
 *
 * @mangled RunSystemEvent__FiP7CCamera__2
 * @address 0x19BD00
 * @size 0xA0
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", RunSystemEvent__FiP7CCamera__2);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInInit__FfPc);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", EditInLoop__Fv);
/**
 * Draws the interior for one frame.
 *
 * @mangled MainDraw__Fv__2
 * @address 0x19D2D0
 * @size 0x6AC
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", MainDraw__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1082__2);
/**
 * Draws the interior's water surfaces, ordered back to front from the camera.
 *
 * @mangled DrawWaterSurface__FP7CCamera
 * @address 0x19D980
 * @size 0x15C
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", DrawWaterSurface__FP7CCamera);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCharacter__Fv);
/**
 * Applies the right stick to the interior camera, holding its height and distance in
 * range.
 *
 * @mangled MoveCamera__FP13CCameraFollow__2
 * @address 0x19E080
 * @size 0x164
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", MoveCamera__FP13CCameraFollow__2);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", SetCameraPos__FP6CFrameP7CCameraP10CCharacter);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", VillagerCollision__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1369);
/**
 * Enters the interior's textures once they have been read.
 *
 * @mangled LoadTexture__Fv__2
 * @address 0x19ECB0
 * @size 0x20C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadTexture__Fv__2);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadData__Fv);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1537);
/**
 * Builds one interior part from its archive entry.
 *
 * @mangled LoadPTS__FP9CMapPartsPUi
 * @address 0x19F6F0
 * @size 0x238
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadPTS__FP9CMapPartsPUi);
/**
 * Collects the function points one interior part defines.
 *
 * @mangled GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA
 * @address 0x19F930
 * @size 0x74
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", GetFuncPoint__FiPUiP16EPARTS_FUNC_DATA);
/**
 * Uploads the interior's texture-animation state to the graphics synthesizer.
 *
 * @mangled setTexAnim__Fv
 * @address 0x19F9B0
 * @size 0x1C0
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", setTexAnim__Fv);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1589);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1590);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandLIGHT_C__FPPv__2);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFIRE__FPPv__2);
/**
 * Places a flame effect in the interior.
 *
 * @mangled CommandFLAME__FPPv__2
 * @address 0x19FFF0
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandFLAME__FPPv__2);
/**
 * Places a glow effect in the interior.
 *
 * @mangled CommandBRIGHT__FPPv__2
 * @address 0x1A0090
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandBRIGHT__FPPv__2);
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
        surface->unk_70 = *(int *) arguments[19];
        surface->unk_74 = *(int *) arguments[20];
        surface->unk_78 = *(int *) arguments[21];
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
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SHAKE__FPPv__2);
