#include "menuitemstep.hpp"

#include <cstring>

#include "dngstatusdata.hpp"
#include "itemdata.hpp"
#include "savedata.hpp"

#ifdef NON_MATCHING
void CMenuItemStep::Initialize(void) {
    frame = 0;
    unk_08 = -1;
    unk_04 = -1;
    enabled = 1;
    pending_volume = 0;
    for (int i = 0; i < 4; i++) {
        unk_10[i] = 0;
    }
    for (int i = 0; i < 4; i++) {
        unk_18[i] = -1;
        unk_20[i] = -1;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menuitemstep", Initialize__13CMenuItemStepFv);
#endif
#ifdef NON_MATCHING
void CMenuItemStep::LoopStep(int interval) {
    if (enabled != 0) {
        // A negative interval asks for the default of one second.
        if (interval < 0) {
            interval = 60;
        }
        frame++;
        if (frame >= interval) {
            pending_volume++;
            frame = 0;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menuitemstep", LoopStep__13CMenuItemStepFi);
#endif
#ifdef NON_MATCHING
void CMenuItemStep::CheckItemVolume(void) {
    int elapsed = pending_volume;
    if (elapsed <= 0) {
        return;
    }

    int preservation[100];
    memset(preservation, 0, sizeof(preservation));
    CDngStatusData *status = SaveData->GetDngStatus();
    int item_count = status->inventory.item_capacity;
    unk_0E = 0;

    for (int slot = 0; slot < item_count; slot++) {
        s16 &item = status->inventory.dungeon_items[slot];
        if (item != ITEM_ICE_BLOCK && item != ITEM_SMALL_ICE && item != ITEM_TINY_ICE) {
            continue;
        }

        int row = slot / 5;
        int column = slot % 5;
        if (row != 0) {
            preservation[slot - 5] += 100;
        }
        if (row != item_count / 5) {
            preservation[slot + 5] += 100;
        }
        if (column != 0) {
            preservation[slot - 1] += 100;
        }
        if (column != 4) {
            preservation[slot + 1] += 100;
        }

        status->item_vol[slot] -= elapsed;
        if (status->item_vol[slot] <= 0) {
            item++;
            if (item >= ITEM_TINY_ICE + 1) {
                item = -1;
            } else {
                status->item_vol[slot] = GetItemData(item)->vol;
            }
        }
    }

    for (int slot = 0; slot < item_count; slot++) {
        s16 &item = status->inventory.dungeon_items[slot];
        if (item != ITEM_FLAPPING_FISH) {
            continue;
        }
        if (preservation[slot] > 100) {
            preservation[slot] = 100;
        }
        int loss = (int) ((float) elapsed * (100.0f - preservation[slot]) / 100.0f);
        status->item_vol[slot] -= loss;
        if (status->item_vol[slot] <= 0) {
            item++;
        }
    }

    if (unk_10[unk_0E] >= ITEM_DUNGEON_START) {
        unk_0A = 1;
    }
    pending_volume = 0;
    frame = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menuitemstep", CheckItemVolume__13CMenuItemStepFv);
#endif
