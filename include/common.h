#pragma once

#include "types.h"

#define STATIC_ASSERT(expr) typedef char _static_assert_##__COUNTER__[(expr) ? 1 : -1]

#ifdef PAL
#define SCREEN_HEIGHT 480
#define SCREEN_HALF_HEIGHT 240
#define SCREEN_HEIGHT_F 480.0f
#define SCREEN_HALF_HEIGHT_F 240.0f
#define SCREEN_QUARTER_HEIGHT_F 120.0f
#define GS_Y_OFFSET 0x7880
#else
#define SCREEN_HEIGHT 448
#define SCREEN_HALF_HEIGHT 224
#define SCREEN_HEIGHT_F 448.0f
#define SCREEN_HALF_HEIGHT_F 224.0f
#define SCREEN_QUARTER_HEIGHT_F 112.0f
#define GS_Y_OFFSET 0x7900
#endif
