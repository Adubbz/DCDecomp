.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetPanf__Ff
/* 5AB30 0015AA30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5AB34 0015AA34 0000BF7F */  sq         $31, 0x0($sp)
/* 5AB38 0015AA38 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 5AB3C 0015AA3C 00008244 */  mtc1       $2, $f0
/* 5AB40 0015AA40 00000000 */  nop
/* 5AB44 0015AA44 34600046 */  c.lt.s     $f12, $f0
/* 5AB48 0015AA48 00000000 */  nop
/* 5AB4C 0015AA4C 02000045 */  bc1f       .L0015AA58
/* 5AB50 0015AA50 00000000 */   nop
/* 5AB54 0015AA54 06030046 */  mov.s      $f12, $f0
.L0015AA58:
/* 5AB58 0015AA58 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5AB5C 0015AA5C 00008244 */  mtc1       $2, $f0
/* 5AB60 0015AA60 00000000 */  nop
/* 5AB64 0015AA64 36600046 */  c.le.s     $f12, $f0
/* 5AB68 0015AA68 00000000 */  nop
/* 5AB6C 0015AA6C 02000145 */  bc1t       .L0015AA78
/* 5AB70 0015AA70 00000000 */   nop
/* 5AB74 0015AA74 06030046 */  mov.s      $f12, $f0
.L0015AA78:
/* 5AB78 0015AA78 7C42023C */  lui        $2, (0x427C0000 >> 16)
/* 5AB7C 0015AA7C 00008244 */  mtc1       $2, $f0
/* 5AB80 0015AA80 00000000 */  nop
/* 5AB84 0015AA84 02030C46 */  mul.s      $f12, $f0, $f12
/* 5AB88 0015AA88 2C44040C */  jal        fptosi
/* 5AB8C 0015AA8C 00000000 */   nop
/* 5AB90 0015AA90 40004224 */  addiu      $2, $2, 0x40
/* 5AB94 0015AA94 0000BF7B */  lq         $31, 0x0($sp)
/* 5AB98 0015AA98 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5AB9C 0015AA9C 0800E003 */  jr         $31
/* 5ABA0 0015AAA0 00000000 */   nop
/* 5ABA4 0015AAA4 00000000 */  nop
/* 5ABA8 0015AAA8 00000000 */  nop
/* 5ABAC 0015AAAC 00000000 */  nop
