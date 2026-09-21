#include "common.h"

#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "edit_in.hpp"
#include "editloop.hpp"
#include "scriptinterpreter.hpp"

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

/**
 * Identifies the kind of editor effect requested.
 */
// clang-format off
enum EFFECT_TYPE {
};
// clang-format on

INCLUDE_ASM("asm/nonmatchings/edit_in", GetElementObjName__FP14EDITPARTS_INFOPPcii);
/**
 * Reads one interior object's levels of detail and hangs them off its part.
 *
 * @mangled LoadMapObject__FP9CMapPartsPPUiP14CDataAlloc2_1_
 * @address 0x19B790
 * @size 0x204
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadMapObject__FP9CMapPartsPPUiP14CDataAlloc2_1_);
/**
 * Reads the interior's event script into the script arena.
 *
 * @mangled LoadScript__Fv__2
 * @address 0x19B9A0
 * @size 0x294
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", LoadScript__Fv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @419);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @420);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @421__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @422);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", StepWater__Fv);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", SearchMapJump__FPfPf);
/**
 * Puts the player where the interior's map jump says they arrive.
 *
 * @mangled GetMapJumpPos__FP10CCharacter
 * @address 0x19E2F0
 * @size 0x12C
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", GetMapJumpPos__FP10CCharacter);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1194);
/**
 * Gives the position, heading and part of one of the interior's doors.
 *
 * @mangled GetDoorPos__FiPfPfPiPi
 * @address 0x19E420
 * @size 0xF8
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", GetDoorPos__FiPfPfPiPi);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", GetCollision__FP6CCPolyP7CBoxVu0__2);
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
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandCD__FPPv__2);
INCLUDE_RODATA("asm/nonmatchings/edit_in", @1627__2);
/**
 * Accepts the object-animation command and does nothing with it.
 *
 * @mangled CommandOBJ_ANIME__FPPv__2
 * @address 0x19FF30
 * @size 0x8
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandOBJ_ANIME__FPPv__2);

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
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandDEBUG__FPPv);
/**
 * Names one of the interior's four moving parts.
 *
 * @mangled CommandMOTION_PARTS__FPPv__2
 * @address 0x1A0140
 * @size 0xF4
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandMOTION_PARTS__FPPv__2);
/**
 * Names one of the interior's eight water surfaces.
 *
 * @mangled CommandWATER_SURFACE__FPPv__2
 * @address 0x1A0240
 * @size 0x184
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SURFACE__FPPv__2);
/**
 * Starts a ripple on the interior's water surface.
 *
 * @mangled CommandWATER_SHAKE__FPPv__2
 * @address 0x1A03D0
 * @size 0x9C
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/edit_in", CommandWATER_SHAKE__FPPv__2);
