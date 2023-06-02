.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSaveFrameImageTask__Fv
/* 73F70 00173E70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73F74 00173E74 0000BF7F */  sq         $31, 0x0($sp)
/* 73F78 00173E78 BC8F838F */  lw         $3, -0x7044($gp)
/* 73F7C 00173E7C 0D006010 */  beqz       $3, .L00173EB4
/* 73F80 00173E80 00000000 */   nop
/* 73F84 00173E84 D201023C */  lui        $2, %hi(D_1D19AC8)
/* 73F88 00173E88 C89A4424 */  addiu      $4, $2, %lo(D_1D19AC8)
/* 73F8C 00173E8C 282E0070 */  paddub     $5, $0, $0
/* 73F90 00173E90 28360070 */  paddub     $6, $0, $0
/* 73F94 00173E94 283E0070 */  paddub     $7, $0, $0
/* 73F98 00173E98 5CBE040C */  jal        MGMoveFrameBuffImage__FP9sceGsTex0iii
/* 73F9C 00173E9C 00000000 */   nop
/* 73FA0 00173EA0 D201023C */  lui        $2, %hi(frame_image_tex)
/* 73FA4 00173EA4 A09A4424 */  addiu      $4, $2, %lo(frame_image_tex)
/* 73FA8 00173EA8 C8C3040C */  jal        Initialize__8CTextureFv
/* 73FAC 00173EAC 00000000 */   nop
/* 73FB0 00173EB0 BC8F80AF */  sw         $0, -0x7044($gp)
.L00173EB4:
/* 73FB4 00173EB4 0000BF7B */  lq         $31, 0x0($sp)
/* 73FB8 00173EB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73FBC 00173EBC 0800E003 */  jr         $31
/* 73FC0 00173EC0 00000000 */   nop
/* 73FC4 00173EC4 00000000 */  nop
/* 73FC8 00173EC8 00000000 */  nop
/* 73FCC 00173ECC 00000000 */  nop
