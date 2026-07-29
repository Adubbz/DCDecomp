.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_OBJHDL_POS__FP12RS_STACKDATAi
/* 0BBEB0 001BBDB0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BBEB4 001BBDB4 2000BF7F */  sq          $31, 0x20($29)
/* 0BBEB8 001BBDB8 1000B07F */  sq          $16, 0x10($29)
/* 0BBEBC 001BBDBC 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0BBEC0 001BBDC0 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0BBEC4 001BBDC4 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0BBEC8 001BBDC8 08009024 */  addiu       $16, $4, 0x8
/* 0BBECC 001BBDCC 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBED0 001BBDD0 00000000 */   nop
/* 0BBED4 001BBDD4 281E4070 */  paddub      $3, $2, $0
/* 0BBED8 001BBDD8 28260072 */  paddub      $4, $16, $0
/* 0BBEDC 001BBDDC 08009024 */  addiu       $16, $4, 0x8
/* 0BBEE0 001BBDE0 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BBEE4 001BBDE4 00000000 */   nop
/* 0BBEE8 001BBDE8 06050046 */  mov.s       $f20, $f0
/* 0BBEEC 001BBDEC 28260072 */  paddub      $4, $16, $0
/* 0BBEF0 001BBDF0 08009024 */  addiu       $16, $4, 0x8
/* 0BBEF4 001BBDF4 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BBEF8 001BBDF8 00000000 */   nop
/* 0BBEFC 001BBDFC 46050046 */  mov.s       $f21, $f0
/* 0BBF00 001BBE00 28260072 */  paddub      $4, $16, $0
/* 0BBF04 001BBE04 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BBF08 001BBE08 00000000 */   nop
/* 0BBF0C 001BBE0C 86050046 */  mov.s       $f22, $f0
/* 0BBF10 001BBE10 28266070 */  paddub      $4, $3, $0
/* 0BBF14 001BBE14 80EC060C */  jal         GetObjHDL__Fi
/* 0BBF18 001BBE18 00000000 */   nop
/* 0BBF1C 001BBE1C 28864070 */  paddub      $16, $2, $0
/* 0BBF20 001BBE20 0800428C */  lw          $2, 0x8($2)
/* 0BBF24 001BBE24 09004014 */  bnez        $2, .L001BBE4C
/* 0BBF28 001BBE28 00000000 */   nop
/* 0BBF2C 001BBE2C 0000048E */  lw          $4, 0x0($16)
/* 0BBF30 001BBE30 06008010 */  beqz        $4, .L001BBE4C
/* 0BBF34 001BBE34 00000000 */   nop
/* 0BBF38 001BBE38 06A30046 */  mov.s       $f12, $f20
/* 0BBF3C 001BBE3C 46AB0046 */  mov.s       $f13, $f21
/* 0BBF40 001BBE40 86B30046 */  mov.s       $f14, $f22
/* 0BBF44 001BBE44 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0BBF48 001BBE48 00000000 */   nop
.L001BBE4C:
/* 0BBF4C 001BBE4C 0800038E */  lw          $3, 0x8($16)
/* 0BBF50 001BBE50 01000224 */  addiu       $2, $0, 0x1
/* 0BBF54 001BBE54 0B006214 */  bne         $3, $2, .L001BBE84
/* 0BBF58 001BBE58 00000000 */   nop
/* 0BBF5C 001BBE5C 0400048E */  lw          $4, 0x4($16)
/* 0BBF60 001BBE60 08008010 */  beqz        $4, .L001BBE84
/* 0BBF64 001BBE64 00000000 */   nop
/* 0BBF68 001BBE68 06A30046 */  mov.s       $f12, $f20
/* 0BBF6C 001BBE6C 46AB0046 */  mov.s       $f13, $f21
/* 0BBF70 001BBE70 86B30046 */  mov.s       $f14, $f22
/* 0BBF74 001BBE74 A000998C */  lw          $25, 0xA0($4)
/* 0BBF78 001BBE78 1800398F */  lw          $25, 0x18($25)
/* 0BBF7C 001BBE7C 09F82003 */  jalr        $25
/* 0BBF80 001BBE80 00000000 */   nop
.L001BBE84:
/* 0BBF84 001BBE84 01000224 */  addiu       $2, $0, 0x1
/* 0BBF88 001BBE88 2000BF7B */  lq          $31, 0x20($29)
/* 0BBF8C 001BBE8C 1000B07B */  lq          $16, 0x10($29)
/* 0BBF90 001BBE90 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0BBF94 001BBE94 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0BBF98 001BBE98 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0BBF9C 001BBE9C 3000BD27 */  addiu       $29, $29, 0x30
/* 0BBFA0 001BBEA0 0800E003 */  jr          $31
/* 0BBFA4 001BBEA4 00000000 */   nop
/* 0BBFA8 001BBEA8 00000000 */  nop
/* 0BBFAC 001BBEAC 00000000 */  nop
