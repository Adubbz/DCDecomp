#pragma once

#include "common.h"
#include "sce/libmc.h"

/**
 * One icon file the memory-card browser draws a save with.
 */
struct MC_ICON_FILE {
    char *name; /**< Icon file the browser reads. */
    s32 unk_4;
    s32 unk_8;
};

STATIC_ASSERT(sizeof(MC_ICON_FILE) == 0xC);

/**
 * The three icons one save is written with, which SetIconData takes and
 * MakeMcIconSysInfo names in the icon.sys it builds.
 */
struct MC_ICON_DATA {
    MC_ICON_FILE view; /**< Icon the browser draws while viewing the save. */
    MC_ICON_FILE copy; /**< Icon the browser draws while copying the save. */
    MC_ICON_FILE del;  /**< Icon the browser draws while deleting the save. */
};

STATIC_ASSERT(sizeof(MC_ICON_DATA) == 0x24);

/**
 * What the library reports about the card in one slot.
 */
struct MC_CARD_INFO {
    s32 exist;  /**< Whether the slot holds a card the game can use. */
    s32 type;   /**< Which kind of card the slot holds. */
    s32 format; /**< Whether that card is formatted. */
    s32 unk_0C; /**< Whether the save on the card is an older layout. */
    s32 unk_10;
    s32 unk_14;
    s32 free; /**< Clusters the card has left. */
    s32 unk_1C;
    s32 result; /**< What the library's last call on the slot returned. */
};

STATIC_ASSERT(sizeof(MC_CARD_INFO) == 0x24);

/**
 * What one save on a card holds, as the load menu lists it.
 */
struct MC_SAVE_FILE_INFO {
    s32 unk_00;      /**< Whether the slot holds a save this build can read. */
    s32 unk_04;      /**< Whether the slot holds a save this build can read. */
    char name[0x20]; /**< Name of the character the save was made by. */
    float play_time; /**< How long that save has been played for. */
    s8 dng_status;   /**< How far into the dungeon the save has reached. */
    u8 unk_2D[3];
    s32 unk_30;
    s32 quest; /**< Which of the save's quests are open. */
};

STATIC_ASSERT(sizeof(MC_SAVE_FILE_INFO) == 0x38);

/** Slots the library reads cards from. */
#define MC_CARD_MAX 2

/** Saves one card holds. */
#define MC_SAVE_FILE_MAX 12

/**
 * Drives every memory-card operation the game asks for. SetFuncNo picks which
 * one runs, and Step carries it a little further each frame until it reports
 * that it has finished or failed.
 */
class CMemoryCardAccess {
public:
    s32 port;    /**< Slot the operation runs against. */
    s32 file_no; /**< Save the operation runs against. */
    s32 unk_008;
    s32 unk_00C;
    s32 unk_010;
    s32 unk_014;
    s32 unk_018;
    char version[0x20];   /**< Build the save was written by, which a load checks. */
    char dir_name[0x20];  /**< Directory the game's saves sit in, which differs by region. */
    char file_name[0x20]; /**< File the operation reads or writes. */
    char cur_dir[0x40];   /**< Directory the card was in before the operation changed it. */
    s32 func_no;          /**< Operation Step is carrying out. */
    s32 unk_0C0;
    s32 step; /**< How far through that operation Step has got. */
    s32 unk_0C8;
    void *save_file_info; /**< The table the loaded save details are kept in. */
    char *buf;            /**< Where the save is built up before it is written. */
    char *unk_0D4;
    s32 unk_0D8;
    s32 unk_0DC;
    s32 unk_0E0;
    s32 unk_0E4;
    s32 unk_0E8;
    sceMcIconSys icon_sys;                         /**< The icon.sys written alongside the save. */
    MC_ICON_DATA icon_data;                        /**< Icons that icon.sys names. */
    MC_CARD_INFO card[MC_CARD_MAX];                /**< What the library reports about each slot. */
    MC_SAVE_FILE_INFO file_info[MC_SAVE_FILE_MAX]; /**< What each save on the card holds. */

    /**
     * @mangled Initialize__17CMemoryCardAccessFv
     * @address 0x2135D0
     * @size 0x180
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled InitForMC__17CMemoryCardAccessFv
     * @address 0x213750
     * @size 0x100
     * @unknownret
     */
    void InitForMC(void);

    /**
     * @mangled SetBuff__17CMemoryCardAccessFPc
     * @address 0x213850
     * @size 0x140
     * @unknownret
     */
    void SetBuff(char *);

    /**
     * @mangled SetIconData__17CMemoryCardAccessFP12MC_ICON_DATA
     * @address 0x213990
     * @size 0x70
     * @unknownret
     */
    void SetIconData(MC_ICON_DATA *);

