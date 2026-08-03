#pragma once

#include "common.h"

class CMapObject {
public:
    /**
     * @mangled GetCollisionFrame__10CMapObjectFv
     * @address 0x1574F0
     * @size 0xA0
     * @unknownret
     */
    void GetCollisionFrame(void);

    /**
     * @mangled FrameObjectOnOff__10CMapObjectFPci
     * @address 0x157590
     * @size 0x130
     * @unknownret
     */
    void FrameObjectOnOff(char *, int);

    /**
     * @mangled Draw__10CMapObjectFv
     * @address 0x1576C0
     * @size 0x40
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawLOD__10CMapObjectFPfiiPi
     * @address 0x157700
     * @size 0x60
     * @unknownret
     */
    void DrawLOD(float *, int, int, int *);

    /**
     * @mangled DrawShadow__10CMapObjectFi
     * @address 0x157760
     * @size 0x110
     * @unknownret
     */
    void DrawShadow(int);

    /**
     * @mangled DrawShade__10CMapObjectFv
     * @address 0x157870
     * @size 0xA0
     * @unknownret
     */
    void DrawShade(void);

    /**
     * @mangled Initialize__10CMapObjectFv
     * @address 0x157910
     * @size 0x60
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__10CMapObjectFv
     * @address 0x157970
     * @size 0x70
     */
    CMapObject(void);
};
