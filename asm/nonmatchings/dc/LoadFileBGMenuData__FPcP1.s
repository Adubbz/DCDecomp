.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadFileBGMenuData__FPcP1
/* 12BBB0 0022BAB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12BBB4 0022BAB4 2000BF7F */  sq         $31, 0x20($sp)
/* 12BBB8 0022BAB8 1000B17F */  sq         $17, 0x10($sp)
/* 12BBBC 0022BABC 0000B07F */  sq         $16, 0x0($sp)
/* 12BBC0 0022BAC0 288E8070 */  paddub     $17, $4, $0
/* 12BBC4 0022BAC4 2886A070 */  paddub     $16, $5, $0
/* 12BBC8 0022BAC8 03002012 */  beqz       $17, .L0022BAD8
/* 12BBCC 0022BACC 00000000 */   nop
/* 12BBD0 0022BAD0 04000016 */  bnez       $16, .L0022BAE4
/* 12BBD4 0022BAD4 00000000 */   nop
.L0022BAD8:
/* 12BBD8 0022BAD8 FFFF0224 */  addiu      $2, $0, -0x1
/* 12BBDC 0022BADC 12000010 */  b          .L0022BB28
/* 12BBE0 0022BAE0 00000000 */   nop
.L0022BAE4:
/* 12BBE4 0022BAE4 DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BBE8 0022BAE8 D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BBEC 0022BAEC 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 12BBF0 0022BAF0 00000000 */   nop
/* 12BBF4 0022BAF4 DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BBF8 0022BAF8 D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BBFC 0022BAFC 282E2072 */  paddub     $5, $17, $0
/* 12BC00 0022BB00 BC14040C */  jal        strcat
/* 12BC04 0022BB04 00000000 */   nop
/* 12BC08 0022BB08 DB01023C */  lui        $2, %hi(MenuGrobalDir)
/* 12BC0C 0022BB0C D08F4424 */  addiu      $4, $2, %lo(MenuGrobalDir)
/* 12BC10 0022BB10 282E0072 */  paddub     $5, $16, $0
/* 12BC14 0022BB14 3C00A627 */  addiu      $6, $sp, 0x3C
/* 12BC18 0022BB18 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 12BC1C 0022BB1C 00000000 */   nop
/* 12BC20 0022BB20 3C00A28F */  lw         $2, 0x3C($sp)
/* 12BC24 0022BB24 00000000 */  nop
.L0022BB28:
/* 12BC28 0022BB28 2000BF7B */  lq         $31, 0x20($sp)
/* 12BC2C 0022BB2C 1000B17B */  lq         $17, 0x10($sp)
/* 12BC30 0022BB30 0000B07B */  lq         $16, 0x0($sp)
/* 12BC34 0022BB34 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12BC38 0022BB38 0800E003 */  jr         $31
/* 12BC3C 0022BB3C 00000000 */   nop
