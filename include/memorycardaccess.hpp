#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MC_ICON_DATA;


class CMemoryCardAccess {
public:
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
     * @mangled SetFuncNo__17CMemoryCardAccessFi
     * @address 0x213B90
     * @size 0x50
     * @unknownret
     */
    void SetFuncNo(int);

    /**
     * @mangled GetFuncNo__17CMemoryCardAccessFv
     * @address 0x213BE0
     * @size 0x10
     * @unknownret
     */
    void GetFuncNo(void);

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
     * @unknownret
     */
    void SetVersion(char *);

    /**
     * @mangled GetVersion__17CMemoryCardAccessFv
     * @address 0x213DE0
     * @size 0x10
     * @unknownret
     */
    void GetVersion(void);

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
     * @mangled DmySync__17CMemoryCardAccessFv
     * @address 0x216BF0
     * @size 0x50
     * @unknownret
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
