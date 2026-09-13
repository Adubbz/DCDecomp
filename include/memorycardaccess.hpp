#pragma once

#include "common.h"
#include "sce/libmc.h"

class CSaveData;

/**
 * Describes one browser-icon file written into the save directory.
 */
struct MC_ICON_FILE {
    char *name; /**< Name of the icon file inside the save directory. */
    char *data; /**< Data written to the icon file. */
    int size;   /**< Size of the icon data in bytes. */
};

STATIC_ASSERT(sizeof(MC_ICON_FILE) == 0xC);

/**
 * Describes the browser icons used when viewing, copying and deleting the save.
 */
struct MC_ICON_DATA {
    MC_ICON_FILE view; /**< Icon that the browser shows for the save. */
    MC_ICON_FILE copy; /**< Icon that the browser shows while it copies the save. */
    MC_ICON_FILE del;  /**< Icon that the browser shows while it deletes the save. */
};

STATIC_ASSERT(sizeof(MC_ICON_DATA) == 0x24);

/**
 * Holds what the class found out about the card in one port.
 */
struct MC_CARD_INFO {
    s32 present;   /**< One while the last sceMcGetInfo found a card in the port. */
    s32 type;      /**< Card type that sceMcGetInfo writes. */
    s32 formatted; /**< Format flag that sceMcGetInfo writes. */
    s32 unk_0C;
    s32 unk_10;
    u8 unk_14[4];
    s32 free_size; /**< Free space that sceMcGetInfo writes. */
    s32 unk_1C;
    s32 result; /**< Result of the last sceMcGetInfo on the card. */
};

STATIC_ASSERT(sizeof(MC_CARD_INFO) == 0x24);

/**
 * Describes one save file of the card to the save and load menus.
 */
struct SAVEDATA_INFO {
    s32 state;       /**< One once the file is read and its version matches, zero otherwise. */
    s32 file_no;     /**< Number that the file carries in its name, counted from one. */
    char name[0x20]; /**< Name of the first character of the save. */
    float play_time; /**< Play time of the save. */
    s8 party_size;   /**< Characters in the party of the save. */
    u8 unk_2D[3];
    s32 unk_30;
    s32 quest_total; /**< Sum of the quest counts of the seven dungeons of the save, held below 10000. */
};

STATIC_ASSERT(sizeof(SAVEDATA_INFO) == 0x38);

/**
 * Slots the library reads cards from.
 */
#define MC_CARD_MAX 2

/**
 * Saves one card holds.
 */
#define MC_SAVE_FILE_MAX 12

/**
 * Names the operation dispatched by CMemoryCardAccess::Step.
 */
// clang-format off
enum MC_OPERATION {
    MC_OPERATION_SEARCH_TYPE            = 0,
    MC_OPERATION_IDLE                   = 1,
    MC_OPERATION_GET_DIR                = 2,
    MC_OPERATION_MAKE_DIR               = 3,
    MC_OPERATION_GET_ALL_SAVE_FILE_INFO = 4,
    MC_OPERATION_SAVE                   = 5,
    MC_OPERATION_LOAD                   = 6,
    MC_OPERATION_FORMAT                 = 8,
    MC_OPERATION_UNFORMAT               = 9,
    MC_OPERATION_WRITE_TEST              = 11,
    MC_OPERATION_LOAD_CONFIG            = 12,
    MC_OPERATION_SAVE_CONFIG            = 13,
    MC_OPERATION_CONVERT                = 14
};
// clang-format on

/**
 * Runs the memory card operations of the game one step at a time.
 */
class CMemoryCardAccess {
public:
    /**
     * Fills the class with its starting values and names the save directory
     * after the menu language.
     *
     * @mangled Initialize__17CMemoryCardAccessFv
     * @address 0x2135D0
     * @size 0x180
     */
    void Initialize();

    /**
     * Starts the memory card library and the class, and returns one if the
     * library fails to start.
     *
     * @mangled InitForMC__17CMemoryCardAccessFv
     * @address 0x213750
     * @size 0x100
     */
    int InitForMC();

