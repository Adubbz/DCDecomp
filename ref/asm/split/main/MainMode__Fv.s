.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MainMode__Fv
/* 07DE10 0017DD10 F0FFBD27 */  addiu       $29, $29, -0x10
/* 07DE14 0017DD14 0000BF7F */  sq          $31, 0x0($29)
/* 07DE18 0017DD18 D301023C */  lui         $2, %hi(MainChara)
/* 07DE1C 0017DD1C C0314224 */  addiu       $2, $2, %lo(MainChara)
/* 07DE20 0017DD20 648782AF */  sw          $2, -0x789C($28)
/* 07DE24 0017DD24 18FD050C */  jal         MoveChara__Fv
/* 07DE28 0017DD28 00000000 */   nop
/* 07DE2C 0017DD2C 0000BF7B */  lq          $31, 0x0($29)
/* 07DE30 0017DD30 1000BD27 */  addiu       $29, $29, 0x10
/* 07DE34 0017DD34 0800E003 */  jr          $31
/* 07DE38 0017DD38 00000000 */   nop
/* 07DE3C 0017DD3C 00000000 */  nop
