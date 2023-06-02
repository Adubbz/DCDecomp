.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRXf__8CGamePadFv
/* 2B790 0012B690 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B794 0012B694 0000BF7F */  sq         $31, 0x0($sp)
/* 2B798 0012B698 ACAC040C */  jal        GetRX__8CGamePadFv
/* 2B79C 0012B69C 00000000 */   nop
/* 2B7A0 0012B6A0 00008244 */  mtc1       $2, $f0
/* 2B7A4 0012B6A4 00000000 */  nop
/* 2B7A8 0012B6A8 60008046 */  cvt.s.w    $f1, $f0
/* 2B7AC 0012B6AC 0043023C */  lui        $2, (0x43000000 >> 16)
/* 2B7B0 0012B6B0 00008244 */  mtc1       $2, $f0
/* 2B7B4 0012B6B4 00000000 */  nop
/* 2B7B8 0012B6B8 03080046 */  div.s      $f0, $f1, $f0
/* 2B7BC 0012B6BC 0000BF7B */  lq         $31, 0x0($sp)
/* 2B7C0 0012B6C0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B7C4 0012B6C4 0800E003 */  jr         $31
/* 2B7C8 0012B6C8 00000000 */   nop
/* 2B7CC 0012B6CC 00000000 */  nop
