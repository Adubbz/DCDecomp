#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", _set_sreg);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", _change_addr);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifGetSreg);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifSetSreg);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifGetDataTable);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifInitCmd);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifExitCmd);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifSetCmdBuffer);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifSetSysCmdBuffer);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifAddCmdHandler);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifRemoveCmdHandler);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", _sceSifSendCmd);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifSendCmd);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", isceSifSendCmd);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", _sceSifCmdIntrHdlr);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/sifcmd", sceSifWriteBackDCache);
