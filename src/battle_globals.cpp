#include "battle_globals.hpp"
#include "runscript.hpp"

#include <cstdio>
#include <cstdlib>

INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_348__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_481__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_663__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_781__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_782__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_783__5);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_784__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_785);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_786);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_787__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_788__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_789__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1349__3);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1350__5);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1505);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1511__4);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1558__2);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1559__3);

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
INCLUDE_RODATA("asm/nonmatchings/battle_globals", LIT_1573);
INCLUDE_ASM("asm/nonmatchings/battle_globals", OpeningBookDraw__Fv);
void runerror(const char *message)
{
    fprintf(stderr, "RUNTIME ERROR: %s\n", message);
    exit__2(-1);
}

void stkoverflow()
{
    runerror("stack overflow");
}

int chk_int(RS_STACKDATA data, funcdata *function)
{
    if (data.type == RS_INT) {
        return data.i;
    }

    fprintf(stderr, "RUNTIME ERROR: %s: operand is not integer\n", function->name);
    exit__2(-1);
    return 0;
}

int is_true(RS_STACKDATA data)
{
    return !(data.type == RS_INT && data.i == 0);
}

void divby0error()
{
    runerror("Divide by 0");
}

void modby0error()
{
    runerror("Modulo by 0");
}

void print(RS_STACKDATA *data, int count)
{
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
