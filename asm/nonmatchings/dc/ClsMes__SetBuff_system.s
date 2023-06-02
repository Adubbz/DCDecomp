.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBuff_system__6ClsMesFPs
/* 4DB30 0014DA30 A41785AC */  sw         $5, 0x17A4($4)
/* 4DB34 0014DA34 A417838C */  lw         $3, 0x17A4($4)
/* 4DB38 0014DA38 AC1783AC */  sw         $3, 0x17AC($4)
/* 4DB3C 0014DA3C A417838C */  lw         $3, 0x17A4($4)
/* 4DB40 0014DA40 02006594 */  lhu        $5, 0x2($3)
/* 4DB44 0014DA44 AC17838C */  lw         $3, 0x17AC($4)
/* 4DB48 0014DA48 21186500 */  addu       $3, $3, $5
/* 4DB4C 0014DA4C AC1783AC */  sw         $3, 0x17AC($4)
/* 4DB50 0014DA50 0800E003 */  jr         $31
/* 4DB54 0014DA54 00000000 */   nop
/* 4DB58 0014DA58 00000000 */  nop
/* 4DB5C 0014DA5C 00000000 */  nop
