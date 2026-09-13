#include "dungeoneventman.hpp"

DUNGEON_EVENT_SLOT *CDungeonEventMan::SearchPartsID(int index, int parts_id) {
    int slot_parts_id;

    if (slot[index].unk_3C != 0) {
        slot_parts_id = slot[index].unk_1C;
    } else {
        slot_parts_id = -1;
    }
    if (parts_id == slot_parts_id) {
        return &slot[index];
    }
    return NULL;
}

DUNGEON_EVENT_SLOT *CDungeonEventMan::SearchSlot(void) {
    for (int i = 0; i < 64; i++) {
        if (slot[i].unk_3C == 0) {
            return &slot[i];
        }
    }
    return NULL;
}

INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSwitch__16CDungeonEventManFii);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchItemEventHold__16CDungeonEventManFi);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", GetDataNum__16CDungeonEventManFv);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSlot__16CDungeonEventManFv);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", CheckCollisionDataHit__16CDungeonEventManFi);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSlotPos__16CDungeonEventManFPf);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSlotPos2__16CDungeonEventManFPf);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SetupEvent__16CDungeonEventManFP11CDungeonMapi);
INCLUDE_RODATA("asm/nonmatchings/dungeoneventman", @3600);
