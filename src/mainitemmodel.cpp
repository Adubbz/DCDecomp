#include "mainitemmodel.hpp"

#ifdef NON_MATCHING
int CMainItemModel::GetFreeCashNo(void) {
    for (int i = 0; i < 6; i++) {
        if (cash[i] == NULL) {
            return i;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", GetFreeCashNo__14CMainItemModelFv);
#endif
#ifdef NON_MATCHING
int CMainItemModel::GetFreeModelNo(void) {
    for (int i = 0; i < 16; i++) {
        if (model[i] == -1) {
            return i;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", GetFreeModelNo__14CMainItemModelFv);
#endif
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetCashModel__14CMainItemModelFiPUiPUii);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", DeleteModel__14CMainItemModelFi);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetHandModel__14CMainItemModelFi);
#ifdef NON_MATCHING
void CMainItemModel::AllReleasItem(void) {
    for (int i = 0; i < 16; i++) {
        if (model[i] == 1) {
            DeleteModel(i);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", AllReleasItem__14CMainItemModelFv);
#endif
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetThrowModel__14CMainItemModelFiPfPf);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Draw__14CMainItemModelFv);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @796__2);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @880__3);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @892__4);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Step__14CMainItemModelFv);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Initialize__14CMainItemModelFv);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", CheckStatusType__15CActiveItemPackFv);
