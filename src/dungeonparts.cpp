#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

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
#include "userstatus.hpp"

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
 * Chance out of a hundred that each item is turned down when drawn, one table per dungeon.
 */
extern s16 *ItemSetRateTbl[7];

/**
 * The floor that divides each dungeon's lower item lists from its upper ones.
 */
extern int floorNum[7];

/**
 * Gives the two items the clown offers on one floor.
 *
 * @mangled GetPieroItem__FiiPiPi
 * @address 0x1BFAB0
 * @size 0x440
 */
void GetPieroItem(int map_no, int ura_dungeon, int *item0, int *item1) {
    PIERO_ITEM_SET *list = PieroItemListPtr[map_no + ura_dungeon * 7];
    s16 *rate = ItemSetRateTbl[map_no];
    int count0;
    int count1;
    int pick0;
    int pick1;
    int chance;

    if (UserStatus->cur_floor < floorNum[map_no]) {
        count0 = list[0].count[0];
        count1 = list[0].count[1];
        pick1 = pick0 = -1;
        while (pick0 == -1) {
            pick0 = (int) (((float) count0 * (float) rand()) / 2.1474836e9f);
            if (pick0 >= count0) {
                pick0 = 0;
            }
            chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
            if (rate[list[0].item[0][pick0] - 1] >= chance) {
                pick0 = -1;
            }
        }
        while (pick1 == -1) {
            pick1 = (int) (((float) count1 * (float) rand()) / 2.1474836e9f);
            if (pick1 >= count1) {
                pick1 = 0;
            }
            chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
            if (rate[list[0].item[1][pick1] - 1] >= chance) {
                pick1 = -1;
            }
        }
        *item0 = list[0].item[0][pick0];
        *item1 = list[0].item[1][pick1];
        return;
    }
    count0 = list[1].count[0];
    count1 = list[1].count[1];
    pick1 = pick0 = -1;
    while (pick0 == -1) {
        pick0 = (int) (((float) count0 * (float) rand()) / 2.1474836e9f);
        if (pick0 >= count0) {
            pick0 = 0;
        }
        chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
        if (rate[list[1].item[0][pick0] - 1] >= chance) {
            pick0 = -1;
        }
    }
    while (pick1 == -1) {
        pick1 = (int) (((float) count1 * (float) rand()) / 2.1474836e9f);
        if (pick1 >= count1) {
            pick1 = 0;
        }
        chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
        if (rate[list[1].item[1][pick1] - 1] >= chance) {
            pick1 = -1;
        }
    }
    *item0 = list[1].item[0][pick0];
    *item1 = list[1].item[1][pick1];
}
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
    int candidate[144];
    s16 rate[400];
    ITEM_PUT_SET *list = ItemPutListPtr[dungeon + kind * 7];
    int held;
    int count;
    int item_no;
    float roll;
    int k;
    int wanted;
    int i;
    s16 *table;
    int tries;
    int pick;
    int n;
    int chance;

    // Retail copies from the pointer table itself rather than from the dungeon's rate list.
    memcpy(rate, &ItemSetRateTbl[dungeon], 0x17C);
    // Weapons the player already holds come up less often.
    for (i = 0x101; i < 0x17C; i++) {
        held = GetNumHowManyItemsHave(i);
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
    k = 0;
    wanted = -1;
    for (;; k++) {
        item_no = list[k].floor;
        if (item_no == -1) {
            break;
        }
        if (floor + 1 == item_no) {
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
    n = 0;
    do {
        if (wanted == list[n].floor) {
            break;
        }
        n++;
        if (n >= 128) {
            printf("err itembox list \n");
            return -1;
        }
    } while (1);
    if (small != 0) {
        int j = 0;
        count = 0;
        for (; list[n].item[j] != -1; j++) {
            item_no = list[n].item[j];
            if (item_no >= 0x51 && item_no < 0x101) {
                candidate[count++] = item_no;
            }
        }
        table = rate;
        tries = 0;
        do {
            roll = ((float) count * (float) rand()) / 2.1474836e9f;
            pick = (int) roll;
            if (roll - (float) pick > 0.0f) {
                pick++;
            }
            if (pick < 0 || pick >= count) {
                pick = 0;
            }
            chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
            item_no = candidate[pick];
            if (table[item_no - 1] < chance) {
                break;
            }
            tries++;
            if (tries >= 0xFFFF) {
                item_no = -1;
                break;
            }
        } while (1);
        return item_no;
    }
    if (small == 0) {
        int j = 0;
        count = 0;
        for (; list[n].item[j] != -1; j++) {
            item_no = list[n].item[j];
            if (item_no >= 0x101) {
                candidate[count++] = item_no;
            }
        }
        if (count == 0) {
            return -1;
        }
        table = rate;
        tries = 0;
        do {
            roll = ((float) count * (float) rand()) / 2.1474836e9f;
            pick = (int) roll;
            if (roll - (float) pick > 0.0f) {
                pick++;
            }
            if (pick < 0 || pick >= count) {
                pick = 0;
            }
            chance = (int) ((100.0f * (float) rand()) / 2.1474836e9f);
            item_no = candidate[pick];
            if (table[item_no - 1] < chance) {
                break;
            }
            tries++;
            if (tries >= 0xFFFF) {
                item_no = -1;
                break;
            }
        } while (1);
        return item_no;
    }
}
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @646__2);
INCLUDE_RODATA("asm/nonmatchings/dungeonparts", @1007__2);

/**
 * The areas where items can be put down on each map.
 */
extern ITEM_FREE_AREA *ItemFreeAreaAll[];

/**
 * Scales a coordinate from the item area table up to world scale.
 */
static inline float ToWorldScale(float coordinate) {
    return coordinate * 10.0f;
}

int SearchiDoPutArea(MAPPARTS *cells, int x, int y, int width, int height, float *out) {
    float quad[196][4][3];
    float px[4];
    float py[4];
    float pz[4];
    int count = 0;
    ITEM_FREE_AREA *areas = ItemFreeAreaAll[selectMapNo];

    for (int cy = y; cy < y + height; cy++) {
        for (int cx = x; cx < x + width; cx++) {
            int parts_no = (cells + cy * 20)[cx].parts_no;
            int direction = (cells + cy * 20)[cx].direction;
            for (int a = 0; areas[a].parts_no != -1 && count < 196; a++) {
                if (parts_no != areas[a].parts_no) {
                    continue;
                }
                for (int b = 0; b < areas[a].rect_num; b++) {
                    int turn = areas[a].direction;
                    turn += direction;
                    if (turn > 3) {
                        turn -= 4;
                    }
                    float angle = (3.1415927f * (90.0f * (float) (4 - turn))) / 180.0f;
                    px[0] = ToWorldScale(areas[a].rect[b].x0);
                    py[0] = areas[a].rect[b].y0 * 10.0f;
                    pz[0] = areas[a].rect[b].z0 * 10.0f;
                    px[3] = areas[a].rect[b].x1 * 10.0f;
                    py[3] = areas[a].rect[b].y1 * 10.0f;
                    pz[3] = areas[a].rect[b].z1 * 10.0f;
                    px[1] = px[3];
                    py[1] = py[0];
                    pz[1] = pz[0];
                    px[2] = px[0];
                    py[2] = py[0];
                    pz[2] = pz[3];
                    for (int k = 0; k < 4; k++) {
                        if (count < 196) {
                            float cz;
                            float cxv;
                            quad[count][k][0] = -(cz = pz[k]) * sinf(angle) - (cxv = px[k]) * cosf(angle);
                            quad[count][k][2] = -cxv * sinf(angle) + cz * cosf(angle);
                            quad[count][k][0] *= -1.0f;
                            quad[count][k][0] += 160.0f * (float) cx;
                            quad[count][k][2] += 160.0f * (float) cy;
                            quad[count][k][1] = py[k];
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
    float max_x = quad[pick][0][0];
    float min_x = max_x;
    float max_z = quad[pick][0][2];
    float min_z = max_z;
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
    float span_x = max_x - min_x;
    float span_z = max_z - min_z;
    out[0] = min_x + (span_x * (float) rand()) / 2.1474836e9f;
    out[1] = quad[pick][0][1];
    out[2] = min_z + (span_z * (float) rand()) / 2.1474836e9f;
    out[3] = 1.0f;
    return count;
}

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
 * The floor each dungeon's upper half ends on.
 */
extern int CenterFloorTbl[6];

/**
 * One Atla a dungeon can hand out.
 */
struct ATRA_APPEAR {
    int id;    /**< Atla; -1 ends the table. */
    int floor; /**< Floor it lies on counted from one, or -1 or -2 for any upper or lower floor. */
    int count; /**< How many floors it is put on when the floor is not fixed. */
};

/**
 * The Atla each dungeon hands out, ended by an entry whose id is -1.
 */
extern ATRA_APPEAR *AtraAppearData[6];

/**
 * The number of floors in each dungeon.
 */
extern int MaxFloorTbl[6];

/**
 * Records that one Atla lies on one floor of a dungeon.
 */
static inline void RegisterAtra(int dungeon, int floor, int atra_id) {
    ((CDngStatusData *) UserStatus)->SetGetAtra(dungeon, floor, atra_id);
}

/**
 * Builds the list of Atla one dungeon may hand out.
 *
 * @mangled BtAtraListMake__Fi
 * @address 0x1C09C0
 * @size 0x358
 */
void BtAtraListMake(int dungeon) {
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
            RegisterAtra(dungeon, --floor, count);
        }
    }
    int i;
    for (i = 0; i < upper; i++) {
        int placed = 0;
        while (placed == 0) {
            int floor = (int) (((float) (center - 1) * (float) rand()) / 2.1474836e9f);
            if (((CDngStatusData *) UserStatus)->GetMaxAtraNum(dungeon, floor) < 8 && chkAtraFloor(dungeon, floor + 1) != 0) {
                RegisterAtra(dungeon, floor, -2);
                placed = 1;
            }
        }
    }
    for (i = 0; i < lower; i++) {
        int placed = 0;
        while (placed == 0) {
            int floor = (int) (((float) ((max - center) - 1) * (float) rand()) / 2.1474836e9f);
            floor += center;
            if (((CDngStatusData *) UserStatus)->GetMaxAtraNum(dungeon, floor) < 8 && chkAtraFloor(dungeon, floor + 1) != 0) {
                RegisterAtra(dungeon, floor, -2);
                placed = 1;
            }
        }
    }
    for (int j = 0; j < count; j++) {
        UserStatus->atra_registry[dungeon][j].id = appear[j].id;
        UserStatus->atra_registry[dungeon][j].floor = appear[j].floor;
        UserStatus->atra_registry[dungeon][j].refcount = appear[j].count;
    }
}

/**
 * Selects the atla identifiers that appear on a floor: keeps the fixed ones,
 * draws each open slot from the dungeon's list for its half, packs them to the
 * front and returns how many there are.
 *
 * @mangled BtAtraFloorCyoice__FiiPi
 * @address 0x1C0D20
 * @size 0x2A0
 */
int BtAtraFloorCyoice(int dungeon, int floor, int *atra) {
    ATRA_SAVE registry[128];
    int packed[8];

    if (dungeon >= 6) {
        return 0;
    }
    ((CDngStatusData *) UserStatus)->GetMaxAtraNum(dungeon, floor);
    int center = CenterFloorTbl[dungeon];
    ((CDngStatusData *) UserStatus)->SetCopyAtraList(dungeon, floor, atra);
    for (int j = 0; j < 100; j++) {
        registry[j].id = UserStatus->atra_registry[dungeon][j].id;
        registry[j].floor = UserStatus->atra_registry[dungeon][j].floor;
        registry[j].refcount = UserStatus->atra_registry[dungeon][j].refcount;
    }
    int half = -1;
    if (floor > center - 1) {
        half = -2;
    }
    int count = 0;
    for (int i = 0; i < 8; i++) {
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
    for (int k = 0; k < 8; k++) {
        packed[k] = -1;
    }
    int out = 0;
    for (int m = 0; m < 8; m++) {
        if (atra[m] >= 0) {
            packed[out++] = atra[m];
        }
    }
    memcpy(atra, packed, sizeof(packed));
    return count;
}
/**
 * Gives a map part's collision model, or null for an empty cell.
 */
static inline CFrame *PartsCollision(CDungeonMap *map, int parts_no) {
    if (parts_no == -1) {
        return NULL;
    }
    return map->parts[parts_no].collision;
}

/**
 * Gives the quarter turns a map part's collision model is given, or 0 for an empty cell.
 */
static inline int PartsCollisionTurn(CDungeonMap *map, int parts_no) {
    if (parts_no == -1) {
        return 0;
    }
    return map->parts[parts_no].collision_turn;
}

int setCollisionData(CDungeonMap *map, CCPoly *poly, float *position, float radius, float height) {
    CBoxVu0 box;
    int count = 0;
    CFrame *collision;
    int i;
    int turn;

    box.max[0] = position[0] + radius;
    box.max[1] = position[1] + radius * height;
    box.max[2] = position[2] + radius;
    box.min[0] = position[0] - radius;
    box.min[1] = position[1] - radius * height;
    box.min[2] = position[2] - radius;
    int around[9][2] = {{0, 0}, {-1, 0}, {0, -1}, {1, 0}, {0, 1}, {-1, -1}, {1, -1}, {-1, 1}, {1, 1}};
    if (map->unk_BDEC != 1) {
        sceVu0FVECTOR part_pos;

        for (i = 0; map->parts[i].frame[0] != NULL; i++) {
            if (i == -1) {
                collision = NULL;
            } else {
                collision = map->parts[i].collision;
            }
            if (collision == NULL) {
                continue;
            }
            sceVu0CopyVector(part_pos, map->parts[i].frame_offset[0]);
            turn = (int) map->parts[i].frame_turn[0];
            turn += PartsCollisionTurn(map, i);
            if (turn > 3) {
                turn -= 3;
            }
            if (turn == 3) {
                turn = -1;
            }
            float angle = (3.1415927f * (-90.0f * (float) turn)) / 180.0f;
            collision->SetRotation(0.0f, angle, 0.0f);
            collision->SetPosition(part_pos);
            count += collision->PickUpNearPoly(&poly[count], box);
        }
        for (i = 0; i < 24; i++) {
            if (map->boxes[i].used != 0) {
                collision = map->box_collision_model;
                collision->SetPosition(map->boxes[i].pos);
                count += collision->PickUpNearPoly(&poly[count], box);
            }
        }
        count = map->CreateCollision(poly, box, count);
        count = NowDranMapField->AddCollision(poly, count, box);
    } else {
        CFrame *model;

        for (int j = 0; j < 9; j++) {
            int x = (int) (position[0] / 160.0f);
            int z = (int) (position[2] / 160.0f);
            x += around[j][0];
            z += around[j][1];
            if (x < 0 || x > 19 || z < 0 || z > 19) {
                continue;
            }
            model = PartsCollision(map, map->cells[x + z * 20].parts_no);
            if (model == NULL) {
                continue;
            }
            float angle = (float) map->cells[x + z * 20].direction;
            angle += (float) PartsCollisionTurn(map, map->cells[x + z * 20].parts_no);
            if (angle > 3.0f) {
                angle -= 3.0f;
            }
            if (angle == 3.0f) {
                angle = -1.0f;
            }
            angle = (3.1415927f * (-90.0f * angle)) / 180.0f;
            model->SetRotation(0.0f, angle, 0.0f);
            model->SetPosition(160.0f * (float) x, 0.0f, 160.0f * (float) z);
            count += model->PickUpNearPoly(&poly[count], box);
        }
        for (int k = 0; k < 24; k++) {
            if (map->boxes[k].used != 0) {
                model = map->box_collision_model;
                model->SetPosition(map->boxes[k].pos);
                count += model->PickUpNearPoly(&poly[count], box);
            }
        }
        count = map->CreateCollision(poly, box, count);
    }
    return count;
}
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
        float y = 0.0f;
        collision->SetPosition(160.0f * (float) x, y, 160.0f * (float) z);
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
