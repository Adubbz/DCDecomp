.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Enable__13CTextureAnimeFi
/* 67C40 00167B40 0400A004 */  bltz       $5, .L00167B54
/* 67C44 00167B44 00000000 */   nop
/* 67C48 00167B48 1800A328 */  slti       $3, $5, 0x18
/* 67C4C 00167B4C 03006014 */  bnez       $3, .L00167B5C
/* 67C50 00167B50 00000000 */   nop
.L00167B54:
/* 67C54 00167B54 05000010 */  b          .L00167B6C
/* 67C58 00167B58 00000000 */   nop
.L00167B5C:
/* 67C5C 00167B5C 01000624 */  addiu      $6, $0, 0x1
/* 67C60 00167B60 80180500 */  sll        $3, $5, 2
/* 67C64 00167B64 21188300 */  addu       $3, $4, $3
/* 67C68 00167B68 000066AC */  sw         $6, 0x0($3)
.L00167B6C:
/* 67C6C 00167B6C 0800E003 */  jr         $31
/* 67C70 00167B70 00000000 */   nop
/* 67C74 00167B74 00000000 */  nop
/* 67C78 00167B78 00000000 */  nop
/* 67C7C 00167B7C 00000000 */  nop
