.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _HOBJ_INTERIORPARTS__FP12RS_STACKDATAi
/* 090BA0 00190AA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090BA4 00190AA4 2000BF7F */  sq          $31, 0x20($29)
/* 090BA8 00190AA8 1000B17F */  sq          $17, 0x10($29)
/* 090BAC 00190AAC 0000B07F */  sq          $16, 0x0($29)
/* 090BB0 00190AB0 D401013C */  lui         $1, %hi(EdEventInfo + 0x258)
/* 090BB4 00190AB4 28D4228C */  lw          $2, %lo(EdEventInfo + 0x258)($1)
/* 090BB8 00190AB8 04004014 */  bnez        $2, .L00190ACC
/* 090BBC 00190ABC 00000000 */   nop
/* 090BC0 00190AC0 01000224 */  addiu       $2, $0, 0x1
/* 090BC4 00190AC4 2D000010 */  b           .L00190B7C
/* 090BC8 00190AC8 00000000 */   nop
.L00190ACC:
/* 090BCC 00190ACC D401013C */  lui         $1, %hi(EdEventInfo + 0x254)
/* 090BD0 00190AD0 24D4228C */  lw          $2, %lo(EdEventInfo + 0x254)($1)
/* 090BD4 00190AD4 0400401C */  bgtz        $2, .L00190AE8
/* 090BD8 00190AD8 00000000 */   nop
/* 090BDC 00190ADC 01000224 */  addiu       $2, $0, 0x1
/* 090BE0 00190AE0 26000010 */  b           .L00190B7C
/* 090BE4 00190AE4 00000000 */   nop
.L00190AE8:
/* 090BE8 00190AE8 08009124 */  addiu       $17, $4, 0x8
/* 090BEC 00190AEC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090BF0 00190AF0 00000000 */   nop
/* 090BF4 00190AF4 28864070 */  paddub      $16, $2, $0
/* 090BF8 00190AF8 28262072 */  paddub      $4, $17, $0
/* 090BFC 00190AFC 08009124 */  addiu       $17, $4, 0x8
/* 090C00 00190B00 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090C04 00190B04 00000000 */   nop
/* 090C08 00190B08 282E4070 */  paddub      $5, $2, $0
/* 090C0C 00190B0C 0600A004 */  bltz        $5, .L00190B28
/* 090C10 00190B10 00000000 */   nop
/* 090C14 00190B14 D401013C */  lui         $1, %hi(EdEventInfo + 0x254)
/* 090C18 00190B18 24D4228C */  lw          $2, %lo(EdEventInfo + 0x254)($1)
/* 090C1C 00190B1C 2A10A200 */  slt         $2, $5, $2
/* 090C20 00190B20 04004014 */  bnez        $2, .L00190B34
/* 090C24 00190B24 00000000 */   nop
.L00190B28:
/* 090C28 00190B28 28160070 */  paddub      $2, $0, $0
/* 090C2C 00190B2C 13000010 */  b           .L00190B7C
/* 090C30 00190B30 00000000 */   nop
.L00190B34:
/* 090C34 00190B34 28262072 */  paddub      $4, $17, $0
/* 090C38 00190B38 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 090C3C 00190B3C 00000000 */   nop
/* 090C40 00190B40 C0180500 */  sll         $3, $5, 3
/* 090C44 00190B44 23206500 */  subu        $4, $3, $5
/* 090C48 00190B48 80180400 */  sll         $3, $4, 2
/* 090C4C 00190B4C 23186400 */  subu        $3, $3, $4
/* 090C50 00190B50 40210300 */  sll         $4, $3, 5
/* 090C54 00190B54 D401013C */  lui         $1, %hi(EdEventInfo + 0x258)
/* 090C58 00190B58 28D4238C */  lw          $3, %lo(EdEventInfo + 0x258)($1)
/* 090C5C 00190B5C 21286400 */  addu        $5, $3, $4
/* 090C60 00190B60 28260072 */  paddub      $4, $16, $0
/* 090C64 00190B64 28364070 */  paddub      $6, $2, $0
/* 090C68 00190B68 1C29060C */  jal         SetObjHandle__FiP9CMapPartsPc
/* 090C6C 00190B6C 00000000 */   nop
/* 090C70 00190B70 01000324 */  addiu       $3, $0, 0x1
/* 090C74 00190B74 0A180200 */  movz        $3, $0, $2
/* 090C78 00190B78 28166070 */  paddub      $2, $3, $0
.L00190B7C:
/* 090C7C 00190B7C 2000BF7B */  lq          $31, 0x20($29)
/* 090C80 00190B80 1000B17B */  lq          $17, 0x10($29)
/* 090C84 00190B84 0000B07B */  lq          $16, 0x0($29)
/* 090C88 00190B88 3000BD27 */  addiu       $29, $29, 0x30
/* 090C8C 00190B8C 0800E003 */  jr          $31
/* 090C90 00190B90 00000000 */   nop
/* 090C94 00190B94 00000000 */  nop
/* 090C98 00190B98 00000000 */  nop
/* 090C9C 00190B9C 00000000 */  nop
