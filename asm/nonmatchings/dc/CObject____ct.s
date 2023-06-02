.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__7CObjectFv
/* 43750 00143650 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 43754 00143654 0000BF7F */  sq         $31, 0x0($sp)
/* 43758 00143658 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 4375C 0014365C 00608244 */  mtc1       $2, $f12
/* 43760 00143660 045C050C */  jal        __ct__7CObjectFf
/* 43764 00143664 00000000 */   nop
/* 43768 00143668 0000BF7B */  lq         $31, 0x0($sp)
/* 4376C 0014366C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 43770 00143670 0800E003 */  jr         $31
/* 43774 00143674 00000000 */   nop
/* 43778 00143678 00000000 */  nop
/* 4377C 0014367C 00000000 */  nop
