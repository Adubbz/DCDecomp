#include "stockitem.hpp"

// C imports
#include "cstring.hpp"
// Our imports
#include "item.hpp"

/* @ 0x23F590 (0x70 bytes) -- Initialize__10CStockItemFv */
void CStockItem::Initialize() {
    memset(this->dungeon_items, 0, sizeof(this->dungeon_items));
    memset(this->unk78, 0, sizeof(this->unk78));
    memset(this->weapon_items, 0, sizeof(this->weapon_items));
    memset(this->consumable_items, 0, sizeof(this->consumable_items));
}

/* @ 0x23F600 (0xC0 bytes) -- SearchSpace__10CStockItemFii*/
s16 CStockItem::SearchSpace(int index, int space) {
    int ret = 0;

    switch (space) {
        case DungeonItems:
            ret = this->dungeon_items[index];
            if ((ret >= ITEM_DUNGEON_START) && (ret <= ITEM_DUNGEON_END)) {
                return ret;
            }

            ret = 0;
            break;
        case Weapons:
            if (this->weapon_items[index].id >= ITEM_WEAPON_START) {
                ret = this->weapon_items[index].id;
            }
            break;
        case ConsumableItems:
            ret = this->consumable_items[index].id;
            if (ret < ITEM_CONSUMABLE_START) {
                ret = 0;
                return ret;
            }
            break;
    }

    return ret;
}