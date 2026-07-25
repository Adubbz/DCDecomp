#pragma once

#include "common.h"

class CMainItemModel {
public:
    /* ?ret */ void GetFreeCashNo(void); // @ 0x1D4540 (0x50 bytes) -- mangled: GetFreeCashNo__14CMainItemModelFv
    /* ?ret */ void GetFreeModelNo(void); // @ 0x1D4590 (0x50 bytes) -- mangled: GetFreeModelNo__14CMainItemModelFv
    /* ?ret */ void SetCashModel(int, unsigned int *, unsigned int *, int); // @ 0x1D45E0 (0x190 bytes) -- mangled: SetCashModel__14CMainItemModelFiPUiPUii
    /* ?ret */ void DeleteModel(int); // @ 0x1D4770 (0xB0 bytes) -- mangled: DeleteModel__14CMainItemModelFi
    /* ?ret */ void SetHandModel(int); // @ 0x1D4820 (0x120 bytes) -- mangled: SetHandModel__14CMainItemModelFi
    /* ?ret */ void AllReleasItem(void); // @ 0x1D4940 (0x80 bytes) -- mangled: AllReleasItem__14CMainItemModelFv
    /* ?ret */ void SetThrowModel(int, float *, float *); // @ 0x1D49C0 (0x110 bytes) -- mangled: SetThrowModel__14CMainItemModelFiPfPf
    /* ?ret */ void Draw(void); // @ 0x1D4AD0 (0x350 bytes) -- mangled: Draw__14CMainItemModelFv
    /* ?ret */ void Step(void); // @ 0x1D4E20 (0x520 bytes) -- mangled: Step__14CMainItemModelFv
    /* ?ret */ void Initialize(void); // @ 0x1D5340 (0xF0 bytes) -- mangled: Initialize__14CMainItemModelFv
};

class CActiveItemPack {
public:
    /* ?ret */ void CheckStatusType(void); // @ 0x1D5430 (0x150 bytes) -- mangled: CheckStatusType__15CActiveItemPackFv
};
