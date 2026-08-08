#include "common.h"

INCLUDE_ASM("main", _set_sreg);
INCLUDE_ASM("main", _change_addr);
INCLUDE_ASM("main", sceSifGetSreg);
INCLUDE_ASM("main", sceSifSetSreg);
INCLUDE_ASM("main", sceSifGetDataTable);
INCLUDE_ASM("main", sceSifInitCmd);
INCLUDE_ASM("main", sceSifExitCmd);
INCLUDE_ASM("main", sceSifSetCmdBuffer);
INCLUDE_ASM("main", sceSifSetSysCmdBuffer);
INCLUDE_ASM("main", sceSifAddCmdHandler);
INCLUDE_ASM("main", sceSifRemoveCmdHandler);
INCLUDE_ASM("main", _sceSifSendCmd);
INCLUDE_ASM("main", sceSifSendCmd);
INCLUDE_ASM("main", isceSifSendCmd);
INCLUDE_ASM("main", _sceSifCmdIntrHdlr);
INCLUDE_ASM("main", sceSifWriteBackDCache);