    /**
     * @mangled MakeMcIconSysInfo__17CMemoryCardAccessFv
     * @address 0x213A00
     * @size 0x190
     * @unknownret
     */
    void MakeMcIconSysInfo(void);

    /**
     * Picks the operation Step carries out, and waits for whatever the library
     * was doing before to finish.
     *
     * @mangled SetFuncNo__17CMemoryCardAccessFi
     * @address 0x213B90
     * @size 0x50
     */
    void SetFuncNo(int no);

    /**
     * @mangled GetFuncNo__17CMemoryCardAccessFv
     * @address 0x213BE0
     * @size 0x10
     */
    int GetFuncNo(void);

    /**
     * @mangled Step__17CMemoryCardAccessFv
     * @address 0x213BF0
     * @size 0x44
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled SetVersion__17CMemoryCardAccessFPc
     * @address 0x213DB0
     * @size 0x30
     */
    void SetVersion(char *version);

    /**
     * @mangled GetVersion__17CMemoryCardAccessFv
     * @address 0x213DE0
     * @size 0x10
     */
    char *GetVersion(void);

    /**
     * @mangled SearchMcType__17CMemoryCardAccessFv
     * @address 0x213DF0
     * @size 0x2A0
     * @unknownret
     */
    void SearchMcType(void);

    /**
     * @mangled GetDir__17CMemoryCardAccessFv
     * @address 0x214090
     * @size 0x2A0
     * @unknownret
     */
    void GetDir(void);

    /**
     * @mangled LoadSysConfig__17CMemoryCardAccessFv
     * @address 0x214330
     * @size 0x2A0
     * @unknownret
     */
    void LoadSysConfig(void);

    /**
     * @mangled SaveSysConfig__17CMemoryCardAccessFv
     * @address 0x2145D0
     * @size 0x310
     * @unknownret
     */
    void SaveSysConfig(void);

    /**
     * @mangled Write__17CMemoryCardAccessFv
     * @address 0x2148E0
     * @size 0x100
     * @unknownret
     */
    void Write(void);

    /**
     * @mangled Convert__17CMemoryCardAccessFv
     * @address 0x2149E0
     * @size 0x340
     * @unknownret
     */
    void Convert(void);

    /**
     * @mangled MakeDir__17CMemoryCardAccessFv
     * @address 0x214D20
     * @size 0x5C
     * @unknownret
     */
    void MakeDir(void);

    /**
     * @mangled GetSaveFileInfoFromMc__17CMemoryCardAccessFi
     * @address 0x2154A0
     * @size 0x590
     * @unknownret
     */
    void GetSaveFileInfoFromMc(int);

    /**
     * @mangled GetAllSaveFileInfo__17CMemoryCardAccessFv
     * @address 0x215A30
     * @size 0xE0
     * @unknownret
     */
    void GetAllSaveFileInfo(void);

    /**
     * @mangled CheckFileNo__17CMemoryCardAccessFi
     * @address 0x215B10
     * @size 0x80
     * @unknownret
     */
    void CheckFileNo(int);

    /**
     * @mangled SaveToMc__17CMemoryCardAccessFi
     * @address 0x215B90
     * @size 0x80
     * @unknownret
     */
    void SaveToMc(int);

    /**
     * @mangled LoadFromMc__17CMemoryCardAccessFi
     * @address 0x216240
     * @size 0x410
     * @unknownret
     */
    void LoadFromMc(int);

    /**
     * @mangled FormatForMc__17CMemoryCardAccessFv
     * @address 0x216650
     * @size 0x1D0
     * @unknownret
     */
    void FormatForMc(void);

    /**
     * @mangled DeleteFile__17CMemoryCardAccessFi
     * @address 0x216820
     * @size 0x160
     * @unknownret
     */
    void DeleteFile(int);

    /**
     * @mangled GetMsgNo__17CMemoryCardAccessFi
     * @address 0x216980
     * @size 0x48
     * @unknownret
     */
    void GetMsgNo(int);

    /**
     * @mangled McError__17CMemoryCardAccessFi
     * @address 0x216A50
     * @size 0x1A0
     * @unknownret
     */
    void McError(int);

    /**
     * Spins until the library has finished whatever it was doing, throwing
     * away what that call returned.
     *
     * @mangled DmySync__17CMemoryCardAccessFv
     * @address 0x216BF0
     * @size 0x50
     */
    void DmySync(void);

    /**
     * @mangled McUnFormatForDebug__17CMemoryCardAccessFv
     * @address 0x216C40
     * @size 0x110
     * @unknownret
     */
    void McUnFormatForDebug(void);
};

STATIC_ASSERT(sizeof(CMemoryCardAccess) == 0x7BC);
