#include "dranmapfield.hpp"

#include <cstdio>

#include "boxvu0.hpp"
#include "collision.hpp"
#include "mds.hpp"
#include "dataalloc.hpp"
#include "frame.hpp"
#include "snd.hpp"

/* The model pack's configuration name. Retail keeps one copy of the string, in the dungeon parts code. */
extern char info_cfg_literal[];

void CDranMapField::LoadModel(unsigned int *pack, CDataAlloc2<1> *arena) {
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->field_count < 12) {
        (&this[set->field_count].character)->Initialize();
        (&this[set->field_count].character)->LoadPackData(pack, info_cfg_literal, arena, arena);
        (&this[set->field_count].character)->SetPosition(0.0f, 0.0f, 0.0f);
        (&this[set->field_count].character)->SetRotation(0.0f, 0.0f, 0.0f);
        set->field_count++;
    } else {
        printf(" ************* over!!\n");
    }
}
int CDranMapField::AddCollision(CCPoly *poly, int count, CBoxVu0 box) {
    int i;
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->collision_count == 0) {
        return count;
    }
    for (i = 0; i < set->collision_count; i++) {
        if (set->collision[i] != NULL && ((DRAN_MAP_FIELD_SET *) this)->state[i] > 1) {
            count += set->collision[i]->PickUpNearPoly(&poly[count], box);
        }
    }
    return count;
}
/* LoadModel's message, which retail's unit holds once. */
extern "C" char OverMessage[];

void CDranMapField::LoadCollision(unsigned int *pack, CDataAlloc2<1> *arena) {
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->collision_count < 12) {
        set->collision[set->collision_count] = (CFrame *) LoadCollisionFile(pack, arena);
        float zero = 0.0f;
        set->collision[set->collision_count]->SetPosition(zero, zero, zero);
        float zero2 = 0.0f;
        set->collision[set->collision_count]->SetRotation(zero2, zero2, zero2);
        set->collision_count++;
    } else {
        printf(OverMessage);
    }
}
/**
 * Draws every active drainage-field model that has finished loading.
 *
 * @mangled Draw__13CDranMapFieldFv
 * @address 0x1CD720
 * @size 0xAC
 */
void CDranMapField::Draw(void) {
    int i;
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->field_count != 0) {
        for (i = 0; i < set->field_count; i++) {
            if (set->field[i].character.frame != NULL && set->state[i] != 0) {
                set->field[i].character.Draw();
            }
        }
    }
}
void CDranMapField::Step(void) {
    int i;
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->field_count != 0) {
        for (i = 0; i < set->field_count; i++) {
            if (this[i].character.frame == NULL) {
                continue;
            }
            if (set->state[i] <= 0) {
                continue;
            }
            // Two starts the drain, and the motion runs while it stands at one.
            if (set->state[i] == 2) {
                SndSePlay(0x6C9, -1, 0);
                set->state[i]--;
            }
            if (set->state[i] == 1) {
                this[i].character.Step();
                if (!(this[i].character.GetNowTime() < 59.0f)) {
                    set->state[i]--;
                }
            }
        }
    }
}
