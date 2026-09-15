#include "dungeoneventman.hpp"

#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "mathutil.hpp"

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

#ifdef NON_MATCHING
void CDungeonEventMan::SearchDataSwitch(int script_no, int enable) {
    for (int i = 0; i < 96; i++) {
        int active;
        if (event[i].event != NULL) {
            active = event[i].enabled;
        } else {
            active = 0;
        }
        if (active != 0 && script_no == event[i].event->script_no) {
            if (enable != 0) {
                event[i].Start();
            }
            if (enable == 0) {
                event[i].Stop();
            }
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSwitch__16CDungeonEventManFii);
#endif
#ifdef NON_MATCHING
void CDungeonEventMan::SearchItemEventHold(int script_no) {
    for (int i = 0; i < 96; i++) {
        int active;
        if (event[i].event != NULL) {
            active = event[i].enabled;
        } else {
            active = 0;
        }
        if (active != 0 && script_no == event[i].event->script_no) {
            event[i].hold = 0;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchItemEventHold__16CDungeonEventManFi);
#endif

int CDungeonEventMan::GetDataNum(void) {
    int count = 0;

    for (int i = 0; i < 96; i++) {
        int active;
        if (event[i].event != NULL) {
            active = event[i].enabled;
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
            active = event[i].enabled;
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
#ifdef NON_MATCHING
CDungeonEventData *CDungeonEventMan::SearchDataSlotPos2(float *position) {
    sceVu0FVECTOR event_position;
    sceVu0FVECTOR target_position;

    sceVu0CopyVector(target_position, position);
    float target_height = target_position[1];
    target_position[1] = 0.0f;

    for (int i = 0; i < 96; i++) {
        CDungeonEventData *event_data = &event[i];
        if (event_data->CheckSwitch() != 0) {
            sceVu0CopyVector(event_position, event_data->pos);
            float height_difference = target_height - event_position[1];
            if (height_difference < 0.0f) {
                height_difference = -height_difference;
            }
            if (height_difference < 40.0f) {
                event_position[1] = 0.0f;
                float radius = event_data->event->radius;
                if (DistVector(event_position, target_position) <= radius + 10.0f) {
                    return event_data;
                }
            }
        }
    }
    return NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SearchDataSlotPos2__16CDungeonEventManFPf);
#endif
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SetupEvent__16CDungeonEventManFP11CDungeonMapi);
INCLUDE_RODATA("asm/nonmatchings/dungeoneventman", @3600);
