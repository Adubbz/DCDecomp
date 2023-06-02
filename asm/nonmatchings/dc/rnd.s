.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel rnd__Fv
/* 23DB0 00123CB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 23DB4 00123CB4 0000BF7F */  sq         $31, 0x0($sp)
/* 23DB8 00123CB8 BE11040C */  jal        rand
/* 23DBC 00123CBC 00000000 */   nop
/* 23DC0 00123CC0 00008244 */  mtc1       $2, $f0
/* 23DC4 00123CC4 00000000 */  nop
/* 23DC8 00123CC8 60008046 */  cvt.s.w    $f1, $f0
/* 23DCC 00123CCC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* 23DD0 00123CD0 00008244 */  mtc1       $2, $f0
/* 23DD4 00123CD4 00000000 */  nop
/* 23DD8 00123CD8 03080046 */  div.s      $f0, $f1, $f0
/* 23DDC 00123CDC 0000BF7B */  lq         $31, 0x0($sp)
/* 23DE0 00123CE0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 23DE4 00123CE4 0800E003 */  jr         $31
/* 23DE8 00123CE8 00000000 */   nop
/* 23DEC 00123CEC 00000000 */  nop
