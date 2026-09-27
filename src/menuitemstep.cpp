#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#include "menuitemstep.hpp"

#include <cstring>

#include "dngstatusdata.hpp"
#include "itemdata.hpp"
#include "savedata.hpp"

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
void CMenuItemStep::CheckItemVolume(void) {
    int slot;
    ITEM_PACK *pack;
    int elapsed = pending_volume;

    if (elapsed > 0) {
        int preservation[100];
        memset(preservation, 0, sizeof(preservation));
        pack = &SaveData->GetDngStatus()->item_pack;
        unk_0E = 0;

        for (slot = 0; slot < pack->num; slot++) {
            if (pack->item[slot] == ITEM_ICE_BLOCK || pack->item[slot] == ITEM_SMALL_ICE ||
                pack->item[slot] == ITEM_TINY_ICE) {
                int neighbor[4] = {-1, -1, -1, -1};
                int row = slot / 5;
                if (row != 0) {
                    preservation[slot - 5] += 100;
                }
                if (row != pack->num / 5) {
                    preservation[slot + 5] += 100;
                }
                int column = slot % 5;
                if (column != 0) {
                    preservation[slot - 1] += 100;
                }
                if (column != 4) {
                    preservation[slot + 1] += 100;
                }

                pack->item_vol[slot] -= elapsed;
                if (pack->item_vol[slot] <= 0) {
                    pack->item[slot]++;
                    if (pack->item[slot] >= ITEM_TINY_ICE + 1) {
                        pack->item[slot] = -1;
                    } else {
                        pack->item_vol[slot] = GetItemData(pack->item[slot])->vol;
                    }
                }
            }
        }

        for (slot = 0; slot < pack->num; slot++) {
            if (pack->item[slot] == ITEM_FLAPPING_FISH) {
                if (preservation[slot] > 100) {
                    preservation[slot] = 100;
                }
                int loss = elapsed * (float) (100.0f - preservation[slot]) / 100.0f;
                pack->item_vol[slot] = pack->item_vol[slot] - loss;
                if (pack->item_vol[slot] <= 0) {
                    pack->item[slot]++;
                }
            }
        }

        if (unk_10[unk_0E] >= ITEM_DUNGEON_START) {
            unk_0A = 1;
        }
        pending_volume = 0;
        frame = 0;
    }
}
