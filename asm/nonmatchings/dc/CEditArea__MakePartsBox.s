.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakePartsBox__9CEditAreaFv
/* 6F000 0016EF00 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 6F004 0016EF04 4000BF7F */  sq         $31, 0x40($sp)
/* 6F008 0016EF08 3000B37F */  sq         $19, 0x30($sp)
/* 6F00C 0016EF0C 2000B27F */  sq         $18, 0x20($sp)
/* 6F010 0016EF10 1000B17F */  sq         $17, 0x10($sp)
/* 6F014 0016EF14 0000B07F */  sq         $16, 0x0($sp)
/* 6F018 0016EF18 288E8070 */  paddub     $17, $4, $0
/* 6F01C 0016EF1C 28360070 */  paddub     $6, $0, $0
/* 6F020 0016EF20 28460070 */  paddub     $8, $0, $0
/* 6F024 0016EF24 28860070 */  paddub     $16, $0, $0
/* 6F028 0016EF28 28260070 */  paddub     $4, $0, $0
/* 6F02C 0016EF2C 28000010 */  b          .L0016EFD0
/* 6F030 0016EF30 00000000 */   nop
.L0016EF34:
/* 6F034 0016EF34 282E0070 */  paddub     $5, $0, $0
/* 6F038 0016EF38 20000010 */  b          .L0016EFBC
/* 6F03C 0016EF3C 00000000 */   nop
.L0016EF40:
/* 6F040 0016EF40 C0100400 */  sll        $2, $4, 3
/* 6F044 0016EF44 23104400 */  subu       $2, $2, $4
/* 6F048 0016EF48 80110200 */  sll        $2, $2, 6
/* 6F04C 0016EF4C 21185100 */  addu       $3, $2, $17
/* 6F050 0016EF50 C0100500 */  sll        $2, $5, 3
/* 6F054 0016EF54 23104500 */  subu       $2, $2, $5
/* 6F058 0016EF58 80100200 */  sll        $2, $2, 2
/* 6F05C 0016EF5C 21184300 */  addu       $3, $2, $3
/* 6F060 0016EF60 2800628C */  lw         $2, 0x28($3)
/* 6F064 0016EF64 14004004 */  bltz       $2, .L0016EFB8
/* 6F068 0016EF68 00000000 */   nop
/* 6F06C 0016EF6C 3400628C */  lw         $2, 0x34($3)
/* 6F070 0016EF70 11004004 */  bltz       $2, .L0016EFB8
/* 6F074 0016EF74 00000000 */   nop
/* 6F078 0016EF78 2A08C400 */  slt        $at, $6, $4
/* 6F07C 0016EF7C 02002010 */  beqz       $at, .L0016EF88
/* 6F080 0016EF80 00000000 */   nop
/* 6F084 0016EF84 28368070 */  paddub     $6, $4, $0
.L0016EF88:
/* 6F088 0016EF88 2A080501 */  slt        $at, $8, $5
/* 6F08C 0016EF8C 02002010 */  beqz       $at, .L0016EF98
/* 6F090 0016EF90 00000000 */   nop
/* 6F094 0016EF94 2846A070 */  paddub     $8, $5, $0
.L0016EF98:
/* 6F098 0016EF98 2A088000 */  slt        $at, $4, $0
/* 6F09C 0016EF9C 02002010 */  beqz       $at, .L0016EFA8
/* 6F0A0 0016EFA0 00000000 */   nop
/* 6F0A4 0016EFA4 28368070 */  paddub     $6, $4, $0
.L0016EFA8:
/* 6F0A8 0016EFA8 2A08B000 */  slt        $at, $5, $16
/* 6F0AC 0016EFAC 02002010 */  beqz       $at, .L0016EFB8
/* 6F0B0 0016EFB0 00000000 */   nop
/* 6F0B4 0016EFB4 2886A070 */  paddub     $16, $5, $0
.L0016EFB8:
/* 6F0B8 0016EFB8 0100A524 */  addiu      $5, $5, 0x1
.L0016EFBC:
/* 6F0BC 0016EFBC 0C00228E */  lw         $2, 0xC($17)
/* 6F0C0 0016EFC0 2A10A200 */  slt        $2, $5, $2
/* 6F0C4 0016EFC4 DEFF4014 */  bnez       $2, .L0016EF40
/* 6F0C8 0016EFC8 00000000 */   nop
/* 6F0CC 0016EFCC 01008424 */  addiu      $4, $4, 0x1
.L0016EFD0:
/* 6F0D0 0016EFD0 0800228E */  lw         $2, 0x8($17)
/* 6F0D4 0016EFD4 2A108200 */  slt        $2, $4, $2
/* 6F0D8 0016EFD8 D6FF4014 */  bnez       $2, .L0016EF34
/* 6F0DC 0016EFDC 00000000 */   nop
/* 6F0E0 0016EFE0 28262072 */  paddub     $4, $17, $0
/* 6F0E4 0016EFE4 5000A527 */  addiu      $5, $sp, 0x50
/* 6F0E8 0016EFE8 283E0070 */  paddub     $7, $0, $0
/* 6F0EC 0016EFEC 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* 6F0F0 0016EFF0 00000000 */   nop
/* 6F0F4 0016EFF4 200021C6 */  lwc1       $f1, 0x20($17)
/* 6F0F8 0016EFF8 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* 6F0FC 0016EFFC 00000146 */  add.s      $f0, $f0, $f1
/* 6F100 0016F000 302020E6 */  swc1       $f0, 0x2030($17)
/* 6F104 0016F004 5400B227 */  addiu      $18, $sp, 0x54
/* 6F108 0016F008 000040C6 */  lwc1       $f0, 0x0($18)
/* 6F10C 0016F00C 342020E6 */  swc1       $f0, 0x2034($17)
/* 6F110 0016F010 5800B327 */  addiu      $19, $sp, 0x58
/* 6F114 0016F014 000061C6 */  lwc1       $f1, 0x0($19)
/* 6F118 0016F018 200020C6 */  lwc1       $f0, 0x20($17)
/* 6F11C 0016F01C 00080046 */  add.s      $f0, $f1, $f0
/* 6F120 0016F020 382020E6 */  swc1       $f0, 0x2038($17)
/* 6F124 0016F024 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 6F128 0016F028 3C2022AE */  sw         $2, 0x203C($17)
/* 6F12C 0016F02C 28262072 */  paddub     $4, $17, $0
/* 6F130 0016F030 5000A527 */  addiu      $5, $sp, 0x50
/* 6F134 0016F034 28360070 */  paddub     $6, $0, $0
/* 6F138 0016F038 283E0070 */  paddub     $7, $0, $0
/* 6F13C 0016F03C 28460072 */  paddub     $8, $16, $0
/* 6F140 0016F040 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* 6F144 0016F044 00000000 */   nop
/* 6F148 0016F048 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* 6F14C 0016F04C 402020E6 */  swc1       $f0, 0x2040($17)
/* 6F150 0016F050 000040C6 */  lwc1       $f0, 0x0($18)
/* 6F154 0016F054 442020E6 */  swc1       $f0, 0x2044($17)
/* 6F158 0016F058 000060C6 */  lwc1       $f0, 0x0($19)
/* 6F15C 0016F05C 482020E6 */  swc1       $f0, 0x2048($17)
/* 6F160 0016F060 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 6F164 0016F064 4C2023AE */  sw         $3, 0x204C($17)
/* 6F168 0016F068 4000BF7B */  lq         $31, 0x40($sp)
/* 6F16C 0016F06C 3000B37B */  lq         $19, 0x30($sp)
/* 6F170 0016F070 2000B27B */  lq         $18, 0x20($sp)
/* 6F174 0016F074 1000B17B */  lq         $17, 0x10($sp)
/* 6F178 0016F078 0000B07B */  lq         $16, 0x0($sp)
/* 6F17C 0016F07C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 6F180 0016F080 0800E003 */  jr         $31
/* 6F184 0016F084 00000000 */   nop
/* 6F188 0016F088 00000000 */  nop
/* 6F18C 0016F08C 00000000 */  nop
