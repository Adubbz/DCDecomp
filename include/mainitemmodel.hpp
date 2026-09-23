#pragma once

#include "common.h"

#include "frame.hpp"

class CMainItemModel {
public:
    u_int *cash[6];        /**< Model data each cache slot holds, or zero where the slot is free. */
    s32 cash_item[6];      /**< Item whose model each cache slot holds. */
    s32 cash_lock[6];      /**< Model slots that draw each cache slot's model. */
    s32 model[16];         /**< What each model slot holds; -1 where the slot is free. */
    s32 model_cash[16];    /**< Cache slot whose model each model slot draws. */
    u8 unk_0C8[8];
    CFrame frame[16];      /**< Frame that places each model slot's model. */
    float velocity[16][4]; /**< Distance each thrown model moves in a frame. */
    s32 throw_time[16];    /**< Frames each thrown model has flown. */

    /**
     * Gives a free cache slot, or -1 where none is free.
     *
     * @mangled GetFreeCashNo__14CMainItemModelFv
     * @address 0x1D4540
     * @size 0x44
     */
    int GetFreeCashNo(void);

    /**
     * Gives a free model slot, or -1 where none is free.
     *
     * @mangled GetFreeModelNo__14CMainItemModelFv
     * @address 0x1D4590
     * @size 0x48
     */
    int GetFreeModelNo(void);

    /**
     * Reads one item model into a cache slot.
     *
     * @mangled SetCashModel__14CMainItemModelFiPUiPUii
     * @address 0x1D45E0
     * @size 0x190
     */
    int SetCashModel(int, unsigned int *, unsigned int *, int);

    /**
     * Releases one model slot.
     *
     * @mangled DeleteModel__14CMainItemModelFi
     * @address 0x1D4770
     * @size 0xA4
     */
    void DeleteModel(int index);

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
     * Starts an item model flying from a position along a heading and returns its slot.
     *
     * @mangled SetThrowModel__14CMainItemModelFiPfPf
     * @address 0x1D49C0
     * @size 0x108
     */
    int SetThrowModel(int, float *, float *);

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

/** Pool that owns the active item models used during dungeon play. */
extern "C" CMainItemModel mainItemModel;
