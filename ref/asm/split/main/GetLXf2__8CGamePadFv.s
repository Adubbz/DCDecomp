.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLXf2__8CGamePadFv
/* 02B890 0012B790 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B894 0012B794 0000BF7F */  sq          $31, 0x0($29)
/* 02B898 0012B798 F4AC040C */  jal         GetLX2__8CGamePadFv
/* 02B89C 0012B79C 00000000 */   nop
/* 02B8A0 0012B7A0 00008244 */  mtc1        $2, $f0
/* 02B8A4 0012B7A4 00000000 */  nop
/* 02B8A8 0012B7A8 60008046 */  cvt.s.w     $f1, $f0
/* 02B8AC 0012B7AC 0043023C */  lui         $2, (0x43000000 >> 16)
/* 02B8B0 0012B7B0 00008244 */  mtc1        $2, $f0
/* 02B8B4 0012B7B4 00000000 */  nop
/* 02B8B8 0012B7B8 03080046 */  div.s       $f0, $f1, $f0
/* 02B8BC 0012B7BC 0000BF7B */  lq          $31, 0x0($29)
/* 02B8C0 0012B7C0 1000BD27 */  addiu       $29, $29, 0x10
/* 02B8C4 0012B7C4 0800E003 */  jr          $31
/* 02B8C8 0012B7C8 00000000 */   nop
/* 02B8CC 0012B7CC 00000000 */  nop
