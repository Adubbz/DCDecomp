#include "dungeonparts.hpp"

#include "frame.hpp"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <libvu0.h>
#include "dungeonmap.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "dranmapfield.hpp"
#include "collision.hpp"
#include "boxvu0.hpp"
#include "mglib.hpp"
#include "editloop.hpp"

#ifdef NON_MATCHING
/* The floors each dungeon keeps Atla off, one list per dungeon, ending at -1. */
static int noEntryTbl00[] = {4, 8, 11, -1};
static int noEntryTbl01[] = {4, 9, 12, -1};
static int noEntryTbl02[] = {5, 9, 12, -1};
static int noEntryTbl03[] = {5, 9, 13, -1};
static int noEntryTbl04[] = {4, 8, 11, -1};
static int noEntryTbl05[] = {19, 20, 21, 22, 23, -1};
static int *noEntryTbl[6] = {noEntryTbl00, noEntryTbl01, noEntryTbl02, noEntryTbl03, noEntryTbl04, noEntryTbl05};
#else
extern int *noEntryTbl[6];
#endif

/**
 * Gives the two items the clown offers on one floor.
 *
 * @mangled GetPieroItem__FiiPiPi
 * @address 0x1BFAB0
 * @size 0x440
 */
#ifdef NON_MATCHING
/**
 * The items the clown can offer on the floors either side of a dungeon's midpoint.
 */
struct PIERO_ITEM_SET {
    int count[2];     /**< Number of items in each of the two lists. */
    int item[2][64];  /**< The two lists the clown's offers are drawn from. */
};

extern PIERO_ITEM_SET *PieroItemListPtr[14];
extern s16 *ItemSetRateTbl[7];
extern int floorNum[7];

static int PickPieroItem(int count, int *items, s16 *rate) {
    int pick = -1;

    while (pick == -1) {
        pick = (int) (((float) count * (float) rand()) / 2.1474836e9f);
        if (pick >= count) {
            pick = 0;
        }
        if (rate[items[pick] - 1] >= (int) ((100.0f * (float) rand()) / 2.1474836e9f)) {
            pick = -1;
        }
    }
    return pick;
}

