.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetBuff_system__6ClsMesFPs
/* 04DB30 0014DA30 A41785AC */  sw          $5, 0x17A4($4)
/* 04DB34 0014DA34 A417838C */  lw          $3, 0x17A4($4)
/* 04DB38 0014DA38 AC1783AC */  sw          $3, 0x17AC($4)
/* 04DB3C 0014DA3C A417838C */  lw          $3, 0x17A4($4)
/* 04DB40 0014DA40 02006594 */  lhu         $5, 0x2($3)
/* 04DB44 0014DA44 AC17838C */  lw          $3, 0x17AC($4)
/* 04DB48 0014DA48 21186500 */  addu        $3, $3, $5
/* 04DB4C 0014DA4C AC1783AC */  sw          $3, 0x17AC($4)
/* 04DB50 0014DA50 0800E003 */  jr          $31
/* 04DB54 0014DA54 00000000 */   nop
/* 04DB58 0014DA58 00000000 */  nop
/* 04DB5C 0014DA5C 00000000 */  nop
