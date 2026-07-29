#include "savedata.hpp"

/* Partial shape of the building/chip definition table entry returned by
 * GetEditAtraPartsData -- only the two fields AtraPartsGet reads are known. */
struct SV_ATRA_PARTS_DEF {
    s32 max_progress; /* +0x0: progress is clamped down to this value. */
    s32 unk4;          /* +0x4: >0 selects the "advance progress" path. */
};

extern "C" SV_ATRA_PARTS_DEF *GetEditAtraPartsData__Fii(int georama_no, int plot_no);

/* @ 0x157B30 (0x10 bytes) -- GetConfigData__9CSaveDataFv */
void *CSaveData::GetConfigData() {
    return this->config;
}

/* @ 0x157B40 (0x10 bytes) -- GetMenuCursor__9CSaveDataFv */
void *CSaveData::GetMenuCursor() {
    return this->menu_cursor;
}

/* @ 0x157B50 (0x40 bytes) -- GetCharaName__9CSaveDataFi */
char *CSaveData::GetCharaName(int chara_no) {
    if (chara_no < 0 || chara_no >= 6) {
        return NULL;
    }

    return this->chara_name[chara_no];
}

/* @ 0x157B90 (0x20 bytes) -- AddPlayTime__9CSaveDataFi */
void CSaveData::AddPlayTime(int time) {
    this->play_time += time;
}

/* @ 0x157BB0 (0x10 bytes) -- GetPlayTime__9CSaveDataFv */
int CSaveData::GetPlayTime() {
    return this->play_time;
}

/* @ 0x157BC0 (0x10 bytes) -- SetNowTime__9CSaveDataFf */
void CSaveData::SetNowTime(float time) {
    this->now_time = time;
}

/* @ 0x157BD0 (0x10 bytes) -- GetNowTime__9CSaveDataFv */
float CSaveData::GetNowTime() {
    return this->now_time;
}

/* @ 0x157BE0 (0xE0 bytes) -- AddNowTime__9CSaveDataFf */
void CSaveData::AddNowTime(float add) {
    float old_time = this->now_time;
    this->now_time += add;

    if (old_time < 8.5f) {
        if (this->now_time >= 8.5) {
            this->AddDay(1);
        }
    }

    if (this->now_time >= 12.0f) {
        this->now_time -= 12.0f;
    }

    if (this->now_time < 0.0f) {
        this->now_time += 12.0f;
    }
}

/* @ 0x157CC0 (0x40 bytes) -- SetDay__9CSaveDataFi */
void CSaveData::SetDay(int day) {
    this->day = day;
    if (this->day > 9998) {
        this->day = 9998;
    }
    if (this->day < 0) {
        this->day = 0;
    }
}

/* @ 0x157D00 (0x10 bytes) -- GetDay__9CSaveDataFv */
int CSaveData::GetDay() {
    return this->day;
}

/* @ 0x157D10 (0x30 bytes) -- AddDay__9CSaveDataFi */
void CSaveData::AddDay(int add) {
    this->day += add;
    this->SetDay(this->day);
}

/* @ 0x157D40 (0x40 bytes) -- AddFishingPoint__9CSaveDataFi */
void CSaveData::AddFishingPoint(int add) {
    this->fishing_point += add;
    if (this->fishing_point > 0x270F) {
        this->fishing_point = 0x270F;
    }
    if (this->fishing_point < 0) {
        this->fishing_point = 0;
    }
}

/* @ 0x157D80 (0x40 bytes) -- SetFishingPoint__9CSaveDataFi */
void CSaveData::SetFishingPoint(int value) {
    this->fishing_point = value;
    if (this->fishing_point > 0x270F) {
        this->fishing_point = 0x270F;
    }
    if (this->fishing_point < 0) {
        this->fishing_point = 0;
    }
}

