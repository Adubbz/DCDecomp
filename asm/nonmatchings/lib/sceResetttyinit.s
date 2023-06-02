.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceResetttyinit
/* 14890 00114790 2500023C */  lui        $2, (0x2509E0 >> 16)
/* 14894 00114794 7A560408 */  j          sceTtyInit
/* 14898 00114798 E00940AC */   sw        $0, (0x2509E0 & 0xFFFF)($2)
/* 1489C 0011479C 00000000 */  nop
