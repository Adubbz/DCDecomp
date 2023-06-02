.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFOOT__FPPv
/* 3AD50 0013AC50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3AD54 0013AC54 0000BF7F */  sq         $31, 0x0($sp)
/* 3AD58 0013AC58 0000838C */  lw         $3, 0x0($4)
/* 3AD5C 0013AC5C 0400828C */  lw         $2, 0x4($4)
/* 3AD60 0013AC60 A08C848F */  lw         $4, -0x7360($gp)
/* 3AD64 0013AC64 00006CC4 */  lwc1       $f12, 0x0($3)
/* 3AD68 0013AC68 00004DC4 */  lwc1       $f13, 0x0($2)
/* 3AD6C 0013AC6C C88C858F */  lw         $5, -0x7338($gp)
/* 3AD70 0013AC70 38E0040C */  jal        SetFootSound__10CCharacterFffi
/* 3AD74 0013AC74 00000000 */   nop
/* 3AD78 0013AC78 0000BF7B */  lq         $31, 0x0($sp)
/* 3AD7C 0013AC7C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3AD80 0013AC80 0800E003 */  jr         $31
/* 3AD84 0013AC84 00000000 */   nop
/* 3AD88 0013AC88 00000000 */  nop
/* 3AD8C 0013AC8C 00000000 */  nop
