.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_GLOBAL_INT__FP12RS_STACKDATAi
/* E52F0 001E51F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E52F4 001E51F4 1000BF7F */  sq         $31, 0x10($sp)
/* E52F8 001E51F8 0000B07F */  sq         $16, 0x0($sp)
/* E52FC 001E51FC 08009024 */  addiu      $16, $4, 0x8
/* E5300 001E5200 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5304 001E5204 00000000 */   nop
/* E5308 001E5208 28260072 */  paddub     $4, $16, $0
/* E530C 001E520C 80180200 */  sll        $3, $2, 2
/* E5310 001E5210 D901023C */  lui        $2, %hi(GL_INT)
/* E5314 001E5214 80FC4224 */  addiu      $2, $2, %lo(GL_INT)
/* E5318 001E5218 21104300 */  addu       $2, $2, $3
/* E531C 001E521C 0000458C */  lw         $5, 0x0($2)
/* E5320 001E5220 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E5324 001E5224 00000000 */   nop
/* E5328 001E5228 01000224 */  addiu      $2, $0, 0x1
/* E532C 001E522C 1000BF7B */  lq         $31, 0x10($sp)
/* E5330 001E5230 0000B07B */  lq         $16, 0x0($sp)
/* E5334 001E5234 2000BD27 */  addiu      $sp, $sp, 0x20
/* E5338 001E5238 0800E003 */  jr         $31
/* E533C 001E523C 00000000 */   nop