/* @ 0x157DC0 (0x180 bytes) -- SetFishingRank__9CSaveDataFif */
void CSaveData::SetFishingRank(int fish_id, float rank) {
    float lowest_rank = -1.0f;
    int lowest_index = -1;
    int i;

    for (i = 0; i < 64; i++) {
        if (this->fish_data[i].rank <= 0.0f) {
            this->fish_data[i].rank = rank;
            this->fish_data[i].fish_id = fish_id;
            break;
        }

        if (lowest_rank < 0.0f || lowest_rank > this->fish_data[i].rank) {
            lowest_index = i;
            lowest_rank = this->fish_data[i].rank;
        }
    }

    if (i == 64 && lowest_index >= 0) {
        this->fish_data[lowest_index].rank = rank;
        this->fish_data[lowest_index].fish_id = fish_id;
    }

    for (i = 0; i < 63; i++) {
        for (int k = i + 1; k < 64; k++) {
            if (this->fish_data[i].rank < this->fish_data[k].rank) {
                SV_FISH_DATA tmp = this->fish_data[i];
                this->fish_data[i] = this->fish_data[k];
                this->fish_data[k] = tmp;
            }
        }
    }
}

/* @ 0x157F40 (0x70 bytes) -- GetFishingRank__9CSaveDataFi */
SV_FISH_DATA *CSaveData::GetFishingRank(int rank_index) {
    int valid;

    if (rank_index < 0 || !(valid = rank_index < 64)) {
        return NULL;
    }

    if (this->fish_data[rank_index].rank <= 0.0f || this->fish_data[rank_index].fish_id < 0) {
        return NULL;
    }

    return &this->fish_data[rank_index];
}

/* @ 0x157FB0 (0x40 bytes) -- GetGrdData__9CSaveDataFi */
SV_GEORAMA_DATA *CSaveData::GetGrdData(int georama_no) {
    int valid;

    if (georama_no < 0 || !(valid = georama_no < 6)) {
        return NULL;
    }

    return &this->georama[georama_no];
}

/* @ 0x157FF0 (0x70 bytes) -- GetEditPartsInfo__9CSaveDataFii */
SV_EDIT_PARTS_INFO *CSaveData::GetEditPartsInfo(int georama_no, int plot_no) {
    int valid;

    if (georama_no < 0 || !(valid = georama_no < 6)) {
        return NULL;
    }

    if (plot_no < 0 || !(valid = plot_no < 24)) {
        return NULL;
    }

    return &this->georama[georama_no].parts_info[plot_no];
}

/* @ 0x158060 (0x70 bytes) -- GetParts__9CSaveDataFiPi */
SV_GRD_PART *CSaveData::GetParts(int georama_no, int *out_count) {
    SV_GRD_PART *parts;
    int count;
    int valid;

    if (georama_no < 0 || !(valid = georama_no < 6)) {
        return NULL;
    }

    parts = this->georama[georama_no].placed_parts;

    for (count = 0; (valid = count < 130) != 0; count++) {
        if (parts[count].part_id < 0) {
            break;
        }
    }

    *out_count = count;
    return parts;
}

/* @ 0x1580D0 (0xD0 bytes) -- GetGrdNPCData__9CSaveDataFii */
void *CSaveData::GetGrdNPCData(int map_no, int npc_no) {
    /* Map IDs >= 11 are "sub-maps" sharing one global NPC table (special_npc)
     * instead of each having a georama slot; a match here just means "this is
     * a recognized sub-map". Terminated by the first negative entry. Retail
     * symbol is `sub_map$439` in .data at 0x25DF50: must stay a
     * function-local (not file-scope) static, and must not be `const`. */
    static s32 sub_map[] = {14, 23, 11, 19, 42, 38, -1, 0};
    int valid;
    int i;

    if (!(valid = map_no < 11)) {
        for (i = 0;; i++) {
            if (sub_map[i] < 0) {
                return NULL;
            }

            if (map_no == sub_map[i]) {
                return this->special_npc + i * 12;
            }
        }
    }

    if (map_no < 0 || !(valid = map_no < 6)) {
        return NULL;
    }

    if (npc_no < 0 || !(valid = npc_no < 20)) {
        return NULL;
    }

    return &this->georama[map_no].npc[npc_no];
}

/* @ 0x1581A0 (0x40 bytes) -- GetElemData__9CSaveDataFi */
s16 *CSaveData::GetElemData(int georama_no) {
    int valid;

    if (georama_no < 0 || !(valid = georama_no < 6)) {
        return NULL;
    }

    return this->elem_data[georama_no];
}

