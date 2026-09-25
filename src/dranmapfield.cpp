#include "dranmapfield.hpp"

#include <cstdio>

#include "boxvu0.hpp"
#include "collision.hpp"
#include "mds.hpp"
#include "dataalloc.hpp"
#include "frame.hpp"
#include "snd.hpp"

#ifdef NON_MATCHING
void CDranMapField::LoadModel(unsigned int *pack, CDataAlloc2<1> *arena) {
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->field_count < 12) {
        (&this[set->field_count].character)->Initialize();
        (&this[set->field_count].character)->LoadPackData(pack, "info", arena, arena);
        (&this[set->field_count].character)->SetPosition(0.0f, 0.0f, 0.0f);
        (&this[set->field_count].character)->SetRotation(0.0f, 0.0f, 0.0f);
        set->field_count++;
    } else {
        printf(" ************* over!!\n");
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dranmapfield", LoadModel__13CDranMapFieldFPUiP14CDataAlloc2_1_);
#endif
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @3606);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @488);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @489);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @490);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @491__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @492);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @493);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @494__3);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @495__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @496__3);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @497__4);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @498__4);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @499__3);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @500__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @501__3);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @502__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @503__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @504);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @505__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @506__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @507__3);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @508__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @509__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @510__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @511__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @512__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @513);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @514__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @515__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @516);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @517__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @518);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @519);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @520);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @521__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @522__2);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @523);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @524);
INCLUDE_RODATA("asm/nonmatchings/dranmapfield", @525);
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/dranmapfield", AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0);
#endif
#ifdef NON_MATCHING
void CDranMapField::LoadCollision(unsigned int *pack, CDataAlloc2<1> *arena) {
    DRAN_MAP_FIELD_SET *set = (DRAN_MAP_FIELD_SET *) this;

    if (set->collision_count < 12) {
        set->collision[set->collision_count] = (CFrame *) LoadCollisionFile(pack, arena);
        set->collision[set->collision_count]->SetPosition(0.0f, 0.0f, 0.0f);
        set->collision[set->collision_count]->SetRotation(0.0f, 0.0f, 0.0f);
        set->collision_count++;
    } else {
        printf(" ************* over!!\n");
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dranmapfield", LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_);
#endif
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
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/dranmapfield", Step__13CDranMapFieldFv);
#endif
