#pragma once

#include "common.h"

// Forward declarations for the types these declarations name.
class CTexture;
struct TM2_head;

/**
 * @file
 * Declares the calls that drive the loading screen while the disc is read.
 */

/**
 * Reports whether the loading-screen operation has ended.
 *
 * @mangled check_now_loading__Fv
 * @address 0x153F40
 * @size 0xC
 */
int check_now_loading(void);

/**
 * Clears the flag set after the loading screen completes a field.
 *
 * @mangled clear_now_loading_vsync_end__Fv
 * @address 0x153F50
 * @size 0xC
 */
void clear_now_loading_vsync_end(void);

/**
 * Reports whether the loading screen has completed a field.
 *
 * @mangled check_now_loading_vsync_end__Fv
 * @address 0x153F60
 * @size 0xC
 */
int check_now_loading_vsync_end(void);

/**
 * Waits for the loading screen to reach the end of a field.
 *
 * @mangled wait_now_loading_vsync__Fv
 * @address 0x153F70
 * @size 0x3C
 */
void wait_now_loading_vsync(void);

/**
 * Hides the active loading-screen overlay.
 *
 * @mangled now_loading_off__Fv
 * @address 0x153FB0
 * @size 0x10
 */
void now_loading_off(void);

/**
 * Loads the loading screen for one map, arms its vertical-sync callback, and
 * starts its fade.
 *
 * @mangled init_now_loading__Fi
 * @address 0x153FC0
 * @size 0x354
 */
void init_now_loading(int map_title_no);

/**
 * Draws the loading screen and advances its fade once per vertical sync.
 *
 * @mangled VSyncCallBack_Load__Fi
 * @address 0x154320
 * @size 0x450
 */
int VSyncCallBack_Load(int field);

/**
 * Uploads a named image and its palette to video memory and records where
 * they went.
 *
 * @mangled LoadTexture__FPcPUcP8CTextureii
 * @address 0x154770
 * @size 0x1D4
 */
void LoadTexture(char *name, unsigned char *archive, CTexture *texture, int image_address,
                 int palette_address);

/**
 * Uploads one already-located image and its palette to video memory and
 * records where they went.
 *
 * @mangled LoadTexture__FP8TM2_headP8CTextureii
 * @address 0x154950
 * @size 0x1D4
 */
void LoadTexture(TM2_head *image, CTexture *texture, int image_address, int palette_address);
