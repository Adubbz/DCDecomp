#include "stockitem.hpp"

// C imports
#include "cstring.hpp"
// Our imports
#include "item.hpp"

/* @ 0x23F590 (0x70 bytes) -- Initialize__10CStockItemFv */
void CStockItem::Initialize() {
    memset(this->dungeon_items, 0, sizeof(this->dungeon_items));
    memset(this->dungeon_item_vols, 0, sizeof(this->dungeon_item_vols));
    memset(this->weapon_items, 0, sizeof(this->weapon_items));
    memset(this->consumable_items, 0, sizeof(this->consumable_items));
}

/* @ 0x23F600 (0xC0 bytes) -- SearchSpace__10CStockItemFii*/
s16 CStockItem::SearchSpace(int index, int space) {
    int ret = 0;

    // Validate the index based on the search space, and return the item ID if valid.
    switch (space) {
        case SEARCHSPACE_DUNGEON_ITEMS:
            ret = this->dungeon_items[index];
            if ((ret >= ITEM_DUNGEON_START) && (ret <= ITEM_DUNGEON_END)) {
                return ret;
            }

            ret = 0;
            break;
        case SEARCHSPACE_WEAPONS:
            if (this->weapon_items[index].id >= ITEM_WEAPON_START) {
                ret = this->weapon_items[index].id;
            }
            break;
        case SEARCHSPACE_CONSUMABLE_ITEMS:
            ret = this->consumable_items[index].id;
            if (ret < ITEM_CONSUMABLE_START) {
                ret = 0;
                return ret;
            }
            break;
    }

    return ret;
}

/* @ 0x23F6C0 (0x30 bytes) -- SetItemToPos__10CStockItemFiPsPs */
void CStockItem::SetItemToPos(int index, s16 *item, s16 *vol) {
    // Update the current item in slot, and return the old item to the caller.
    s16 *item_slot = &this->dungeon_items[index];
    s16 old_item = *item_slot;
    *item_slot = *item;
    *item = old_item;

    // Update the current count of the item in slot, and return the old count to the caller.
    s16 *vol_slot = &this->dungeon_item_vols[index];
    s16 old_vol = *vol_slot;
    *vol_slot = *vol;
    *vol = old_vol;
}
