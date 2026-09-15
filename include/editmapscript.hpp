#pragma once

#include "common.h"

#include "editloop.hpp"

/**
 * Returns the integer value addressed by a script argument slot.
 *
 * @mangled test__FPPv
 * @address 0x1741D0
 * @size 0x10
 */
int test(void **argument);

/**
 * Reports whether the current editor state should draw the fishing interface.
 */
int FishingDrawCheck();

/**
 * Tests whether a motion crossed a nearby target time during the current step.
 */
int CheckMotionTime(float target, float previous, float current);

/**
 * Provides the editor hook for stopping all currently managed sound.
 */
void StopAllSound();
