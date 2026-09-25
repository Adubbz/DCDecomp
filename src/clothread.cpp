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
#include <libpkt.h>

#include "bound.hpp"
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
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "sysmes.hpp"
#ifdef NON_MATCHING // draft includes
#include "visualvu1.hpp"
#include <cstdlib>
#include <libpkt.h>
#include "rect.hpp"
#endif

/**
 * Cloth instance currently receiving configuration commands.
 */
extern CCloth *pCloth;

/**
 * Last exclusion bound attached while reading one cloth configuration.
 */
static CBound *pBound;

/**
 * Model frame whose cloth configuration is being read.
 */
static CFrameVu1 *ParentFrame;

/**
 * Allocator used for the cloth currently being initialized.
 */
static CDataAlloc2<1> *DataBuffer;

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
#ifdef NON_MATCHING
static int GetArg(input_str &input, int *args, void **argv);
static int SearchCommand(input_str &input, int *command);
static int SkipSpace(input_str &input);
static int CheckChar(char c);

CCloth *InitCloth(CFrameVu1 *frame, input_str &input, CDataAlloc2<1> *alloc) {
    char words[16][256];
    void *argv[16];
    int command;

    DataBuffer = alloc;
    pCloth = new ((u_long128 *) alloc->Alloc(0x856)) CCloth(16, 16, 1.0f);
    ParentFrame = frame;
    pBound = NULL;
    if (frame == NULL) {
        return NULL;
    }
    if (pCloth == NULL) {
        return NULL;
    }
    SkipSpace(input);
    for (int i = 0; i < 16; i++) {
        argv[i] = words[i];
    }
    while (SearchCommand(input, &command) != 0) {
        if (command >= 9 || command < 0) {
            printf("unknown command!!\n");
            continue;
        }
        int result = GetArg(input, Command[command].args, (void **) argv);
        if (result == 0) {
            break;
        }
        if (result < 0) {
            printf("error!!\n");
        }
        CommandExe[command](argv);
    }
    return pCloth;
}
#else
INCLUDE_ASM("asm/nonmatchings/clothread", InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_);
#endif

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
static void CommandFRAME(void **argv) {
    CFrameVu1 *frame = (CFrameVu1 *) ParentFrame->SearchFrame((char *) argv[0]);

    pCloth->frame = frame;
    if (frame != NULL) {
        frame->attr.draw_on = 2;
        CVisualVu1 *visual = frame->GetVisual();
        pCloth->Initialize((MDT_HEADER *) visual->GetMDTDataAddress(), DataBuffer);
    }
}

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
#ifdef NON_MATCHING
static void CommandBOUND(void **argv) {
    sceVu0FVECTOR vectors[4];
    CBound *bound = new ((u_long128 *) DataBuffer->Alloc(0x14)) CBound(1.0f, 1.0f, 1.0f);

    if (bound == NULL) {
        return;
    }
    int arg = 0;
    CFrame *frame = ParentFrame->SearchFrame((char *) argv[arg++]);
    if (frame == NULL) {
        return;
    }
    for (int i = 0; i < 4; i++) {
        vectors[i][0] = *(float *) argv[arg];
        vectors[i][1] = *(float *) argv[(int) (arg + 1)];
        vectors[i][2] = *(float *) argv[(int) (arg + 2)];
        arg += 3;
        vectors[i][3] = 1.0f;
    }
    vectors[0][3] = 0.0f;
    bound->SetDir(frame, vectors[1], vectors[2], vectors[0], vectors[3][0], vectors[3][1]);
    float x;
    float y;
    float z;
    z = vectors[3][2];
    y = vectors[3][1];
    x = vectors[3][0];
    bound->extent[0] = x;
    bound->extent[1] = y;
    bound->extent[2] = z;
    if (bound->extent[0] > 0.0f) {
        bound->reciprocal[0] = 1.0f / x;
    }
    if (bound->extent[1] > 0.0f) {
        bound->reciprocal[1] = 1.0f / y;
    }
    if (bound->extent[2] > 0.0f) {
        bound->reciprocal[2] = 1.0f / z;
    }
    bound->friction = *(float *) argv[arg];
    if (pBound == NULL) {
        pCloth->bound = bound;
    } else {
        pBound->next = bound;
    }
    pBound = bound;
}
#else
INCLUDE_ASM("asm/nonmatchings/clothread", CommandBOUND__FPPv);
#endif
/**
 * Reads one command argument out of a model script.
 *
 * @mangled GetArg__FR9input_strPiPPv__2
 * @address 0x140000
 * @size 0x320
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static int GetArg(input_str &input, int *args, void **argv) {
    char word[256];

    if (!SkipSpace(input))
        return 0;
    int argc = 0;
    while (args[argc++] >= 0)
        ;
    int c;
    for (int i = 0; i < argc - 1; i++) {
        int length = 0;
        if (!SkipSpace(input))
            return 0;
        while (1) {
            if (input.get(&c) == 0)
                return 0;
            if (c == ',' || !CheckChar(c))
                break;
            word[length++] = c;
        }
        word[length] = 0;
        switch (args[i]) {
            case 0:
                if (word[0] != '"')
                    return -1;
                for (length = 1;; length++) {
                    char value = word[length];
                    if (value == '"') {
                        word[length] = 0;
                        break;
                    }
                    if (value == 0)
                        return -1;
                }
                strcpy((char *) argv[i], word + 1);
                break;
            case 1:
                for (length = 0; word[length] != 0; length++) {
                    char value = word[length];
                    if (value < '0' || value > '9')
                        return -1;
                }
                *(int *) argv[i] = atoi(word);
                break;
            case 2:
                for (length = 0; word[length] != 0; length++) {
                    char value = word[length];
                    if ((value < '0' || value > '9') && value != '.' && value != '-')
                        return -1;
                }
                *(float *) argv[i] = (float) atof(word);
                break;
            default:
                return -1;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/clothread", GetArg__FR9input_strPiPPv__2);
#endif
/**
 * Finds the command table entry a model script's next word names.
 *
 * @mangled SearchCommand__FR9input_strPi__2
 * @address 0x140320
 * @size 0x144
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static int SearchCommand(input_str &input, int *command) {
    char word[256];

    if (!SkipSpace(input))
        return 0;
    int length = 0;
    int c;
    while (1) {
        if (input.get(&c) == 0)
            return 0;
        if (!CheckChar(c))
            break;
        word[length++] = c;
    }
    word[length] = 0;
    for (int i = 0; i < 9; i++) {
        if (strcmp(Command[i].name, word) == 0) {
            *command = i;
            return 1;
        }
    }
    *command = 10;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/clothread", SearchCommand__FR9input_strPi__2);
#endif
/**
 * Steps a model script past whitespace and comments.
 *
 * @mangled SkipSpace__FR9input_str__2
 * @address 0x140470
 * @size 0x94
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
#ifdef NON_MATCHING
static int SkipSpace(input_str &input) {
    char *str;
    int i;

    str = input.data;
    i = input.pos;
    while (i < input.size) {
        if (CheckChar(str[i])) {
            break;
        }
        i++;
    }
    input.pos = i;

    if (i >= input.size)
        return 0;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/clothread", SkipSpace__FR9input_str__2);
#endif
/**
 * Reports whether a character is not whitespace.
 *
 * @mangled CheckChar__Fc__2
 * @address 0x140510
 * @size 0x60
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
static int CheckChar(char c) {
    int found = 0;
    if (c == ' ')
        found = 1;
    if (c == '\t')
        found = 1;
    if (c == '\n')
        found = 1;
    if (c == '\r')
        found = 1;
    return !found;
}

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
void MoveImageTest(sceVif1Packet *packet, int src_base, int src_width, int src_format,
                   const CRect_i_ &rect, int dst_base, int dst_width, int dst_format, int dst_x,
                   int dst_y, int direction) {
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_BITBLTBUF,
                     SCE_GS_SET_BITBLTBUF(src_base, src_width, src_format, dst_base, dst_width,
                                          dst_format));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXPOS,
                     SCE_GS_SET_TRXPOS(rect.x, rect.y, dst_x, dst_y, direction));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXREG, SCE_GS_SET_TRXREG(rect.width, rect.height));
    sceVif1PkAddGsAD(packet, SCE_GS_TRXDIR, 2);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

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
