#pragma once

#include "common.h"

#include <cstring>

#include "dngstatusdata.hpp"
#include "stockitem.hpp"

/**
 * @file
 * Declares the save slot record and its operations.
 */

/**
 * Holds the position that each menu screen shows again when the player opens it.
 */
class CMenuCursor {
public:
    /**
     * Sets all menu positions and modes to their default values.
     *
     * @mangled InitPos__11CMenuCursorFv
     * @address 0x158AE0
     * @size 0x80
     */
    void InitPos();

private:
    // CSaveData mirrors reset_pos into its own config[16], and sets it from
    // the memory card data in InvertConfig.
    friend class CSaveData;

    s16 reset_pos; /**< Set to zero to keep the menu positions. Any other value discards them. */
    s16 pos[10];   /**< Contains the cursor position of each menu. */
    s16 mode[10];  /**< Contains the mode of each menu. */
    s16 chara_no;  /**< Identifies the character that the item menu shows. */
};
STATIC_ASSERT(sizeof(CMenuCursor) == 0x2C);

/**
 * Contains the configuration values in the format that the memory card uses.
 *
 * The values are written three times. If the three copies do not agree, the
 * memory card data is damaged.
 */
struct SV_CONFIG_SYS {
    char values[18];       /**< Contains the configuration values. */
    char values_copy1[18]; /**< Contains the first copy of the configuration values. */
    char values_copy2[18]; /**< Contains the second copy of the configuration values. */
    char reserved_36[10];  /**< Contains the game clear flag at offset two. */
};

/**
 * Contains one entry of the fishing leaderboard.
 */
struct SV_FISH_DATA {
    s32 fish_id; /**< Identifies the fish. */
    float rank;  /**< Contains the score that gives the position in the leaderboard. */
    float unk_8;
    float unk_C;
};

/**
 * Contains the state of one Georama plot.
 */
struct SV_EDIT_PARTS_INFO {
    s32 part_id; /**< Identifies the building on the plot. */
    s16 flag;    /**< Set to one when the player has the building. */
    s16 unk_6;
    s16 progress;    /**< Contains the build progress of the building. */
    s16 npc_slot[6]; /**< Identifies the NPCs that live in the building. */
    s16 unk_16;
};

/**
 * Contains one Georama part that the player put on the map.
 */
struct SV_GRD_PART {
    s16 part_id; /**< Identifies the part. */
    s16 variant; /**< Selects the variant of the part. */
    float pos_x; /**< Contains the X position of the part. */
    float pos_y; /**< Contains the Y position of the part. */
    float pos_z; /**< Contains the Z position of the part. */
};

/**
 * Contains one NPC slot of a Georama town.
 */
struct SV_GRD_NPC {
    char unk_0[12];
};

/**
 * Contains the Georama save data of one town.
 */
struct SV_GEORAMA_DATA {
    char unk_0[104];
    SV_EDIT_PARTS_INFO parts_info[24]; /**< Contains the state of each plot. */
    SV_GRD_PART placed_parts[130];     /**< Contains the parts that the player put on the map. */
    SV_GRD_NPC npc[20];                /**< Contains the NPC slots of the town. */
};

/**
 * Contains the data of one save slot.
 */
class CSaveData {
public:
    /**
     * Sets all save data fields to their initial state.
     *
     * @mangled __ct__9CSaveDataFv
     * @address 0x158D30
     * @size 0x50
     */
    CSaveData();

    /**
     * Sets all save data fields to their initial state.
     *
     * @mangled Initialize__9CSaveDataFv
     * @address 0x158B60
     * @size 0x1D0
     */
    void Initialize();

    /**
     * Returns the configuration values.
     *
     * @mangled GetConfigData__9CSaveDataFv
     * @address 0x157B30
     * @size 0x10
     */
    void *GetConfigData();

    /**
     * Returns the menu cursor.
     *
     * @mangled GetMenuCursor__9CSaveDataFv
     * @address 0x157B40
     * @size 0x10
     */
    CMenuCursor *GetMenuCursor();

    /**
     * Returns the name of a character, or NULL if the character number is not valid.
     *
     * @mangled GetCharaName__9CSaveDataFi
     * @address 0x157B50
     * @size 0x40
     */
    char *GetCharaName(int chara_no);

    /**
     * Adds a value to the play time.
     *
     * @mangled AddPlayTime__9CSaveDataFi
     * @address 0x157B90
     * @size 0x20
     */
    void AddPlayTime(int time);

    /**
     * Returns the play time.
     *
     * @mangled GetPlayTime__9CSaveDataFv
     * @address 0x157BB0
     * @size 0x10
     */
    int GetPlayTime();

    /**
     * Sets the time of day.
     *
     * @mangled SetNowTime__9CSaveDataFf
     * @address 0x157BC0
     * @size 0x10
     */
    void SetNowTime(float time);

