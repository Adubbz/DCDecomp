#include "savedata.hpp"

/**
 * Contains one entry of the Georama building definition table.
 *
 * Only the two fields that AtraPartsGet() reads are known.
 */
struct SV_ATRA_PARTS_DEF {
    s32 max_progress; /**< Contains the maximum build progress of the building. */
    s32 unk4;         /**< Selects the build progress operation if the value is more than zero. */
};

/**
 * Returns the definition table entry of a Georama plot.
 *
 * @mangled GetEditAtraPartsData__Fii
 * @address 0x158E00
 * @size 0x80
 */
extern "C" SV_ATRA_PARTS_DEF *GetEditAtraPartsData__Fii(int georama_no, int plot_no);

void *CSaveData::GetConfigData() {
    return this->config;
}

CMenuCursor *CSaveData::GetMenuCursor() {
    return &this->menu_cursor;
}

char *CSaveData::GetCharaName(int chara_no) {
    if (chara_no < 0 || chara_no >= 6) {
        return NULL;
    }

    return this->chara_name[chara_no];
}

void CSaveData::AddPlayTime(int time) {
    this->play_time += time;
}

int CSaveData::GetPlayTime() {
    return this->play_time;
}

void CSaveData::SetNowTime(float time) {
    this->now_time = time;
}

float CSaveData::GetNowTime() {
    return this->now_time;
}

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

void CSaveData::SetDay(int day) {
    this->day = day;
    if (this->day > 9998) {
        this->day = 9998;
    }
    if (this->day < 0) {
        this->day = 0;
    }
}

int CSaveData::GetDay() {
    return this->day;
}

void CSaveData::AddDay(int add) {
    this->day += add;
    this->SetDay(this->day);
}

void CSaveData::AddFishingPoint(int add) {
    this->fishing_point += add;
    if (this->fishing_point > 0x270F) {
        this->fishing_point = 0x270F;
    }
    if (this->fishing_point < 0) {
        this->fishing_point = 0;
    }
}

void CSaveData::SetFishingPoint(int value) {
    this->fishing_point = value;
    if (this->fishing_point > 0x270F) {
        this->fishing_point = 0x270F;
    }
    if (this->fishing_point < 0) {
        this->fishing_point = 0;
    }
}

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

SV_FISH_DATA *CSaveData::GetFishingRank(int rank_index) {
    if (rank_index < 0 || rank_index >= 64) {
        return NULL;
    }

    if (this->fish_data[rank_index].rank <= 0.0f || this->fish_data[rank_index].fish_id < 0) {
        return NULL;
    }

    return &this->fish_data[rank_index];
}

SV_GEORAMA_DATA *CSaveData::GetGrdData(int georama_no) {
    if (georama_no < 0 || georama_no >= 6) {
        return NULL;
    }

    return &this->georama[georama_no];
}

SV_EDIT_PARTS_INFO *CSaveData::GetEditPartsInfo(int georama_no, int plot_no) {
    if (georama_no < 0 || georama_no >= 6) {
        return NULL;
    }

    if (plot_no < 0 || plot_no >= 24) {
        return NULL;
    }

    return &this->georama[georama_no].parts_info[plot_no];
}

SV_GRD_PART *CSaveData::GetParts(int georama_no, int *out_count) {
    SV_GRD_PART *parts;
    int count;

    if (georama_no < 0 || georama_no >= 6) {
        return NULL;
    }

    parts = this->georama[georama_no].placed_parts;

    for (count = 0; count < 130; count++) {
        if (parts[count].part_id < 0) {
            break;
        }
    }

    *out_count = count;
    return parts;
}

void *CSaveData::GetGrdNPCData(int map_no, int npc_no) {
    // Map IDs >= 11 are "sub-maps" that share one global NPC table
    // (special_npc) instead of each having a georama slot; a match here only
    // means "this is a recognized sub-map". The first negative entry ends the
    // table. The retail symbol is `sub_map$439` in .data at 0x25DF50: it must
    // stay a function-local (not file-scope) static, and must not be `const`.
    static s32 sub_map[] = {14, 23, 11, 19, 42, 38, -1, 0};
    int i;

    if (map_no >= 11) {
        for (i = 0;; i++) {
            if (sub_map[i] < 0) {
                return NULL;
            }

            if (map_no == sub_map[i]) {
                return this->special_npc + i * 12;
            }
        }
    }

    if (map_no < 0 || map_no >= 6) {
        return NULL;
    }

    if (npc_no < 0 || npc_no >= 20) {
        return NULL;
    }

    return &this->georama[map_no].npc[npc_no];
}

s16 *CSaveData::GetElemData(int georama_no) {
    if (georama_no < 0 || georama_no >= 6) {
        return NULL;
    }

    return this->elem_data[georama_no];
}

CDngStatusData *CSaveData::GetDngStatus() {
    return &this->dng_status;
}

CStockItem *CSaveData::GetStockItem() {
    return &this->stock_item;
}

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

