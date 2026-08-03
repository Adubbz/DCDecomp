#pragma once

#include "common.h"

class CMainItemModel {
public:
    /**
     * @mangled GetFreeCashNo__14CMainItemModelFv
     * @address 0x1D4540
     * @size 0x50
     * @unknownret
     */
    void GetFreeCashNo(void);

    /**
     * @mangled GetFreeModelNo__14CMainItemModelFv
     * @address 0x1D4590
     * @size 0x50
     * @unknownret
     */
    void GetFreeModelNo(void);

    /**
     * @mangled SetCashModel__14CMainItemModelFiPUiPUii
     * @address 0x1D45E0
     * @size 0x190
     * @unknownret
     */
    void SetCashModel(int, unsigned int *, unsigned int *, int);

    /**
     * @mangled DeleteModel__14CMainItemModelFi
     * @address 0x1D4770
     * @size 0xB0
     * @unknownret
     */
    void DeleteModel(int);

    /**
     * @mangled SetHandModel__14CMainItemModelFi
     * @address 0x1D4820
     * @size 0x120
     * @unknownret
     */
    void SetHandModel(int);

    /**
     * @mangled AllReleasItem__14CMainItemModelFv
     * @address 0x1D4940
     * @size 0x80
     * @unknownret
     */
    void AllReleasItem(void);

    /**
     * @mangled SetThrowModel__14CMainItemModelFiPfPf
     * @address 0x1D49C0
     * @size 0x110
     * @unknownret
     */
    void SetThrowModel(int, float *, float *);

    /**
     * @mangled Draw__14CMainItemModelFv
     * @address 0x1D4AD0
     * @size 0x350
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__14CMainItemModelFv
     * @address 0x1D4E20
     * @size 0x520
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Initialize__14CMainItemModelFv
     * @address 0x1D5340
     * @size 0xF0
     * @unknownret
     */
    void Initialize(void);
};

class CActiveItemPack {
public:
    /**
     * @mangled CheckStatusType__15CActiveItemPackFv
     * @address 0x1D5430
     * @size 0x150
     * @unknownret
     */
    void CheckStatusType(void);
};
