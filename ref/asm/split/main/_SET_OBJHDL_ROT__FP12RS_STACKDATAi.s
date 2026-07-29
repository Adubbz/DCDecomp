.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_OBJHDL_ROT__FP12RS_STACKDATAi
/* 0BBFB0 001BBEB0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0BBFB4 001BBEB4 4000BF7F */  sq          $31, 0x40($29)
/* 0BBFB8 001BBEB8 3000B17F */  sq          $17, 0x30($29)
/* 0BBFBC 001BBEBC 2000B07F */  sq          $16, 0x20($29)
/* 0BBFC0 001BBEC0 1000B8E7 */  swc1        $f24, 0x10($29)
/* 0BBFC4 001BBEC4 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 0BBFC8 001BBEC8 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0BBFCC 001BBECC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0BBFD0 001BBED0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0BBFD4 001BBED4 08009024 */  addiu       $16, $4, 0x8
/* 0BBFD8 001BBED8 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBFDC 001BBEDC 00000000 */   nop
/* 0BBFE0 001BBEE0 281E4070 */  paddub      $3, $2, $0
/* 0BBFE4 001BBEE4 28260072 */  paddub      $4, $16, $0
/* 0BBFE8 001BBEE8 08009024 */  addiu       $16, $4, 0x8
/* 0BBFEC 001BBEEC 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BBFF0 001BBEF0 00000000 */   nop
/* 0BBFF4 001BBEF4 86050046 */  mov.s       $f22, $f0
/* 0BBFF8 001BBEF8 28260072 */  paddub      $4, $16, $0
/* 0BBFFC 001BBEFC 08009024 */  addiu       $16, $4, 0x8
/* 0BC000 001BBF00 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BC004 001BBF04 00000000 */   nop
/* 0BC008 001BBF08 C6050046 */  mov.s       $f23, $f0
/* 0BC00C 001BBF0C 28260072 */  paddub      $4, $16, $0
/* 0BC010 001BBF10 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BC014 001BBF14 00000000 */   nop
/* 0BC018 001BBF18 06060046 */  mov.s       $f24, $f0
/* 0BC01C 001BBF1C 28266070 */  paddub      $4, $3, $0
/* 0BC020 001BBF20 80EC060C */  jal         GetObjHDL__Fi
/* 0BC024 001BBF24 00000000 */   nop
/* 0BC028 001BBF28 28864070 */  paddub      $16, $2, $0
/* 0BC02C 001BBF2C 0800428C */  lw          $2, 0x8($2)
/* 0BC030 001BBF30 19004014 */  bnez        $2, .L001BBF98
/* 0BC034 001BBF34 00000000 */   nop
/* 0BC038 001BBF38 0000118E */  lw          $17, 0x0($16)
/* 0BC03C 001BBF3C 16002012 */  beqz        $17, .L001BBF98
/* 0BC040 001BBF40 00000000 */   nop
/* 0BC044 001BBF44 28262072 */  paddub      $4, $17, $0
/* 0BC048 001BBF48 02000524 */  addiu       $5, $0, 0x2
/* 0BC04C 001BBF4C A0A3040C */  jal         SetRotType__6CFrameFi
/* 0BC050 001BBF50 00000000 */   nop
/* 0BC054 001BBF54 06B30046 */  mov.s       $f12, $f22
/* 0BC058 001BBF58 F88E040C */  jal         AngleLimit__Ff
/* 0BC05C 001BBF5C 00000000 */   nop
/* 0BC060 001BBF60 46050046 */  mov.s       $f21, $f0
/* 0BC064 001BBF64 06BB0046 */  mov.s       $f12, $f23
/* 0BC068 001BBF68 F88E040C */  jal         AngleLimit__Ff
/* 0BC06C 001BBF6C 00000000 */   nop
/* 0BC070 001BBF70 06050046 */  mov.s       $f20, $f0
/* 0BC074 001BBF74 06C30046 */  mov.s       $f12, $f24
/* 0BC078 001BBF78 F88E040C */  jal         AngleLimit__Ff
/* 0BC07C 001BBF7C 00000000 */   nop
/* 0BC080 001BBF80 28262072 */  paddub      $4, $17, $0
/* 0BC084 001BBF84 06AB0046 */  mov.s       $f12, $f21
/* 0BC088 001BBF88 46A30046 */  mov.s       $f13, $f20
/* 0BC08C 001BBF8C 86030046 */  mov.s       $f14, $f0
/* 0BC090 001BBF90 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0BC094 001BBF94 00000000 */   nop
.L001BBF98:
/* 0BC098 001BBF98 0800038E */  lw          $3, 0x8($16)
/* 0BC09C 001BBF9C 01000224 */  addiu       $2, $0, 0x1
/* 0BC0A0 001BBFA0 17006214 */  bne         $3, $2, .L001BC000
/* 0BC0A4 001BBFA4 00000000 */   nop
/* 0BC0A8 001BBFA8 0400108E */  lw          $16, 0x4($16)
/* 0BC0AC 001BBFAC 14000012 */  beqz        $16, .L001BC000
/* 0BC0B0 001BBFB0 00000000 */   nop
/* 0BC0B4 001BBFB4 06B30046 */  mov.s       $f12, $f22
/* 0BC0B8 001BBFB8 F88E040C */  jal         AngleLimit__Ff
/* 0BC0BC 001BBFBC 00000000 */   nop
/* 0BC0C0 001BBFC0 46050046 */  mov.s       $f21, $f0
/* 0BC0C4 001BBFC4 06BB0046 */  mov.s       $f12, $f23
/* 0BC0C8 001BBFC8 F88E040C */  jal         AngleLimit__Ff
/* 0BC0CC 001BBFCC 00000000 */   nop
/* 0BC0D0 001BBFD0 06050046 */  mov.s       $f20, $f0
/* 0BC0D4 001BBFD4 06C30046 */  mov.s       $f12, $f24
/* 0BC0D8 001BBFD8 F88E040C */  jal         AngleLimit__Ff
/* 0BC0DC 001BBFDC 00000000 */   nop
/* 0BC0E0 001BBFE0 28260072 */  paddub      $4, $16, $0
/* 0BC0E4 001BBFE4 06AB0046 */  mov.s       $f12, $f21
/* 0BC0E8 001BBFE8 46A30046 */  mov.s       $f13, $f20
/* 0BC0EC 001BBFEC 86030046 */  mov.s       $f14, $f0
/* 0BC0F0 001BBFF0 A000198E */  lw          $25, 0xA0($16)
/* 0BC0F4 001BBFF4 3000398F */  lw          $25, 0x30($25)
/* 0BC0F8 001BBFF8 09F82003 */  jalr        $25
/* 0BC0FC 001BBFFC 00000000 */   nop
.L001BC000:
/* 0BC100 001BC000 01000224 */  addiu       $2, $0, 0x1
/* 0BC104 001BC004 4000BF7B */  lq          $31, 0x40($29)
/* 0BC108 001BC008 3000B17B */  lq          $17, 0x30($29)
/* 0BC10C 001BC00C 2000B07B */  lq          $16, 0x20($29)
/* 0BC110 001BC010 1000B8C7 */  lwc1        $f24, 0x10($29)
/* 0BC114 001BC014 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 0BC118 001BC018 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0BC11C 001BC01C 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0BC120 001BC020 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0BC124 001BC024 5000BD27 */  addiu       $29, $29, 0x50
/* 0BC128 001BC028 0800E003 */  jr          $31
/* 0BC12C 001BC02C 00000000 */   nop
