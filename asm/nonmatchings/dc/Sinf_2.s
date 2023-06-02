.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Sinf__Ff
/* 23F40 00123E40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 23F44 00123E44 0000BF7F */  sq         $31, 0x0($sp)
/* 23F48 00123E48 00008044 */  mtc1       $0, $f0
/* 23F4C 00123E4C 00000000 */  nop
/* 23F50 00123E50 34600046 */  c.lt.s     $f12, $f0
/* 23F54 00123E54 00000000 */  nop
/* 23F58 00123E58 12000145 */  bc1t       .L00123EA4
/* 23F5C 00123E5C 00000000 */   nop
/* 23F60 00123E60 948680C7 */  lwc1       $f0, -0x796C($gp)
/* 23F64 00123E64 02630046 */  mul.s      $f12, $f12, $f0
/* 23F68 00123E68 2C44040C */  jal        fptosi
/* 23F6C 00123E6C 00000000 */   nop
/* 23F70 00123E70 FF034330 */  andi       $3, $2, 0x3FF
/* 23F74 00123E74 04004104 */  bgez       $2, .L00123E88
/* 23F78 00123E78 00000000 */   nop
/* 23F7C 00123E7C 02006010 */  beqz       $3, .L00123E88
/* 23F80 00123E80 00000000 */   nop
/* 23F84 00123E84 00FC6324 */  addiu      $3, $3, -0x400
.L00123E88:
/* 23F88 00123E88 80180300 */  sll        $3, $3, 2
/* 23F8C 00123E8C 2B00023C */  lui        $2, %hi(SinTable)
/* 23F90 00123E90 10A04224 */  addiu      $2, $2, %lo(SinTable)
/* 23F94 00123E94 21104300 */  addu       $2, $2, $3
/* 23F98 00123E98 000040C4 */  lwc1       $f0, 0x0($2)
/* 23F9C 00123E9C 12000010 */  b          .L00123EE8
/* 23FA0 00123EA0 00000000 */   nop
.L00123EA4:
/* 23FA4 00123EA4 47600046 */  neg.s      $f1, $f12
/* 23FA8 00123EA8 948680C7 */  lwc1       $f0, -0x796C($gp)
/* 23FAC 00123EAC 020B0046 */  mul.s      $f12, $f1, $f0
/* 23FB0 00123EB0 2C44040C */  jal        fptosi
/* 23FB4 00123EB4 00000000 */   nop
/* 23FB8 00123EB8 FF034330 */  andi       $3, $2, 0x3FF
/* 23FBC 00123EBC 04004104 */  bgez       $2, .L00123ED0
/* 23FC0 00123EC0 00000000 */   nop
/* 23FC4 00123EC4 02006010 */  beqz       $3, .L00123ED0
/* 23FC8 00123EC8 00000000 */   nop
/* 23FCC 00123ECC 00FC6324 */  addiu      $3, $3, -0x400
.L00123ED0:
/* 23FD0 00123ED0 80180300 */  sll        $3, $3, 2
/* 23FD4 00123ED4 2B00023C */  lui        $2, %hi(SinTable)
/* 23FD8 00123ED8 10A04224 */  addiu      $2, $2, %lo(SinTable)
/* 23FDC 00123EDC 21104300 */  addu       $2, $2, $3
/* 23FE0 00123EE0 000040C4 */  lwc1       $f0, 0x0($2)
/* 23FE4 00123EE4 07000046 */  neg.s      $f0, $f0
.L00123EE8:
/* 23FE8 00123EE8 0000BF7B */  lq         $31, 0x0($sp)
/* 23FEC 00123EEC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 23FF0 00123EF0 0800E003 */  jr         $31
/* 23FF4 00123EF4 00000000 */   nop
/* 23FF8 00123EF8 00000000 */  nop
/* 23FFC 00123EFC 00000000 */  nop
