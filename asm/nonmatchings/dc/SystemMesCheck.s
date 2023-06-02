.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SystemMesCheck__Fv
/* 60210 00160110 6C8E828F */  lw         $2, -0x7194($gp)
/* 60214 00160114 2A100200 */  slt        $2, $0, $2
/* 60218 00160118 0800E003 */  jr         $31
/* 6021C 0016011C 00000000 */   nop