void GetPieroItem(int dungeon, int kind, int *first, int *second) {
    PIERO_ITEM_SET *list = PieroItemListPtr[dungeon + kind * 7];
    s16 *rate = ItemSetRateTbl[dungeon];

    if (((CDngStatusData *) UserStatus)->cur_floor < floorNum[dungeon]) {
        int a = PickPieroItem(list[0].count[0], list[0].item[0], rate);
        int b = PickPieroItem(list[0].count[1], list[0].item[1], rate);
        *first = list[0].item[0][a];
        *second = list[0].item[1][b];
        return;
    }
    int a = PickPieroItem(list[1].count[0], list[1].item[0], rate);
    int b = PickPieroItem(list[1].count[1], list[1].item[1], rate);
    *first = list[1].item[0][a];
    *second = list[1].item[1][b];
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", GetPieroItem__FiiPiPi);
#endif
#ifdef NON_MATCHING
/**
 * The items a treasure box can hold on one floor.
 */
struct ITEM_PUT_SET {
    int floor;      /**< Floor the list is for, counted from one; -1 ends the table. */
    int unk_04;
    int item[128];  /**< Items a box on the floor can hold, ended by -1. */
};

extern ITEM_PUT_SET *ItemPutListPtr[14];

int GetNumHowManyItemsHave(int item_no);

int PresetSmallItemNo_Get(int dungeon, int floor, int kind, int small) {
    s16 rate[0x17C / 2];
    int candidate[128];
    ITEM_PUT_SET *list = ItemPutListPtr[dungeon + kind * 7];
    int i;
    int count;
    int tries;

    memcpy(rate, ItemSetRateTbl[dungeon], sizeof(rate));
    // Weapons the player already holds come up less often.
    for (i = 0x101; i < 0x17C; i++) {
        int held = GetNumHowManyItemsHave(i);
        if (held > 0) {
            if (held == 1) {
                rate[i - 1] -= 10;
            }
            if (held >= 2) {
                rate[i - 1] -= 20;
            }
            if (rate[i - 1] <= 0) {
                rate[i - 1] = 0;
            }
        }
    }
    int wanted = -1;
    for (i = 0; list[i].floor != -1; i++) {
        if (floor + 1 == list[i].floor) {
            wanted = floor + 1;
        }
    }
    if (wanted == -1) {
        if (floor < floorNum[dungeon]) {
            wanted = 0x100;
        } else {
            wanted = 0xFF;
        }
    }
    for (i = 0; wanted != list[i].floor;) {
        i++;
        if (i >= 128) {
            printf("err itembox list \n");
            return -1;
        }
    }
    ITEM_PUT_SET *set = &list[i];
    count = 0;
    for (int j = 0; set->item[j] != -1; j++) {
        int item_no = set->item[j];
        if (small != 0) {
            if (item_no >= 0x51 && item_no < 0x101) {
                candidate[count++] = item_no;
            }
        } else if (item_no >= 0x101) {
            candidate[count++] = item_no;
        }
    }
    if (small == 0 && count == 0) {
        return -1;
    }
    tries = 0;
    while (1) {
        float roll = ((float) count * (float) rand()) / 2.1474836e9f;
        int pick = (int) roll;
        if (roll - (float) pick > 0.0f) {
            pick++;
        }
        if (pick < 0 || pick >= count) {
            pick = 0;
        }
        int item_no = candidate[pick];
        if (rate[item_no - 1] < (int) ((100.0f * (float) rand()) / 2.1474836e9f)) {
            return item_no;
        }
        tries++;
        if (tries >= 0xFFFF) {
            return -1;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", PresetSmallItemNo_Get__Fiiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @646__2);
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @1007__2);
#ifdef NON_MATCHING
/**
 * An area of one map part where an item can be put down.
 */
struct ITEM_FREE_AREA {
    s8 parts_no;          /**< Map part the areas lie on; -1 ends the table. */
    u8 count;             /**< Number of boxes that follow. */
    s8 direction;         /**< Quarter turns the boxes are given in. */
    u8 unk_03;
    float box[4][6];      /**< Each box as its two corners, in tenths of a unit. */
};

extern ITEM_FREE_AREA *ItemFreeAreaAll[];

void SearchiDoPutArea(MAPPARTS *cells, int x, int y, int width, int height, float *out) {
    float corner[4][4];
    float quad[196][4][3];
    int count = 0;
    ITEM_FREE_AREA *areas = ItemFreeAreaAll[selectMapNo];

    for (int cy = y; cy < y + height; cy++) {
        for (int cx = x; cx < x + width; cx++) {
            MAPPARTS *cell = &cells[cy * 20 + cx];
            int parts_no = cell->parts_no;
            int direction = cell->direction;
            for (int a = 0; areas[a].parts_no != -1 && count < 196; a++) {
                if (parts_no != areas[a].parts_no) {
                    continue;
                }
                for (int b = 0; b < areas[a].count; b++) {
                    int turn = areas[a].direction + direction;
                    if (turn >= 4) {
                        turn -= 4;
                    }
                    float angle = (3.1415927f * (90.0f * (float) (4 - turn))) / 180.0f;
                    float *box = areas[a].box[b];
                    corner[0][0] = 10.0f * box[0];
                    corner[1][0] = 10.0f * box[1];
                    corner[2][0] = 10.0f * box[2];
                    corner[0][3] = 10.0f * box[3];
                    corner[1][3] = 10.0f * box[4];
                    corner[2][3] = 10.0f * box[5];
                    corner[0][1] = corner[0][3];
                    corner[1][1] = corner[1][0];
                    corner[2][1] = corner[2][0];
                    corner[0][2] = corner[0][0];
                    corner[1][2] = corner[1][0];
                    corner[2][2] = corner[2][3];
                    for (int k = 0; k < 4; k++) {
                        if (count < 196) {
                            float cz = corner[2][k];
                            float cxv = corner[0][k];
                            quad[count][k][0] = -cz * sinf(angle) - cxv * cosf(angle);
                            quad[count][k][2] = -cxv * sinf(angle) + cz * cosf(angle);
                            quad[count][k][0] *= -1.0f;
                            quad[count][k][0] += 160.0f * (float) cx;
                            quad[count][k][2] += 160.0f * (float) cy;
                            quad[count][k][1] = corner[1][k];
                        }
                    }
                    count++;
                    if (count >= 196) {
                        break;
                    }
                }
            }
        }
    }
    int pick = (int) (((float) count * (float) rand()) / 2.1474836e9f);
    float min_x = quad[pick][0][0];
    float max_x = min_x;
    float min_z = quad[pick][0][2];
    float max_z = min_z;
    for (int k = 1; k < 4; k++) {
        if (min_x > quad[pick][k][0]) {
            min_x = quad[pick][k][0];
        }
        if (max_x < quad[pick][k][0]) {
            max_x = quad[pick][k][0];
        }
        if (min_z > quad[pick][k][2]) {
            min_z = quad[pick][k][2];
        }
        if (max_z < quad[pick][k][2]) {
            max_z = quad[pick][k][2];
        }
    }
    out[0] = min_x + ((max_x - min_x) * (float) rand()) / 2.1474836e9f;
    out[1] = quad[pick][0][1];
    out[2] = min_z + ((max_z - min_z) * (float) rand()) / 2.1474836e9f;
    out[3] = 1.0f;
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", SearchiDoPutArea__FP8MAPPARTSiiiiPf);
#endif
/**
 * Reports whether an Atla may be placed on one floor.
 *
 * @mangled chkAtraFloor__Fii
 * @address 0x1C0940
 * @size 0x74
 */
int chkAtraFloor(int dungeon, int floor) {
    if (dungeon >= 6) {
        return 0;
    }
    int *floors = noEntryTbl[dungeon];
    for (int i = 0; floors[i] != -1; i++) {
        if (floor == floors[i]) {
            return 0;
        }
    }
    return 1;
}
/**
 * Builds the list of Atla one dungeon may hand out.
 *
 * @mangled BtAtraListMake__Fi
 * @address 0x1C09C0
 * @size 0x358
 */
#ifdef NON_MATCHING
/**
 * One Atla a dungeon can hand out.
 */
struct ATRA_APPEAR {
    int id;     /**< Atla; -1 ends the table. */
    int floor;  /**< Floor it lies on counted from one, or -1 or -2 for any upper or lower floor. */
    int count;  /**< How many floors it is put on when the floor is not fixed. */
};

extern ATRA_APPEAR *AtraAppearData[6];
extern int CenterFloorTbl[6];
extern int MaxFloorTbl[6];

void BtAtraListMake(int dungeon) {
    CDngStatusData *status = (CDngStatusData *) UserStatus;

    if (dungeon >= 6) {
        return;
    }
    ATRA_APPEAR *appear = AtraAppearData[dungeon];
    int center = CenterFloorTbl[dungeon];
    int max = MaxFloorTbl[dungeon];
    int count = 0;
    int upper = 0;
    int lower = 0;
    for (; appear[count].id != -1; count++) {
        int floor = appear[count].floor;
        if (floor == -1) {
            upper += appear[count].count;
        }
        if (floor == -2) {
            lower += appear[count].count;
        }
        if (floor != -1 && floor != -2) {
            status->SetGetAtra(dungeon, floor - 1, count);
        }
    }
    int i;
    for (i = 0; i < upper; i++) {
        int placed = 0;
        while (placed == 0) {
            int floor = (int) (((float) (center - 1) * (float) rand()) / 2.1474836e9f);
            if (status->GetMaxAtraNum(dungeon, floor) < 8 && chkAtraFloor(dungeon, floor + 1) != 0) {
                status->SetGetAtra(dungeon, floor, -2);
                placed = 1;
            }
        }
    }
    for (i = 0; i < lower; i++) {
        int placed = 0;
        while (placed == 0) {
            int floor = (int) (((float) ((max - center) - 1) * (float) rand()) / 2.1474836e9f) + center;
            if (status->GetMaxAtraNum(dungeon, floor) < 8 && chkAtraFloor(dungeon, floor + 1) != 0) {
                status->SetGetAtra(dungeon, floor, -2);
                placed = 1;
            }
        }
    }
    for (i = 0; i < count; i++) {
        status->atra_registry[dungeon][i].id = appear[i].id;
        status->atra_registry[dungeon][i].floor = appear[i].floor;
        status->atra_registry[dungeon][i].refcount = appear[i].count;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", BtAtraListMake__Fi);
#endif
#ifdef NON_MATCHING
int BtAtraFloorCyoice(int dungeon, int floor, int *atra) {
    DNG_ATRA_REGISTRY_ENTRY registry[100];
    int packed[8];
    CDngStatusData *status = (CDngStatusData *) UserStatus;
    int i;

    if (dungeon >= 6) {
        return 0;
    }
    status->GetMaxAtraNum(dungeon, floor);
    int center = CenterFloorTbl[dungeon];
    status->SetCopyAtraList(dungeon, floor, atra);
    for (i = 0; i < 100; i++) {
        registry[i] = status->atra_registry[dungeon][i];
    }
    int half = -1;
    if (floor > center - 1) {
        half = -2;
    }
    int count = 0;
    for (i = 0; i < 8; i++) {
        if (atra[i] >= 0) {
            count++;
        } else if (atra[i] == -2) {
            int placed = 0;
            while (placed == 0) {
                int pick = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
                if (registry[pick].id != -1 && registry[pick].refcount > 0 &&
                    half == registry[pick].floor) {
                    atra[i] = pick;
                    registry[pick].refcount--;
                    placed = 1;
                }
            }
            count++;
        }
    }
    for (i = 0; i < 8; i++) {
        packed[i] = -1;
    }
    int out = 0;
    for (i = 0; i < 8; i++) {
        if (atra[i] >= 0) {
            packed[out++] = atra[i];
        }
    }
    memcpy(atra, packed, sizeof(packed));
    return count;
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", BtAtraFloorCyoice__FiiPi);
#endif
#ifdef NON_MATCHING
extern CDranMapField *NowDranMapField;

int setCollisionData(CDungeonMap *map, CCPoly *polys, float *position, float radius, float height) {
    static int around[9][2] = {{0, 0}, {-1, 0}, {0, -1}, {1, 0}, {0, 1},
                               {-1, -1}, {1, -1}, {-1, 1}, {1, 1}};
    CBoxVu0 box;
    sceVu0FVECTOR part_pos;
    int count = 0;
    int i;

    box.max[0] = position[0] + radius;
    box.max[1] = position[1] + radius * height;
    box.max[2] = position[2] + radius;
    box.min[0] = position[0] - radius;
    box.min[1] = position[1] - radius * height;
    box.min[2] = position[2] - radius;
    if (map->unk_BDEC != 1) {
        for (i = 0; map->parts[i].frame[0] != NULL; i++) {
            CFrame *collision = i == -1 ? NULL : map->parts[i].collision;
            if (collision == NULL) {
                continue;
            }
            sceVu0CopyVector(part_pos, map->parts[i].frame_offset[0]);
            int turn = (int) map->parts[i].frame_turn[0] + (i == -1 ? 0 : map->parts[i].collision_turn);
            if (turn >= 4) {
                turn -= 3;
            }
            if (turn == 3) {
                turn = -1;
            }
            collision->SetRotation(0.0f, (3.1415927f * (-90.0f * (float) turn)) / 180.0f, 0.0f);
            collision->SetPosition(part_pos);
            count += collision->PickUpNearPoly(&polys[count], box);
        }
        for (i = 0; i < 24; i++) {
            if (map->boxes[i].used != 0) {
                map->box_collision_model->SetPosition(map->boxes[i].pos);
                count += map->box_collision_model->PickUpNearPoly(&polys[count], box);
            }
        }
        return NowDranMapField->AddCollision(polys, map->CreateCollision(polys, box, count), box);
    }
    for (i = 0; i < 9; i++) {
        int x = (int) (position[0] / 160.0f) + around[i][0];
        int z = (int) (position[2] / 160.0f) + around[i][1];
        if (x < 0 || x >= 20 || z < 0 || z >= 20) {
            continue;
        }
        MAP_CELL *cell = &map->cells[x + z * 20];
        int parts_no = cell->parts_no;
        CFrame *collision = parts_no == -1 ? NULL : map->parts[parts_no].collision;
        if (collision == NULL) {
            continue;
        }
        float turn = (float) cell->direction + (float) (parts_no == -1 ? 0 : map->parts[parts_no].collision_turn);
        if (turn > 3.0f) {
            turn -= 3.0f;
        }
        if (turn == 3.0f) {
            turn = -1.0f;
        }
        collision->SetRotation(0.0f, (3.1415927f * (-90.0f * turn)) / 180.0f, 0.0f);
        collision->SetPosition(160.0f * (float) x, 0.0f, 160.0f * (float) z);
        count += collision->PickUpNearPoly(&polys[count], box);
    }
    for (i = 0; i < 24; i++) {
        if (map->boxes[i].used != 0) {
            map->box_collision_model->SetPosition(map->boxes[i].pos);
            count += map->box_collision_model->PickUpNearPoly(&polys[count], box);
        }
    }
    return map->CreateCollision(polys, box, count);
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", setCollisionData__FP11CDungeonMapP6CCPolyPfff);
#endif
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
/**
 * Places a healing zone within one dungeon part.
 *
 * @mangled SetHealZone__13CDungeonPartsFPfff
 * @address 0x1C1670
 * @size 0x58
 */
void CDungeonParts::SetHealZone(float *position, float width, float depth) {
    sceVu0CopyVector(heal_pos, position);
    heal_width = width;
    heal_depth = depth;
    heal_on = 1;
}

/**
 * Draws one dungeon part and everything standing on it.
 *
 * @mangled Draw__13CDungeonPartsFv
 * @address 0x1C16D0
 * @size 0x17C
 */
void CDungeonParts::Draw() {
    sceVu0FVECTOR position;

    for (int i = 0; i < 6; i++) {
        if (frame[i] == NULL) {
            continue;
        }
        int turn = (int) ((float) direction + frame_turn[i]);
        if (turn > 3) {
            turn -= 3;
        }
        float angle = (float) turn;
        if (3.0f == angle) {
            angle = -1.0f;
        }
        angle = (3.1415927f * (-90.0f * angle)) / 180.0f;
        frame[i]->SetRotation(0.0f, angle, 0.0f);

        sceVu0CopyVector(position, pos);
        position[0] += frame_offset[i][0];
        position[1] += frame_offset[i][1];
        position[2] += frame_offset[i][2];
        position[3] = 1.0f;
        frame[i]->SetPosition(position);
        MGDraw(frame[i]);
    }
}
#ifdef NON_MATCHING
/**
 * Chooses the level of detail each of a part's frames draws at.
 *
 * @mangled DrawCalc__13CDungeonPartsFiiii
 * @address 0x1C1850
 * @size 0x348
 */
void CDungeonParts::DrawCalc(int x, int z, int turn, int fixed) {
    sceVu0FVECTOR position;

    for (int i = 0; i < 6; i++) {
        CFrame *model = frame[i];
        if (model == NULL) {
            continue;
        }

        int model_turn = (int) ((float) direction + frame_turn[i]);
        if (model_turn > 3) {
            model_turn -= 3;
        }
        float angle = (float) model_turn;
        if (3.0f == angle) {
            angle = -1.0f;
        }
        angle = (3.1415927f * (-90.0f * angle)) / 180.0f;
        model->SetRotation(0.0f, angle, 0.0f);

        sceVu0CopyVector(position, pos);
        position[0] += frame_offset[i][0];
        position[1] += frame_offset[i][1];
        position[2] += frame_offset[i][2];
        position[3] = 1.0f;
        frame[i]->SetPosition(position);
    }
    CFrame *model = collision;
    if (model == NULL) {
        return;
    }
    if (fixed == 1) {
        int collision_turn = turn + this->collision_turn;
        if (collision_turn > 3) {
            collision_turn -= 3;
        }
        if (collision_turn == 3) {
            collision_turn = -1;
        }
        model->SetRotation(0.0f, (3.1415927f * (-90.0f * (float) collision_turn)) / 180.0f, 0.0f);
        collision->SetPosition(160.0f * (float) x, 0.0f, 160.0f * (float) z);
        return;
    }
    int collision_turn = (int) (frame_turn[0] + (float) this->collision_turn);
    if (collision_turn > 3) {
        collision_turn -= 3;
    }
    if (collision_turn == 3) {
        collision_turn = -1;
    }
    model->SetRotation(0.0f, (3.1415927f * (-90.0f * (float) collision_turn)) / 180.0f, 0.0f);
    sceVu0CopyVector(position, pos);
    position[0] += frame_offset[0][0];
    position[1] += frame_offset[0][1];
    position[2] += frame_offset[0][2];
    position[3] = 1.0f;
    collision->SetPosition(frame_offset[0]);
}
#else
INCLUDE_ASM("asm/nonmatchings/dungeonparts", DrawCalc__13CDungeonPartsFiiii);
#endif

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
        frame_turn[i] = 0.0f;
    }
    direction_offset = 0;
    collision = NULL;
    unk_004 = NULL;
    unk_008 = 0;
    collision_turn = 0;
    fire_num = 0;
    water.used = 0;
    water.has_fall = 0;
    heal_on = 0;
    direction = 0;
}
