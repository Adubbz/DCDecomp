.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_obj_rot__FP10OBJ_HANDLEPf
/* 8ACA0 0018ABA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8ACA4 0018ABA4 0000BF7F */  sq         $31, 0x0($sp)
/* 8ACA8 0018ABA8 0000838C */  lw         $3, 0x0($4)
/* 8ACAC 0018ABAC 08006010 */  beqz       $3, .L0018ABD0
/* 8ACB0 0018ABB0 00000000 */   nop
/* 8ACB4 0018ABB4 28266070 */  paddub     $4, $3, $0
/* 8ACB8 0018ABB8 A000798C */  lw         $25, 0xA0($3)
/* 8ACBC 0018ABBC 5800398F */  lw         $25, 0x58($25)
/* 8ACC0 0018ABC0 09F82003 */  jalr       $25
/* 8ACC4 0018ABC4 00000000 */   nop
/* 8ACC8 0018ABC8 1C000010 */  b          .L0018AC3C
/* 8ACCC 0018ABCC 00000000 */   nop
.L0018ABD0:
/* 8ACD0 0018ABD0 0400838C */  lw         $3, 0x4($4)
/* 8ACD4 0018ABD4 08006010 */  beqz       $3, .L0018ABF8
/* 8ACD8 0018ABD8 00000000 */   nop
/* 8ACDC 0018ABDC 28266070 */  paddub     $4, $3, $0
/* 8ACE0 0018ABE0 A000798C */  lw         $25, 0xA0($3)
/* 8ACE4 0018ABE4 5800398F */  lw         $25, 0x58($25)
/* 8ACE8 0018ABE8 09F82003 */  jalr       $25
/* 8ACEC 0018ABEC 00000000 */   nop
/* 8ACF0 0018ABF0 12000010 */  b          .L0018AC3C
/* 8ACF4 0018ABF4 00000000 */   nop
.L0018ABF8:
/* 8ACF8 0018ABF8 28360070 */  paddub     $6, $0, $0
/* 8ACFC 0018ABFC 0C000010 */  b          .L0018AC30
/* 8AD00 0018AC00 00000000 */   nop
.L0018AC04:
/* 8AD04 0018AC04 80180600 */  sll        $3, $6, 2
/* 8AD08 0018AC08 21186400 */  addu       $3, $3, $4
/* 8AD0C 0018AC0C 0800638C */  lw         $3, 0x8($3)
/* 8AD10 0018AC10 06006010 */  beqz       $3, .L0018AC2C
/* 8AD14 0018AC14 00000000 */   nop
/* 8AD18 0018AC18 28266070 */  paddub     $4, $3, $0
/* 8AD1C 0018AC1C 8CA3040C */  jal        GetRotation__6CFrameFPf
/* 8AD20 0018AC20 00000000 */   nop
/* 8AD24 0018AC24 05000010 */  b          .L0018AC3C
/* 8AD28 0018AC28 00000000 */   nop
.L0018AC2C:
/* 8AD2C 0018AC2C 0100C624 */  addiu      $6, $6, 0x1
.L0018AC30:
/* 8AD30 0018AC30 0C00C328 */  slti       $3, $6, 0xC
/* 8AD34 0018AC34 F3FF6014 */  bnez       $3, .L0018AC04
/* 8AD38 0018AC38 00000000 */   nop
.L0018AC3C:
/* 8AD3C 0018AC3C 0000BF7B */  lq         $31, 0x0($sp)
/* 8AD40 0018AC40 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8AD44 0018AC44 0800E003 */  jr         $31
/* 8AD48 0018AC48 00000000 */   nop
/* 8AD4C 0018AC4C 00000000 */  nop
