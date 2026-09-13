#include "memorycardaccess.hpp"

#include <cstring>

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Initialize__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", InitForMC__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SetBuff__17CMemoryCardAccessFPc);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SetIconData__17CMemoryCardAccessFP12MC_ICON_DATA);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeMcIconSysInfo__17CMemoryCardAccessFv);

void CMemoryCardAccess::SetFuncNo(int no) {
    func_no = no;
    step = 0;

    if (no == 1) {
        unk_0E0 = 0x3D;
    }
    sceMcSync(1, 0, 0);
}

int CMemoryCardAccess::GetFuncNo(void) {
    return func_no;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Step__17CMemoryCardAccessFv);

void CMemoryCardAccess::SetVersion(char *version) {
    strcpy(this->version, version);
}

char *CMemoryCardAccess::GetVersion(void) {
    return version;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SearchMcType__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetDir__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", LoadSysConfig__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SaveSysConfig__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Write__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", Convert__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeDir__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetSaveFileInfoFromMc__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetAllSaveFileInfo__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", CheckFileNo__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SaveToMc__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", LoadFromMc__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", FormatForMc__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", DeleteFile__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetMsgNo__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", McError__17CMemoryCardAccessFi);

void CMemoryCardAccess::DmySync(void) {
    int cmd;
    int result;
    int running;

    running = 0;
    while (running == 0) {
        running = sceMcSync(0, &cmd, &result);
    }
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", McUnFormatForDebug__17CMemoryCardAccessFv);
