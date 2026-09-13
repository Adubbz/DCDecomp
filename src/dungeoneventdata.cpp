#include "dungeoneventdata.hpp"

INCLUDE_ASM("asm/nonmatchings/dungeoneventdata", Set__17CDungeonEventDataFP13CDungeonEvent);
INCLUDE_RODATA("asm/nonmatchings/dungeoneventdata", @3309);

int CDungeonEventData::CheckSwitch(void) {
    if (event == NULL) {
        return 0;
    }
    if (unk_38 != 0 && unk_34 != 0) {
        return 1;
    }
    return 0;
}

void CDungeonEventData::Stop(void) {
    unk_34 = 0;
}

void CDungeonEventData::Start(void) {
    unk_34 = 1;
}
