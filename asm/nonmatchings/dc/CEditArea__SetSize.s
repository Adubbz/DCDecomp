.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSize__9CEditAreaFiiff
/* 6D960 0016D860 080085AC */  sw         $5, 0x8($4)
/* 6D964 0016D864 0C0086AC */  sw         $6, 0xC($4)
/* 6D968 0016D868 20008CE4 */  swc1       $f12, 0x20($4)
/* 6D96C 0016D86C 24008DE4 */  swc1       $f13, 0x24($4)
/* 6D970 0016D870 0800E003 */  jr         $31
/* 6D974 0016D874 00000000 */   nop
/* 6D978 0016D878 00000000 */  nop
/* 6D97C 0016D87C 00000000 */  nop
