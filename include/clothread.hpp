#pragma once

#include "common.h"

class CFrameVu1;

/**
 * Turns a model towards one heading, a step at a time, and gives back the
 * heading it stands on now.
 *
 * @mangled unitRotation__FP9CFrameVu1f
 * @address 0x140810
 * @size 0x28C
 */
float unitRotation(CFrameVu1 *frame, float heading);
