.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRXf__8CGamePadFv
/* 02B790 0012B690 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B794 0012B694 0000BF7F */  sq          $31, 0x0($29)
/* 02B798 0012B698 ACAC040C */  jal         GetRX__8CGamePadFv
/* 02B79C 0012B69C 00000000 */   nop
/* 02B7A0 0012B6A0 00008244 */  mtc1        $2, $f0
/* 02B7A4 0012B6A4 00000000 */  nop
/* 02B7A8 0012B6A8 60008046 */  cvt.s.w     $f1, $f0
/* 02B7AC 0012B6AC 0043023C */  lui         $2, (0x43000000 >> 16)
/* 02B7B0 0012B6B0 00008244 */  mtc1        $2, $f0
/* 02B7B4 0012B6B4 00000000 */  nop
/* 02B7B8 0012B6B8 03080046 */  div.s       $f0, $f1, $f0
/* 02B7BC 0012B6BC 0000BF7B */  lq          $31, 0x0($29)
/* 02B7C0 0012B6C0 1000BD27 */  addiu       $29, $29, 0x10
/* 02B7C4 0012B6C4 0800E003 */  jr          $31
/* 02B7C8 0012B6C8 00000000 */   nop
/* 02B7CC 0012B6CC 00000000 */  nop
