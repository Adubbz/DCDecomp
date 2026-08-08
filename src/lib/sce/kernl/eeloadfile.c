#include "common.h"

INCLUDE_ASM("main", _lf_bind);
INCLUDE_ASM("main", _lf_version);
INCLUDE_ASM("main", sceSifLoadFileReset);
INCLUDE_ASM("main", sceSifLoadModuleBuffer);
INCLUDE_ASM("main", _sceSifLoadModule);
INCLUDE_ASM("main", sceSifLoadModule);
INCLUDE_ASM("main", _sceSifLoadElfPart);
INCLUDE_ASM("main", sceSifLoadElfPart);
INCLUDE_ASM("main", sceSifLoadElf);
INCLUDE_ASM("main", sceSifGetIopAddr);
INCLUDE_ASM("main", sceSifSetIopAddr);
