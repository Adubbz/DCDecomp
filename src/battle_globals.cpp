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

/**
 * Gives every party member their default name.
 *
 * @mangled GlobalNameInit__Fv
 * @address 0x238450
 * @size 0x48
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", GlobalNameInit__Fv);
/**
 * Opens the name-entry screen and reads its textures.
 *
 * @mangled InitNameRegist__FiiP1
 * @address 0x2384A0
 * @size 0x190
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", InitNameRegist__FiiP1);
/**
 * Gives the name-entry screen's textures back and closes it.
 *
 * @mangled ExitNameEnterFunc__Fv
 * @address 0x238630
 * @size 0x68
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", ExitNameEnterFunc__Fv);
/**
 * Gives the texture and cell one name character draws from.
 *
 * @mangled GetNameTextureInfo__FPP8CTextureiRiRi
 * @address 0x2386A0
 * @size 0xBC
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetNameTextureInfo__FPP8CTextureiRiRi);
/**
 * Draws a party member's name.
 *
 * @mangled DrawCharaName__Fiiiii
 * @address 0x238760
 * @size 0x118
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawCharaName__Fiiiii);
/**
 * Draws the frame around the name being entered, bobbing it with a sine.
 *
 * @mangled DrawNameRegiWaku__Fiiiii
 * @address 0x238880
 * @size 0x1F0
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawNameRegiWaku__Fiiiii);
/**
 * Draws the name being entered above the keyboard.
 *
 * @mangled DrawCharaNameUp__Fiiii
 * @address 0x238A70
 * @size 0x628
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawCharaNameUp__Fiiii);
/**
 * Draws the character keyboard the name is entered from.
 *
 * @mangled DrawNameTemplete__Fiiii
 * @address 0x2390A0
 * @size 0x930
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawNameTemplete__Fiiii);
/**
 * Reports whether two names are the same.
 *
 * @mangled NameCompare__FPsPs
 * @address 0x2399D0
 * @size 0x6C
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameCompare__FPsPs);
/**
 * Reports whether the entered name may be used.
 *
 * @mangled CheckName__Fv
 * @address 0x239A40
 * @size 0x160
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", CheckName__Fv);
/**
 * Draws the name-entry screen.
 *
 * @mangled NameEnterDraw__Fv
 * @address 0x239BA0
 * @size 0xC9C
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameEnterDraw__Fv);
/**
 * Moves the cursor across the keyboard and enters the character it settles on.
 *
 * @mangled NameEnterKey__Fv
 * @address 0x23A840
 * @size 0x1F28
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameEnterKey__Fv);
/**
 * Gives one party member their default name for the chosen language.
 *
 * @mangled NameDefaultSet__Fi
 * @address 0x23C770
 * @size 0x110
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameDefaultSet__Fi);
/**
 * Gives the kerning between two name characters.
 *
 * @mangled GetFontLRTumeW__Fiii
 * @address 0x23C880
 * @size 0x78
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetFontLRTumeW__Fiii);
/**
 * Draws a party member's name on the character-select page.
 *
 * @mangled CharaSelectNameDraw2__FiiPsPP8CTexturei
 * @address 0x23C900
 * @size 0x250
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", CharaSelectNameDraw2__FiiPsPP8CTexturei);
/**
 * Draws a party member's name on the save board, in a gradient.
 *
 * @mangled DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
 * @address 0x23CB50
 * @size 0x284
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA);
/**
 * Gives how wide a party member's name draws.
 *
 * @mangled GetMsgLengthCharaName__Fi
 * @address 0x23CDE0
 * @size 0x78
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetMsgLengthCharaName__Fi);
/**
 * Opens the storybook that begins the game.
 *
 * @mangled InitOpeningBook__FP1Pi
 * @address 0x23CE60
 * @size 0xB0
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", InitOpeningBook__FP1Pi);
/**
 * Turns the storybook's pages with the pad.
 *
 * @mangled OpeningBookKey__Fv
 * @address 0x23CF10
 * @size 0x664
 */
INCLUDE_ASM("asm/nonmatchings/battle_globals", OpeningBookKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/battle_globals", @1573);
/**
 * Draws the storybook page by page.
 *
 * @mangled OpeningBookDraw__Fv
 * @address 0x23D580
 * @size 0x134
 */
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