    /**
     * Returns the time of day.
     *
     * @mangled GetNowTime__9CSaveDataFv
     * @address 0x157BD0
     * @size 0x10
     */
    float GetNowTime();

    /**
     * Adds a value to the time of day and starts a new day if necessary.
     *
     * @mangled AddNowTime__9CSaveDataFf
     * @address 0x157BE0
     * @size 0xE0
     */
    void AddNowTime(float add);

    /**
     * Sets the day count and keeps the count in the permitted range.
     *
     * @mangled SetDay__9CSaveDataFi
     * @address 0x157CC0
     * @size 0x40
     */
    void SetDay(int day);

    /**
     * Returns the day count.
     *
     * @mangled GetDay__9CSaveDataFv
     * @address 0x157D00
     * @size 0x10
     */
    int GetDay();

    /**
     * Adds a value to the day count.
     *
     * @mangled AddDay__9CSaveDataFi
     * @address 0x157D10
     * @size 0x30
     */
    void AddDay(int add);

    /**
     * Adds a value to the fishing points and keeps the points in the permitted range.
     *
     * @mangled AddFishingPoint__9CSaveDataFi
     * @address 0x157D40
     * @size 0x40
     */
    void AddFishingPoint(int add);

    /**
     * Sets the fishing points and keeps the points in the permitted range.
     *
     * @mangled SetFishingPoint__9CSaveDataFi
     * @address 0x157D80
     * @size 0x40
     */
    void SetFishingPoint(int value);

    /**
     * Puts a fish score in the leaderboard and sorts the leaderboard again.
     *
     * @mangled SetFishingRank__9CSaveDataFif
     * @address 0x157DC0
     * @size 0x180
     */
    void SetFishingRank(int fish_id, float score);

    /**
     * Returns a leaderboard entry, or NULL if the entry is empty.
     *
     * @mangled GetFishingRank__9CSaveDataFi
     * @address 0x157F40
     * @size 0x70
     */
    SV_FISH_DATA *GetFishingRank(int rank_index);

    /**
     * Returns the Georama data of a town, or NULL if the town number is not valid.
     *
     * @mangled GetGrdData__9CSaveDataFi
     * @address 0x157FB0
     * @size 0x40
     */
    SV_GEORAMA_DATA *GetGrdData(int georama_no);

    /**
     * Returns the state of a Georama plot, or NULL if a number is not valid.
     *
     * @mangled GetEditPartsInfo__9CSaveDataFii
     * @address 0x157FF0
     * @size 0x70
     */
    SV_EDIT_PARTS_INFO *GetEditPartsInfo(int georama_no, int plot_no);

    /**
     * Returns the Georama parts of a town and gives the number of parts that the town has.
     *
     * @mangled GetParts__9CSaveDataFiPi
     * @address 0x158060
     * @size 0x70
     */
    SV_GRD_PART *GetParts(int georama_no, int *out_count);

    /**
     * Returns an NPC slot of a map, or NULL if a number is not valid.
     *
     * @mangled GetGrdNPCData__9CSaveDataFii
     * @address 0x1580D0
     * @size 0xD0
     */
    void *GetGrdNPCData(int map_no, int npc_no);

    /**
     * Returns the chips of a town, or NULL if the town number is not valid.
     *
     * @mangled GetElemData__9CSaveDataFi
     * @address 0x1581A0
     * @size 0x40
     */
    s16 *GetElemData(int georama_no);

    /**
     * Returns the dungeon status data.
     *
     * @mangled GetDngStatus__9CSaveDataFv
     * @address 0x1581E0
     * @size 0x10
     */
    CDngStatusData *GetDngStatus();

    /**
     * Returns the stock inventory.
     *
     * @mangled GetStockItem__9CSaveDataFv
     * @address 0x1581F0
     * @size 0x10
     */
    CStockItem *GetStockItem();

    /**
     * Returns the value of a game flag, or zero if the flag number is not valid.
     *
     * @mangled GetGameFlag__9CSaveDataFi
     * @address 0x158200
     * @size 0x80
     */
    int GetGameFlag(int flag_no);

    /**
     * Sets a game flag and returns the new value.
     *
     * @mangled SetGameFlag__9CSaveDataFii
     * @address 0x158280
     * @size 0xA0
     */
    int SetGameFlag(int flag_no, int value);

    /**
     * Returns the value of a game integer flag, or zero if the flag number is not valid.
     *
     * @mangled GetGameIntFlag__9CSaveDataFi
     * @address 0x158320
     * @size 0x40
     */
    int GetGameIntFlag(int flag_no);

    /**
     * Sets a game integer flag and returns the new value.
     *
     * @mangled SetGameIntFlag__9CSaveDataFii
     * @address 0x158360
     * @size 0x40
     */
    int SetGameIntFlag(int flag_no, int value);

