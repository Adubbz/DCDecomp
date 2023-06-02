.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel itof
/* 15D58 00115C58 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 15D5C 00115C5C 2D280000 */  daddu      $5, $0, $0
/* 15D60 00115C60 0000BFFF */  sd         $31, 0x0($sp)
/* 15D64 00115C64 03008014 */  bnez       $4, .L00115C74
/* 15D68 00115C68 2D300000 */   daddu     $6, $0, $0
/* 15D6C 00115C6C 29000010 */  b          .L00115D14
/* 15D70 00115C70 2D100000 */   daddu     $2, $0, $0
.L00115C74:
/* 15D74 00115C74 04008104 */  bgez       $4, .L00115C88
/* 15D78 00115C78 2D188000 */   daddu     $3, $4, $0
/* 15D7C 00115C7C 2F180400 */  dsubu      $3, $0, $4
/* 15D80 00115C80 00800634 */  ori        $6, $0, 0x8000
/* 15D84 00115C84 3C340600 */  dsll32     $6, $6, 16
.L00115C88:
/* 15D88 00115C88 01000224 */  addiu      $2, $0, 0x1
/* 15D8C 00115C8C 0A006250 */  beql       $3, $2, .L00115CB8
/* 15D90 00115C90 3500A228 */   slti      $2, $5, 0x35
/* 15D94 00115C94 00000000 */  nop
.L00115C98:
/* 15D98 00115C98 0100A564 */  daddiu     $5, $5, 0x1
/* 15D9C 00115C9C 7B180300 */  dsra       $3, $3, 1
/* 15DA0 00115CA0 00000000 */  nop
/* 15DA4 00115CA4 00000000 */  nop
/* 15DA8 00115CA8 00000000 */  nop
/* 15DAC 00115CAC FAFF6214 */  bne        $3, $2, .L00115C98
/* 15DB0 00115CB0 00000000 */   nop
/* 15DB4 00115CB4 3500A228 */  slti       $2, $5, 0x35
.L00115CB8:
/* 15DB8 00115CB8 07004010 */  beqz       $2, .L00115CD8
/* 15DBC 00115CBC FF03A364 */   daddiu    $3, $5, 0x3FF
/* 15DC0 00115CC0 40000224 */  addiu      $2, $0, 0x40
/* 15DC4 00115CC4 2F104500 */  dsubu      $2, $2, $5
/* 15DC8 00115CC8 3C100200 */  dsll32     $2, $2, 0
/* 15DCC 00115CCC 3F100200 */  dsra32     $2, $2, 0
/* 15DD0 00115CD0 14204400 */  dsllv      $4, $4, $2
/* 15DD4 00115CD4 3B230400 */  dsra       $4, $4, 12
.L00115CD8:
/* 15DD8 00115CD8 3C150300 */  dsll32     $2, $3, 20
/* 15DDC 00115CDC 2510C200 */  or         $2, $6, $2
/* 15DE0 00115CE0 25204400 */  or         $4, $2, $4
/* 15DE4 00115CE4 05008004 */  bltz       $4, .L00115CFC
/* 15DE8 00115CE8 7A100400 */   dsrl      $2, $4, 1
/* 15DEC 00115CEC CE39040C */  jal        __floatdidf
/* 15DF0 00115CF0 00000000 */   nop
/* 15DF4 00115CF4 08000010 */  b          .L00115D18
/* 15DF8 00115CF8 0000BFDF */   ld        $31, 0x0($sp)
.L00115CFC:
/* 15DFC 00115CFC 01008430 */  andi       $4, $4, 0x1
/* 15E00 00115D00 CE39040C */  jal        __floatdidf
/* 15E04 00115D04 25208200 */   or        $4, $4, $2
/* 15E08 00115D08 2D204000 */  daddu      $4, $2, $0
/* 15E0C 00115D0C 6E3F040C */  jal        dpadd
/* 15E10 00115D10 2D288000 */   daddu     $5, $4, $0
.L00115D14:
/* 15E14 00115D14 0000BFDF */  ld         $31, 0x0($sp)
.L00115D18:
/* 15E18 00115D18 0800E003 */  jr         $31
/* 15E1C 00115D1C 1000BD27 */   addiu     $sp, $sp, 0x10