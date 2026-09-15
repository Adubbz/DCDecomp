#pragma once

#include "common.h"

class CMainItemModel {
private:
    u8 data[0x2810];

public:
    /**
     * Gives a free cache slot, or -1 where none is free.
     *
     * @mangled GetFreeCashNo__14CMainItemModelFv
     * @address 0x1D4540
     * @size 0x44
     */
    void GetFreeCashNo(void);

    /**
     * Gives a free model slot, or -1 where none is free.
     *
     * @mangled GetFreeModelNo__14CMainItemModelFv
     * @address 0x1D4590
     * @size 0x48
     */
    void GetFreeModelNo(void);

    /**
     * Reads one item model into a cache slot.
     *
     * @mangled SetCashModel__14CMainItemModelFiPUiPUii
     * @address 0x1D45E0
     * @size 0x190
     */
    void SetCashModel(int, unsigned int *, unsigned int *, int);

    /**
     * Releases one model slot.
     *
     * @mangled DeleteModel__14CMainItemModelFi
     * @address 0x1D4770
     * @size 0xA4
     */
    void DeleteModel(int);

    /**
     * Puts one item model in the player's hand.
     *
     * @mangled SetHandModel__14CMainItemModelFi
     * @address 0x1D4820
     * @size 0x120
     */
    int SetHandModel(int);

    /**
     * Releases every item model.
     *
     * @mangled AllReleasItem__14CMainItemModelFv
     * @address 0x1D4940
     * @size 0x78
     */
    void AllReleasItem(void);

    /**
     * Starts one item model flying from a position along a heading.
     *
     * @mangled SetThrowModel__14CMainItemModelFiPfPf
     * @address 0x1D49C0
     * @size 0x108
     */
    void SetThrowModel(int, float *, float *);

    /**
     * Draws every item model the player is carrying or has thrown.
     *
     * @mangled Draw__14CMainItemModelFv
     * @address 0x1D4AD0
     * @size 0x350
     */
    void Draw(void);

    /**
     * Advances every item model by a frame.
     *
     * @mangled Step__14CMainItemModelFv
     * @address 0x1D4E20
     * @size 0x520
     */
    void Step(void);

    /**
     * Clears every item model and cache slot.
     *
     * @mangled Initialize__14CMainItemModelFv
     * @address 0x1D5340
     * @size 0xE4
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
