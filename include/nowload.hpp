#pragma once

#include "common.h"

/**
 * @file
 * Declares the calls that drive the loading screen while the disc is read.
 */

/**
 * Waits for the loading screen to reach the end of a field.
 *
 * @mangled wait_now_loading_vsync__Fv
 * @address 0x153F70
 * @size 0x3C
 * @unknownret
 */
void wait_now_loading_vsync(void);
