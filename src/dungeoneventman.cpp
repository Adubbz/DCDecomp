#include "dungeoneventman.hpp"

#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "frame.hpp"
#include "mathutil.hpp"

#include <cmath>
#include <cstdio>

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

int CDungeonEventMan::GetDataNum(void) {
    int count = 0;

    for (int i = 0; i < 96; i++) {
        int active;
        if (event[i].event != NULL) {
            active = event[i].unk_38;
        } else {
            active = 0;
        }
        if (active == 0) {
            count++;
        }
    }
    return count;
}

CDungeonEventData *CDungeonEventMan::SearchDataSlot(void) {
    for (int i = 0; i < 96; i++) {
        int active;
        if (event[i].event != NULL) {
            active = event[i].unk_38;
        } else {
            active = 0;
        }
        if (active == 0) {
            return &event[i];
        }
    }
    return NULL;
}

CDungeonEventData *CDungeonEventMan::CheckCollisionDataHit(int index) {
    int i;
    int owner;
    int sub_id;

    owner = event[index].event->chara_no;
    sub_id = event[index].event->unk_30;
    if (owner != -1) {
        for (i = 0; i < 96; i++) {
            if (NowColData->active[i] == 0) {
                continue;
            }
            if (NowColData->hit[i].owner != owner) {
                continue;
            }
            if (sub_id != -1 && NowColData->hit[i].unk_60 != sub_id) {
                continue;
            }

            sceVu0FVECTOR hit_position;
            sceVu0CopyVector(hit_position, NowColData->hit[i].pos);
            float radius = event[index].event->radius;
            if (DistVector(hit_position, event[index].pos) <= radius) {
                return &event[index];
            }
        }
    }
    return NULL;
}
CDungeonEventData *CDungeonEventMan::SearchDataSlotPos(float *position) {
    for (int i = 0; i < 96; i++) {
        CDungeonEventData *event_data = &event[i];
        if (event_data->CheckSwitch() != 0) {
            float radius = event[i].event->radius;
            if (DistVector(event[i].pos, position) <= radius && event[i].event->chara_no == -1) {
                return event_data;
            }

            CDungeonEventData *collision_event = CheckCollisionDataHit(i);
            if (collision_event != NULL) {
                return collision_event;
            }
        }
    }
    return NULL;
}
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSlotPos2__16CDungeonEventManFPf);
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SetupEvent__16CDungeonEventManFP11CDungeonMapi);
INCLUDE_RODATA("asm/nonmatchings/dungeoneventman", @3600);
