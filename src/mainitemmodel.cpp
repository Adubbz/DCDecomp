#include "mainitemmodel.hpp"

int CMainItemModel::GetFreeCashNo(void) {
    for (int i = 0; i < 6; i++) {
        if (cash[i] == NULL) {
            return i;
        }
    }
    return -1;
}
int CMainItemModel::GetFreeModelNo(void) {
    for (int i = 0; i < 16; i++) {
        if (model[i] == -1) {
            return i;
        }
    }
    return -1;
}
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetCashModel__14CMainItemModelFiPUiPUii);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", DeleteModel__14CMainItemModelFi);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetHandModel__14CMainItemModelFi);
void CMainItemModel::AllReleasItem(void) {
    for (int i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                DeleteModel(i);
                break;
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", SetThrowModel__14CMainItemModelFiPfPf);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Draw__14CMainItemModelFv);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @796__2);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @880__3);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @892__4);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Step__14CMainItemModelFv);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Initialize__14CMainItemModelFv);
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", CheckStatusType__15CActiveItemPackFv);
