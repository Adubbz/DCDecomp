.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuTextureDelete__FPi
/* 12D230 0022D130 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12D234 0022D134 3000BF7F */  sq         $31, 0x30($sp)
/* 12D238 0022D138 2000B27F */  sq         $18, 0x20($sp)
/* 12D23C 0022D13C 1000B17F */  sq         $17, 0x10($sp)
/* 12D240 0022D140 0000B07F */  sq         $16, 0x0($sp)
/* 12D244 0022D144 28968070 */  paddub     $18, $4, $0
/* 12D248 0022D148 28860070 */  paddub     $16, $0, $0
/* 12D24C 0022D14C 0B000010 */  b          .L0022D17C
/* 12D250 0022D150 00000000 */   nop
.L0022D154:
/* 12D254 0022D154 C701023C */  lui        $2, %hi(TexManager)
/* 12D258 0022D158 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12D25C 0022D15C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 12D260 0022D160 00000000 */   nop
/* 12D264 0022D164 2A00023C */  lui        $2, %hi(_728_6)
/* 12D268 0022D168 80F14424 */  addiu      $4, $2, %lo(_728_6)
/* 12D26C 0022D16C 0000258E */  lw         $5, 0x0($17)
/* 12D270 0022D170 A611040C */  jal        printf
/* 12D274 0022D174 00000000 */   nop
/* 12D278 0022D178 01001026 */  addiu      $16, $16, 0x1
.L0022D17C:
/* 12D27C 0022D17C 80181000 */  sll        $3, $16, 2
/* 12D280 0022D180 21884302 */  addu       $17, $18, $3
/* 12D284 0022D184 0000258E */  lw         $5, 0x0($17)
/* 12D288 0022D188 FFFF0324 */  addiu      $3, $0, -0x1
/* 12D28C 0022D18C F1FFA314 */  bne        $5, $3, .L0022D154
/* 12D290 0022D190 00000000 */   nop
/* 12D294 0022D194 3000BF7B */  lq         $31, 0x30($sp)
/* 12D298 0022D198 2000B27B */  lq         $18, 0x20($sp)
/* 12D29C 0022D19C 1000B17B */  lq         $17, 0x10($sp)
/* 12D2A0 0022D1A0 0000B07B */  lq         $16, 0x0($sp)
/* 12D2A4 0022D1A4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12D2A8 0022D1A8 0800E003 */  jr         $31
/* 12D2AC 0022D1AC 00000000 */   nop
