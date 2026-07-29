.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLYf2__8CGamePadFv
/* 02B8D0 0012B7D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B8D4 0012B7D4 0000BF7F */  sq          $31, 0x0($29)
/* 02B8D8 0012B7D8 00AD040C */  jal         GetLY2__8CGamePadFv
/* 02B8DC 0012B7DC 00000000 */   nop
/* 02B8E0 0012B7E0 00008244 */  mtc1        $2, $f0
/* 02B8E4 0012B7E4 00000000 */  nop
/* 02B8E8 0012B7E8 60008046 */  cvt.s.w     $f1, $f0
/* 02B8EC 0012B7EC 0043023C */  lui         $2, (0x43000000 >> 16)
/* 02B8F0 0012B7F0 00008244 */  mtc1        $2, $f0
/* 02B8F4 0012B7F4 00000000 */  nop
/* 02B8F8 0012B7F8 03080046 */  div.s       $f0, $f1, $f0
/* 02B8FC 0012B7FC 0000BF7B */  lq          $31, 0x0($29)
/* 02B900 0012B800 1000BD27 */  addiu       $29, $29, 0x10
/* 02B904 0012B804 0800E003 */  jr          $31
/* 02B908 0012B808 00000000 */   nop
/* 02B90C 0012B80C 00000000 */  nop