    /**
     * Builds the save image in the given buffer out of the save data, the
     * version string and one checksum byte for every 64 bytes of save data.
     *
     * @mangled SetBuff__17CMemoryCardAccessFPc
     * @address 0x213850
     * @size 0x140
     */
    void SetBuff(char *buffer);

    /**
     * Sets the file descriptors for the save directory's browser icons.
     *
     * @mangled SetIconData__17CMemoryCardAccessFP12MC_ICON_DATA
     * @address 0x213990
     * @size 0x70
     */
    void SetIconData(MC_ICON_DATA *icon);

    /**
     * Fills the icon.sys image that MakeDir writes into the save directory.
     *
     * @mangled MakeMcIconSysInfo__17CMemoryCardAccessFv
     * @address 0x213A00
     * @size 0x190
     */
    void MakeMcIconSysInfo();

    /**
     * Starts the given operation from its first step and polls the memory
     * card library once.
     *
     * @mangled SetFuncNo__17CMemoryCardAccessFi
     * @address 0x213B90
     * @size 0x50
     */
    void SetFuncNo(int func_no);

    /**
     * Returns the operation that the class is running.
     *
     * @mangled GetFuncNo__17CMemoryCardAccessFv
     * @address 0x213BE0
     * @size 0x10
     */
    int GetFuncNo();

    /**
     * Runs one step of the current operation and returns its result.
     *
     * @mangled Step__17CMemoryCardAccessFv
     * @address 0x213BF0
     * @size 0x1C0
     */
    int Step();

    /**
     * Copies the given version string into the class.
     *
     * @mangled SetVersion__17CMemoryCardAccessFPc
     * @address 0x213DB0
     * @size 0x30
     */
    void SetVersion(char *version);

    /**
     * Returns the version string that every save file carries after its data.
     *
     * @mangled GetVersion__17CMemoryCardAccessFv
     * @address 0x213DE0
     * @size 0x10
     */
    char *GetVersion();

    /**
     * Reads the type, the free space and the format of the card in the current
     * port.
     *
     * @mangled SearchMcType__17CMemoryCardAccessFv
     * @address 0x213DF0
     * @size 0x2A0
     */
    int SearchMcType();

    /**
     * Enters the save directory of the card and reads its entries into the
     * directory table.
     *
     * @mangled GetDir__17CMemoryCardAccessFv
     * @address 0x214090
     * @size 0x2A0
     */
    int GetDir();

    /**
     * Reads the configuration file of the save directory and applies it to
     * the save data.
     *
     * @mangled LoadSysConfig__17CMemoryCardAccessFv
     * @address 0x214330
     * @size 0x2A0
     */
    int LoadSysConfig();

    /**
     * Writes the configuration of the save data to the configuration file of
     * the save directory.
     *
     * @mangled SaveSysConfig__17CMemoryCardAccessFv
     * @address 0x2145D0
     * @size 0x310
     */
    int SaveSysConfig();

    /**
     * Writes a test file of 0x76F800 bytes into the root directory of the card.
     *
     * @mangled Write__17CMemoryCardAccessFv
     * @address 0x2148E0
     * @size 0x100
     */
    int Write();

    /**
     * Creates the save directory and copies the save files of the
     * BASCUS-97112dkcloud directory into it.
     *
     * @mangled Convert__17CMemoryCardAccessFv
     * @address 0x2149E0
     * @size 0x340
     */
    int Convert();

    /**
     * Creates the save directory and writes a default configuration file,
     * icon.sys and the icon files into it.
     *
     * @mangled MakeDir__17CMemoryCardAccessFv
     * @address 0x214D20
     * @size 0x778
     */
    int MakeDir();

    /**
     * Reads the save file with the given number and fills its entry of the
     * save file table from it.
     *
     * @mangled GetSaveFileInfoFromMc__17CMemoryCardAccessFi
     * @address 0x2154A0
     * @size 0x590
     */
    int GetSaveFileInfoFromMc(int file_no);

    /**
     * Reads the twelve save files of the card in turn into the save file table.
     *
     * @mangled GetAllSaveFileInfo__17CMemoryCardAccessFv
     * @address 0x215A30
     * @size 0xE0
     */
    int GetAllSaveFileInfo();

