.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtlDrawSave__Fv
/* 0F5960 001F5860 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F5964 001F5864 0000BF7F */  sq          $31, 0x0($29)
/* 0F5968 001F5868 2A00023C */  lui         $2, %hi(LIT_924__2)
/* 0F596C 001F586C E8D44424 */  addiu       $4, $2, %lo(LIT_924__2)
/* 0F5970 001F5870 F480080C */  jal         DrawMenuSave__FPc
/* 0F5974 001F5874 00000000 */   nop
/* 0F5978 001F5878 28260070 */  paddub      $4, $0, $0
/* 0F597C 001F587C 046F050C */  jal         setbilinear__Fi
/* 0F5980 001F5880 00000000 */   nop
/* 0F5984 001F5884 0000BF7B */  lq          $31, 0x0($29)
/* 0F5988 001F5888 1000BD27 */  addiu       $29, $29, 0x10
/* 0F598C 001F588C 0800E003 */  jr          $31
/* 0F5990 001F5890 00000000 */   nop
/* 0F5994 001F5894 00000000 */  nop
/* 0F5998 001F5898 00000000 */  nop
/* 0F599C 001F589C 00000000 */  nop
