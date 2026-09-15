#pragma once

#include "common.h"

#include <libvu0.h>

#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;

/**
 * Draws the polygons of a water surface with the VU1 microprogram.
 *
 * Adds no method of its own: its vtable is CVisualVu1's, entry for entry.
 */
class CVisualPolyVu1;

class CVisualVu1 {
public:
    s32 unk_00; /**< Unknown base-visual state preceding the virtual table pointer. */
    s32 unk_04; /**< Unknown base-visual state preceding the virtual table pointer. */
    /**
     * Clears the vector-unit visual's packet pointers and sizes.
     *
     * @mangled Initialize__10CVisualVu1Fv
     * @address 0x134EC0
     * @size 0x3C
     */
    virtual void Initialize(void);

    /**
     * Takes the address that the model data of the object is read from. The
     * base object keeps none.
     *
     * @mangled SetMDTDataAddress__10CVisualVu1FPUi
     * @address 0x137E80
     * @size 0x8
     */
    virtual void SetMDTDataAddress(unsigned int *data);

    /**
     * Gets the address that the model data of the object is read from. The
     * base object keeps none.
     *
     * @mangled GetMDTDataAddress__10CVisualVu1Fv
     * @address 0x137E90
     * @size 0xC
     */
    virtual unsigned int *GetMDTDataAddress(void);

    /**
     * Returns zero because this visual has no retained model data to rebuild.
     *
     * @mangled RemakeData__10CVisualVu1FPUi
     * @address 0x134BB0
     * @size 0xC
     */
    virtual int RemakeData(unsigned int *);

    /**
     * Draws the visual into a packet through the vector unit.
     *
     * @mangled DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x135000
     * @size 0x964
     */
    virtual int DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *,
                        int, int);

    /**
     * Draws the visual into a VIF packet.
     *
     * @mangled DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x134BC0
     * @size 0xC4
     */
    virtual int DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *,
                        int, int);

    s32 unk_0C; /**< Unknown base-visual state following the virtual table pointer. */

    /**
     * Constructs a vector-unit visual and clears it.
     *
     * @mangled __ct__10CVisualVu1Fv
     * @address 0x134F00
     * @size 0x50
     */
    CVisualVu1(void);

    /**
     * @mangled CreateVUdataFromMDT__10CVisualVu1FPUiPUiii
     * @address 0x135AA0
     * @size 0x3A8
     * @unknownret
     */
    void CreateVUdataFromMDT(unsigned int *, unsigned int *, int, int);

    /**
     * @mangled CreateVUdataFromMDTRemake__10CVisualVu1FPUiPUii
     * @address 0x135E50
     * @size 0x288
     * @unknownret
     */
    void CreateVUdataFromMDTRemake(unsigned int *, unsigned int *, int);
};

class CVisualPolyVu1 : public CVisualVu1 {
public:
    sceVu0FVECTOR unk_010;
};

STATIC_ASSERT(sizeof(CVisualPolyVu1) == 0x20);

class CVisual {
public:
    /**
     * Clears the visual's draw flags.
     *
     * @mangled Initialize__7CVisualFv
     * @address 0x134B50
     * @size 0x10
     */
    void Initialize(void);

    /**
     * Constructs a visual and clears it.
     *
     * @mangled __ct__7CVisualFv
     * @address 0x134B60
     * @size 0x44
     */
    CVisual(void);
};
