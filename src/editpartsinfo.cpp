#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "editpartsinfo.hpp"

char EditPartsInfo[0x1628];

INCLUDE_ASM("asm/nonmatchings/editpartsinfo", GetPartsInfo__14CEditPartsInfoFi);
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
