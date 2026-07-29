.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFOOT__FPPv
/* 03AD50 0013AC50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03AD54 0013AC54 0000BF7F */  sq          $31, 0x0($29)
/* 03AD58 0013AC58 0000838C */  lw          $3, 0x0($4)
/* 03AD5C 0013AC5C 0400828C */  lw          $2, 0x4($4)
/* 03AD60 0013AC60 A08C848F */  lw          $4, -0x7360($28)
/* 03AD64 0013AC64 00006CC4 */  lwc1        $f12, 0x0($3)
/* 03AD68 0013AC68 00004DC4 */  lwc1        $f13, 0x0($2)
/* 03AD6C 0013AC6C C88C858F */  lw          $5, -0x7338($28)
/* 03AD70 0013AC70 38E0040C */  jal         SetFootSound__10CCharacterFffi
/* 03AD74 0013AC74 00000000 */   nop
/* 03AD78 0013AC78 0000BF7B */  lq          $31, 0x0($29)
/* 03AD7C 0013AC7C 1000BD27 */  addiu       $29, $29, 0x10
/* 03AD80 0013AC80 0800E003 */  jr          $31
/* 03AD84 0013AC84 00000000 */   nop
/* 03AD88 0013AC88 00000000 */  nop
/* 03AD8C 0013AC8C 00000000 */  nop
