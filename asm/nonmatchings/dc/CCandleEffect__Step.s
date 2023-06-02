.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__13CCandleEffectFv
/* 63BE0 00163AE0 040081C4 */  lwc1       $f1, 0x4($4)
/* 63BE4 00163AE4 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* 63BE8 00163AE8 40080046 */  add.s      $f1, $f1, $f0
/* 63BEC 00163AEC 040081E4 */  swc1       $f1, 0x4($4)
/* 63BF0 00163AF0 0041033C */  lui        $3, (0x41000000 >> 16)
/* 63BF4 00163AF4 00008344 */  mtc1       $3, $f0
/* 63BF8 00163AF8 00000000 */  nop
/* 63BFC 00163AFC 36080046 */  c.le.s     $f1, $f0
/* 63C00 00163B00 00000000 */  nop
/* 63C04 00163B04 02000145 */  bc1t       .L00163B10
/* 63C08 00163B08 00000000 */   nop
/* 63C0C 00163B0C 040080AC */  sw         $0, 0x4($4)
.L00163B10:
/* 63C10 00163B10 0800E003 */  jr         $31
/* 63C14 00163B14 00000000 */   nop
/* 63C18 00163B18 00000000 */  nop
/* 63C1C 00163B1C 00000000 */  nop
