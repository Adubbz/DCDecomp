.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_GLOBAL_INT__FP12RS_STACKDATAi
/* 0E52F0 001E51F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E52F4 001E51F4 1000BF7F */  sq          $31, 0x10($29)
/* 0E52F8 001E51F8 0000B07F */  sq          $16, 0x0($29)
/* 0E52FC 001E51FC 08009024 */  addiu       $16, $4, 0x8
/* 0E5300 001E5200 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E5304 001E5204 00000000 */   nop
/* 0E5308 001E5208 28260072 */  paddub      $4, $16, $0
/* 0E530C 001E520C 80180200 */  sll         $3, $2, 2
/* 0E5310 001E5210 D901023C */  lui         $2, %hi(GL_INT)
/* 0E5314 001E5214 80FC4224 */  addiu       $2, $2, %lo(GL_INT)
/* 0E5318 001E5218 21104300 */  addu        $2, $2, $3
/* 0E531C 001E521C 0000458C */  lw          $5, 0x0($2)
/* 0E5320 001E5220 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E5324 001E5224 00000000 */   nop
/* 0E5328 001E5228 01000224 */  addiu       $2, $0, 0x1
/* 0E532C 001E522C 1000BF7B */  lq          $31, 0x10($29)
/* 0E5330 001E5230 0000B07B */  lq          $16, 0x0($29)
/* 0E5334 001E5234 2000BD27 */  addiu       $29, $29, 0x20
/* 0E5338 001E5238 0800E003 */  jr          $31
/* 0E533C 001E523C 00000000 */   nop
