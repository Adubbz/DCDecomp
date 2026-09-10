#pragma once

class CCharacter;

void EBInitialize();
void EBInit(float speed_mult);
/** Starts the enemy-battle introduction sequence. */
void EBInitIntro();
/** Ends the enemy-battle sequence. */
void EBExit();
/** Selects the enemy-battle diagnostic display. */
void EBDebug(int mode);
/** Advances the enemy-battle introduction and returns its state. */
int EBIntroLoop();
/** Advances the active enemy-battle sequence and returns its state. */
int EBLoop();
void EBFinishSound(int fade_bgm, int play_fanfare);

/**
 * Assigns the enemy-battle motion sequence for a character.
 *
 * @mangled EBSetMotion__FP10CCharacterPi
 * @address 0x1682B0
 * @size 0x168
 */
void EBSetMotion(CCharacter *character, int *motions);

/**
 * Adds a timed key command to the enemy-battle sequence.
 *
 * @mangled EBSetKey__Ffii
 * @address 0x168430
 * @size 0x12C
 */
void EBSetKey(float time, int key, int mode);

/**
 * Selects the editor input modes that currently own controller input.
 *
 * @mangled EdSetKeyMode__Fi
 * @address 0x1697F0
 * @size 0x10
 */
int EdSetKeyMode(int mode);

/**
 * Returns the right stick's horizontal axis when the requested mode is active.
 * @mangled EdGetRXf__Fi @address 0x169800 @size 0x44
 */
float EdGetRXf(int mode);

/**
 * Returns the right stick's vertical axis when the requested mode is active.
 * @mangled EdGetRYf__Fi @address 0x169850 @size 0x44
 */
float EdGetRYf(int mode);

/**
 * Returns the left stick's horizontal axis when the requested mode is active.
 * @mangled EdGetLXf__Fi @address 0x1698A0 @size 0x44
 */
float EdGetLXf(int mode);

/**
 * Returns the left stick's vertical axis when the requested mode is active.
 * @mangled EdGetLYf__Fi @address 0x1698F0 @size 0x44
 */
float EdGetLYf(int mode);

/**
 * Tests held editor buttons when the requested mode is active.
 * @mangled EdPadOn__Fii @address 0x169940 @size 0x50
 */
int EdPadOn(int keys, int mode);

/**
 * Tests newly pressed editor buttons when the requested mode is active.
 * @mangled EdPadDown__Fii @address 0x169990 @size 0x50
 */
int EdPadDown(int keys, int mode);
