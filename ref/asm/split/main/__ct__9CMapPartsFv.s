.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__9CMapPartsFv
/* 09AA60 0019A960 E0FFBD27 */  addiu       $29, $29, -0x20
/* 09AA64 0019A964 1000BF7F */  sq          $31, 0x10($29)
/* 09AA68 0019A968 0000B07F */  sq          $16, 0x0($29)
/* 09AA6C 0019A96C 28868070 */  paddub      $16, $4, $0
/* 09AA70 0019A970 5C5E050C */  jal         __ct__10CMapObjectFv
/* 09AA74 0019A974 00000000 */   nop
/* 09AA78 0019A978 2A00023C */  lui         $2, %hi(__vt__9CMapParts)
/* 09AA7C 0019A97C 80164224 */  addiu       $2, $2, %lo(__vt__9CMapParts)
/* 09AA80 0019A980 A00002AE */  sw          $2, 0xA0($16)
/* 09AA84 0019A984 28260072 */  paddub      $4, $16, $0
/* 09AA88 0019A988 306A060C */  jal         Initialize__9CMapPartsFv
/* 09AA8C 0019A98C 00000000 */   nop
/* 09AA90 0019A990 28160072 */  paddub      $2, $16, $0
/* 09AA94 0019A994 1000BF7B */  lq          $31, 0x10($29)
/* 09AA98 0019A998 0000B07B */  lq          $16, 0x0($29)
/* 09AA9C 0019A99C 2000BD27 */  addiu       $29, $29, 0x20
/* 09AAA0 0019A9A0 0800E003 */  jr          $31
/* 09AAA4 0019A9A4 00000000 */   nop
/* 09AAA8 0019A9A8 00000000 */  nop
/* 09AAAC 0019A9AC 00000000 */  nop
