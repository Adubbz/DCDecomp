.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_GET_LIFE_RATE__FP12RS_STACKDATAi
/* 0E3050 001E2F50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E3054 001E2F54 0000BF7F */  sq          $31, 0x0($29)
/* 0E3058 001E2F58 E09C858F */  lw          $5, -0x6320($28)
/* 0E305C 001E2F5C 9000A38C */  lw          $3, 0x90($5)
/* 0E3060 001E2F60 80100300 */  sll         $2, $3, 2
/* 0E3064 001E2F64 21184300 */  addu        $3, $2, $3
/* 0E3068 001E2F68 80100300 */  sll         $2, $3, 2
/* 0E306C 001E2F6C 21106200 */  addu        $2, $3, $2
/* 0E3070 001E2F70 00110200 */  sll         $2, $2, 4
/* 0E3074 001E2F74 21104500 */  addu        $2, $2, $5
/* 0E3078 001E2F78 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E307C 001E2F7C 21084100 */  addu        $1, $2, $1
/* 0E3080 001E2F80 F0E3238C */  lw          $3, -0x1C10($1)
/* 0E3084 001E2F84 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E3088 001E2F88 21084100 */  addu        $1, $2, $1
/* 0E308C 001E2F8C F4E3228C */  lw          $2, -0x1C0C($1)
/* 0E3090 001E2F90 00008244 */  mtc1        $2, $f0
/* 0E3094 001E2F94 00000000 */  nop
/* 0E3098 001E2F98 60008046 */  cvt.s.w     $f1, $f0
/* 0E309C 001E2F9C 00008344 */  mtc1        $3, $f0
/* 0E30A0 001E2FA0 00000000 */  nop
/* 0E30A4 001E2FA4 20008046 */  cvt.s.w     $f0, $f0
/* 0E30A8 001E2FA8 43080046 */  div.s       $f1, $f1, $f0
/* 0E30AC 001E2FAC C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0E30B0 001E2FB0 00008244 */  mtc1        $2, $f0
/* 0E30B4 001E2FB4 00000000 */  nop
/* 0E30B8 001E2FB8 02030146 */  mul.s       $f12, $f0, $f1
/* 0E30BC 001E2FBC BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E30C0 001E2FC0 00000000 */   nop
/* 0E30C4 001E2FC4 01000224 */  addiu       $2, $0, 0x1
/* 0E30C8 001E2FC8 0000BF7B */  lq          $31, 0x0($29)
/* 0E30CC 001E2FCC 1000BD27 */  addiu       $29, $29, 0x10
/* 0E30D0 001E2FD0 0800E003 */  jr          $31
/* 0E30D4 001E2FD4 00000000 */   nop
/* 0E30D8 001E2FD8 00000000 */  nop
/* 0E30DC 001E2FDC 00000000 */  nop
