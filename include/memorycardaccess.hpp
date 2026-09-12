#pragma once

#include "common.h"

class CSaveData;

/**
 * Names one of the icon files that the memory card browser shows for a save.
 */
struct MC_ICON_FILE {
    char *name; /**< Name of the icon file inside the save directory. */
    u8 unk_04[8];
};

STATIC_ASSERT(sizeof(MC_ICON_FILE) == 0xC);

/**
 * Holds the three icon files that MakeMcIconSysInfo writes into icon.sys.
 */
struct MC_ICON_DATA {
    MC_ICON_FILE view; /**< Icon that the browser shows for the save. */
    MC_ICON_FILE copy; /**< Icon that the browser shows while it copies the save. */
    MC_ICON_FILE del;  /**< Icon that the browser shows while it deletes the save. */
};

STATIC_ASSERT(sizeof(MC_ICON_DATA) == 0x24);

/**
 * Holds what SearchMcType and GetDir found out about the card in one port.
 */
struct MC_CARD_INFO {
    s32 present;   /**< One once sceMcSync reported a command on the card. */
    s32 type;      /**< Card type that sceMcGetInfo writes. */
    s32 formatted; /**< Format flag that sceMcGetInfo writes. */
    s32 unk_0C;
    s32 unk_10;
    u8 unk_14[4];
    s32 free_size; /**< Free space that sceMcGetInfo writes. */
    s32 unk_1C;
    s32 result; /**< Result that sceMcSync reported for the last command on the card. */
};

STATIC_ASSERT(sizeof(MC_CARD_INFO) == 0x24);

/**
 * Describes one save file of the card to the save and load menus.
 */
struct MC_SAVE_FILE_INFO {
    s32 state;       /**< Zero while the file is missing, one once it is read, three once it is damaged. */
    s32 file_no;     /**< Number that the file carries in its name, counted from one. */
    char name[0x20]; /**< Name of the character that the save holds. */
    float play_time; /**< Play time of the save. */
    s8 dungeon_no;   /**< Sixth byte of the dungeon status of the save. */
    u8 unk_2D[3];
    s32 unk_30;
    s32 quest_total; /**< Quests that the save finished in the seven dungeons, held below 10000. */
};

STATIC_ASSERT(sizeof(MC_SAVE_FILE_INFO) == 0x38);

/**
 * Runs every memory card operation of the game as a step machine: SetFuncNo
 * picks the operation, Step runs one step of it per frame, and GetFuncNo and
 * GetMsgNo tell the menus what it is doing.
 */
class CMemoryCardAccess {
public:
    /**
     * Fills the class with its starting values and names the save directory
     * after the language that the title screen selected.
     *
     * @mangled Initialize__17CMemoryCardAccessFv
     * @address 0x2135D0
     * @size 0x180
     */
    void Initialize();

    /**
     * Starts the memory card library, resets the class, and returns one when
     * the library fails to start or one of its modules is too old.
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
     * Copies the three icon files that the save directory is to carry.
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
     * Runs one step of the current operation, returns to the idle operation
     * once it finished, and hands anything else to McError.
     *
     * @mangled Step__17CMemoryCardAccessFv
     * @address 0x213BF0
     * @size 0x44
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
     * Reads the type, the free space and the format flag of the card in the
     * current port, and tells whether its format changed.
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
     * Writes the save image to a test file in the root directory of the card.
     *
     * @mangled Write__17CMemoryCardAccessFv
     * @address 0x2148E0
     * @size 0x100
     */
    int Write();

    /**
     * Rebuilds the save directory and writes every save file of the card
     * again in the current format.
     *
     * @mangled Convert__17CMemoryCardAccessFv
     * @address 0x2149E0
     * @size 0x340
     */
    int Convert();

    /**
     * Creates the save directory and writes the icon files and icon.sys into
     * it.
     *
     * @mangled MakeDir__17CMemoryCardAccessFv
     * @address 0x214D20
     * @size 0x5C
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
     * Reads every save file of the card in turn into the save file table.
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
     * Writes the save image to the save file with the given number.
     *
     * @mangled SaveToMc__17CMemoryCardAccessFi
     * @address 0x215B90
     * @size 0x80
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
     * Returns the message that the given error carries for the operation that
     * the class is running.
     *
     * @mangled GetMsgNo__17CMemoryCardAccessFi
     * @address 0x216980
     * @size 0x48
     */
    int GetMsgNo(int error);

    /**
     * Records the operation, the file and the step that the given error
     * stopped, and prints it.
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
    s32 error_code;         /**< Error that stopped the last operation, zero while none did. */
    s32 error_func_no;      /**< Operation that the class was running when the error came. */
    s32 error_file_no;      /**< Save file that the class was working on when the error came. */
    s32 error_step;         /**< Step that the operation had reached when the error came. */
    s32 read_wait;          /**< Counts the steps that waited for a read, which gives up at 101. */
    char version[0x20];     /**< Version string that every save file carries after its data. */
    char dir_name[0x20];    /**< Name of the save directory on the card. */
    char file_name[0x20];   /**< Name that every save file of the game starts with. */
    char current_dir[0x40]; /**< Directory that sceMcChdir writes back. */
    s32 func_no;            /**< Operation that the class is running. */
    u8 unk_C0[4];
    s32 step;               /**< Step that the current operation has reached. */
    s32 fd;                 /**< File that sceMcOpen returned, or -1 while none is open. */
    u8 (*dir_table)[64];    /**< Entries of the save directory that sceMcGetDir wrote. */
    CSaveData *save_buffer; /**< Save data at the start of the save image. */
    char *check_sum;        /**< One checksum byte of the save image for every 64 bytes of it. */
    char *unk_D8;
    char *read_buffer; /**< Area behind the save image that a read fills. */
    s32 unk_E0;
    s32 transferred;                 /**< Bytes that the current read or write has moved. */
    s32 transfer_size;               /**< Bytes that the current read or write is to move. */
    u8 icon_sys[0x3C4];              /**< icon.sys image that MakeDir writes into the save directory. */
    MC_ICON_DATA icon;               /**< Icon files that the save directory is to carry. */
    MC_CARD_INFO card[2];            /**< What the class found out about the card in each port. */
    MC_SAVE_FILE_INFO file_info[12]; /**< Save files of the card, as the menus show them. */
    u8 unk_7BC[4];
};

STATIC_ASSERT(sizeof(CMemoryCardAccess) == 0x7C0);