int CSaveData::SetGameFlag(int flag_no, int value) {
    int bit_idx;
    int word_idx;
    u32 mask;

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (word_idx >= 256) {
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

int CSaveData::GetGameIntFlag(int flag_no) {
    if (flag_no >= 32) {
        return 0;
    }

    return this->game_int_flag[flag_no];
}

int CSaveData::SetGameIntFlag(int flag_no, int value) {
    if (flag_no >= 32) {
        return 0;
    }

    this->game_int_flag[flag_no] = value;
    return value;
}

int CSaveData::GetMapFlag(int map_no, int flag_no) {
    int word_idx;
    int bit_idx;
    u32 mask;

    if (map_no < 0 || map_no >= 0x50) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (word_idx >= 16) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    return (this->map_flags[map_no][word_idx] & mask) != 0;
}

int CSaveData::SetMapFlag(int map_no, int flag_no, int value) {
    int word_idx;
    int bit_idx;
    u32 mask;

    if (map_no < 0 || map_no >= 0x50) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (word_idx >= 16) {
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

int CSaveData::GetMapInitFlag(int map_no, int flag_no) {
    int word_idx;
    int bit_idx;
    u32 mask;

    if (map_no < 0 || map_no >= 0x50) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (word_idx >= 16) {
        return 0;
    }

    bit_idx = flag_no & 0x1F;
    if (flag_no < 0 && bit_idx != 0) {
        bit_idx -= 32;
    }

    mask = 1 << bit_idx;
    return (this->map_init_flags[map_no][word_idx] & mask) != 0;
}

int CSaveData::SetMapInitFlag(int map_no, int flag_no, int value) {
    int word_idx;
    int bit_idx;
    u32 mask;

    if (map_no < 0 || map_no >= 0x50) {
        return 0;
    }

    if (flag_no < 0) {
        return 0;
    }

    word_idx = flag_no >> 5;
    if (word_idx >= 16) {
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
    for (i = 0; i < 128; i++, p++) {
        if (*p < 0) {
            *p = chip_id;
            return 1;
        }
    }

    return 0;
}

s16 CSaveData::VisitMap(int map_no, int add) {
    if (map_no < 0 || map_no >= 0x50) {
        return 0;
    }

    this->visit_map[map_no] += add;
    if (this->visit_map[map_no] > 0x270F) {
        this->visit_map[map_no] = 0x270F;
    }

    return this->visit_map[map_no];
}

int CSaveData::QuestDungeon(int dungeon_no, int add) {
    if (dungeon_no == 6) {
        this->quest_dungeon_total += add;
        if (this->quest_dungeon_total > 0x270F) {
            this->quest_dungeon_total = 0x270F;
        }
        return this->quest_dungeon_total;
    }

    if (dungeon_no < 0 || dungeon_no >= 6) {
        return 0;
    }

    this->quest_dungeon[dungeon_no] += add;
    if (this->quest_dungeon[dungeon_no] > 0x270F) {
        this->quest_dungeon[dungeon_no] = 0x270F;
    }

    return this->quest_dungeon[dungeon_no];
}

void CSaveData::ConvertConfig(SV_CONFIG_SYS *out) {
    char *src;
    char *p;
    int copy;
    int j;

    p = (char *) out;

    this->config[16] = this->menu_cursor.reset_pos;
    this->config[15] = this->dng_status.config_mirror;

    src = (char *) this->config;
    memset(p, 0, sizeof(SV_CONFIG_SYS));

    for (copy = 0; copy < 3; copy++) {
        for (j = 0; j < 18; j++) {
            *(p + copy * 18 + j) = *(src + j * 4);
        }
    }
}

int CSaveData::InvertConfig(SV_CONFIG_SYS *in) {
    int i;
    int j;

    for (j = 0; j < 18; j++) {
        if (in->values[j] != in->values_copy1[j]) {
            return 0;
        }

        if (in->values[j] != in->values_copy2[j]) {
            return 0;
        }
    }

    for (i = 0; i < 18; i++) {
        this->config[i] = in->values[i];
    }

    s32 config16 = this->config[16];
    this->menu_cursor.reset_pos = (s16) config16;
    if (this->menu_cursor.reset_pos != 0) {
        this->menu_cursor.InitPos();
    }

    this->dng_status.config_mirror = this->config[15];

    return 1;
}

void CMenuCursor::InitPos() {
    int i;
    int j;

    for (i = 0; i < 10; i++) {
        this->pos[i] = 0;
    }

    for (j = 0; j < 10; j++) {
        this->mode[j] = -1;
    }

    this->mode[0] = 4;
    this->mode[2] = 6;
    this->mode[3] = 0;
    this->chara_no = 0;
}

void CSaveData::Initialize() {
    int i;
    int j;
    int k;

    memset(this, 0, sizeof(CSaveData));
    this->unk_1CC = -1;
    this->now_time = 0.0f;

    for (j = 0; j < 6; j++) {
        for (k = 0; k < 128; k++) {
            this->elem_data[j][k] = -1;
        }
    }

    SV_GEORAMA_DATA *g = this->georama;

    for (i = 0; i < 6; i++, g++) {
        memset(g, 0, sizeof(SV_GEORAMA_DATA));

        for (j = 0; j < 24; j++) {
            SV_EDIT_PARTS_INFO *info = &g->parts_info[j];

            for (k = 0; k < 6; k++) {
                info->npc_slot[k] = 0;
            }
        }

        for (j = 0; j < 130; j++) {
            g->placed_parts[j].part_id = -1;
        }
    }

    this->dng_status.Initialize();
    this->stock_item.Initialize();

    memset(this, 0, sizeof(this->config));
    memset(this->game_flags, 0, sizeof(this->game_flags));
    memset(this->map_flags, 0, 4);
}

CSaveData::CSaveData() {
    this->menu_cursor.reset_pos = 0;
    this->menu_cursor.InitPos();
    this->Initialize();
}
