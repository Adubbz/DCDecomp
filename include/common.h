#pragma once

#include "types.h"

#define STATIC_ASSERT(expr) typedef char _static_assert_##__COUNTER__ [(expr) ? 1 : -1]