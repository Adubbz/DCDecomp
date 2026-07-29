.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel get_obj_rot__FP10OBJ_HANDLEPf
/* 08ACA0 0018ABA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08ACA4 0018ABA4 0000BF7F */  sq          $31, 0x0($29)
/* 08ACA8 0018ABA8 0000838C */  lw          $3, 0x0($4)
/* 08ACAC 0018ABAC 08006010 */  beqz        $3, .L0018ABD0
/* 08ACB0 0018ABB0 00000000 */   nop
/* 08ACB4 0018ABB4 28266070 */  paddub      $4, $3, $0
/* 08ACB8 0018ABB8 A000798C */  lw          $25, 0xA0($3)
/* 08ACBC 0018ABBC 5800398F */  lw          $25, 0x58($25)
/* 08ACC0 0018ABC0 09F82003 */  jalr        $25
/* 08ACC4 0018ABC4 00000000 */   nop
/* 08ACC8 0018ABC8 1C000010 */  b           .L0018AC3C
/* 08ACCC 0018ABCC 00000000 */   nop
.L0018ABD0:
/* 08ACD0 0018ABD0 0400838C */  lw          $3, 0x4($4)
/* 08ACD4 0018ABD4 08006010 */  beqz        $3, .L0018ABF8
/* 08ACD8 0018ABD8 00000000 */   nop
/* 08ACDC 0018ABDC 28266070 */  paddub      $4, $3, $0
/* 08ACE0 0018ABE0 A000798C */  lw          $25, 0xA0($3)
/* 08ACE4 0018ABE4 5800398F */  lw          $25, 0x58($25)
/* 08ACE8 0018ABE8 09F82003 */  jalr        $25
/* 08ACEC 0018ABEC 00000000 */   nop
/* 08ACF0 0018ABF0 12000010 */  b           .L0018AC3C
/* 08ACF4 0018ABF4 00000000 */   nop
.L0018ABF8:
/* 08ACF8 0018ABF8 28360070 */  paddub      $6, $0, $0
/* 08ACFC 0018ABFC 0C000010 */  b           .L0018AC30
/* 08AD00 0018AC00 00000000 */   nop
.L0018AC04:
/* 08AD04 0018AC04 80180600 */  sll         $3, $6, 2
/* 08AD08 0018AC08 21186400 */  addu        $3, $3, $4
/* 08AD0C 0018AC0C 0800638C */  lw          $3, 0x8($3)
/* 08AD10 0018AC10 06006010 */  beqz        $3, .L0018AC2C
/* 08AD14 0018AC14 00000000 */   nop
/* 08AD18 0018AC18 28266070 */  paddub      $4, $3, $0
/* 08AD1C 0018AC1C 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 08AD20 0018AC20 00000000 */   nop
/* 08AD24 0018AC24 05000010 */  b           .L0018AC3C
/* 08AD28 0018AC28 00000000 */   nop
.L0018AC2C:
/* 08AD2C 0018AC2C 0100C624 */  addiu       $6, $6, 0x1
.L0018AC30:
/* 08AD30 0018AC30 0C00C328 */  slti        $3, $6, 0xC
/* 08AD34 0018AC34 F3FF6014 */  bnez        $3, .L0018AC04
/* 08AD38 0018AC38 00000000 */   nop
.L0018AC3C:
/* 08AD3C 0018AC3C 0000BF7B */  lq          $31, 0x0($29)
/* 08AD40 0018AC40 1000BD27 */  addiu       $29, $29, 0x10
/* 08AD44 0018AC44 0800E003 */  jr          $31
/* 08AD48 0018AC48 00000000 */   nop
/* 08AD4C 0018AC4C 00000000 */  nop
