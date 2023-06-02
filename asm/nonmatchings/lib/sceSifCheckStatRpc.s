.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifCheckStatRpc
/* 17798 00117698 0000858C */  lw         $5, 0x0($4)
/* 1779C 0011769C 0900A010 */  beqz       $5, .L001176C4
/* 177A0 001176A0 00000000 */   nop
/* 177A4 001176A4 0400838C */  lw         $3, 0x4($4)
/* 177A8 001176A8 1800A28C */  lw         $2, 0x18($5)
/* 177AC 001176AC 05006214 */  bne        $3, $2, .L001176C4
/* 177B0 001176B0 00000000 */   nop
/* 177B4 001176B4 1000A28C */  lw         $2, 0x10($5)
/* 177B8 001176B8 01004230 */  andi       $2, $2, 0x1
/* 177BC 001176BC 03004014 */  bnez       $2, .L001176CC
/* 177C0 001176C0 00000000 */   nop
.L001176C4:
/* 177C4 001176C4 0800E003 */  jr         $31
/* 177C8 001176C8 2D100000 */   daddu     $2, $0, $0
.L001176CC:
/* 177CC 001176CC 0800E003 */  jr         $31
/* 177D0 001176D0 01000224 */   addiu     $2, $0, 0x1
/* 177D4 001176D4 00000000 */  nop
