#include "common.h"

INCLUDE_ASM("main", _init_signal_r);
INCLUDE_ASM("main", _signal_r);
INCLUDE_ASM("main", _raise_r);
INCLUDE_ASM("main", __sigtramp_r);
INCLUDE_ASM("main", raise);
INCLUDE_ASM("main", signal);
INCLUDE_ASM("main", _init_signal);
INCLUDE_ASM("main", __sigtramp);
