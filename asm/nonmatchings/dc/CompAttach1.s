.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST
/* EBF40 001EBE40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* EBF44 001EBE44 3000BF7F */  sq         $31, 0x30($sp)
/* EBF48 001EBE48 2000B27F */  sq         $18, 0x20($sp)
/* EBF4C 001EBE4C 1000B17F */  sq         $17, 0x10($sp)
/* EBF50 001EBE50 0000B07F */  sq         $16, 0x0($sp)
/* EBF54 001EBE54 288E8070 */  paddub     $17, $4, $0
/* EBF58 001EBE58 2886A070 */  paddub     $16, $5, $0
/* EBF5C 001EBE5C 00008484 */  lh         $4, 0x0($4)
/* EBF60 001EBE60 B4C6080C */  jal        GetAttachKind__Fi
/* EBF64 001EBE64 00000000 */   nop
/* EBF68 001EBE68 80180200 */  sll        $3, $2, 2
/* EBF6C 001EBE6C 2900023C */  lui        $2, %hi(asort_table)
/* EBF70 001EBE70 00284224 */  addiu      $2, $2, %lo(asort_table)
/* EBF74 001EBE74 21104300 */  addu       $2, $2, $3
/* EBF78 001EBE78 0000528C */  lw         $18, 0x0($2)
/* EBF7C 001EBE7C 00000486 */  lh         $4, 0x0($16)
/* EBF80 001EBE80 B4C6080C */  jal        GetAttachKind__Fi
/* EBF84 001EBE84 00000000 */   nop
/* EBF88 001EBE88 80180200 */  sll        $3, $2, 2
/* EBF8C 001EBE8C 2900023C */  lui        $2, %hi(asort_table)
/* EBF90 001EBE90 00284224 */  addiu      $2, $2, %lo(asort_table)
/* EBF94 001EBE94 21104300 */  addu       $2, $2, $3
/* EBF98 001EBE98 0000428C */  lw         $2, 0x0($2)
/* EBF9C 001EBE9C 00002486 */  lh         $4, 0x0($17)
/* EBFA0 001EBEA0 51008128 */  slti       $at, $4, 0x51
/* EBFA4 001EBEA4 02002010 */  beqz       $at, .L001EBEB0
/* EBFA8 001EBEA8 00000000 */   nop
/* EBFAC 001EBEAC 05001224 */  addiu      $18, $0, 0x5
.L001EBEB0:
/* EBFB0 001EBEB0 00000386 */  lh         $3, 0x0($16)
/* EBFB4 001EBEB4 51006128 */  slti       $at, $3, 0x51
/* EBFB8 001EBEB8 02002010 */  beqz       $at, .L001EBEC4
/* EBFBC 001EBEBC 00000000 */   nop
/* EBFC0 001EBEC0 05000224 */  addiu      $2, $0, 0x5
.L001EBEC4:
/* EBFC4 001EBEC4 2A085200 */  slt        $at, $2, $18
/* EBFC8 001EBEC8 04002010 */  beqz       $at, .L001EBEDC
/* EBFCC 001EBECC 00000000 */   nop
/* EBFD0 001EBED0 01000224 */  addiu      $2, $0, 0x1
/* EBFD4 001EBED4 12000010 */  b          .L001EBF20
/* EBFD8 001EBED8 00000000 */   nop
.L001EBEDC:
/* EBFDC 001EBEDC 2A084202 */  slt        $at, $18, $2
/* EBFE0 001EBEE0 04002010 */  beqz       $at, .L001EBEF4
/* EBFE4 001EBEE4 00000000 */   nop
/* EBFE8 001EBEE8 FFFF0224 */  addiu      $2, $0, -0x1
/* EBFEC 001EBEEC 0C000010 */  b          .L001EBF20
/* EBFF0 001EBEF0 00000000 */   nop
.L001EBEF4:
/* EBFF4 001EBEF4 2A086400 */  slt        $at, $3, $4
/* EBFF8 001EBEF8 04002010 */  beqz       $at, .L001EBF0C
/* EBFFC 001EBEFC 00000000 */   nop
/* EC000 001EBF00 01000224 */  addiu      $2, $0, 0x1
/* EC004 001EBF04 06000010 */  b          .L001EBF20
/* EC008 001EBF08 00000000 */   nop
.L001EBF0C:
/* EC00C 001EBF0C 2A088300 */  slt        $at, $4, $3
/* EC010 001EBF10 FFFF0224 */  addiu      $2, $0, -0x1
/* EC014 001EBF14 0A100100 */  movz       $2, $0, $at
/* EC018 001EBF18 01000010 */  b          .L001EBF20
/* EC01C 001EBF1C 00000000 */   nop
.L001EBF20:
/* EC020 001EBF20 3000BF7B */  lq         $31, 0x30($sp)
/* EC024 001EBF24 2000B27B */  lq         $18, 0x20($sp)
/* EC028 001EBF28 1000B17B */  lq         $17, 0x10($sp)
/* EC02C 001EBF2C 0000B07B */  lq         $16, 0x0($sp)
/* EC030 001EBF30 4000BD27 */  addiu      $sp, $sp, 0x40
/* EC034 001EBF34 0800E003 */  jr         $31
/* EC038 001EBF38 00000000 */   nop
/* EC03C 001EBF3C 00000000 */  nop
