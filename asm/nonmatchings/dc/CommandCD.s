.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandCD__FPPv
/* 742A0 001741A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 742A4 001741A4 0000BF7F */  sq         $31, 0x0($sp)
/* 742A8 001741A8 0000858C */  lw         $5, 0x0($4)
/* 742AC 001741AC D201023C */  lui        $2, %hi(CurrentDir_2)
/* 742B0 001741B0 F09A4424 */  addiu      $4, $2, %lo(CurrentDir_2)
/* 742B4 001741B4 5A15040C */  jal        strcpy
/* 742B8 001741B8 00000000 */   nop
/* 742BC 001741BC 0000BF7B */  lq         $31, 0x0($sp)
/* 742C0 001741C0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 742C4 001741C4 0800E003 */  jr         $31
/* 742C8 001741C8 00000000 */   nop
/* 742CC 001741CC 00000000 */  nop
