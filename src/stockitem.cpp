#include "stockitem.hpp"

#include <cstdio>
#include <cstring>
#include "itemdata.hpp"
#include "types.h"

void CStockItem::Initialize() {
    memset(this->dungeon_items, 0, sizeof(this->dungeon_items));
    memset(this->dungeon_item_vols, 0, sizeof(this->dungeon_item_vols));
    memset(this->weapons, 0, sizeof(this->weapons));
    memset(this->attachments, 0, sizeof(this->attachments));
}

s16 CStockItem::SearchSpace(int pos, int space) {
    int ret = 0;

    // Validate the pos based on the search space, and return the item ID if valid.
    switch (space) {
        case SEARCHSPACE_DUNGEON_ITEMS:
            ret = this->dungeon_items[pos];
            if ((ret >= ITEM_DUNGEON_START) && (ret <= ITEM_DUNGEON_END)) {
                return ret;
            }

            ret = 0;
            break;
        case SEARCHSPACE_WEAPONS:
            if (this->weapons[pos].itemNo >= ITEM_WEAPON_START) {
                ret = this->weapons[pos].itemNo;
            }
            break;
        case SEARCHSPACE_ATTACH:
            ret = this->attachments[pos].itemNo;
            if (ret < ITEM_ATTACH_START) {
                ret = 0;
                return ret;
            }
            break;
    }

    return ret;
}

void CStockItem::SetItemToPos(int pos, s16 *item, s16 *vol) {
    // Update the current item in slot, and return the old item to the caller.
    s16 *item_slot = &this->dungeon_items[pos];
    s16 old_item = *item_slot;
    *item_slot = *item;
    *item = old_item;

    // Update the current count of the item in slot, and return the old count to the caller.
    s16 *vol_slot = &this->dungeon_item_vols[pos];
    s16 old_vol = *vol_slot;
    *vol_slot = *vol;
    *vol = old_vol;
}

void CStockItem::GetItemInfo(int pos, s16 *item, s16 *vol) {
    *item = this->dungeon_items[pos];
    *vol = this->dungeon_item_vols[pos];
}

void CStockItem::SetWepToPos(int pos, WEAPON_HAVE *weapon) {
    WEAPON_HAVE *slot = &this->weapons[pos];
    WEAPON_HAVE old_weapon;
    memcpy(&old_weapon, slot, sizeof(WEAPON_HAVE));
    memcpy(slot, weapon, sizeof(WEAPON_HAVE));
    memcpy(weapon, &old_weapon, sizeof(WEAPON_HAVE));
}

void CStockItem::GetWeaponInfo(int pos, WEAPON_HAVE *weapon) {
    memcpy(weapon, &this->weapons[pos], sizeof(WEAPON_HAVE));
}

void CStockItem::SetAttachToPos(int pos, ATTACH_LIST *attach) {
    ATTACH_LIST *slot = &this->attachments[pos];
    ATTACH_LIST old_attach;
    memcpy(&old_attach, slot, sizeof(ATTACH_LIST));
    memcpy(slot, attach, sizeof(ATTACH_LIST));
    memcpy(attach, &old_attach, sizeof(ATTACH_LIST));
}

void CStockItem::GetAttachInfo(int pos, ATTACH_LIST *attach) {
    memcpy(attach, &this->attachments[pos], sizeof(ATTACH_LIST));
}

int CStockItem::SearchItem(int itemNo) {
    if (itemNo < ITEM_ATTACH_START) {
        return 0;
    }

    int ret = false;

    if ((itemNo > 0 && itemNo < ITEM_ATTACH_START) || itemNo >= ITEM_WEAPON_START) {
        for (int i = 0; i < 30; i++) {
            if (this->weapons[i].itemNo == itemNo) {
                ret = true;
                break;
            }
        }
    } else if (itemNo >= ITEM_ATTACH_START && itemNo < ITEM_DUNGEON_START) {
        for (int i = 0; i < 30; i++) {
            if (this->attachments[i].itemNo == itemNo) {
                ret = true;
                break;
            }
        }
    } else if (itemNo >= ITEM_DUNGEON_START && itemNo <= ITEM_DUNGEON_END) {
        for (int i = 0; i < 60; i++) {
            if (this->dungeon_items[i] == itemNo) {
                ret = true;
                break;
            }
        }
    }

    if (ret != 0) {
        printf("itemNo [%d]  is exist!\n", itemNo);
    } else {
        printf("itemNo [%d]  is none!\n", itemNo);
    }

    return ret;
}
