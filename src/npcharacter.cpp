#include "npcharacter.hpp"

INCLUDE_ASM("asm/nonmatchings/npcharacter", Step__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", ShadowStep__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", PlaySeq__12CNPCharacterFv);

void CNPCharacter::ClearSeq() {
    read_index = 0;
    write_index = 0;
    sequence_enabled = 1;
    for (int index = 0; index < 8; index++) {
        sequences[index].operation = NP_SEQUENCE_UNUSED;
    }
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", SetSeq__12CNPCharacterFPff);
INCLUDE_ASM("asm/nonmatchings/npcharacter", SetWait__12CNPCharacterFi);

int CNPCharacter::CheckSeq() {
    return read_index != write_index;
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", GetNextSeq__12CNPCharacterFv);

NP_SEQUENCE *CNPCharacter::GetNowSeq() {
    return &sequences[read_index];
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", NextSeq__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", Draw__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", DrawShadow__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", CheckDraw__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", PickUpPoly__12CNPCharacterFPfP6CCPoly);
INCLUDE_ASM("asm/nonmatchings/npcharacter", PickUpPoly__10CCharacterFPfP6CCPoly);
INCLUDE_ASM("asm/nonmatchings/npcharacter", Initialize__12CNPCharacterFv);
INCLUDE_ASM("asm/nonmatchings/npcharacter", __ct__12CNPCharacterFv);
