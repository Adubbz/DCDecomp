#pragma once

#include "common.h"

extern "C" void *memset(void *dest, int value, u32 size);

/* CDngStatusData / CStockItem storage is still an opaque char[] in CSaveData,
 * so their Initialize() methods are reached by mangled name, with the
 * sub-object's address passed as an explicit `this`. */
extern "C" void Initialize__14CDngStatusDataFv(void *dng_status);
extern "C" void Initialize__10CStockItemFv(void *stock_item);

/* CMenuCursor is not fully analyzed (menu_cursor stays an opaque char[44]
 * below); declared only far enough to name InitPos() with the right
 * mangling, which CSaveData's constructor and InvertConfig both need. */
class CMenuCursor {
    public:
        void InitPos();
};

/* On-disk config block written/read by CSaveData::ConvertConfig / InvertConfig.
 * 18 config bytes, triplicated for memory-card corruption detection.
 * See RE/savedata.md for full details. */
struct SV_CONFIG_SYS {
    char values[18];
    char values_copy1[18];
    char values_copy2[18];
    char reserved_36[10];
};

/* One entry in CSaveData's 64-slot fishing leaderboard. */
struct SV_FISH_DATA {
    s32 fish_id;
    float rank;
    float unk8;
    float unkC;
};

/* One buildable Georama plot's state (24 possible plots per town). */
struct SV_EDIT_PARTS_INFO {
    s32 part_id;
    s16 flag;
    s16 unk6;
    s16 progress;
    s16 npc_slot[6];
    s16 pad16;
};

/* One placed Georama building part (position + variant), 130 possible per town. */
struct SV_GRD_PART {
    s16 part_id;
    s16 variant;
    float pos_x;
    float pos_y;
    float pos_z;
};

/* One NPC slot assigned to a Georama town. Internal layout not analyzed. */
struct SV_GRD_NPC {
    char raw[12];
};

/* One of the 6 Georama towns' save data (see RE/savedata.md). */
struct SV_GEORAMA_DATA {
    char unk_000[104];
    SV_EDIT_PARTS_INFO parts_info[24];
    SV_GRD_PART placed_parts[130];
    SV_GRD_NPC npc[20];
};

/* A single save slot's data. */
class CSaveData {
    public:
        CSaveData();

        void Initialize();

        void *GetConfigData();
        void *GetMenuCursor();
        char *GetCharaName(int chara_no);

        void AddPlayTime(int time);
        int GetPlayTime();

        void SetNowTime(float time);
        float GetNowTime();
        void AddNowTime(float add);

        void SetDay(int day);
        int GetDay();
        void AddDay(int add);

        void AddFishingPoint(int add);
        void SetFishingPoint(int value);
        void SetFishingRank(int fish_id, float score);
        SV_FISH_DATA *GetFishingRank(int rank_index);

        SV_GEORAMA_DATA *GetGrdData(int georama_no);
        SV_EDIT_PARTS_INFO *GetEditPartsInfo(int georama_no, int plot_no);
        SV_GRD_PART *GetParts(int georama_no, int *out_count);
        void *GetGrdNPCData(int map_no, int npc_no);
        s16 *GetElemData(int georama_no);

        void *GetDngStatus();
        void *GetStockItem();

        int GetGameFlag(int flag_no);
        int SetGameFlag(int flag_no, int value);
        int GetGameIntFlag(int flag_no);
        int SetGameIntFlag(int flag_no, int value);

        int GetMapFlag(int map_no, int flag_no);
        int SetMapFlag(int map_no, int flag_no, int value);
        int GetMapInitFlag(int map_no, int flag_no);
        int SetMapInitFlag(int map_no, int flag_no, int value);

        int AtraPartsGet(int georama_no, int plot_no);
        int AtraChipGet(int georama_no, int chip_id);

        s16 VisitMap(int map_no, int add);
        int QuestDungeon(int dungeon_no, int add);

        void ConvertConfig(SV_CONFIG_SYS *out);
        int InvertConfig(SV_CONFIG_SYS *in);

    private:
        s32 config[18];
        char chara_name[6][64];
        char unk_1C8[4];
        s32 unk_1CC;
        float now_time;
        s32 play_time;
        s32 day;
        s32 fishing_point;
        SV_FISH_DATA fish_data[64];
        char unk_5E0[112];
        char menu_cursor[44]; /* CMenuCursor, not yet analyzed */
        SV_GEORAMA_DATA georama[6];
        s16 elem_data[6][128];
        char special_npc[320]; /* CDngStatusData special NPC table */
        /* CDngStatusData, split into three raw pieces so the one field
         * CSaveData itself touches (0x9748 from `this`, mirrored into
         * config[15] by ConvertConfig/InvertConfig) is a named member: only a
         * direct member access at a >0x7FFF offset emits retail's
         * `lui at,0x1; addu at,<this>,at; lw/sw reg,-0x68b8(at)` idiom. */
        char dng_status[17212];
        s32 dng_status_config15;
        char dng_status_rest[18780];
        char stock_item[8640]; /* CStockItem, not yet analyzed */
        u32 game_flags[256];
        s32 game_int_flag[32];
        u32 map_flags[80][16];
        u32 map_init_flags[80][16];
        s16 visit_map[80];
        s16 quest_dungeon[6];
        char unk_12F94[4];
        s32 quest_dungeon_total;
        char unk_12F9C[548];
};

/* The game's single global save-data instance is defined in src/main.cpp,
 * not src/savedata.cpp -- a global with a non-trivial constructor emits
 * static-initializer code that would shift CSaveData's matched methods. */
extern CSaveData *SaveData;

STATIC_ASSERT(sizeof(CSaveData) == 78272);