/* @ 0x1581E0 (0x10 bytes) -- GetDngStatus__9CSaveDataFv */
void *CSaveData::GetDngStatus() {
    return this->dng_status;
}

/* @ 0x1581F0 (0x10 bytes) -- GetStockItem__9CSaveDataFv */
void *CSaveData::GetStockItem() {
    return this->stock_item;
}

/* @ 0x158200 (0x80 bytes) -- GetGameFlag__9CSaveDataFi */
int CSaveData::GetGameFlag(int flag_no) {
    int bit_idx;

    if (flag_no < 0) {
        return 0;
    }

    if (flag_no >> 5 >= 256) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    u32 mask = 1 << bit_idx;
    return (this->game_flags[flag_no >> 5] & mask) != 0;
}

/* @ 0x158280 (0xA0 bytes) -- SetGameFlag__9CSaveDataFii */
int CSaveData::SetGameFlag(int flag_no, int value) {
    /* bit_idx is declared before word_idx, which is not the order they are
     * used in: MWCC hands out registers in reverse declaration order here, and
     * this is what puts word_idx in $a3 and bit_idx in $v1 the way retail has
     * them. Swapping these two lines back costs seven instructions. */
    int bit_idx;
    int word_idx;
    int valid;
    u32 mask;

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (!(valid = word_idx < 256)) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    this->game_flags[word_idx] &= ~mask;
    if (value) {
        this->game_flags[word_idx] |= mask;
    }

    return value;
}

/* @ 0x158320 (0x40 bytes) -- GetGameIntFlag__9CSaveDataFi */
int CSaveData::GetGameIntFlag(int flag_no) {
    int valid;

    if ((valid = flag_no < 32) == 0) {
        return 0;
    }

    return this->game_int_flag[flag_no];
}

/* @ 0x158360 (0x40 bytes) -- SetGameIntFlag__9CSaveDataFii */
int CSaveData::SetGameIntFlag(int flag_no, int value) {
    int valid;

    if (!(valid = flag_no < 32)) {
        return 0;
    }

    this->game_int_flag[flag_no] = value;
    return value;
}

/* @ 0x1583A0 (0xA0 bytes) -- GetMapFlag__9CSaveDataFii */
int CSaveData::GetMapFlag(int map_no, int flag_no) {
    int word_idx;
    int bit_idx;
    int valid;
    u32 mask;

    if (map_no < 0 || !(valid = map_no < 0x50)) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (!(valid = word_idx < 16)) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    return (this->map_flags[map_no][word_idx] & mask) != 0;
}

/* @ 0x158440 (0xC0 bytes) -- SetMapFlag__9CSaveDataFiii */
int CSaveData::SetMapFlag(int map_no, int flag_no, int value) {
    int word_idx;
    int bit_idx;
    int valid;
    u32 mask;

    if (map_no < 0 || !(valid = map_no < 0x50)) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (!(valid = word_idx < 16)) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    this->map_flags[map_no][word_idx] &= ~mask;
    if (value) {
        this->map_flags[map_no][word_idx] |= mask;
    }

    return value;
}

/* @ 0x158500 (0xA0 bytes) -- GetMapInitFlag__9CSaveDataFii */
int CSaveData::GetMapInitFlag(int map_no, int flag_no) {
    int word_idx;
    int bit_idx;
    int valid;
    u32 mask;

    if (map_no < 0 || !(valid = map_no < 0x50)) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (!(valid = word_idx < 16)) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    return (this->map_init_flags[map_no][word_idx] & mask) != 0;
}

/* @ 0x1585A0 (0xC0 bytes) -- SetMapInitFlag__9CSaveDataFiii */
int CSaveData::SetMapInitFlag(int map_no, int flag_no, int value) {
    int word_idx;
    int bit_idx;
    int valid;
    u32 mask;

    if (map_no < 0 || !(valid = map_no < 0x50)) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (!(valid = word_idx < 16)) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    this->map_init_flags[map_no][word_idx] &= ~mask;
    if (value) {
        this->map_init_flags[map_no][word_idx] |= mask;
    }

    return value;
}

