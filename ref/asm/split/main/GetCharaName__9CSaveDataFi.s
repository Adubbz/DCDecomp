.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCharaName__9CSaveDataFi
/* 057C50 00157B50 0400A004 */  bltz        $5, .L00157B64
/* 057C54 00157B54 00000000 */   nop
/* 057C58 00157B58 0600A228 */  slti        $2, $5, 0x6
/* 057C5C 00157B5C 04004014 */  bnez        $2, .L00157B70
/* 057C60 00157B60 00000000 */   nop
.L00157B64:
/* 057C64 00157B64 28160070 */  paddub      $2, $0, $0
/* 057C68 00157B68 04000010 */  b           .L00157B7C
/* 057C6C 00157B6C 00000000 */   nop
.L00157B70:
/* 057C70 00157B70 80110500 */  sll         $2, $5, 6
/* 057C74 00157B74 21108200 */  addu        $2, $4, $2
/* 057C78 00157B78 48004224 */  addiu       $2, $2, 0x48
.L00157B7C:
/* 057C7C 00157B7C 0800E003 */  jr          $31
/* 057C80 00157B80 00000000 */   nop
/* 057C84 00157B84 00000000 */  nop
/* 057C88 00157B88 00000000 */  nop
/* 057C8C 00157B8C 00000000 */  nop
