#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CVisualVu1;
struct RenderInfo;
struct sceVif1Packet;


/**
 * Draws a model with the VU1 microprogram.
 */
class CFrameVu1 {
public:
    u8 unk_000[0x220];
    float pos[4]; /**< World position of the frame. */

    /**
     * @mangled DrawVu1__9CFrameVu1FPUiP10RenderInfo
     * @address 0x129400
     * @size 0xD10
     * @unknownret
     */
    void DrawVu1(unsigned int *, RenderInfo *);

    /**
     * @mangled DrawVu1__9CFrameVu1FP13sceVif1PacketP10RenderInfo
     * @address 0x12A110
     * @size 0x80
     * @unknownret
     */
    void DrawVu1(sceVif1Packet *, RenderInfo *);

    /**
     * @mangled SetVisual__9CFrameVu1FP10CVisualVu1
     * @address 0x12A210
     * @size 0x10
     * @unknownret
     */
    void SetVisual(CVisualVu1 *);

    /**
     * @mangled GetVisual__9CFrameVu1Fv
     * @address 0x12A220
     * @size 0x10
     * @unknownret
     */
    void GetVisual(void);

    /**
     * @mangled Initialize__9CFrameVu1Fv
     * @address 0x12A230
     * @size 0x30
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__9CFrameVu1Fv
     * @address 0x12A260
     * @size 0x50
     */
    CFrameVu1(void);

    /**
     * @mangled __as__9CFrameVu1FR9CFrameVu1
     * @address 0x12A2B0
     * @size 0x50
     * @unknownret
     */
    void __as(CFrameVu1 &);
};
