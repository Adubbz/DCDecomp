#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 15

#include "battle_globals.hpp"

#include <cstdio>
#include <cstdlib>

#include "runscript.hpp"

INCLUDE_RODATA("asm/nonmatchings/battle_globals", @348__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @481__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @663__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @781__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @782__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @783__5);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @784__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @785);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @786);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @787__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @788__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @789__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1349__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1350__5);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1505);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1511__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1558__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1559__3);

INCLUDE_ASM("asm/nonmatchings/battle_globals", GlobalNameInit__Fv);
INCLUDE_ASM("asm/nonmatchings/battle_globals", InitNameRegist__FiiP1);
INCLUDE_ASM("asm/nonmatchings/battle_globals", ExitNameEnterFunc__Fv);
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetNameTextureInfo__FPP8CTextureiRiRi);
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawCharaName__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawNameRegiWaku__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawCharaNameUp__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawNameTemplete__Fiiii);
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameCompare__FPsPs);
INCLUDE_ASM("asm/nonmatchings/battle_globals", CheckName__Fv);
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameEnterDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameEnterKey__Fv);
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameDefaultSet__Fi);
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetFontLRTumeW__Fiii);
INCLUDE_ASM("asm/nonmatchings/battle_globals", CharaSelectNameDraw2__FiiPsPP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA);
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetMsgLengthCharaName__Fi);
INCLUDE_ASM("asm/nonmatchings/battle_globals", InitOpeningBook__FP1Pi);
INCLUDE_ASM("asm/nonmatchings/battle_globals", OpeningBookKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1573);
INCLUDE_ASM("asm/nonmatchings/battle_globals", OpeningBookDraw__Fv);

void runerror(const char *message) {
    fprintf(stderr, "RUNTIME ERROR: %s\n", message);
    exit__2(-1);
}

void stkoverflow() {
    runerror("stack overflow");
}

int chk_int(RS_STACKDATA data, funcdata *function) {
    if (data.type == RS_INT) {
        return data.i;
    }

    fprintf(stderr, "RUNTIME ERROR: %s: operand is not integer\n", function->name);
    exit__2(-1);
    return 0;
}

int is_true(RS_STACKDATA data) {
    return !(data.type == RS_INT && data.i == 0);
}

void divby0error() {
    runerror("Divide by 0");
}

void modby0error() {
    runerror("Modulo by 0");
}

void print(RS_STACKDATA *data, int count) {
    for (int index = 0; index < count; index++, data++) {
        if (data->type == RS_INT) {
            printf("%d", data->i);
        } else if (data->type == RS_STR) {
            printf("%s", data->s);
        } else if (data->type == RS_FLOAT) {
            printf("%f", data->f);
        }
        fflush(stdout);
    }
}
