#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", QueueInit);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", QueuePeekWriteDone);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", QueuePeekReadDone);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", sceTtyHandler);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", sceTtyWrite);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", sceTtyRead);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/tty", sceTtyInit);
