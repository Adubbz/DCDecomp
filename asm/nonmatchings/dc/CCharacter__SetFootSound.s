.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFootSound__10CCharacterFffi
/* 381E0 001380E0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 381E4 001380E4 4000BF7F */  sq         $31, 0x40($sp)
/* 381E8 001380E8 3000B27F */  sq         $18, 0x30($sp)
/* 381EC 001380EC 2000B17F */  sq         $17, 0x20($sp)
/* 381F0 001380F0 1000B07F */  sq         $16, 0x10($sp)
/* 381F4 001380F4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 381F8 001380F8 288E8070 */  paddub     $17, $4, $0
/* 381FC 001380FC 066D0046 */  mov.s      $f20, $f13
/* 38200 00138100 2886A070 */  paddub     $16, $5, $0
/* 38204 00138104 281E0070 */  paddub     $3, $0, $0
/* 38208 00138108 16000010 */  b          .L00138164
/* 3820C 0013810C 00000000 */   nop
.L00138110:
/* 38210 00138110 80100300 */  sll        $2, $3, 2
/* 38214 00138114 21104300 */  addu       $2, $2, $3
/* 38218 00138118 80100200 */  sll        $2, $2, 2
/* 3821C 0013811C 21102202 */  addu       $2, $17, $2
/* 38220 00138120 600D5224 */  addiu      $18, $2, 0xD60
/* 38224 00138124 600D40C4 */  lwc1       $f0, 0xD60($2)
/* 38228 00138128 60008046 */  cvt.s.w    $f1, $f0
/* 3822C 0013812C 00008044 */  mtc1       $0, $f0
/* 38230 00138130 00000000 */  nop
/* 38234 00138134 34080046 */  c.lt.s     $f1, $f0
/* 38238 00138138 00000000 */  nop
/* 3823C 0013813C 08000045 */  bc1f       .L00138160
/* 38240 00138140 00000000 */   nop
/* 38244 00138144 2C44040C */  jal        fptosi
/* 38248 00138148 00000000 */   nop
/* 3824C 0013814C 000042AE */  sw         $2, 0x0($18)
/* 38250 00138150 080040AE */  sw         $0, 0x8($18)
/* 38254 00138154 0C0050AE */  sw         $16, 0xC($18)
/* 38258 00138158 05000010 */  b          .L00138170
/* 3825C 0013815C 00000000 */   nop
.L00138160:
/* 38260 00138160 01006324 */  addiu      $3, $3, 0x1
.L00138164:
/* 38264 00138164 06006228 */  slti       $2, $3, 0x6
/* 38268 00138168 E9FF4014 */  bnez       $2, .L00138110
/* 3826C 0013816C 00000000 */   nop
.L00138170:
/* 38270 00138170 281E0070 */  paddub     $3, $0, $0
/* 38274 00138174 18000010 */  b          .L001381D8
/* 38278 00138178 00000000 */   nop
.L0013817C:
/* 3827C 0013817C 80100300 */  sll        $2, $3, 2
/* 38280 00138180 21104300 */  addu       $2, $2, $3
/* 38284 00138184 80100200 */  sll        $2, $2, 2
/* 38288 00138188 21102202 */  addu       $2, $17, $2
/* 3828C 0013818C 600D5224 */  addiu      $18, $2, 0xD60
/* 38290 00138190 600D40C4 */  lwc1       $f0, 0xD60($2)
/* 38294 00138194 60008046 */  cvt.s.w    $f1, $f0
/* 38298 00138198 00008044 */  mtc1       $0, $f0
/* 3829C 0013819C 00000000 */  nop
/* 382A0 001381A0 34080046 */  c.lt.s     $f1, $f0
/* 382A4 001381A4 00000000 */  nop
/* 382A8 001381A8 0A000045 */  bc1f       .L001381D4
/* 382AC 001381AC 00000000 */   nop
/* 382B0 001381B0 06A30046 */  mov.s      $f12, $f20
/* 382B4 001381B4 2C44040C */  jal        fptosi
/* 382B8 001381B8 00000000 */   nop
/* 382BC 001381BC 000042AE */  sw         $2, 0x0($18)
/* 382C0 001381C0 01000224 */  addiu      $2, $0, 0x1
/* 382C4 001381C4 080042AE */  sw         $2, 0x8($18)
/* 382C8 001381C8 0C0050AE */  sw         $16, 0xC($18)
/* 382CC 001381CC 05000010 */  b          .L001381E4
/* 382D0 001381D0 00000000 */   nop
.L001381D4:
/* 382D4 001381D4 01006324 */  addiu      $3, $3, 0x1
.L001381D8:
/* 382D8 001381D8 06006228 */  slti       $2, $3, 0x6
/* 382DC 001381DC E7FF4014 */  bnez       $2, .L0013817C
/* 382E0 001381E0 00000000 */   nop
.L001381E4:
/* 382E4 001381E4 01000224 */  addiu      $2, $0, 0x1
/* 382E8 001381E8 4000BF7B */  lq         $31, 0x40($sp)
/* 382EC 001381EC 3000B27B */  lq         $18, 0x30($sp)
/* 382F0 001381F0 2000B17B */  lq         $17, 0x20($sp)
/* 382F4 001381F4 1000B07B */  lq         $16, 0x10($sp)
/* 382F8 001381F8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 382FC 001381FC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 38300 00138200 0800E003 */  jr         $31
/* 38304 00138204 00000000 */   nop
/* 38308 00138208 00000000 */  nop
/* 3830C 0013820C 00000000 */  nop