/* @ 0x158660 (0x100 bytes) -- AtraPartsGet__9CSaveDataFii */
int CSaveData::AtraPartsGet(int georama_no, int plot_no) {
    SV_EDIT_PARTS_INFO *info;
    SV_ATRA_PARTS_DEF *def;

    info = this->GetEditPartsInfo(georama_no, plot_no);
    if (info == NULL) {
        return 0;
    }

    def = GetEditAtraPartsData__Fii(georama_no, plot_no);
    if (def == NULL) {
        return 0;
    }

    if (def->unk4 > 0) {
        if (info->flag == 0) {
            info->progress = 5;
        } else {
            info->progress += 5;
            if (info->progress > def->max_progress) {
                info->progress = (s16) def->max_progress;
            }
        }

        info->flag = 1;
    } else {
        if (info->flag != 0) {
            return 0;
        }

        info->flag = 1;
    }

    return 1;
}

/* @ 0x158760 (0xA0 bytes) -- AtraChipGet__9CSaveDataFii */
int CSaveData::AtraChipGet(int georama_no, int chip_id) {
    s16 *elem;
    s16 *p;
    int i;

    elem = this->GetElemData(georama_no);

    if (chip_id < 0) {
        return 0;
    }

    if (elem == NULL) {
        return 0;
    }

    p = elem;
    int valid;
    for (i = 0; (valid = i < 128) != 0; i++, p++) {
        if (*p < 0) {
            *p = chip_id;
            return 1;
        }
    }

    return 0;
}

/* @ 0x158800 (0x70 bytes) -- VisitMap__9CSaveDataFii */
s16 CSaveData::VisitMap(int map_no, int add) {
    int valid;

    if (map_no < 0 || !(valid = map_no < 0x50)) {
        return 0;
    }

    this->visit_map[map_no] += add;
    if (this->visit_map[map_no] > 0x270F) {
        this->visit_map[map_no] = 0x270F;
    }

    return this->visit_map[map_no];
}

/* @ 0x158870 (0xD0 bytes) -- QuestDungeon__9CSaveDataFii */
int CSaveData::QuestDungeon(int dungeon_no, int add) {
    int valid;

    if (dungeon_no == 6) {
        this->quest_dungeon_total += add;
        if (this->quest_dungeon_total > 0x270F) {
            this->quest_dungeon_total = 0x270F;
        }
        return this->quest_dungeon_total;
    }

    if (dungeon_no < 0 || !(valid = dungeon_no < 6)) {
        return 0;
    }

    this->quest_dungeon[dungeon_no] += add;
    if (this->quest_dungeon[dungeon_no] > 0x270F) {
        this->quest_dungeon[dungeon_no] = 0x270F;
    }

    return this->quest_dungeon[dungeon_no];
}

/* @ 0x158940 (0xC0 bytes) -- ConvertConfig__9CSaveDataFP13SV_CONFIG_SYS */
void CSaveData::ConvertConfig(SV_CONFIG_SYS *out) {
    /* Register/shape notes (all confirmed against retail 0x158940 via
     * asm-differ):
     * - `p` must be a named local assigned at the top (it gets s1; `out`
     *   itself dying at the memset call is what lets MWCC keep `this` in a0
     *   for the two config mirror writes below).
     * - `src` must be assigned *after* those writes, right before the
     *   memset (it gets s0; assigning it earlier or using `this` directly
     *   in the copy loop changes the whole allocation).
     * - The store must be written `*(p + copy * 18 + j)` -- left-associative
     *   pointer arithmetic, so the address is computed (p + copy*18) + j as
     *   in retail; the array form p[copy * 18 + j] made MWCC reassociate it
     *   as (p + j) + copy*18, which does not match. */
    char *src; /* declared before p: MWCC assigns s0/s1 in declaration order
                * (src->s0, p->s1, matching retail) even though p is
                * assigned/used first. */
    char *p;
    int copy;
    int j;
    int valid;

    p = (char *) out;

    this->config[16] = *(s16 *) this->menu_cursor;
    this->config[15] = this->dng_status_config15;

    src = (char *) this->config;
    memset(p, 0, sizeof(SV_CONFIG_SYS));

    for (copy = 0; (valid = copy < 3) != 0; copy++) {
        for (j = 0; (valid = j < 18) != 0; j++) {
            *(p + copy * 18 + j) = *(src + j * 4);
        }
    }
}

