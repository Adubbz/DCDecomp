#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
struct sceVif1Packet;


class CVisualMDTVu1 {
public:
    /**
     * @mangled SetMDTDataAddress__13CVisualMDTVu1FPUi
     * @address 0x134F50
     * @size 0x10
     * @unknownret
     */
    void SetMDTDataAddress(unsigned int *);

    /**
     * @mangled GetMDTDataAddress__13CVisualMDTVu1Fv
     * @address 0x134F60
     * @size 0x10
     * @unknownret
     */
    void GetMDTDataAddress(void);

    /**
     * @mangled Initialize__13CVisualMDTVu1Fv
     * @address 0x134F70
     * @size 0x40
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__13CVisualMDTVu1Fv
     * @address 0x134FB0
     * @size 0x50
     */
    CVisualMDTVu1(void);

    /**
     * @mangled DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x1360E0
     * @size 0x120
     * @unknownret
     */
    void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int);

    /**
     * @mangled DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x136200
     * @size 0x40
     * @unknownret
     */
    void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int);

    /**
     * @mangled RemakeData__13CVisualMDTVu1FPUi
     * @address 0x136240
     * @size 0x50
     * @unknownret
     */
    void RemakeData(unsigned int *);
};
