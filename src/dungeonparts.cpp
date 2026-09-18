#include "dungeonparts.hpp"

#include "frame.hpp"

#ifdef NON_MATCHING
/* The floors each dungeon keeps Atla off, one list per dungeon, ending at -1. */
static int noEntry0[] = {4, 8, 11, -1};
static int noEntry1[] = {4, 9, 12, -1};
static int noEntry2[] = {5, 9, 12, -1};
static int noEntry3[] = {5, 9, 13, -1};
static int noEntry4[] = {4, 8, 11, -1};
static int noEntry5[] = {19, 20, 21, 22, 23, -1};
static int *noEntryTbl[6] = {noEntry0, noEntry1, noEntry2, noEntry3, noEntry4, noEntry5};
#endif

/**
 * Gives the two items the clown offers on one floor.
 *
 * @mangled GetPieroItem__FiiPiPi
 * @address 0x1BFAB0
 * @size 0x440
 */
INCLUDE_ASM("asm/nonmatchings/dungeonparts", GetPieroItem__FiiPiPi);
INCLUDE_ASM("asm/nonmatchings/dungeonparts", PresetSmallItemNo_Get__Fiiii);
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @646__2);
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @1007__2);
INCLUDE_ASM("asm/nonmatchings/dungeonparts", SearchiDoPutArea__FP8MAPPARTSiiiiPf);
/**
 * Reports whether an Atla may be placed on one floor.
 *
 * @mangled chkAtraFloor__Fii
 * @address 0x1C0940
 * @size 0x74
 */
#ifdef NON_MATCHING
int chkAtraFloor(int dungeon, int floor) {
    if (dungeon >= 6) {
        return 0;
    }
    for (int i = 0;; i++) {
        int barred = noEntryTbl[dungeon][i];

        if (barred == -1) {
            return 1;
        }
        if (floor == barred) {
            return 0;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", chkAtraFloor__Fii);
#endif
/**
 * Builds the list of Atla one dungeon may hand out.
 *
 * @mangled BtAtraListMake__Fi
 * @address 0x1C09C0
 * @size 0x358
 */
INCLUDE_ASM("asm/nonmatchings/dungeonparts", BtAtraListMake__Fi);
INCLUDE_ASM("asm/nonmatchings/dungeonparts", BtAtraFloorCyoice__FiiPi);
INCLUDE_ASM("asm/nonmatchings/dungeonparts", setCollisionData__FP11CDungeonMapP6CCPolyPfff);
#ifdef NON_MATCHING
CFrame *CDungeonParts::GetSearchFrame(char *name) {
    for (int i = 0; i < 6; i++) {
        if (frame[i] != NULL) {
            CFrame *found = frame[i]->SearchFrame(name);
            if (found != NULL) {
                return found;
            }
        }
    }
    // The collision and the second model are searched after the drawn ones.
    if (collision != NULL) {
        CFrame *found = collision->SearchFrame(name);
        if (found != NULL) {
            return found;
        }
    }
    if (unk_004 != NULL) {
        CFrame *found = unk_004->SearchFrame(name);
        if (found != NULL) {
            return found;
        }
    }
    return NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", GetSearchFrame__13CDungeonPartsFPc);
#endif
/**
 * Places a healing zone within one dungeon part.
 *
 * @mangled SetHealZone__13CDungeonPartsFPfff
 * @address 0x1C1670
 * @size 0x58
 */
INCLUDE_ASM("asm/nonmatchings/dungeonparts", SetHealZone__13CDungeonPartsFPfff);
/**
 * Draws one dungeon part and everything standing on it.
 *
 * @mangled Draw__13CDungeonPartsFv
 * @address 0x1C16D0
 * @size 0x17C
 */
INCLUDE_ASM("asm/nonmatchings/dungeonparts", Draw__13CDungeonPartsFv);
/**
 * Chooses the level of detail each of a part's frames draws at.
 *
 * @mangled DrawCalc__13CDungeonPartsFiiii
 * @address 0x1C1850
 * @size 0x348
 */
INCLUDE_ASM("asm/nonmatchings/dungeonparts", DrawCalc__13CDungeonPartsFiiii);

/**
 * Clears one dungeon part.
 *
 * @mangled initalize__13CDungeonPartsFv
 * @address 0x1C1BA0
 * @size 0x5C
 */
void CDungeonParts::initalize() {
    for (int i = 0; i < 6; i++) {
        frame[i] = NULL;
        unk_170[i] = 0.0f;
    }
    direction_offset = 0;
    collision = NULL;
    unk_004 = NULL;
    unk_008 = 0;
    unk_010 = 0;
    fire_num = 0;
    water.used = 0;
    water.has_fall = 0;
    unk_1A8 = 0;
    direction = 0;
}
