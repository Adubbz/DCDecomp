#pragma once

#include "common.h"

class CMainItemModel {
private:
    u8 data[0x2810];

public:
    /**
     * @mangled GetFreeCashNo__14CMainItemModelFv
     * @address 0x1D4540
     * @size 0x44
     * @unknownret
     */
    void GetFreeCashNo(void);

    /**
     * @mangled GetFreeModelNo__14CMainItemModelFv
     * @address 0x1D4590
     * @size 0x48
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
     * @size 0xA4
     * @unknownret
     */
    void DeleteModel(int);

    /**
     * @mangled SetHandModel__14CMainItemModelFi
     * @address 0x1D4820
     * @size 0x120
     * @unknownret
     */
    int SetHandModel(int);

    /**
     * @mangled AllReleasItem__14CMainItemModelFv
     * @address 0x1D4940
     * @size 0x78
     * @unknownret
     */
    void AllReleasItem(void);

    /**
     * @mangled SetThrowModel__14CMainItemModelFiPfPf
     * @address 0x1D49C0
     * @size 0x108
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
     * @size 0xE4
     * @unknownret
     */
    void Initialize(void);
};

/**
 * Names the model each item the player is running draws with.
 */
class CActiveItemPack {
public:
    s32 now;                /**< Slot the player is using now. */
    s32 item[4];            /**< Item each slot runs. */
    s32 model[9];           /**< Model each slot draws with, or -1 for none. */
    CMainItemModel *models; /**< The pool the models come out of. */

    /**
     * Gives back how the item the player is using now is run.
     *
     * @mangled CheckStatusType__15CActiveItemPackFv
     * @address 0x1D5430
     * @size 0x144
     */
    int CheckStatusType(void);
};

STATIC_ASSERT(sizeof(CActiveItemPack) == 0x3C);

STATIC_ASSERT(sizeof(CMainItemModel) == 0x2810);