    /**
     * Returns one when the directory table already holds the save file with
     * the given number.
     *
     * @mangled CheckFileNo__17CMemoryCardAccessFi
     * @address 0x215B10
     * @size 0x80
     */
    int CheckFileNo(int file_no);

    /**
     * Writes the save image to the save file with the given number and the
     * configuration to the configuration file.
     *
     * @mangled SaveToMc__17CMemoryCardAccessFi
     * @address 0x215B90
     * @size 0x6B0
     */
    int SaveToMc(int file_no);

    /**
     * Reads the save file with the given number into the save data.
     *
     * @mangled LoadFromMc__17CMemoryCardAccessFi
     * @address 0x216240
     * @size 0x410
     */
    int LoadFromMc(int file_no);

    /**
     * Formats the card in the current port.
     *
     * @mangled FormatForMc__17CMemoryCardAccessFv
     * @address 0x216650
     * @size 0x1D0
     */
    int FormatForMc();

    /**
     * Deletes the save file with the given number.
     *
     * @mangled DeleteFile__17CMemoryCardAccessFi
     * @address 0x216820
     * @size 0x160
     */
    int DeleteFile(int file_no);

    /**
     * Returns the message of the operation that the class is running, counted
     * from the given message number.
     *
     * @mangled GetMsgNo__17CMemoryCardAccessFi
     * @address 0x216980
     * @size 0xC8
     */
    int GetMsgNo(int msg_no);

    /**
     * Records the kind of the given error and the operation, file and step that
     * it stopped.
     *
     * @mangled McError__17CMemoryCardAccessFi
     * @address 0x216A50
     * @size 0x1A0
     */
    int McError(int error);

    /**
     * Waits until the memory card library has no command left to finish.
     *
     * @mangled DmySync__17CMemoryCardAccessFv
     * @address 0x216BF0
     * @size 0x50
     */
    void DmySync();

    /**
     * Unformats the card in the current port.
     *
     * @mangled McUnFormatForDebug__17CMemoryCardAccessFv
     * @address 0x216C40
     * @size 0x110
     */
    int McUnFormatForDebug();

public:
    s32 port;               /**< Port that every command of the class names. */
    s32 file_no;            /**< Save file that the current operation works on. */
    s32 error_code;         /**< Kind of error that stopped the last operation, zero while none did. */
    s32 error_func_no;      /**< Operation that the class was running when the error came. */
    s32 error_file_no;      /**< Save file that the class was working on when the error came. */
    s32 error_step;         /**< Step that the operation had reached when the error came. */
    s32 retry_count;        /**< Failed polls of the current read or delete, which stop at 101 and 121. */
    char version[0x20];     /**< Version string that every save file carries after its data. */
    char dir_name[0x20];    /**< Name of the save directory on the card. */
    char file_name[0x20];   /**< Name that every save file of the game starts with. */
    char current_dir[0x40]; /**< Directory that sceMcChdir writes back. */
    s32 func_no;            /**< Operation that the class is running. */
    u8 unk_C0[4];
    s32 step;               /**< Step that the current operation has reached. */
    s32 fd;                 /**< File that the last sceMcOpen returned, -1 until one does. */
    u8 (*dir_table)[64];    /**< Table that GetDir fills with the entries of the save directory. */
    CSaveData *save_buffer; /**< Save data at the start of the save image. */
    char *check_sum;        /**< Checksum bytes of the save image, one for every 64 bytes of the save data. */
    char *unk_D8;
    char *read_buffer; /**< Area behind the save image that a read fills. */
    s32 unk_E0;
    s32 transferred;                           /**< Bytes that the current read or write has moved. */
    s32 transfer_size;                         /**< Bytes that the current read or write is to move. */
    sceMcIconSys icon_sys;                     /**< icon.sys image that MakeDir writes into the save directory. */
    MC_ICON_DATA icon;                         /**< Icon files that the save directory is to carry. */
    MC_CARD_INFO card[MC_CARD_MAX];            /**< What the class found out about the card in each port. */
    SAVEDATA_INFO file_info[MC_SAVE_FILE_MAX]; /**< Save files of the card, as the menus show them. */
    u8 unk_7BC[4];
};

STATIC_ASSERT(sizeof(CMemoryCardAccess) == 0x7C0);
