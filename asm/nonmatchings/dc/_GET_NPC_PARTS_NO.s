.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_PARTS_NO__FP12RS_STACKDATAi
/* 8EAF0 0018E9F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8EAF4 0018E9F4 1000BF7F */  sq         $31, 0x10($sp)
/* 8EAF8 0018E9F8 0000B07F */  sq         $16, 0x0($sp)
/* 8EAFC 0018E9FC 0200A128 */  slti       $at, $5, 0x2
/* 8EB00 0018EA00 04002010 */  beqz       $at, .L0018EA14
/* 8EB04 0018EA04 00000000 */   nop
/* 8EB08 0018EA08 28160070 */  paddub     $2, $0, $0
/* 8EB0C 0018EA0C 17000010 */  b          .L0018EA6C
/* 8EB10 0018EA10 00000000 */   nop
.L0018EA14:
/* 8EB14 0018EA14 08009024 */  addiu      $16, $4, 0x8
/* 8EB18 0018EA18 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EB1C 0018EA1C 00000000 */   nop
/* 8EB20 0018EA20 04004004 */  bltz       $2, .L0018EA34
/* 8EB24 0018EA24 00000000 */   nop
/* 8EB28 0018EA28 10004328 */  slti       $3, $2, 0x10
/* 8EB2C 0018EA2C 04006014 */  bnez       $3, .L0018EA40
/* 8EB30 0018EA30 00000000 */   nop
.L0018EA34:
/* 8EB34 0018EA34 28160070 */  paddub     $2, $0, $0
/* 8EB38 0018EA38 0C000010 */  b          .L0018EA6C
/* 8EB3C 0018EA3C 00000000 */   nop
.L0018EA40:
/* 8EB40 0018EA40 28260072 */  paddub     $4, $16, $0
/* 8EB44 0018EA44 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8EB48 0018EA48 CCD3258C */  lw         $5, -0x2C34($at)
/* 8EB4C 0018EA4C C0180200 */  sll        $3, $2, 3
/* 8EB50 0018EA50 21106200 */  addu       $2, $3, $2
/* 8EB54 0018EA54 00110200 */  sll        $2, $2, 4
/* 8EB58 0018EA58 21104500 */  addu       $2, $2, $5
/* 8EB5C 0018EA5C 4800458C */  lw         $5, 0x48($2)
/* 8EB60 0018EA60 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8EB64 0018EA64 00000000 */   nop
/* 8EB68 0018EA68 01000224 */  addiu      $2, $0, 0x1
.L0018EA6C:
/* 8EB6C 0018EA6C 1000BF7B */  lq         $31, 0x10($sp)
/* 8EB70 0018EA70 0000B07B */  lq         $16, 0x0($sp)
/* 8EB74 0018EA74 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8EB78 0018EA78 0800E003 */  jr         $31
/* 8EB7C 0018EA7C 00000000 */   nop
