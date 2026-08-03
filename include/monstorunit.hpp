#pragma once

#include "common.h"

class CDungeonMap;
class CDataAlloc2_1_; /* disassembler's filesystem-safe spelling of CDataAlloc2<1> (dataalloc.hpp) */

class CMonstorUnit {
public:
    /**
     * @mangled GetMonstorNum__12CMonstorUnitFv
     * @address 0x1D7A40
     * @size 0x60
     * @unknownret
     */
    void GetMonstorNum(void);

    /**
     * @mangled DrawMapSymbol__12CMonstorUnitFPf
     * @address 0x1D7AA0
     * @size 0x1E0
     * @unknownret
     */
    void DrawMapSymbol(float *);

    /**
     * @mangled SetKey__12CMonstorUnitFv
     * @address 0x1D7C80
     * @size 0x150
     * @unknownret
     */
    void SetKey(void);

    /**
     * @mangled CheckEventFlag2__12CMonstorUnitFv
     * @address 0x1D7F30
     * @size 0x90
     * @unknownret
     */
    void CheckEventFlag2(void);

    /**
     * @mangled ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
     * @address 0x1D7FC0
     * @size 0x3A0
     * @unknownret
     */
    void ArrangementPos(CDungeonMap *, int, int, int);

    /**
     * @mangled AllBin2__12CMonstorUnitFv
     * @address 0x1D8360
     * @size 0x50
     * @unknownret
     */
    void AllBin2(void);

    /**
     * @mangled PalletSet__12CMonstorUnitFv
     * @address 0x1D83B0
     * @size 0x1C0
     * @unknownret
     */
    void PalletSet(void);

    /**
     * @mangled PalletStep__12CMonstorUnitFv
     * @address 0x1D8570
     * @size 0x420
     * @unknownret
     */
    void PalletStep(void);

    /**
     * @mangled SoundCheck__12CMonstorUnitFv
     * @address 0x1D8990
     * @size 0x340
     * @unknownret
     */
    void SoundCheck(void);

    /**
     * @mangled DrawMonstor__12CMonstorUnitFv
     * @address 0x1D8CD0
     * @size 0x540
     * @unknownret
     */
    void DrawMonstor(void);

    /**
     * @mangled DrawMonstorCursor__12CMonstorUnitFv
     * @address 0x1D9210
     * @size 0xE0
     * @unknownret
     */
    void DrawMonstorCursor(void);

    /**
     * @mangled DrawShadowMonstor__12CMonstorUnitFv
     * @address 0x1D9800
     * @size 0x1A0
     * @unknownret
     */
    void DrawShadowMonstor(void);

    /**
     * @mangled CheckViewLevel__12CMonstorUnitFv
     * @address 0x1D99A0
     * @size 0x3C0
     * @unknownret
     */
    void CheckViewLevel(void);

    /**
     * @mangled SelectAttachi__12CMonstorUnitFv
     * @address 0x1D9D60
     * @size 0x1B0
     * @unknownret
     */
    void SelectAttachi(void);

    /**
     * @mangled CheckDmg__12CMonstorUnitFv
     * @address 0x1D9F10
     * @size 0x2910
     * @unknownret
     */
    void CheckDmg(void);

    /**
     * @mangled MoveCheck__12CMonstorUnitFPfPfi
     * @address 0x1DC820
     * @size 0x5B0
     * @unknownret
     */
    void MoveCheck(float *, float *, int);

    /**
     * @mangled MoveCheck2__12CMonstorUnitFv
     * @address 0x1DCDD0
     * @size 0x370
     * @unknownret
     */
    void MoveCheck2(void);

    /**
     * @mangled MoveChecMonster__12CMonstorUnitFv
     * @address 0x1DD140
     * @size 0x400
     * @unknownret
     */
    void MoveChecMonster(void);

    /**
     * @mangled Step__12CMonstorUnitFi
     * @address 0x1DD540
     * @size 0x24B0
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled CleanViewMonstor__12CMonstorUnitFi
     * @address 0x1DF9F0
     * @size 0x4A0
     * @unknownret
     */
    void CleanViewMonstor(int);

    /**
     * @mangled SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_
     * @address 0x1DFE90
     * @size 0x420
     * @unknownret
     */
    void SetupBaseModel(int, int, int, CDataAlloc2_1_ *);

    /**
     * @mangled SetupViewMonstor__12CMonstorUnitFiPfi
     * @address 0x1E02B0
     * @size 0x1390
     * @unknownret
     */
    void SetupViewMonstor(int, float *, int);
};
