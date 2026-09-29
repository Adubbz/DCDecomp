#include "dungeoneventdata.hpp"

#include <cstdio>

void CDungeonEventData::Set(CDungeonEvent *source) {
    if (source == NULL) {
        printf("******** event NULL !!\n");
        for (;;) {
        }
    }

    event = source;
    hold = source->hold;
    switch_on = source->switch_on;
    enabled = 1;
    chara_done = -1;
}

int CDungeonEventData::CheckSwitch(void) {
    if (event == NULL) {
        return 0;
    }
    if (enabled != 0 && switch_on != 0) {
        return 1;
    }
    return 0;
}

void CDungeonEventData::Stop(void) {
    switch_on = 0;
}

void CDungeonEventData::Start(void) {
    switch_on = 1;
}
