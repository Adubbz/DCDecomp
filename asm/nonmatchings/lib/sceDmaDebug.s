.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaDebug
/* C5B0 0010C4B0 2500033C */  lui        $3, (0x2502F8 >> 16)
/* C5B4 0010C4B4 F802628C */  lw         $2, (0x2502F8 & 0xFFFF)($3)
/* C5B8 0010C4B8 0800E003 */  jr         $31
/* C5BC 0010C4BC F80264AC */   sw        $4, (0x2502F8 & 0xFFFF)($3)
