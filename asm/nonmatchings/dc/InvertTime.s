.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InvertTime__Ff
/* 74250 00174150 0040023C */  lui        $2, (0x40000000 >> 16)
/* 74254 00174154 00008244 */  mtc1       $2, $f0
/* 74258 00174158 00000000 */  nop
/* 7425C 0017415C 02630046 */  mul.s      $f12, $f12, $f0
/* 74260 00174160 2041023C */  lui        $2, (0x41200000 >> 16)
/* 74264 00174164 00008244 */  mtc1       $2, $f0
/* 74268 00174168 00000000 */  nop
/* 7426C 0017416C 00630046 */  add.s      $f12, $f12, $f0
/* 74270 00174170 C041023C */  lui        $2, (0x41C00000 >> 16)
/* 74274 00174174 00008244 */  mtc1       $2, $f0
/* 74278 00174178 00000000 */  nop
/* 7427C 0017417C 36600046 */  c.le.s     $f12, $f0
/* 74280 00174180 00000000 */  nop
/* 74284 00174184 02000145 */  bc1t       .L00174190
/* 74288 00174188 00000000 */   nop
/* 7428C 0017418C 01630046 */  sub.s      $f12, $f12, $f0
.L00174190:
/* 74290 00174190 06600046 */  mov.s      $f0, $f12
/* 74294 00174194 0800E003 */  jr         $31
/* 74298 00174198 00000000 */   nop
/* 7429C 0017419C 00000000 */  nop