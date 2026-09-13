#pragma once

#include "common.h"

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
