#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 15

#include "battle_globals.hpp"

#include <cstdio>
#include <cstdlib>

#include "runscript.hpp"
#include "savedata.hpp"

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
#ifdef NON_MATCHING
void GlobalNameInit(void) {
    for (int chara_no = 0; chara_no < 6; chara_no++) {
        NameDefaultSet(chara_no);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", GlobalNameInit__Fv);
#endif
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
#ifdef NON_MATCHING
int NameCompare(short *first, short *second) {
    int same = 0;

    for (int i = 0; i < 10; i++) {
        if (first[i] == second[i]) {
            same++;
        }
    }
    // Every character has to agree before the names count as one.
    if (same >= 10) {
        return 0;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", NameCompare__FPsPs);
#endif
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
#ifdef NON_MATCHING
int GetMsgLengthCharaName(int chara_no) {
    if (chara_no < 0 || chara_no >= 6) {
        return 0;
    }

    /* The name is ten sixteen-bit characters; savedata.hpp still gives the
       getter a `char *` return, which the halfword walk here contradicts. */
    short *name = (short *) SaveData->GetCharaName(chara_no);
    int length = 0;

    while (*name != 0 && length < 10) {
        name++;
        length++;
    }
    return length;
}
#else
INCLUDE_ASM("asm/nonmatchings/battle_globals", GetMsgLengthCharaName__Fi);
#endif
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
