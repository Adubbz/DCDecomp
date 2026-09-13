#include "dungeoneventdata.hpp"

INCLUDE_ASM("asm/nonmatchings/dungeoneventdata", Set__17CDungeonEventDataFP13CDungeonEvent);
INCLUDE_RODATA("asm/nonmatchings/dungeoneventdata", @3309);
INCLUDE_ASM("asm/nonmatchings/dungeoneventdata", CheckSwitch__17CDungeonEventDataFv);

void CDungeonEventData::Stop(void) {
    unk_34 = 0;
}

void CDungeonEventData::Start(void) {
    unk_34 = 1;
}
