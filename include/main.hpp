#pragma once

/**
 * @file
 * Declarations of what src/main.cpp defines for the rest of the game.
 */

#include "common.h"

#include <libvu0.h>

/** Which entry the main menu has the cursor on. */
extern s32 main_select_menu_no;

/** The system messages every message window shares. */
extern short *SystemMes;

/**
 * Map the game is on or about to load.
 */
extern int MapNo;

/** Initial ambient-light colour used by the renderer. */
extern sceVu0FVECTOR ambientlight;

/** Initial parallel-light direction matrix used by the renderer. */
extern sceVu0FMATRIX light;

/** Initial parallel-light colour matrix used by the renderer. */
extern sceVu0FMATRIX lightcolor;

/**
 * Empty string the game-mode table names modes without a file by.
 */
extern char gamemode_empty_string[];

/**
 * Default constructor of CCharacter, written out by hand for the arrays main builds.
 *
 * @mangled __ct__10CCharacterFv
 * @address 0x143530
 * @size 0xd4
 */
extern "C" void *__ct__10CCharacterFv(void *self);

/**
 * Default constructor of CTextureAnime, written out by hand for the arrays main builds.
 *
 * @mangled __ct__13CTextureAnimeFv
 * @address 0x143620
 * @size 0x28
 */
extern "C" void *__ct__13CTextureAnimeFv(void *self);

/**
 * Default constructor of CObject, written out by hand for the arrays main builds.
 *
 * @mangled __ct__7CObjectFv
 * @address 0x143650
 * @size 0x28
 */
extern "C" void *__ct__7CObjectFv(void *self);

/**
 * Default constructor of MotionParam under the name main's array constructors call it by.
 *
 * @mangled __ct__11MotionParamFv
 * @address 0x143610
 * @size 0xc
 */
extern "C" void *GeneratedMotionParamCtor(void *self);
