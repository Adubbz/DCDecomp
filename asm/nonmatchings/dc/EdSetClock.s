.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetClock__Ff
/* 78270 00178170 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 78274 00178174 0000BF7F */  sq         $31, 0x0($sp)
/* 78278 00178178 00008044 */  mtc1       $0, $f0
/* 7827C 0017817C 00000000 */  nop
/* 78280 00178180 34600046 */  c.lt.s     $f12, $f0
/* 78284 00178184 00000000 */  nop
/* 78288 00178188 08000145 */  bc1t       .L001781AC
/* 7828C 0017818C 00000000 */   nop
/* 78290 00178190 C041033C */  lui        $3, (0x41C00000 >> 16)
/* 78294 00178194 00008344 */  mtc1       $3, $f0
/* 78298 00178198 00000000 */  nop
/* 7829C 0017819C 36600046 */  c.le.s     $f12, $f0
/* 782A0 001781A0 00000000 */  nop
/* 782A4 001781A4 03000145 */  bc1t       .L001781B4
/* 782A8 001781A8 00000000 */   nop
.L001781AC:
/* 782AC 001781AC 04000010 */  b          .L001781C0
/* 782B0 001781B0 00000000 */   nop
.L001781B4:
/* 782B4 001781B4 3CD0050C */  jal        ConvertTime__Ff
/* 782B8 001781B8 00000000 */   nop
/* 782BC 001781BC 049180E7 */  swc1       $f0, -0x6EFC($gp)
.L001781C0:
/* 782C0 001781C0 0000BF7B */  lq         $31, 0x0($sp)
/* 782C4 001781C4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 782C8 001781C8 0800E003 */  jr         $31
/* 782CC 001781CC 00000000 */   nop