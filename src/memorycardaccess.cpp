#include "memorycardaccess.hpp"

#include <cstdio>
#include <cstring>
#include <libmc.h>

#include "savedata.hpp"

/** Returns the language that the title screen selected. */
int GetMenuLangFlag();

/** Empties the table that holds the entries of the save directory. */
void InitSaveFileInfoTbl();

/** Returns one when the table holds an entry with the given name. */
int GetOpenAttribute(char *name);

/** Holds the entries of the save directory that sceMcGetDir last wrote. */
extern u8 SaveFileInfo[99][64];

/** Holds the configuration in the format that the memory card carries. */
extern SV_CONFIG_SYS sys_config;

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Initialize__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @372__3);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @373__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @374__3);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @375__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @376__4);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", InitForMC__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @384__3);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @385__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @386__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @387__2);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SetBuff__17CMemoryCardAccessFPc);

void CMemoryCardAccess::SetIconData(MC_ICON_DATA *icon) {
    memcpy(&this->icon.view, &icon->view, sizeof(MC_ICON_FILE));
    memcpy(&this->icon.copy, &icon->copy, sizeof(MC_ICON_FILE));
    memcpy(&this->icon.del, &icon->del, sizeof(MC_ICON_FILE));
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeMcIconSysInfo__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @404);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @405__2);

void CMemoryCardAccess::SetFuncNo(int func_no) {
    this->func_no = func_no;
    this->step = 0;
    if (func_no == MC_OPERATION_IDLE) {
        this->unk_E0 = 0x3D;
    }
    sceMcSync(MC_NOWAIT, NULL, NULL);
}

int CMemoryCardAccess::GetFuncNo() {
    return this->func_no;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Step__17CMemoryCardAccessFv);

void CMemoryCardAccess::SetVersion(char *version) {
    strcpy(this->version, version);
}

char *CMemoryCardAccess::GetVersion() {
    return this->version;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SearchMcType__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetDir__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @531__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @532__2);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", LoadSysConfig__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SaveSysConfig__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @641__3);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Write__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @643__3);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Convert__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @668__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @669__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @670__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @671__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @672__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @673__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @674__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @675__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @814);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @815__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @816);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeDir__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetSaveFileInfoFromMc__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @892__5);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @893__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @894__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1031);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1032__2);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetAllSaveFileInfo__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", CheckFileNo__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SaveToMc__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", LoadFromMc__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1090__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1091);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", FormatForMc__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1122);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1123);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", DeleteFile__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1141__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1142__2);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetMsgNo__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", McError__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1188__3);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1189);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1190);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1191);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1192__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1193__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1194__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1195__3);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1196);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", DmySync__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", McUnFormatForDebug__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1230);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @594__2);
