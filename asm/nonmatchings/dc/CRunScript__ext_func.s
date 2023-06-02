.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
/* 13DF30 0023DE30 040085AC */  sw         $5, 0x4($4)
/* 13DF34 0023DE34 000086AC */  sw         $6, 0x0($4)
/* 13DF38 0023DE38 0800E003 */  jr         $31
/* 13DF3C 0023DE3C 00000000 */   nop
