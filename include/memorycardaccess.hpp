#pragma once

#include "common.h"

struct MC_ICON_DATA;

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
    void Initialize(void);

    /**
     * Starts the memory card library, resets the class, and returns one when
     * the library fails to start or one of its modules is too old.
     *
     * @mangled InitForMC__17CMemoryCardAccessFv
     * @address 0x213750
     * @size 0x100
     */
    int InitForMC(void);

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
    void MakeMcIconSysInfo(void);

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
    int GetFuncNo(void);

    /**
     * Runs one step of the current operation, returns to the idle operation
     * once it finished, and hands anything else to McError.
     *
     * @mangled Step__17CMemoryCardAccessFv
     * @address 0x213BF0
     * @size 0x44
     */
    int Step(void);

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
    char *GetVersion(void);

    /**
     * Reads the type, the free space and the format flag of the card in the
     * current port, and tells whether its format changed.
     *
     * @mangled SearchMcType__17CMemoryCardAccessFv
     * @address 0x213DF0
     * @size 0x2A0
     */
    int SearchMcType(void);

    /**
     * Enters the save directory of the card and reads its entries into the
     * directory table.
     *
     * @mangled GetDir__17CMemoryCardAccessFv
     * @address 0x214090
     * @size 0x2A0
     */
    int GetDir(void);

    /**
     * Reads the configuration file of the save directory and applies it to
     * the save data.
     *
     * @mangled LoadSysConfig__17CMemoryCardAccessFv
     * @address 0x214330
     * @size 0x2A0
     */
    int LoadSysConfig(void);

    /**
     * Writes the configuration of the save data to the configuration file of
     * the save directory.
     *
     * @mangled SaveSysConfig__17CMemoryCardAccessFv
     * @address 0x2145D0
     * @size 0x310
     */
    int SaveSysConfig(void);

    /**
     * Writes the save image to a test file in the root directory of the card.
     *
     * @mangled Write__17CMemoryCardAccessFv
     * @address 0x2148E0
     * @size 0x100
     */
    int Write(void);

    /**
     * Rebuilds the save directory and writes every save file of the card
     * again in the current format.
     *
     * @mangled Convert__17CMemoryCardAccessFv
     * @address 0x2149E0
     * @size 0x340
     */
    int Convert(void);

    /**
     * Creates the save directory and writes the icon files and icon.sys into
     * it.
     *
     * @mangled MakeDir__17CMemoryCardAccessFv
     * @address 0x214D20
     * @size 0x5C
     */
    int MakeDir(void);

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
    int GetAllSaveFileInfo(void);

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
    int FormatForMc(void);

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
    void DmySync(void);

    /**
     * Unformats the card in the current port.
     *
     * @mangled McUnFormatForDebug__17CMemoryCardAccessFv
     * @address 0x216C40
     * @size 0x110
     */
    int McUnFormatForDebug(void);
};
