.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuManual__FPiP1
/* 133ED0 00233DD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 133ED4 00233DD4 2000BF7F */  sq         $31, 0x20($sp)
/* 133ED8 00233DD8 1000B17F */  sq         $17, 0x10($sp)
/* 133EDC 00233DDC 0000B07F */  sq         $16, 0x0($sp)
/* 133EE0 00233DE0 288E8070 */  paddub     $17, $4, $0
/* 133EE4 00233DE4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133EE8 00233DE8 A0A825AC */  sw         $5, -0x5760($at)
/* 133EEC 00233DEC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133EF0 00233DF0 A0A8248C */  lw         $4, -0x5760($at)
/* 133EF4 00233DF4 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 133EF8 00233DF8 00000000 */   nop
/* 133EFC 00233DFC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F00 00233E00 A0A822AC */  sw         $2, -0x5760($at)
/* 133F04 00233E04 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F08 00233E08 A0A8308C */  lw         $16, -0x5760($at)
/* 133F0C 00233E0C 30FB040C */  jal        StartReadBG__Fv
/* 133F10 00233E10 00000000 */   nop
/* 133F14 00233E14 2A00023C */  lui        $2, %hi(_559_2)
/* 133F18 00233E18 30F34424 */  addiu      $4, $2, %lo(_559_2)
/* 133F1C 00233E1C 282E0072 */  paddub     $5, $16, $0
/* 133F20 00233E20 ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* 133F24 00233E24 00000000 */   nop
/* 133F28 00233E28 38FB040C */  jal        ReadBG__Fv
/* 133F2C 00233E2C 00000000 */   nop
/* 133F30 00233E30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F34 00233E34 76A820A4 */  sh         $0, -0x578A($at)
/* 133F38 00233E38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F3C 00233E3C 78A820A4 */  sh         $0, -0x5788($at)
/* 133F40 00233E40 00002386 */  lh         $3, 0x0($17)
/* 133F44 00233E44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F48 00233E48 70A823A4 */  sh         $3, -0x5790($at)
/* 133F4C 00233E4C 04002386 */  lh         $3, 0x4($17)
/* 133F50 00233E50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F54 00233E54 72A823A4 */  sh         $3, -0x578E($at)
/* 133F58 00233E58 08002386 */  lh         $3, 0x8($17)
/* 133F5C 00233E5C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F60 00233E60 74A823A4 */  sh         $3, -0x578C($at)
/* 133F64 00233E64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F68 00233E68 7CA820A4 */  sh         $0, -0x5784($at)
/* 133F6C 00233E6C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F70 00233E70 80A820AC */  sw         $0, -0x5780($at)
/* 133F74 00233E74 FEFF0324 */  addiu      $3, $0, -0x2
/* 133F78 00233E78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F7C 00233E7C 7AA823A4 */  sh         $3, -0x5786($at)
/* 133F80 00233E80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F84 00233E84 84A820AC */  sw         $0, -0x577C($at)
/* 133F88 00233E88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133F8C 00233E8C 88A820AC */  sw         $0, -0x5778($at)
/* 133F90 00233E90 DB01033C */  lui        $3, %hi(EastKingMsgCls)
/* 133F94 00233E94 80906324 */  addiu      $3, $3, %lo(EastKingMsgCls)
/* 133F98 00233E98 AC9783AF */  sw         $3, -0x6854($gp)
/* 133F9C 00233E9C AC97838F */  lw         $3, -0x6854($gp)
/* 133FA0 00233EA0 D41660AC */  sw         $0, 0x16D4($3)
/* 133FA4 00233EA4 10000424 */  addiu      $4, $0, 0x10
/* 133FA8 00233EA8 AC97838F */  lw         $3, -0x6854($gp)
/* 133FAC 00233EAC 2C0064AC */  sw         $4, 0x2C($3)
/* 133FB0 00233EB0 AC97838F */  lw         $3, -0x6854($gp)
/* 133FB4 00233EB4 300064AC */  sw         $4, 0x30($3)
/* 133FB8 00233EB8 DA01013C */  lui        $at, (0x1DA52B0 >> 16)
/* 133FBC 00233EBC B052238C */  lw         $3, (0x1DA52B0 & 0xFFFF)($at)
/* 133FC0 00233EC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133FC4 00233EC4 98A823AC */  sw         $3, -0x5768($at)
/* 133FC8 00233EC8 DA01013C */  lui        $at, (0x1DA2330 >> 16)
/* 133FCC 00233ECC 3023238C */  lw         $3, (0x1DA2330 & 0xFFFF)($at)
/* 133FD0 00233ED0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133FD4 00233ED4 9CA823AC */  sw         $3, -0x5764($at)
/* 133FD8 00233ED8 DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* 133FDC 00233EDC 183B2384 */  lh         $3, (0x1DA3B18 & 0xFFFF)($at)
/* 133FE0 00233EE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133FE4 00233EE4 7EA823A4 */  sh         $3, -0x5782($at)
/* 133FE8 00233EE8 2000BF7B */  lq         $31, 0x20($sp)
/* 133FEC 00233EEC 1000B17B */  lq         $17, 0x10($sp)
/* 133FF0 00233EF0 0000B07B */  lq         $16, 0x0($sp)
/* 133FF4 00233EF4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 133FF8 00233EF8 0800E003 */  jr         $31
/* 133FFC 00233EFC 00000000 */   nop
