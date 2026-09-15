#include "dungeoneventdata.hpp"

#include <cstdio>

void CDungeonEventData::Set(CDungeonEvent *source) {
    if (source == NULL) {
        printf("******** event NULL !!\n");
        for (;;) {
        }
    }

    event = source;
    hold = source->unk_28;
    unk_34 = source->unk_34;
    enabled = 1;
    chara_done = -1;
}

int CDungeonEventData::CheckSwitch(void) {
    if (event == NULL) {
        return 0;
    }
    if (enabled != 0 && unk_34 != 0) {
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
