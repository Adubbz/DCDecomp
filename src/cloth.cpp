#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 285

#include "cloth.hpp"

#include "frame.hpp"
#include "framevu1.hpp"
#include "mglib.hpp"

/**
 * Draws the simulated cloth through a temporary world-space frame.
 */
void CCloth::Draw() {
    CFrameVu1 draw_frame;
    int i;

    draw_frame.SetVisual(this);
    draw_frame.max[0] = 10000.0f;
    draw_frame.max[1] = 10000.0f;
    draw_frame.max[2] = 10000.0f;
    draw_frame.min[0] = -10000.0f;
    draw_frame.min[1] = -10000.0f;
    draw_frame.min[2] = -10000.0f;
    for (i = 0; i < 8; i++) {
        float *corner[2];

        corner[0] = draw_frame.min;
        corner[1] = draw_frame.max;
        draw_frame.corner[i][3] = 1.0f;
        draw_frame.corner[i][0] = corner[(i & 1) != 0][0];
        draw_frame.corner[i][1] = corner[(i & 2) != 0][1];
        draw_frame.corner[i][2] = corner[(i & 4) != 0][2];
    }

    CFrameAttr attr;

    attr.fog_enable = 0;
    attr.unk_0B = 0;
    attr.unk_08 = 0;
    float origin = 0.0f;

    draw_frame.SetAttr(attr, 1, 0);
    draw_frame.SetPosition(origin, origin, origin);
    MGDraw(&draw_frame);
}

/**
 * Puts every cloth vertex back where its frame says it rests.
 *
 * @mangled Clear__6CClothFv
 * @address 0x13B7A0
 * @size 0x100
 */
INCLUDE_ASM("asm/nonmatchings/cloth", Clear__6CClothFv);
/**
 * Advances the cloth simulation, pushing its vertices out of the exclusion boxes.
 *
 * @mangled Step__6CClothFi
 * @address 0x13B8A0
 * @size 0xBCC
 */
INCLUDE_ASM("asm/nonmatchings/cloth", Step__6CClothFi);
/**
 * Draws the cloth through the vector unit.
 *
 * @mangled DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x13C470
 * @size 0xC0
 */
INCLUDE_ASM("asm/nonmatchings/cloth", DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
/**
 * Draws the cloth into a VIF packet.
 *
 * @mangled DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x13C530
 * @size 0xC0
 */
INCLUDE_ASM("asm/nonmatchings/cloth", DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii);
/**
 * Builds the packet that draws the cloth and gives back its size.
 *
 * @mangled CreateVUData__6CClothFPUi
 * @address 0x13C5F0
 * @size 0x3B8
 */
INCLUDE_ASM("asm/nonmatchings/cloth", CreateVUData__6CClothFPUi);
/**
 * Gives the cloth its default grid size, stiffness and gravity.
 *
 * @mangled InitParam__6CClothFv
 * @address 0x13C9B0
 * @size 0x1C0
 */
INCLUDE_ASM("asm/nonmatchings/cloth", InitParam__6CClothFv);

/**
 * Constructs a cloth grid with the requested dimensions and spacing.
 */
CCloth::CCloth(int grid_i, int grid_j, float grid_pitch) {
    InitParam();
    num_i = grid_i;
    num_j = grid_j;
    pitch = grid_pitch;
}

/**
 * Takes the cloth's vertex storage out of an arena.
 *
 * @mangled Initialize__6CClothFP14CDataAlloc2_1_
 * @address 0x13CBF0
 * @size 0x458
 */
INCLUDE_ASM("asm/nonmatchings/cloth", Initialize__6CClothFP14CDataAlloc2_1_);
/**
 * Builds the cloth's grid from a model's mesh and takes its storage out of an arena.
 *
 * @mangled Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_
 * @address 0x13D050
 * @size 0x200
 */
INCLUDE_ASM("asm/nonmatchings/cloth", Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_);
