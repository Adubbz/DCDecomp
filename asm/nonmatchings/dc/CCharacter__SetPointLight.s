.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPointLight__10CCharacterFPfffffff
/* 37FE0 00137EE0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 37FE4 00137EE4 5000BF7F */  sq         $31, 0x50($sp)
/* 37FE8 00137EE8 4000B27F */  sq         $18, 0x40($sp)
/* 37FEC 00137EEC 3000B17F */  sq         $17, 0x30($sp)
/* 37FF0 00137EF0 2000B07F */  sq         $16, 0x20($sp)
/* 37FF4 00137EF4 1400B9E7 */  swc1       $f25, 0x14($sp)
/* 37FF8 00137EF8 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 37FFC 00137EFC 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 38000 00137F00 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 38004 00137F04 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 38008 00137F08 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 3800C 00137F0C 288E8070 */  paddub     $17, $4, $0
/* 38010 00137F10 2886A070 */  paddub     $16, $5, $0
/* 38014 00137F14 46660046 */  mov.s      $f25, $f12
/* 38018 00137F18 066E0046 */  mov.s      $f24, $f13
/* 3801C 00137F1C C6750046 */  mov.s      $f23, $f14
/* 38020 00137F20 867D0046 */  mov.s      $f22, $f15
/* 38024 00137F24 46850046 */  mov.s      $f21, $f16
/* 38028 00137F28 068D0046 */  mov.s      $f20, $f17
/* 3802C 00137F2C 28260070 */  paddub     $4, $0, $0
/* 38030 00137F30 1C000010 */  b          .L00137FA4
/* 38034 00137F34 00000000 */   nop
.L00137F38:
/* 38038 00137F38 40100400 */  sll        $2, $4, 1
/* 3803C 00137F3C 21104400 */  addu       $2, $2, $4
/* 38040 00137F40 00910200 */  sll        $18, $2, 4
/* 38044 00137F44 21185102 */  addu       $3, $18, $17
/* 38048 00137F48 280D6524 */  addiu      $5, $3, 0xD28
/* 3804C 00137F4C 280D628C */  lw         $2, 0xD28($3)
/* 38050 00137F50 13004014 */  bnez       $2, .L00137FA0
/* 38054 00137F54 00000000 */   nop
/* 38058 00137F58 01000224 */  addiu      $2, $0, 0x1
/* 3805C 00137F5C 0000A2AC */  sw         $2, 0x0($5)
/* 38060 00137F60 000D6424 */  addiu      $4, $3, 0xD00
/* 38064 00137F64 282E0072 */  paddub     $5, $16, $0
/* 38068 00137F68 0C86040C */  jal        sceVu0CopyVector
/* 3806C 00137F6C 00000000 */   nop
/* 38070 00137F70 0C0000C6 */  lwc1       $f0, 0xC($16)
/* 38074 00137F74 21105102 */  addu       $2, $18, $17
/* 38078 00137F78 2C0D40E4 */  swc1       $f0, 0xD2C($2)
/* 3807C 00137F7C 200D59E4 */  swc1       $f25, 0xD20($2)
/* 38080 00137F80 240D58E4 */  swc1       $f24, 0xD24($2)
/* 38084 00137F84 100D57E4 */  swc1       $f23, 0xD10($2)
/* 38088 00137F88 140D56E4 */  swc1       $f22, 0xD14($2)
/* 3808C 00137F8C 180D55E4 */  swc1       $f21, 0xD18($2)
/* 38090 00137F90 1C0D54E4 */  swc1       $f20, 0xD1C($2)
/* 38094 00137F94 01000224 */  addiu      $2, $0, 0x1
/* 38098 00137F98 06000010 */  b          .L00137FB4
/* 3809C 00137F9C 00000000 */   nop
.L00137FA0:
/* 380A0 00137FA0 01008424 */  addiu      $4, $4, 0x1
.L00137FA4:
/* 380A4 00137FA4 02008228 */  slti       $2, $4, 0x2
/* 380A8 00137FA8 E3FF4014 */  bnez       $2, .L00137F38
/* 380AC 00137FAC 00000000 */   nop
/* 380B0 00137FB0 28160070 */  paddub     $2, $0, $0
.L00137FB4:
/* 380B4 00137FB4 5000BF7B */  lq         $31, 0x50($sp)
/* 380B8 00137FB8 4000B27B */  lq         $18, 0x40($sp)
/* 380BC 00137FBC 3000B17B */  lq         $17, 0x30($sp)
/* 380C0 00137FC0 2000B07B */  lq         $16, 0x20($sp)
/* 380C4 00137FC4 1400B9C7 */  lwc1       $f25, 0x14($sp)
/* 380C8 00137FC8 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 380CC 00137FCC 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 380D0 00137FD0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 380D4 00137FD4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 380D8 00137FD8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 380DC 00137FDC 6000BD27 */  addiu      $sp, $sp, 0x60
/* 380E0 00137FE0 0800E003 */  jr         $31
/* 380E4 00137FE4 00000000 */   nop
/* 380E8 00137FE8 00000000 */  nop
/* 380EC 00137FEC 00000000 */  nop