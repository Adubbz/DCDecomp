#pragma once

#include "common.h"

class CDungeonMap;
class CDataAlloc2_1_; /* disassembler's filesystem-safe spelling of CDataAlloc2<1> (dataalloc.hpp) */

class CMonstorUnit {
public:
    /* ?ret */ void GetMonstorNum(void); // @ 0x1D7A40 (0x60 bytes) -- mangled: GetMonstorNum__12CMonstorUnitFv
    /* ?ret */ void DrawMapSymbol(float *); // @ 0x1D7AA0 (0x1E0 bytes) -- mangled: DrawMapSymbol__12CMonstorUnitFPf
    /* ?ret */ void SetKey(void); // @ 0x1D7C80 (0x150 bytes) -- mangled: SetKey__12CMonstorUnitFv
    /* ?ret */ void CheckEventFlag2(void); // @ 0x1D7F30 (0x90 bytes) -- mangled: CheckEventFlag2__12CMonstorUnitFv
    /* ?ret */ void ArrangementPos(CDungeonMap *, int, int, int); // @ 0x1D7FC0 (0x3A0 bytes) -- mangled: ArrangementPos__12CMonstorUnitFP11CDungeonMapiii
    /* ?ret */ void AllBin2(void); // @ 0x1D8360 (0x50 bytes) -- mangled: AllBin2__12CMonstorUnitFv
    /* ?ret */ void PalletSet(void); // @ 0x1D83B0 (0x1C0 bytes) -- mangled: PalletSet__12CMonstorUnitFv
    /* ?ret */ void PalletStep(void); // @ 0x1D8570 (0x420 bytes) -- mangled: PalletStep__12CMonstorUnitFv
    /* ?ret */ void SoundCheck(void); // @ 0x1D8990 (0x340 bytes) -- mangled: SoundCheck__12CMonstorUnitFv
    /* ?ret */ void DrawMonstor(void); // @ 0x1D8CD0 (0x540 bytes) -- mangled: DrawMonstor__12CMonstorUnitFv
    /* ?ret */ void DrawMonstorCursor(void); // @ 0x1D9210 (0xE0 bytes) -- mangled: DrawMonstorCursor__12CMonstorUnitFv
    /* ?ret */ void DrawShadowMonstor(void); // @ 0x1D9800 (0x1A0 bytes) -- mangled: DrawShadowMonstor__12CMonstorUnitFv
    /* ?ret */ void CheckViewLevel(void); // @ 0x1D99A0 (0x3C0 bytes) -- mangled: CheckViewLevel__12CMonstorUnitFv
    /* ?ret */ void SelectAttachi(void); // @ 0x1D9D60 (0x1B0 bytes) -- mangled: SelectAttachi__12CMonstorUnitFv
    /* ?ret */ void CheckDmg(void); // @ 0x1D9F10 (0x2910 bytes) -- mangled: CheckDmg__12CMonstorUnitFv
    /* ?ret */ void MoveCheck(float *, float *, int); // @ 0x1DC820 (0x5B0 bytes) -- mangled: MoveCheck__12CMonstorUnitFPfPfi
    /* ?ret */ void MoveCheck2(void); // @ 0x1DCDD0 (0x370 bytes) -- mangled: MoveCheck2__12CMonstorUnitFv
    /* ?ret */ void MoveChecMonster(void); // @ 0x1DD140 (0x400 bytes) -- mangled: MoveChecMonster__12CMonstorUnitFv
    /* ?ret */ void Step(int); // @ 0x1DD540 (0x24B0 bytes) -- mangled: Step__12CMonstorUnitFi
    /* ?ret */ void CleanViewMonstor(int); // @ 0x1DF9F0 (0x4A0 bytes) -- mangled: CleanViewMonstor__12CMonstorUnitFi
    /* ?ret */ void SetupBaseModel(int, int, int, CDataAlloc2_1_ *); // @ 0x1DFE90 (0x420 bytes) -- mangled: SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_
    /* ?ret */ void SetupViewMonstor(int, float *, int); // @ 0x1E02B0 (0x1390 bytes) -- mangled: SetupViewMonstor__12CMonstorUnitFiPfi
};
