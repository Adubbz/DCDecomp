.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetFrame__12CObjectFrameFP9CFrameVu1i
/* 0571C0 001570C0 0700C004 */  bltz        $6, .L001570E0
/* 0571C4 001570C4 00000000 */   nop
/* 0571C8 001570C8 0400C128 */  slti        $1, $6, 0x4
/* 0571CC 001570CC 04002010 */  beqz        $1, .L001570E0
/* 0571D0 001570D0 00000000 */   nop
/* 0571D4 001570D4 80180600 */  sll         $3, $6, 2
/* 0571D8 001570D8 21186400 */  addu        $3, $3, $4
/* 0571DC 001570DC B00065AC */  sw          $5, 0xB0($3)
.L001570E0:
/* 0571E0 001570E0 0800E003 */  jr          $31
/* 0571E4 001570E4 00000000 */   nop
/* 0571E8 001570E8 00000000 */  nop
/* 0571EC 001570EC 00000000 */  nop
