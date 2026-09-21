#include "dungeoneventman.hpp"

#include <cmath>
#include <cstdio>

#include "collisiondata.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "frame.hpp"
#include "mathutil.hpp"

CDungeonEvent *CDungeonEventMan::SearchPartsID(int index, int parts_id) {
    int slot_parts_id;

    if (slot[index].enabled != 0) {
        slot_parts_id = slot[index].parts_id;
    } else {
        slot_parts_id = -1;
    }
    if (parts_id == slot_parts_id) {
        return &slot[index];
    }
    return NULL;
}

CDungeonEvent *CDungeonEventMan::SearchSlot(void) {
    for (int i = 0; i < 64; i++) {
        if (slot[i].enabled == 0) {
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
CDungeonEventData *CDungeonEventMan::SearchDataSlotPos2(float *position) {
    int i;
    sceVu0FVECTOR event_position;
    sceVu0FVECTOR target_position;

    sceVu0CopyVector(target_position, position);
    float target_height = target_position[1];
    target_position[1] = 0.0f;

    for (i = 0; i < 96; i++) {
        if (event[i].CheckSwitch() != 0) {
            sceVu0CopyVector(event_position, event[i].pos);
            float height_difference = target_height - event_position[1];
            height_difference = height_difference < 0.0f ? -height_difference : height_difference;
            if (height_difference < 40.0f) {
                event_position[1] = 0.0f;
                float radius = event[i].event->radius;
                if (DistVector(event_position, target_position) <= radius + 10.0f) {
                    return &event[i];
                }
            }
        }
    }
    return NULL;
}
#ifdef NON_MATCHING
void CDungeonEventMan::SetupEvent(CDungeonMap *map, int mode) {
    sceVu0FVECTOR local_origin = {0.0f, 0.0f, 0.0f, 0.0f};

    if (mode == 1) {
        for (int row = 0; row < 16; row++) {
            for (int column = 0; column < 16; column++) {
                MAP_CELL *cell = &map->cells[column + row * 20];
                int parts_id = cell->parts_no;
                if (parts_id == MAP_PARTS_NONE) {
                    continue;
                }

                for (int slot_no = 0; slot_no < 64; slot_no++) {
                    CDungeonEvent *definition = SearchPartsID(slot_no, parts_id);
                    if (definition == NULL) {
                        continue;
                    }

                    CDungeonEventData *runtime_event = SearchDataSlot();
                    if (runtime_event == NULL) {
                        printf("** eventdata err \n ");
                        while (true) {
                        }
                    }
                    runtime_event->Set(definition);

                    int direction_offset = map->parts[parts_id].direction_offset;
                    float direction = (float) cell->direction + (float) direction_offset;
                    if (direction > 3.0f) {
                        direction -= 3.0f;
                    }
                    if (direction == 3.0f) {
                        direction = -1.0f;
                    }
                    definition->placement_frame->SetRotation(
                        0.0f, (3.1415927f * (-90.0f * direction)) / 180.0f, 0.0f);

                    sceVu0FMATRIX matrix;
                    definition->trigger_frame->GetLWMatrix(matrix);
                    runtime_event->dir[0] = 0.0f;
                    runtime_event->dir[1] = atan2f(matrix[2][0], matrix[2][2]);
                    runtime_event->dir[2] = 0.0f;
                    runtime_event->dir[3] = 1.0f;

                    definition->placement_frame->SetPosition(
                        160.0f * (float) column, 0.0f, 160.0f * (float) row);
                    definition->trigger_frame->GetWorldPosition(runtime_event->pos, local_origin);
                }
            }
        }
        return;
    }

    for (int parts_id = 0; map->parts[parts_id].loaded != 0; parts_id++) {
        for (int slot_no = 0; slot_no < 64; slot_no++) {
            CDungeonEvent *definition = SearchPartsID(slot_no, parts_id);
            if (definition == NULL) {
                continue;
            }

            CDungeonEventData *runtime_event = SearchDataSlot();
            runtime_event->Set(definition);

            float direction = map->parts[parts_id].event_direction +
                              (float) map->parts[parts_id].direction_offset;
            if (direction > 3.0f) {
                direction -= 3.0f;
            }
            if (direction == 3.0f) {
                direction = -1.0f;
            }
            definition->placement_frame->SetRotation(
                0.0f, (3.1415927f * (-90.0f * direction)) / 180.0f, 0.0f);

            sceVu0FMATRIX matrix;
            definition->trigger_frame->GetLWMatrix(matrix);
            runtime_event->dir[0] = 0.0f;
            runtime_event->dir[1] = atan2f(matrix[2][0], matrix[2][2]);
            runtime_event->dir[2] = 0.0f;
            runtime_event->dir[3] = 1.0f;
            definition->trigger_frame->GetWorldPosition(runtime_event->pos, local_origin);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeoneventman", SetupEvent__16CDungeonEventManFP11CDungeonMapi);
#endif
INCLUDE_RODATA("asm/nonmatchings/dungeoneventman", @3600);
