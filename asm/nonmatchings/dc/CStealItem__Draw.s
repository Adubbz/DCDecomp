.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__10CStealItemFv
/* D7A40 001D7940 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* D7A44 001D7944 2000BF7F */  sq         $31, 0x20($sp)
/* D7A48 001D7948 1000B17F */  sq         $17, 0x10($sp)
/* D7A4C 001D794C 0000B07F */  sq         $16, 0x0($sp)
/* D7A50 001D7950 288E8070 */  paddub     $17, $4, $0
/* D7A54 001D7954 28860070 */  paddub     $16, $0, $0
/* D7A58 001D7958 18000010 */  b          .L001D79BC
/* D7A5C 001D795C 00000000 */   nop
.L001D7960:
/* D7A60 001D7960 80181000 */  sll        $3, $16, 2
/* D7A64 001D7964 21187100 */  addu       $3, $3, $17
/* D7A68 001D7968 D000648C */  lw         $4, 0xD0($3)
/* D7A6C 001D796C FFFF0324 */  addiu      $3, $0, -0x1
/* D7A70 001D7970 11008310 */  beq        $4, $3, .L001D79B8
/* D7A74 001D7974 00000000 */   nop
/* D7A78 001D7978 00111000 */  sll        $2, $16, 4
/* D7A7C 001D797C 21102202 */  addu       $2, $17, $2
/* D7A80 001D7980 0000248E */  lw         $4, 0x0($17)
/* D7A84 001D7984 10004524 */  addiu      $5, $2, 0x10
/* D7A88 001D7988 B89F040C */  jal        SetPosition__6CFrameFPf
/* D7A8C 001D798C 00000000 */   nop
/* D7A90 001D7990 00688044 */  mtc1       $0, $f13
/* D7A94 001D7994 00000000 */  nop
/* D7A98 001D7998 866B0046 */  mov.s      $f14, $f13
/* D7A9C 001D799C 0000248E */  lw         $4, 0x0($17)
/* D7AA0 001D79A0 10012CC6 */  lwc1       $f12, 0x110($17)
/* D7AA4 001D79A4 70A3040C */  jal        SetRotation__6CFrameFfff
/* D7AA8 001D79A8 00000000 */   nop
/* D7AAC 001D79AC 0000248E */  lw         $4, 0x0($17)
/* D7AB0 001D79B0 60BB040C */  jal        MGDraw__FP6CFrame
/* D7AB4 001D79B4 00000000 */   nop
.L001D79B8:
/* D7AB8 001D79B8 01001026 */  addiu      $16, $16, 0x1
.L001D79BC:
/* D7ABC 001D79BC 0800032A */  slti       $3, $16, 0x8
/* D7AC0 001D79C0 E7FF6014 */  bnez       $3, .L001D7960
/* D7AC4 001D79C4 00000000 */   nop
/* D7AC8 001D79C8 2000BF7B */  lq         $31, 0x20($sp)
/* D7ACC 001D79CC 1000B17B */  lq         $17, 0x10($sp)
/* D7AD0 001D79D0 0000B07B */  lq         $16, 0x0($sp)
/* D7AD4 001D79D4 3000BD27 */  addiu      $sp, $sp, 0x30
/* D7AD8 001D79D8 0800E003 */  jr         $31
/* D7ADC 001D79DC 00000000 */   nop
