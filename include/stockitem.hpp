#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
struct WEAPON_HAVE;

enum SearchSpace {
    SEARCHSPACE_DUNGEON_ITEMS    = 0,
    SEARCHSPACE_WEAPONS         = 1,
    SEARCHSPACE_CONSUMABLE_ITEMS = 2,
};

struct WeaponItem {
    s16 id;
    s16 data[123];
};

struct ConsumableItem {
    s16 id;
    s16 data[15];
};

class CStockItem {
private:
    s16 dungeon_items[60];
    /* Per-slot "vol": the amount left in that copy of the item, seeded from
     * ITEM_LIST +10. Travels with dungeon_items through every swap and sort. */
    s16 dungeon_item_vols[60];
    WeaponItem weapon_items[30];
    ConsumableItem consumable_items[30];
public:
    /**
     * @mangled Initialize__10CStockItemFv
     * @address 0x23F590
     * @size 0x70
     */
    void Initialize();

    /**
     * @mangled SearchSpace__10CStockItemFii
     * @address 0x23F600
     * @size 0xC0
     */
    s16 SearchSpace(int item, int mode);

    /**
     * @mangled SetItemToPos__10CStockItemFiPsPs
     * @address 0x23F6C0
     * @size 0x30
     */
    void SetItemToPos(int index, s16 *item, s16 *vol);

    /**
     * @mangled GetItemInfo__10CStockItemFiPsPs
     * @address 0x23F6F0
     * @size 0x20
     * @unknownret
     */
    void GetItemInfo(int index, s16 *item, s16 *vol);

    /**
     * @mangled SetWepToPos__10CStockItemFiP11WEAPON_HAVE
     * @address 0x23F710
     * @size 0x80
     * @unknownret
     */
    void SetWepToPos(int, WEAPON_HAVE *);

    /**
     * @mangled GetWeaponInfo__10CStockItemFiP11WEAPON_HAVE
     * @address 0x23F790
     * @size 0x40
     * @unknownret
     */
    void GetWeaponInfo(int, WEAPON_HAVE *);

    /**
     * @mangled SetAttachToPos__10CStockItemFiP11ATTACH_LIST
     * @address 0x23F7D0
     * @size 0x80
     * @unknownret
     */
    void SetAttachToPos(int, ATTACH_LIST *);

    /**
     * @mangled GetAttachInfo__10CStockItemFiP11ATTACH_LIST
     * @address 0x23F850
     * @size 0x40
     * @unknownret
     */
    void GetAttachInfo(int, ATTACH_LIST *);

    /**
     * @mangled SearchItem__10CStockItemFi
     * @address 0x23F890
     * @size 0x190
     * @unknownret
     */
    void SearchItem(int);

    /**
     * @mangled SeitonChargeItemBoardSub__10CStockItemFv
     * @address 0x23FB40
     * @size 0x130
     * @unknownret
     */
    void SeitonChargeItemBoardSub(void);

    /**
     * @mangled SeitonItem__10CStockItemFv
     * @address 0x23FC70
     * @size 0x80
     * @unknownret
     */
    void SeitonItem(void);

    /**
     * @mangled SeitonAttach__10CStockItemFv
     * @address 0x23FF10
     * @size 0x80
     * @unknownret
     */
    void SeitonAttach(void);

    /**
     * @mangled GetNowModeSpace__10CStockItemFi
     * @address 0x23FF90
     * @size 0xC0
     * @unknownret
     */
    void GetNowModeSpace(int);
};
STATIC_ASSERT(sizeof(CStockItem) == 0x21C0);
