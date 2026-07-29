.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel rnd__Fv
/* 023DB0 00123CB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 023DB4 00123CB4 0000BF7F */  sq          $31, 0x0($29)
/* 023DB8 00123CB8 BE11040C */  jal         rand
/* 023DBC 00123CBC 00000000 */   nop
/* 023DC0 00123CC0 00008244 */  mtc1        $2, $f0
/* 023DC4 00123CC4 00000000 */  nop
/* 023DC8 00123CC8 60008046 */  cvt.s.w     $f1, $f0
/* 023DCC 00123CCC 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 023DD0 00123CD0 00008244 */  mtc1        $2, $f0
/* 023DD4 00123CD4 00000000 */  nop
/* 023DD8 00123CD8 03080046 */  div.s       $f0, $f1, $f0
/* 023DDC 00123CDC 0000BF7B */  lq          $31, 0x0($29)
/* 023DE0 00123CE0 1000BD27 */  addiu       $29, $29, 0x10
/* 023DE4 00123CE4 0800E003 */  jr          $31
/* 023DE8 00123CE8 00000000 */   nop
/* 023DEC 00123CEC 00000000 */  nop
