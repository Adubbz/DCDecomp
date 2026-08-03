#pragma once

#include "common.h"
#include "vu1.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct RenderInfo;
class CDataAlloc2_1_;
struct MDT_HEADER;
struct sceVif1Packet;


class CCloth {
public:
    /**
     * @mangled Draw__6CClothFv
     * @address 0x13B640
     * @size 0x160
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Clear__6CClothFv
     * @address 0x13B7A0
     * @size 0x100
     * @unknownret
     */
    void Clear(void);

    /**
     * @mangled Step__6CClothFi
     * @address 0x13B8A0
     * @size 0xBD0
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x13C470
     * @size 0xC0
     * @unknownret
     */
    void DrawVu1(unsigned int *, float (*)[4], RenderInfo *, VU1_PROGRAM, RenderInfo *, int, int);

    /**
     * @mangled DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
     * @address 0x13C530
     * @size 0xC0
     * @unknownret
     */
    void DrawVu1(sceVif1Packet *, float (*)[4], RenderInfo *, VU1_PROGRAM, sceVif1Packet *, int, int);

    /**
     * @mangled CreateVUData__6CClothFPUi
     * @address 0x13C5F0
     * @size 0x3C0
     * @unknownret
     */
    void CreateVUData(unsigned int *);

    /**
     * @mangled InitParam__6CClothFv
     * @address 0x13C9B0
     * @size 0x1C0
     * @unknownret
     */
    void InitParam(void);

    /**
     * @mangled __ct__6CClothFiif
     * @address 0x13CB70
     * @size 0x80
     */
    CCloth(int, int, float);

    /**
     * @mangled Initialize__6CClothFP14CDataAlloc2_1_
     * @address 0x13CBF0
     * @size 0x460
     * @unknownret
     */
    void Initialize(CDataAlloc2_1_ *);

    /**
     * @mangled Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_
     * @address 0x13D050
     * @size 0x200
     * @unknownret
     */
    void Initialize(MDT_HEADER *, CDataAlloc2_1_ *);
};
