#pragma once

#include "common.h"

#include "frame.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CVisualVu1;


/**
 * Draws a model with the VU1 microprogram.
 */
class CFrameVu1 : public CFrame {
public:
    u8 unk_260[0x10];

    /**
     * @mangled DrawVu1__9CFrameVu1FPUiP10RenderInfo
     * @address 0x129400
     * @size 0xD10
     * @unknownret
     */
    virtual void DrawVu1(unsigned int *, RenderInfo *);

    /**
     * @mangled DrawVu1__9CFrameVu1FP13sceVif1PacketP10RenderInfo
     * @address 0x12A110
     * @size 0x80
     * @unknownret
     */
    virtual void DrawVu1(sceVif1Packet *, RenderInfo *);

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
    virtual void Initialize(void);

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

STATIC_ASSERT(sizeof(CFrameVu1) == 0x270);
