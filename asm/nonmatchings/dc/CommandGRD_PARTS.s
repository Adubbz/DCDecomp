.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandGRD_PARTS__FPPv
/* 75E80 00175D80 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 75E84 00175D84 2000BF7F */  sq         $31, 0x20($sp)
/* 75E88 00175D88 1000B17F */  sq         $17, 0x10($sp)
/* 75E8C 00175D8C 0000B07F */  sq         $16, 0x0($sp)
/* 75E90 00175D90 288E8070 */  paddub     $17, $4, $0
/* 75E94 00175D94 0000838C */  lw         $3, 0x0($4)
/* 75E98 00175D98 0000648C */  lw         $4, 0x0($3)
/* 75E9C 00175D9C 04008004 */  bltz       $4, .L00175DB0
/* 75EA0 00175DA0 00000000 */   nop
/* 75EA4 00175DA4 18008328 */  slti       $3, $4, 0x18
/* 75EA8 00175DA8 03006014 */  bnez       $3, .L00175DB8
/* 75EAC 00175DAC 00000000 */   nop
.L00175DB0:
/* 75EB0 00175DB0 26000010 */  b          .L00175E4C
/* 75EB4 00175DB4 00000000 */   nop
.L00175DB8:
/* 75EB8 00175DB8 0C9084AF */  sw         $4, -0x6FF4($gp)
/* 75EBC 00175DBC D8020324 */  addiu      $3, $0, 0x2D8
/* 75EC0 00175DC0 18208300 */  mult       $4, $4, $3
/* 75EC4 00175DC4 C08F838F */  lw         $3, -0x7040($gp)
/* 75EC8 00175DC8 21186400 */  addu       $3, $3, $4
/* 75ECC 00175DCC 185D7024 */  addiu      $16, $3, 0x5D18
/* 75ED0 00175DD0 F87F1026 */  addiu      $16, $16, 0x7FF8
/* 75ED4 00175DD4 0400278E */  lw         $7, 0x4($17)
/* 75ED8 00175DD8 0000E380 */  lb         $3, 0x0($7)
/* 75EDC 00175DDC 0E006010 */  beqz       $3, .L00175E18
/* 75EE0 00175DE0 00000000 */   nop
/* 75EE4 00175DE4 3000A427 */  addiu      $4, $sp, 0x30
/* 75EE8 00175DE8 2A00023C */  lui        $2, %hi(_501_2)
/* 75EEC 00175DEC E0A74524 */  addiu      $5, $2, %lo(_501_2)
/* 75EF0 00175DF0 D201023C */  lui        $2, %hi(CurrentDir_2)
/* 75EF4 00175DF4 F09A4624 */  addiu      $6, $2, %lo(CurrentDir_2)
/* 75EF8 00175DF8 1614040C */  jal        sprintf
/* 75EFC 00175DFC 00000000 */   nop
/* 75F00 00175E00 28260072 */  paddub     $4, $16, $0
/* 75F04 00175E04 3000A527 */  addiu      $5, $sp, 0x30
/* 75F08 00175E08 C0D6050C */  jal        GenMdsName__FP14MAP_PARTS_INFOPc
/* 75F0C 00175E0C 00000000 */   nop
/* 75F10 00175E10 02000010 */  b          .L00175E1C
/* 75F14 00175E14 00000000 */   nop
.L00175E18:
/* 75F18 00175E18 000000A2 */  sb         $0, 0x0($16)
.L00175E1C:
/* 75F1C 00175E1C 0800238E */  lw         $3, 0x8($17)
/* 75F20 00175E20 0000638C */  lw         $3, 0x0($3)
/* 75F24 00175E24 400203AE */  sw         $3, 0x240($16)
/* 75F28 00175E28 0C00238E */  lw         $3, 0xC($17)
/* 75F2C 00175E2C 000060C4 */  lwc1       $f0, 0x0($3)
/* 75F30 00175E30 640200E6 */  swc1       $f0, 0x264($16)
/* 75F34 00175E34 01000324 */  addiu      $3, $0, 0x1
/* 75F38 00175E38 480203AE */  sw         $3, 0x248($16)
/* 75F3C 00175E3C 440200AE */  sw         $0, 0x244($16)
/* 75F40 00175E40 F88F80AF */  sw         $0, -0x7008($gp)
/* 75F44 00175E44 FC8F80AF */  sw         $0, -0x7004($gp)
/* 75F48 00175E48 009090AF */  sw         $16, -0x7000($gp)
.L00175E4C:
/* 75F4C 00175E4C 2000BF7B */  lq         $31, 0x20($sp)
/* 75F50 00175E50 1000B17B */  lq         $17, 0x10($sp)
/* 75F54 00175E54 0000B07B */  lq         $16, 0x0($sp)
/* 75F58 00175E58 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 75F5C 00175E5C 0800E003 */  jr         $31
/* 75F60 00175E60 00000000 */   nop
/* 75F64 00175E64 00000000 */  nop
/* 75F68 00175E68 00000000 */  nop
/* 75F6C 00175E6C 00000000 */  nop