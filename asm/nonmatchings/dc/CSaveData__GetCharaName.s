.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCharaName__9CSaveDataFi
/* 57C50 00157B50 0400A004 */  bltz       $5, .L00157B64
/* 57C54 00157B54 00000000 */   nop
/* 57C58 00157B58 0600A228 */  slti       $2, $5, 0x6
/* 57C5C 00157B5C 04004014 */  bnez       $2, .L00157B70
/* 57C60 00157B60 00000000 */   nop
.L00157B64:
/* 57C64 00157B64 28160070 */  paddub     $2, $0, $0
/* 57C68 00157B68 04000010 */  b          .L00157B7C
/* 57C6C 00157B6C 00000000 */   nop
.L00157B70:
/* 57C70 00157B70 80110500 */  sll        $2, $5, 6
/* 57C74 00157B74 21108200 */  addu       $2, $4, $2
/* 57C78 00157B78 48004224 */  addiu      $2, $2, 0x48
.L00157B7C:
/* 57C7C 00157B7C 0800E003 */  jr         $31
/* 57C80 00157B80 00000000 */   nop
/* 57C84 00157B84 00000000 */  nop
/* 57C88 00157B88 00000000 */  nop
/* 57C8C 00157B8C 00000000 */  nop
