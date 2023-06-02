.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeOutToEvent__Fii
/* 77C70 00177B70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77C74 00177B74 0000BF7F */  sq         $31, 0x0($sp)
/* 77C78 00177B78 3087828F */  lw         $2, -0x78D0($gp)
/* 77C7C 00177B7C 04004014 */  bnez       $2, .L00177B90
/* 77C80 00177B80 00000000 */   nop
/* 77C84 00177B84 28160070 */  paddub     $2, $0, $0
/* 77C88 00177B88 15000010 */  b          .L00177BE0
/* 77C8C 00177B8C 00000000 */   nop
.L00177B90:
/* 77C90 00177B90 A890828F */  lw         $2, -0x6F58($gp)
/* 77C94 00177B94 08004010 */  beqz       $2, .L00177BB8
/* 77C98 00177B98 00000000 */   nop
/* 77C9C 00177B9C AC90828F */  lw         $2, -0x6F54($gp)
/* 77CA0 00177BA0 2A084500 */  slt        $at, $2, $5
/* 77CA4 00177BA4 04002014 */  bnez       $at, .L00177BB8
/* 77CA8 00177BA8 00000000 */   nop
/* 77CAC 00177BAC 28160070 */  paddub     $2, $0, $0
/* 77CB0 00177BB0 0B000010 */  b          .L00177BE0
/* 77CB4 00177BB4 00000000 */   nop
.L00177BB8:
/* 77CB8 00177BB8 A89084AF */  sw         $4, -0x6F58($gp)
/* 77CBC 00177BBC AC9085AF */  sw         $5, -0x6F54($gp)
/* 77CC0 00177BC0 00608044 */  mtc1       $0, $f12
/* 77CC4 00177BC4 00000000 */  nop
/* 77CC8 00177BC8 46630046 */  mov.s      $f13, $f12
/* 77CCC 00177BCC 86630046 */  mov.s      $f14, $f12
/* 77CD0 00177BD0 3C000424 */  addiu      $4, $0, 0x3C
/* 77CD4 00177BD4 E425060C */  jal        EdFadeOut__Fifff
/* 77CD8 00177BD8 00000000 */   nop
/* 77CDC 00177BDC 01000224 */  addiu      $2, $0, 0x1
.L00177BE0:
/* 77CE0 00177BE0 0000BF7B */  lq         $31, 0x0($sp)
/* 77CE4 00177BE4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 77CE8 00177BE8 0800E003 */  jr         $31
/* 77CEC 00177BEC 00000000 */   nop
