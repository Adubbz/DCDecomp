#pragma once

#include "types.h"

// Every source can mark a function that is not decompiled yet.
#include "include_asm.h"

#define STATIC_ASSERT(expr) typedef char _static_assert_##__COUNTER__ [(expr) ? 1 : -1]