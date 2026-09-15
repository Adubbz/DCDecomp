#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 187

#include "common.h"
#include "sce/libcdvd.h"
#include "sce/sifdev.h"
#include "sce/sifrpc.h"

#include <cassert>
#include <cstdio>
#include <cstring>

#include "btsysscript.hpp"
#include "cloth.hpp"
#include "clothread.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "framevu1.hpp"
#include "gameutil.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "sysmes.hpp"

/**
 * Cloth instance currently receiving configuration commands.
 */
extern CCloth *pCloth;

/**
 * Sets and clamps the cloth grid dimensions.
 */
static void CommandSIZE(void **argv);
/**
 * Attaches the cloth to the frame named by the command.
 */
static void CommandFRAME(void **argv);
/**
 * Sets the scale used when calculating cloth normals.
 */
static void CommandNORMAL(void **argv);
/**
 * Sets the cloth follow vector.
 */
static void CommandFOLLOW(void **argv);
/**
 * Sets the cloth stiffness vector.
 */
static void CommandK(void **argv);
/**
 * Sets the cloth response to wind.
 */
static void CommandWINDEFFECT(void **argv);
/**
 * Sets the cloth gravity vector.
 */
static void CommandGRAVITY(void **argv);
/**
 * Selects which cloth rows divide their polygons.
 */
static void CommandPOLYDIVE(void **argv);
/**
 * Creates and attaches an exclusion bound for the cloth.
 */
static void CommandBOUND(void **argv);

/**
 *              Names one keyword of the cloth configuration file.
 *
 * The argument list gives each argument's kind -- 0 for a word, 1 for an
 * integer, 2 for a float -- and ends at -1.
 */
struct COMMAND_INFO {
    char *name;   /**< Keyword the line starts with. */
    int args[16]; /**< Kind of each argument, ended by -1. */
};

/* The keywords a cloth configuration file may use. */
static COMMAND_INFO Command[9] = {
    {"SIZE", {1, 1, -1}},
    {"FRAME", {0, -1}},
    {"NORMAL", {2, -1}},
    {"FOLLOW", {2, 2, 2, -1}},
    {"K", {2, 2, 2, -1}},
    {"WINDEFFECT", {2, -1}},
    {"GRAVITY", {2, 2, 2, -1}},
    {"POLYDIV", {0, -1}},
    {"BOUND", {0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, -1}},
};

/* What each of those keywords does, in the same order. */
static void (*CommandExe[9])(void **) = {
    CommandSIZE,
    CommandFRAME,
    CommandNORMAL,
    CommandFOLLOW,
    CommandK,
    CommandWINDEFFECT,
    CommandGRAVITY,
    CommandPOLYDIVE,
    CommandBOUND,
};

INCLUDE_RODATA("asm/nonmatchings/clothread", @254);
INCLUDE_RODATA("asm/nonmatchings/clothread", @255);

/**
 * Reads one model's cloth description and attaches the simulation.
 *
 * @mangled InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_
 * @address 0x13F9C0
 * @size 0x1B4
 */
INCLUDE_ASM("asm/nonmatchings/clothread", InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_);

static void CommandSIZE(void **argv) {
    int num_i = *(int *) argv[0];
    int num_j = *(int *) argv[1];

    if (num_i <= 0)
        num_i = 1;
    if (num_i > 16)
        num_i = 16;
    if (num_j <= 0)
        num_j = 1;
    if (num_j > 16)
        num_j = 16;
    pCloth->num_i = num_i;
    pCloth->num_j = num_j;
}

/**
 * Names the frame the following model commands act on.
 *
 * @mangled CommandFRAME__FPPv
 * @address 0x13FBE0
 * @size 0x7C
 */
INCLUDE_ASM("asm/nonmatchings/clothread", CommandFRAME__FPPv);

static void CommandNORMAL(void **argv) {
    pCloth->normal_scale = *(float *) argv[0];
}

static void CommandFOLLOW(void **argv) {
    pCloth->follow[0] = *(float *) argv[0];
    pCloth->follow[1] = *(float *) argv[1];
    pCloth->follow[2] = *(float *) argv[2];
}

