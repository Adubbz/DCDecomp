.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_OBJHDL_ROT__FP12RS_STACKDATAi
/* BBFB0 001BBEB0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* BBFB4 001BBEB4 4000BF7F */  sq         $31, 0x40($sp)
/* BBFB8 001BBEB8 3000B17F */  sq         $17, 0x30($sp)
/* BBFBC 001BBEBC 2000B07F */  sq         $16, 0x20($sp)
/* BBFC0 001BBEC0 1000B8E7 */  swc1       $f24, 0x10($sp)
/* BBFC4 001BBEC4 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* BBFC8 001BBEC8 0800B6E7 */  swc1       $f22, 0x8($sp)
/* BBFCC 001BBECC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* BBFD0 001BBED0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* BBFD4 001BBED4 08009024 */  addiu      $16, $4, 0x8
/* BBFD8 001BBED8 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBFDC 001BBEDC 00000000 */   nop
/* BBFE0 001BBEE0 281E4070 */  paddub     $3, $2, $0
/* BBFE4 001BBEE4 28260072 */  paddub     $4, $16, $0
/* BBFE8 001BBEE8 08009024 */  addiu      $16, $4, 0x8
/* BBFEC 001BBEEC 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BBFF0 001BBEF0 00000000 */   nop
/* BBFF4 001BBEF4 86050046 */  mov.s      $f22, $f0
/* BBFF8 001BBEF8 28260072 */  paddub     $4, $16, $0
/* BBFFC 001BBEFC 08009024 */  addiu      $16, $4, 0x8
/* BC000 001BBF00 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC004 001BBF04 00000000 */   nop
/* BC008 001BBF08 C6050046 */  mov.s      $f23, $f0
/* BC00C 001BBF0C 28260072 */  paddub     $4, $16, $0
/* BC010 001BBF10 60EE060C */  jal        GetStackFloat__FP12RS_STACKDATA_2
/* BC014 001BBF14 00000000 */   nop
/* BC018 001BBF18 06060046 */  mov.s      $f24, $f0
/* BC01C 001BBF1C 28266070 */  paddub     $4, $3, $0
/* BC020 001BBF20 80EC060C */  jal        GetObjHDL__Fi
/* BC024 001BBF24 00000000 */   nop
/* BC028 001BBF28 28864070 */  paddub     $16, $2, $0
/* BC02C 001BBF2C 0800428C */  lw         $2, 0x8($2)
/* BC030 001BBF30 19004014 */  bnez       $2, .L001BBF98
/* BC034 001BBF34 00000000 */   nop
/* BC038 001BBF38 0000118E */  lw         $17, 0x0($16)
/* BC03C 001BBF3C 16002012 */  beqz       $17, .L001BBF98
/* BC040 001BBF40 00000000 */   nop
/* BC044 001BBF44 28262072 */  paddub     $4, $17, $0
/* BC048 001BBF48 02000524 */  addiu      $5, $0, 0x2
/* BC04C 001BBF4C A0A3040C */  jal        SetRotType__6CFrameFi
/* BC050 001BBF50 00000000 */   nop
/* BC054 001BBF54 06B30046 */  mov.s      $f12, $f22
/* BC058 001BBF58 F88E040C */  jal        AngleLimit__Ff
/* BC05C 001BBF5C 00000000 */   nop
/* BC060 001BBF60 46050046 */  mov.s      $f21, $f0
/* BC064 001BBF64 06BB0046 */  mov.s      $f12, $f23
/* BC068 001BBF68 F88E040C */  jal        AngleLimit__Ff
/* BC06C 001BBF6C 00000000 */   nop
/* BC070 001BBF70 06050046 */  mov.s      $f20, $f0
/* BC074 001BBF74 06C30046 */  mov.s      $f12, $f24
/* BC078 001BBF78 F88E040C */  jal        AngleLimit__Ff
/* BC07C 001BBF7C 00000000 */   nop
/* BC080 001BBF80 28262072 */  paddub     $4, $17, $0
/* BC084 001BBF84 06AB0046 */  mov.s      $f12, $f21
/* BC088 001BBF88 46A30046 */  mov.s      $f13, $f20
/* BC08C 001BBF8C 86030046 */  mov.s      $f14, $f0
/* BC090 001BBF90 70A3040C */  jal        SetRotation__6CFrameFfff
/* BC094 001BBF94 00000000 */   nop
.L001BBF98:
/* BC098 001BBF98 0800038E */  lw         $3, 0x8($16)
/* BC09C 001BBF9C 01000224 */  addiu      $2, $0, 0x1
/* BC0A0 001BBFA0 17006214 */  bne        $3, $2, .L001BC000
/* BC0A4 001BBFA4 00000000 */   nop
/* BC0A8 001BBFA8 0400108E */  lw         $16, 0x4($16)
/* BC0AC 001BBFAC 14000012 */  beqz       $16, .L001BC000
/* BC0B0 001BBFB0 00000000 */   nop
/* BC0B4 001BBFB4 06B30046 */  mov.s      $f12, $f22
/* BC0B8 001BBFB8 F88E040C */  jal        AngleLimit__Ff
/* BC0BC 001BBFBC 00000000 */   nop
/* BC0C0 001BBFC0 46050046 */  mov.s      $f21, $f0
/* BC0C4 001BBFC4 06BB0046 */  mov.s      $f12, $f23
/* BC0C8 001BBFC8 F88E040C */  jal        AngleLimit__Ff
/* BC0CC 001BBFCC 00000000 */   nop
/* BC0D0 001BBFD0 06050046 */  mov.s      $f20, $f0
/* BC0D4 001BBFD4 06C30046 */  mov.s      $f12, $f24
/* BC0D8 001BBFD8 F88E040C */  jal        AngleLimit__Ff
/* BC0DC 001BBFDC 00000000 */   nop
/* BC0E0 001BBFE0 28260072 */  paddub     $4, $16, $0
/* BC0E4 001BBFE4 06AB0046 */  mov.s      $f12, $f21
/* BC0E8 001BBFE8 46A30046 */  mov.s      $f13, $f20
/* BC0EC 001BBFEC 86030046 */  mov.s      $f14, $f0
/* BC0F0 001BBFF0 A000198E */  lw         $25, 0xA0($16)
/* BC0F4 001BBFF4 3000398F */  lw         $25, 0x30($25)
/* BC0F8 001BBFF8 09F82003 */  jalr       $25
/* BC0FC 001BBFFC 00000000 */   nop
.L001BC000:
/* BC100 001BC000 01000224 */  addiu      $2, $0, 0x1
/* BC104 001BC004 4000BF7B */  lq         $31, 0x40($sp)
/* BC108 001BC008 3000B17B */  lq         $17, 0x30($sp)
/* BC10C 001BC00C 2000B07B */  lq         $16, 0x20($sp)
/* BC110 001BC010 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* BC114 001BC014 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* BC118 001BC018 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* BC11C 001BC01C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* BC120 001BC020 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* BC124 001BC024 5000BD27 */  addiu      $sp, $sp, 0x50
/* BC128 001BC028 0800E003 */  jr         $31
/* BC12C 001BC02C 00000000 */   nop
