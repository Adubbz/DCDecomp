#include "common.h"

INCLUDE_ASM("main", QueueInit);
INCLUDE_ASM("main", QueuePeekWriteDone);
INCLUDE_ASM("main", QueuePeekReadDone);
INCLUDE_ASM("main", sceTtyHandler);
INCLUDE_ASM("main", sceTtyWrite);
INCLUDE_ASM("main", sceTtyRead);
INCLUDE_ASM("main", sceTtyInit);
