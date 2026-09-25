#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#include "menuiconautoget.hpp"

#include <cstring>

#include "menu_draw.hpp"
#include "savedata.hpp"

int CMenuIconAutoGet::IsMoveIcon(void) {
    int moving = 0;

    for (int i = 0; i < 3; i++) {
        if (icon[i].item > 0) {
            moving = 1;
        }
    }
    return moving;
}

int CMenuIconAutoGet::IsSameItem(int item) {
    int found = 0;

    for (int i = 0; i < 3; i++) {
        if (item == icon[i].item) {
            found++;
        }
    }
    return found;
}

int CMenuIconAutoGet::GetMoveIconGole(int slot, int item) {
    int found = 0;

    for (int i = 0; i < 3; i++) {
        if (slot == icon[i].slot && item == icon[i].item) {
            found++;
        }
    }
    return found;
}

int CMenuIconAutoGet::GetSpace(void) {
    for (int i = 0; i < 3; i++) {
        if (icon[i].item < 0x51) {
            return i;
        }
    }
    return -1;
}
#ifdef NON_MATCHING
int CMenuIconAutoGet::IconAutoMove(void) {
    static const int destination_x[3] = {92, 156, 220};
    CDngStatusData *dungeon_status = SaveData->GetDngStatus();
    int moving = 0;

    for (int i = 0; i < 3; i++) {
        MENU_AUTO_GET_ICON *moving_icon = &icon[i];
        if (moving_icon->item > 0) {
            moving = 1;
            moving_icon->x += (destination_x[moving_icon->slot] - moving_icon->x) / 4.0f;
            moving_icon->y += (105.0f - moving_icon->y) / 4.0f;
            if (moving_icon->x - destination_x[moving_icon->slot] < 4.0f) {
                int slot = moving_icon->slot;
                if (dungeon_status->inventory.quick_item_slot[slot] <= 0) {
                    dungeon_status->inventory.quick_item_slot[slot] = moving_icon->item;
                    dungeon_status->inventory.quick_item_qty[slot] = 1;
                    dungeon_status->quick_item_icon_count[slot] = moving_icon->count;
                } else {
                    dungeon_status->inventory.quick_item_qty[slot]++;
                }
                memset(moving_icon, -1, sizeof(*moving_icon));
            }
        }
    }
    return moving;
}
#else
INCLUDE_ASM("asm/nonmatchings/menuiconautoget", IconAutoMove__16CMenuIconAutoGetFv);
#endif

void CMenuIconAutoGet::IconMoveTarSet(int index, int slot, int item, int count, float x, float y) {
    icon[index].slot = slot;
    icon[index].item = item;
    icon[index].count = count;
    icon[index].x = x;
    icon[index].y = y;
}
void CMenuIconAutoGet::IconAutoMoveDraw(void) {
    for (int i = 0; i < 3; i++) {
        if (icon[i].item >= 0x84) {
            DrawIconParts(icon[i].item, (int) icon[i].x, (int) icon[i].y, 0, 640, 128, 0);
        }
    }
}
