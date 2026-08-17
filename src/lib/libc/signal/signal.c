#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", _init_signal_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", _signal_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", _raise_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", __sigtramp_r);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", raise);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", signal);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", _init_signal);
INCLUDE_ASM("asm/nonmatchings/lib/libc/signal/signal", __sigtramp);
