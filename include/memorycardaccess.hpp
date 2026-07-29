#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MC_ICON_DATA;


class CMemoryCardAccess {
public:
    /* ?ret */ void Initialize(void); // @ 0x2135D0 (0x180 bytes) -- mangled: Initialize__17CMemoryCardAccessFv
    /* ?ret */ void InitForMC(void); // @ 0x213750 (0x100 bytes) -- mangled: InitForMC__17CMemoryCardAccessFv
    /* ?ret */ void SetBuff(char *); // @ 0x213850 (0x140 bytes) -- mangled: SetBuff__17CMemoryCardAccessFPc
    /* ?ret */ void SetIconData(MC_ICON_DATA *); // @ 0x213990 (0x70 bytes) -- mangled: SetIconData__17CMemoryCardAccessFP12MC_ICON_DATA
    /* ?ret */ void MakeMcIconSysInfo(void); // @ 0x213A00 (0x190 bytes) -- mangled: MakeMcIconSysInfo__17CMemoryCardAccessFv
    /* ?ret */ void SetFuncNo(int); // @ 0x213B90 (0x50 bytes) -- mangled: SetFuncNo__17CMemoryCardAccessFi
    /* ?ret */ void GetFuncNo(void); // @ 0x213BE0 (0x10 bytes) -- mangled: GetFuncNo__17CMemoryCardAccessFv
    /* ?ret */ void Step(void); // @ 0x213BF0 (0x44 bytes) -- mangled: Step__17CMemoryCardAccessFv
    /* ?ret */ void SetVersion(char *); // @ 0x213DB0 (0x30 bytes) -- mangled: SetVersion__17CMemoryCardAccessFPc
    /* ?ret */ void GetVersion(void); // @ 0x213DE0 (0x10 bytes) -- mangled: GetVersion__17CMemoryCardAccessFv
    /* ?ret */ void SearchMcType(void); // @ 0x213DF0 (0x2A0 bytes) -- mangled: SearchMcType__17CMemoryCardAccessFv
    /* ?ret */ void GetDir(void); // @ 0x214090 (0x2A0 bytes) -- mangled: GetDir__17CMemoryCardAccessFv
    /* ?ret */ void LoadSysConfig(void); // @ 0x214330 (0x2A0 bytes) -- mangled: LoadSysConfig__17CMemoryCardAccessFv
    /* ?ret */ void SaveSysConfig(void); // @ 0x2145D0 (0x310 bytes) -- mangled: SaveSysConfig__17CMemoryCardAccessFv
    /* ?ret */ void Write(void); // @ 0x2148E0 (0x100 bytes) -- mangled: Write__17CMemoryCardAccessFv
    /* ?ret */ void Convert(void); // @ 0x2149E0 (0x340 bytes) -- mangled: Convert__17CMemoryCardAccessFv
    /* ?ret */ void MakeDir(void); // @ 0x214D20 (0x5C bytes) -- mangled: MakeDir__17CMemoryCardAccessFv
    /* ?ret */ void GetSaveFileInfoFromMc(int); // @ 0x2154A0 (0x590 bytes) -- mangled: GetSaveFileInfoFromMc__17CMemoryCardAccessFi
    /* ?ret */ void GetAllSaveFileInfo(void); // @ 0x215A30 (0xE0 bytes) -- mangled: GetAllSaveFileInfo__17CMemoryCardAccessFv
    /* ?ret */ void CheckFileNo(int); // @ 0x215B10 (0x80 bytes) -- mangled: CheckFileNo__17CMemoryCardAccessFi
    /* ?ret */ void SaveToMc(int); // @ 0x215B90 (0x80 bytes) -- mangled: SaveToMc__17CMemoryCardAccessFi
    /* ?ret */ void LoadFromMc(int); // @ 0x216240 (0x410 bytes) -- mangled: LoadFromMc__17CMemoryCardAccessFi
    /* ?ret */ void FormatForMc(void); // @ 0x216650 (0x1D0 bytes) -- mangled: FormatForMc__17CMemoryCardAccessFv
    /* ?ret */ void DeleteFile(int); // @ 0x216820 (0x160 bytes) -- mangled: DeleteFile__17CMemoryCardAccessFi
    /* ?ret */ void GetMsgNo(int); // @ 0x216980 (0x48 bytes) -- mangled: GetMsgNo__17CMemoryCardAccessFi
    /* ?ret */ void McError(int); // @ 0x216A50 (0x1A0 bytes) -- mangled: McError__17CMemoryCardAccessFi
    /* ?ret */ void DmySync(void); // @ 0x216BF0 (0x50 bytes) -- mangled: DmySync__17CMemoryCardAccessFv
    /* ?ret */ void McUnFormatForDebug(void); // @ 0x216C40 (0x110 bytes) -- mangled: McUnFormatForDebug__17CMemoryCardAccessFv
};