    /**
     * Returns the value of a map flag, or zero if a number is not valid.
     *
     * @mangled GetMapFlag__9CSaveDataFii
     * @address 0x1583A0
     * @size 0xA0
     */
    int GetMapFlag(int map_no, int flag_no);

    /**
     * Sets a map flag and returns the new value.
     *
     * @mangled SetMapFlag__9CSaveDataFiii
     * @address 0x158440
     * @size 0xC0
     */
    int SetMapFlag(int map_no, int flag_no, int value);

    /**
     * Returns the value of a map initialization flag, or zero if a number is not valid.
     *
     * @mangled GetMapInitFlag__9CSaveDataFii
     * @address 0x158500
     * @size 0xA0
     */
    int GetMapInitFlag(int map_no, int flag_no);

    /**
     * Sets a map initialization flag and returns the new value.
     *
     * @mangled SetMapInitFlag__9CSaveDataFiii
     * @address 0x1585A0
     * @size 0xC0
     */
    int SetMapInitFlag(int map_no, int flag_no, int value);

    /**
     * Gives the player a Georama building and returns one if the state changed.
     *
     * @mangled AtraPartsGet__9CSaveDataFii
     * @address 0x158660
     * @size 0x100
     */
    int AtraPartsGet(int georama_no, int plot_no);

    /**
     * Puts a chip in the first empty chip slot of a town and returns one if a slot was empty.
     *
     * @mangled AtraChipGet__9CSaveDataFii
     * @address 0x158760
     * @size 0xA0
     */
    int AtraChipGet(int georama_no, int chip_id);

    /**
     * Adds a value to the visit count of a map and returns the new count.
     *
     * @mangled VisitMap__9CSaveDataFii
     * @address 0x158800
     * @size 0x70
     */
    s16 VisitMap(int map_no, int add);

    /**
     * Adds a value to the quest count of a dungeon and returns the new count.
     *
     * @mangled QuestDungeon__9CSaveDataFii
     * @address 0x158870
     * @size 0xD0
     */
    int QuestDungeon(int dungeon_no, int add);

    /**
     * Writes the configuration values in the format that the memory card uses.
     *
     * @mangled ConvertConfig__9CSaveDataFP13SV_CONFIG_SYS
     * @address 0x158940
     * @size 0xC0
     */
    void ConvertConfig(SV_CONFIG_SYS *out);

    /**
     * Reads the configuration values from the memory card and returns zero if the copies do not agree.
     *
     * @mangled InvertConfig__9CSaveDataFP13SV_CONFIG_SYS
     * @address 0x158A00
     * @size 0xE0
     */
    int InvertConfig(SV_CONFIG_SYS *in);

private:
    s32 config[18];         /**< Contains the configuration values. */
    char chara_name[6][64]; /**< Contains the name of each character. */
    char unk_1C8[4];
    s32 unk_1CC;
    float now_time;             /**< Contains the time of day. */
    s32 play_time;              /**< Contains the play time. */
    s32 day;                    /**< Contains the day count. */
    s32 fishing_point;          /**< Contains the fishing points. */
    SV_FISH_DATA fish_data[64]; /**< Contains the fishing leaderboard. */
    char unk_5E0[112];
    CMenuCursor menu_cursor;    /**< Contains the menu positions. */
    SV_GEORAMA_DATA georama[6]; /**< Contains the Georama data of each town. */
    s16 elem_data[6][128];      /**< Contains the chips of each town. */
    char special_npc[320];      /**< Contains the NPC slots that the sub-maps share. */

    // ConvertConfig and InvertConfig reach dng_status.config_mirror at 0x9748
    // from `this`. Only a direct member access at a >0x7FFF offset emits
    // retail's `lui at,0x1; addu at,<this>,at; lw/sw reg,-0x68b8(at)` idiom.
    CDngStatusData dng_status;  /**< Contains the dungeon status data. */
    CStockItem stock_item;      /**< Contains the stock inventory. */
    u32 game_flags[256];        /**< Contains the game flag bits. */
    s32 game_int_flag[32];      /**< Contains the game integer flags. */
    u32 map_flags[80][16];      /**< Contains the map flag bits of each map. */
    u32 map_init_flags[80][16]; /**< Contains the map initialization flag bits of each map. */
    s16 visit_map[80];          /**< Contains the visit count of each map. */
    s16 quest_dungeon[6];       /**< Contains the quest count of each dungeon. */
    char unk_12F94[4];
    s32 quest_dungeon_total; /**< Contains the quest count of all the dungeons. */
    char unk_12F9C[548];
};

/** Points to the save data of the game. */
extern CSaveData *SaveData;

STATIC_ASSERT(sizeof(CSaveData) == 78272);
