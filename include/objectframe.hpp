#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrameVu1;


class CObjectFrame {
public:
    /**
     * @mangled SetFrame__12CObjectFrameFP9CFrameVu1i
     * @address 0x1570C0
     * @size 0x30
     * @unknownret
     */
    void SetFrame(CFrameVu1 *, int);

    /**
     * @mangled FrameObjectOnOff__12CObjectFrameFPci
     * @address 0x1570F0
     * @size 0xA0
     * @unknownret
     */
    void FrameObjectOnOff(char *, int);

    /**
     * @mangled Draw__12CObjectFrameFv
     * @address 0x157190
     * @size 0x90
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawLOD__12CObjectFrameFPfiiPi
     * @address 0x157220
     * @size 0x240
     * @unknownret
     */
    void DrawLOD(float *, int, int, int *);

    /**
     * @mangled Initialize__12CObjectFrameFP9CFrameVu1
     * @address 0x157460
     * @size 0x90
     * @unknownret
     */
    void Initialize(CFrameVu1 *);
};
