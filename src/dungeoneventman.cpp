#include "dungeoneventman.hpp"

INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchPartsID__16CDungeonEventManFii);

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