static void CommandK(void **argv) {
    pCloth->stiffness[0] = *(float *) argv[0];
    pCloth->stiffness[1] = *(float *) argv[1];
    pCloth->stiffness[2] = *(float *) argv[2];
}

static void CommandWINDEFFECT(void **argv) {
    pCloth->wind_effect = *(float *) argv[0];
}

static void CommandGRAVITY(void **argv) {
    pCloth->gravity[0] = *(float *) argv[0];
    pCloth->gravity[1] = *(float *) argv[1];
    pCloth->gravity[2] = *(float *) argv[2];
}

static void CommandPOLYDIVE(void **argv) {
    char *s = (char *) argv[0];
    int i = 0;

    while (i < 16) {
        char c = *s;
        if (c == 0)
            break;
        pCloth->polygon_divide[i] = (c != '0');
        s++;
        i++;
    }
}
/**
 * Adds one exclusion box to the cloth on the current frame.
 *
 * @mangled CommandBOUND__FPPv
 * @address 0x13FDB0
 * @size 0x24C
 */
INCLUDE_ASM("asm/nonmatchings/clothread", CommandBOUND__FPPv);
/**
 * Reads one command argument out of a model script.
 *
 * @mangled GetArg__FR9input_strPiPPv__2
 * @address 0x140000
 * @size 0x320
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/clothread", GetArg__FR9input_strPiPPv__2);
/**
 * Finds the command table entry a model script's next word names.
 *
 * @mangled SearchCommand__FR9input_strPi__2
 * @address 0x140320
 * @size 0x144
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/clothread", SearchCommand__FR9input_strPi__2);
/**
 * Steps a model script past whitespace and comments.
 *
 * @mangled SkipSpace__FR9input_str__2
 * @address 0x140470
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/clothread", SkipSpace__FR9input_str__2);
/**
 * Reports whether a character is not whitespace.
 *
 * @mangled CheckChar__Fc__2
 * @address 0x140510
 * @size 0x60
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
INCLUDE_ASM("asm/nonmatchings/clothread", CheckChar__Fc__2);

/**
 * Converts analog-stick displacement into a motion speed and movement state.
 */
int keyCtrl(float x, float y, MOTION_INFO *motion) {
    int result = 0;

    if (y != 0.0f || x != 0.0f) {
        float m;
        float speed;

        result = 2;

        if (x < 0.0f)
            x *= -1.0f;
        if (y < 0.0f)
            y *= -1.0f;

        if (x >= y)
            m = x;
        else
            m = y;

        speed = 0.8f * (0.1f + m);
        motion[2].speed = speed;
        if (speed >= 0.7f)
            motion[2].speed = 0.7f;

        if (x + y >= 0.85f)
            result = 1;
    }

    return result;
}

/**
 * Copies one rectangle of video memory to another.
 *
 * @mangled MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
 * @address 0x140660
 * @size 0x1A4
 */
INCLUDE_ASM("asm/nonmatchings/clothread", MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii);

/**
 * Turns a frame toward a heading by one angular step and returns the new yaw.
 */
float unitRotation(CFrameVu1 *frame, float heading) {
    float rotation[4];
    float delta;
    float abs_delta;

    frame->GetRotation(rotation);
    delta = heading - rotation[1];
    if (delta <= 0.0f)
        abs_delta = -1.0f * delta;
    else
        abs_delta = delta;

    if (abs_delta <= 3.141592653589793) {
        if (abs_delta <= 0.2617993877991494)
            delta = 0.0f;
    } else {
        abs_delta = 6.283185307179586 - abs_delta;
        if (abs_delta <= 0.2617993877991494)
            delta = 0.0f;
    }

    if (delta > 0.0f) {
        if (delta <= 3.141592653589793)
            rotation[1] += 0.2617994f;
        else
            rotation[1] -= 0.2617994f;
    }

    if (delta < 0.0f) {
        if (delta >= -3.141592653589793)
            rotation[1] -= 0.2617994f;
        else
            rotation[1] += 0.2617994f;
    }

    if (0.0f == delta)
        rotation[1] = heading;

    if (rotation[1] <= -3.141592653589793)
        rotation[1] += 6.2831855f;
    if (rotation[1] >= 3.141592653589793)
        rotation[1] -= 6.2831855f;

    return rotation[1];
}
