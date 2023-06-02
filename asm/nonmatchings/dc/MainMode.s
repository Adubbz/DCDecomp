.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainMode__Fv
/* 7DE10 0017DD10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 7DE14 0017DD14 0000BF7F */  sq         $31, 0x0($sp)
/* 7DE18 0017DD18 D301023C */  lui        $2, %hi(MainChara)
/* 7DE1C 0017DD1C C0314224 */  addiu      $2, $2, %lo(MainChara)
/* 7DE20 0017DD20 648782AF */  sw         $2, -0x789C($gp)
/* 7DE24 0017DD24 18FD050C */  jal        MoveChara__Fv
/* 7DE28 0017DD28 00000000 */   nop
/* 7DE2C 0017DD2C 0000BF7B */  lq         $31, 0x0($sp)
/* 7DE30 0017DD30 1000BD27 */  addiu      $sp, $sp, 0x10
/* 7DE34 0017DD34 0800E003 */  jr         $31
/* 7DE38 0017DD38 00000000 */   nop
/* 7DE3C 0017DD3C 00000000 */  nop