/* @ 0x158A00 (0xE0 bytes) -- InvertConfig__9CSaveDataFP13SV_CONFIG_SYS */
int CSaveData::InvertConfig(SV_CONFIG_SYS *in) {
    int i;
    int j;
    int valid;

    for (j = 0; (valid = j < 18) != 0; j++) {
        if (in->values[j] != in->values_copy1[j]) {
            return 0;
        }

        if (in->values[j] != in->values_copy2[j]) {
            return 0;
        }
    }

    for (i = 0; (valid = i < 18) != 0; i++) {
        this->config[i] = in->values[i];
    }

    s32 config16 = this->config[16];
    *(s16 *) this->menu_cursor = (s16) config16;
    if (*(s16 *) this->menu_cursor != 0) {
        ((CMenuCursor *) this->menu_cursor)->InitPos();
    }

    this->dng_status_config15 = this->config[15];

    return 1;
}

/* @ 0x158AE0 (0x80 bytes) -- InitPos__11CMenuCursorFv */
/* Resets a CMenuCursor to its default state: slots [1,11) = 0, slots
 * [11,21) = -1 (in s16 units), then slots 11/13/14/21 overwritten with fixed
 * defaults (4/6/0/0). Slot 0 (the "current position") is left untouched --
 * callers zero it themselves before calling this. Must stay textually here,
 * between InvertConfig and Initialize, to match retail's address order. */
void CMenuCursor::InitPos() {
    s16 *self = (s16 *) this;
    int i;
    int j;
    int valid;

    for (i = 0; (valid = i < 10) != 0; i++) {
        self[1 + i] = 0;
    }

    for (j = 0; (valid = j < 10) != 0; j++) {
        self[11 + j] = -1;
    }

    self[11] = 4;
    self[13] = 6;
    self[14] = 0;
    self[21] = 0;
}

/* @ 0x158B60 (0x1D0 bytes) -- Initialize__9CSaveDataFv */
void CSaveData::Initialize() {
    /* Register notes (confirmed against retail 0x158b60 via asm-differ):
     * retail reuses the SAME two counter variables across every inner loop
     * (elem clear, npc_slot clear, placed_parts clear -- all j in a1, k in
     * a2); introducing fresh counters per loop shifts them onto a0 and
     * mismatches. The npc_slot loop must also hoist &g->parts_info[j] into
     * a pointer before the k loop (retail: addiu v1,<g+j*24>,0x68, then
     * sh zero,0xa(...)); indexing the full expression inside the k loop
     * recomputes j*24 per iteration and does not match. */
    int i;
    int j;
    int k;
    int valid;

    memset(this, 0, sizeof(CSaveData));
    this->unk_1CC = -1;
    this->now_time = 0.0f;

    for (j = 0; (valid = j < 6) != 0; j++) {
        for (k = 0; (valid = k < 128) != 0; k++) {
            this->elem_data[j][k] = -1;
        }
    }

    SV_GEORAMA_DATA *g = this->georama;

    for (i = 0; (valid = i < 6) != 0; i++, g++) {
        memset(g, 0, sizeof(SV_GEORAMA_DATA));

        for (j = 0; (valid = j < 24) != 0; j++) {
            SV_EDIT_PARTS_INFO *info = &g->parts_info[j];

            for (k = 0; (valid = k < 6) != 0; k++) {
                info->npc_slot[k] = 0;
            }
        }

        for (j = 0; (valid = j < 130) != 0; j++) {
            g->placed_parts[j].part_id = -1;
        }
    }

    Initialize__14CDngStatusDataFv(this->dng_status);
    Initialize__10CStockItemFv(this->stock_item);

    memset(this, 0, sizeof(this->config));
    memset(this->game_flags, 0, sizeof(this->game_flags));
    memset(this->map_flags, 0, 4);
}

/* @ 0x158D30 (0x50 bytes) -- __ct__9CSaveDataFv */
CSaveData::CSaveData() {
    *(s16 *) this->menu_cursor = 0;
    ((CMenuCursor *) this->menu_cursor)->InitPos();
    this->Initialize();
}
