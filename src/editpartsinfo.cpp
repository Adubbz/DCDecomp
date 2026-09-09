#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "editpartsinfo.hpp"

CEditPartsInfo EditPartsInfo;

EDITPARTS_INFO *CEditPartsInfo::GetPartsInfo(int index) {
    if ((index < 0) || (index >= 0x18)) {
        return NULL;
    }
    return &parts[index];
}
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", CheckComplete__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", SetCompEvent__14CEditPartsInfoFii);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetCompEvent__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetRequest__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetNextPartsNum__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetNextParts__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Clear__14CEditPartsInfoFv);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Save__14CEditPartsInfoFiP9CSaveData);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Load__14CEditPartsInfoFiP9CSaveDatai);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER);
