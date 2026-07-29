.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetMapFlag__Fii
/* 078190 00178090 F0FFBD27 */  addiu       $29, $29, -0x10
/* 078194 00178094 0000BF7F */  sq          $31, 0x0($29)
/* 078198 00178098 28368070 */  paddub      $6, $4, $0
/* 07819C 0017809C 283EA070 */  paddub      $7, $5, $0
/* 0781A0 001780A0 0400C01C */  bgtz        $6, .L001780B4
/* 0781A4 001780A4 00000000 */   nop
/* 0781A8 001780A8 28160070 */  paddub      $2, $0, $0
/* 0781AC 001780AC 05000010 */  b           .L001780C4
/* 0781B0 001780B0 00000000 */   nop
.L001780B4:
/* 0781B4 001780B4 1C8D848F */  lw          $4, -0x72E4($28)
/* 0781B8 001780B8 288D858F */  lw          $5, -0x72D8($28)
/* 0781BC 001780BC 1061050C */  jal         SetMapFlag__9CSaveDataFiii
/* 0781C0 001780C0 00000000 */   nop
.L001780C4:
/* 0781C4 001780C4 0000BF7B */  lq          $31, 0x0($29)
/* 0781C8 001780C8 1000BD27 */  addiu       $29, $29, 0x10
/* 0781CC 001780CC 0800E003 */  jr          $31
/* 0781D0 001780D0 00000000 */   nop
/* 0781D4 001780D4 00000000 */  nop
/* 0781D8 001780D8 00000000 */  nop
/* 0781DC 001780DC 00000000 */  nop
