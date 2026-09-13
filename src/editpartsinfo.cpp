#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "editpartsinfo.hpp"

/**
 * Reports whether an editable part is placed and still has work available.
 *
 * @mangled CheckPartsInfo__FP14EDITPARTS_INFO
 * @address 0x199F90
 * @size 0x3C
 */
int CheckPartsInfo(EDITPARTS_INFO *info);

CEditPartsInfo EditPartsInfo;

EDITPARTS_INFO *CEditPartsInfo::GetPartsInfo(int index) {
    if ((index < 0) || (index >= 0x18)) {
        return NULL;
    }
    return &parts[index];
}
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", CheckComplete__14CEditPartsInfoFi);

void CEditPartsInfo::SetCompEvent(int index, int completed) {
    EDITPARTS_INFO *info = GetPartsInfo(index);
    if (info != NULL) {
        if (completed != 0) {
            info->completion_flags |= 1;
            return;
        }
        info->completion_flags &= ~1;
    }
}

int CEditPartsInfo::GetCompEvent(int index) {
    EDITPARTS_INFO *info = GetPartsInfo(index);
    if (info == NULL) {
        return 0;
    }
    return (info->completion_flags & 1) != 0;
}

INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetRequest__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetNextPartsNum__14CEditPartsInfoFi);

int CEditPartsInfo::GetNextParts(int index) {
    for (;;) {
        index++;
        EDITPARTS_INFO *info = GetPartsInfo(index);
        if (info != NULL) {
            if (CheckPartsInfo(info) != 0) {
                return index;
            }
        } else {
            return -1;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Clear__14CEditPartsInfoFv);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Save__14CEditPartsInfoFiP9CSaveData);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Load__14CEditPartsInfoFiP9CSaveDatai);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFi);
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER);
