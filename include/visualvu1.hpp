#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;


class CVisualVu1 {
public:
    /**
     * @mangled Initialize__10CVisualVu1Fv
     * @address 0x134EC0
     * @size 0x40
     * @unknownret
     */
    virtual void Initialize(void);

    /**
     * Takes the address that the model data of the object is read from. The
     * base object keeps none.
     *
     * @mangled SetMDTDataAddress__10CVisualVu1FPUi
     * @address 0x137E80
     * @size 0x10
     */
    virtual void SetMDTDataAddress(unsigned int *data);

    /**
     * Gets the address that the model data of the object is read from. The
     * base object keeps none.
     *
     * @mangled GetMDTDataAddress__10CVisualVu1Fv
     * @address 0x137E90
     * @size 0x10
     */
    virtual unsigned int *GetMDTDataAddress(void);

    /**
     * @mangled RemakeData__10CVisualVu1FPUi
     * @address 0x134BB0
     * @size 0x10
     * @unknownret
     */
    virtual void RemakeData(unsigned int *);

    /**
     * @mangled DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x135000
     * @size 0x970
     * @unknownret
     */
    virtual void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *,
                         int, int);

    /**
     * @mangled DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x134BC0
     * @size 0xD0
     * @unknownret
     */
    virtual void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *,
                         int, int);

    /**
     * @mangled __ct__10CVisualVu1Fv
     * @address 0x134F00
     * @size 0x50
     */
    CVisualVu1(void);

    /**
     * @mangled CreateVUdataFromMDT__10CVisualVu1FPUiPUiii
     * @address 0x135AA0
     * @size 0x3B0
     * @unknownret
     */
    void CreateVUdataFromMDT(unsigned int *, unsigned int *, int, int);

    /**
     * @mangled CreateVUdataFromMDTRemake__10CVisualVu1FPUiPUii
     * @address 0x135E50
     * @size 0x290
     * @unknownret
     */
    void CreateVUdataFromMDTRemake(unsigned int *, unsigned int *, int);
};

class CVisual {
public:
    /**
     * @mangled Initialize__7CVisualFv
     * @address 0x134B50
     * @size 0x10
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__7CVisualFv
     * @address 0x134B60
     * @size 0x50
     */
    CVisual(void);
};
