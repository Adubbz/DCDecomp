.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__13MAP_NPC_MODELFRC13MAP_NPC_MODEL
/* 42D90 00142C90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 42D94 00142C94 2000BF7F */  sq         $31, 0x20($sp)
/* 42D98 00142C98 1000B17F */  sq         $17, 0x10($sp)
/* 42D9C 00142C9C 0000B07F */  sq         $16, 0x0($sp)
/* 42DA0 00142CA0 288E8070 */  paddub     $17, $4, $0
/* 42DA4 00142CA4 2886A070 */  paddub     $16, $5, $0
/* 42DA8 00142CA8 680B050C */  jal        __as__10CCharacterFRC10CCharacter
/* 42DAC 00142CAC 00000000 */   nop
/* 42DB0 00142CB0 B01103C6 */  lwc1       $f3, 0x11B0($16)
/* 42DB4 00142CB4 B41102C6 */  lwc1       $f2, 0x11B4($16)
/* 42DB8 00142CB8 B81101C6 */  lwc1       $f1, 0x11B8($16)
/* 42DBC 00142CBC BC1100C6 */  lwc1       $f0, 0x11BC($16)
/* 42DC0 00142CC0 B01123E6 */  swc1       $f3, 0x11B0($17)
/* 42DC4 00142CC4 B41122E6 */  swc1       $f2, 0x11B4($17)
/* 42DC8 00142CC8 B81121E6 */  swc1       $f1, 0x11B8($17)
/* 42DCC 00142CCC BC1120E6 */  swc1       $f0, 0x11BC($17)
/* 42DD0 00142CD0 C01103C6 */  lwc1       $f3, 0x11C0($16)
/* 42DD4 00142CD4 C41102C6 */  lwc1       $f2, 0x11C4($16)
/* 42DD8 00142CD8 C81101C6 */  lwc1       $f1, 0x11C8($16)
/* 42DDC 00142CDC CC1100C6 */  lwc1       $f0, 0x11CC($16)
/* 42DE0 00142CE0 C01123E6 */  swc1       $f3, 0x11C0($17)
/* 42DE4 00142CE4 C41122E6 */  swc1       $f2, 0x11C4($17)
/* 42DE8 00142CE8 C81121E6 */  swc1       $f1, 0x11C8($17)
/* 42DEC 00142CEC CC1120E6 */  swc1       $f0, 0x11CC($17)
/* 42DF0 00142CF0 D011028E */  lw         $2, 0x11D0($16)
/* 42DF4 00142CF4 D01122AE */  sw         $2, 0x11D0($17)
/* 42DF8 00142CF8 D411028E */  lw         $2, 0x11D4($16)
/* 42DFC 00142CFC D41122AE */  sw         $2, 0x11D4($17)
/* 42E00 00142D00 D811028E */  lw         $2, 0x11D8($16)
/* 42E04 00142D04 D81122AE */  sw         $2, 0x11D8($17)
/* 42E08 00142D08 DC11028E */  lw         $2, 0x11DC($16)
/* 42E0C 00142D0C DC1122AE */  sw         $2, 0x11DC($17)
/* 42E10 00142D10 E0110626 */  addiu      $6, $16, 0x11E0
/* 42E14 00142D14 E0112526 */  addiu      $5, $17, 0x11E0
/* 42E18 00142D18 20000424 */  addiu      $4, $0, 0x20
.L00142D1C:
/* 42E1C 00142D1C 0000C38C */  lw         $3, 0x0($6)
/* 42E20 00142D20 0400C28C */  lw         $2, 0x4($6)
/* 42E24 00142D24 0800C624 */  addiu      $6, $6, 0x8
/* 42E28 00142D28 FFFF8424 */  addiu      $4, $4, -0x1
/* 42E2C 00142D2C 0000A3AC */  sw         $3, 0x0($5)
/* 42E30 00142D30 0400A2AC */  sw         $2, 0x4($5)
/* 42E34 00142D34 0800A524 */  addiu      $5, $5, 0x8
/* 42E38 00142D38 F8FF801C */  bgtz       $4, .L00142D1C
/* 42E3C 00142D3C 00000000 */   nop
/* 42E40 00142D40 E0120626 */  addiu      $6, $16, 0x12E0
/* 42E44 00142D44 E0122526 */  addiu      $5, $17, 0x12E0
/* 42E48 00142D48 08000424 */  addiu      $4, $0, 0x8
.L00142D4C:
/* 42E4C 00142D4C 0000C38C */  lw         $3, 0x0($6)
/* 42E50 00142D50 0400C28C */  lw         $2, 0x4($6)
/* 42E54 00142D54 0800C624 */  addiu      $6, $6, 0x8
/* 42E58 00142D58 FFFF8424 */  addiu      $4, $4, -0x1
/* 42E5C 00142D5C 0000A3AC */  sw         $3, 0x0($5)
/* 42E60 00142D60 0400A2AC */  sw         $2, 0x4($5)
/* 42E64 00142D64 0800A524 */  addiu      $5, $5, 0x8
/* 42E68 00142D68 F8FF801C */  bgtz       $4, .L00142D4C
/* 42E6C 00142D6C 00000000 */   nop
/* 42E70 00142D70 2013028E */  lw         $2, 0x1320($16)
/* 42E74 00142D74 201322AE */  sw         $2, 0x1320($17)
/* 42E78 00142D78 28162072 */  paddub     $2, $17, $0
/* 42E7C 00142D7C 2000BF7B */  lq         $31, 0x20($sp)
/* 42E80 00142D80 1000B17B */  lq         $17, 0x10($sp)
/* 42E84 00142D84 0000B07B */  lq         $16, 0x0($sp)
/* 42E88 00142D88 3000BD27 */  addiu      $sp, $sp, 0x30
/* 42E8C 00142D8C 0800E003 */  jr         $31
/* 42E90 00142D90 00000000 */   nop
/* 42E94 00142D94 00000000 */  nop
/* 42E98 00142D98 00000000 */  nop
/* 42E9C 00142D9C 00000000 */  nop