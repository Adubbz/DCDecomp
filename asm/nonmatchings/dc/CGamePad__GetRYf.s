.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRYf__8CGamePadFv
/* 2B7D0 0012B6D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B7D4 0012B6D4 0000BF7F */  sq         $31, 0x0($sp)
/* 2B7D8 0012B6D8 B8AC040C */  jal        GetRY__8CGamePadFv
/* 2B7DC 0012B6DC 00000000 */   nop
/* 2B7E0 0012B6E0 00008244 */  mtc1       $2, $f0
/* 2B7E4 0012B6E4 00000000 */  nop
/* 2B7E8 0012B6E8 60008046 */  cvt.s.w    $f1, $f0
/* 2B7EC 0012B6EC 0043023C */  lui        $2, (0x43000000 >> 16)
/* 2B7F0 0012B6F0 00008244 */  mtc1       $2, $f0
/* 2B7F4 0012B6F4 00000000 */  nop
/* 2B7F8 0012B6F8 03080046 */  div.s      $f0, $f1, $f0
/* 2B7FC 0012B6FC 0000BF7B */  lq         $31, 0x0($sp)
/* 2B800 0012B700 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B804 0012B704 0800E003 */  jr         $31
/* 2B808 0012B708 00000000 */   nop
/* 2B80C 0012B70C 00000000 */  nop
