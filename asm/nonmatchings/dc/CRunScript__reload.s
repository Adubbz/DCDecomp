.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel reload__10CRunScriptFP14RS_PROG_HEADER
/* 13DF10 0023DE10 3C0085AC */  sw         $5, 0x3C($4)
/* 13DF14 0023DE14 0800A38C */  lw         $3, 0x8($5)
/* 13DF18 0023DE18 2118A300 */  addu       $3, $5, $3
/* 13DF1C 0023DE1C 400083AC */  sw         $3, 0x40($4)
/* 13DF20 0023DE20 0800E003 */  jr         $31
/* 13DF24 0023DE24 00000000 */   nop
/* 13DF28 0023DE28 00000000 */  nop
/* 13DF2C 0023DE2C 00000000 */  nop
