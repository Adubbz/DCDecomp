.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetUseItem__FPi
/* 72D00 00172C00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 72D04 00172C04 3000BF7F */  sq         $31, 0x30($sp)
/* 72D08 00172C08 2000B27F */  sq         $18, 0x20($sp)
/* 72D0C 00172C0C 1000B17F */  sq         $17, 0x10($sp)
/* 72D10 00172C10 0000B07F */  sq         $16, 0x0($sp)
/* 72D14 00172C14 28868070 */  paddub     $16, $4, $0
/* 72D18 00172C18 288E0070 */  paddub     $17, $0, $0
/* 72D1C 00172C1C 0E000010 */  b          .L00172C58
/* 72D20 00172C20 00000000 */   nop
.L00172C24:
/* 72D24 00172C24 80901100 */  sll        $18, $17, 2
/* 72D28 00172C28 21101202 */  addu       $2, $16, $18
/* 72D2C 00172C2C 0000448C */  lw         $4, 0x0($2)
/* 72D30 00172C30 E4CA050C */  jal        ConvertItemNo__Fi
/* 72D34 00172C34 00000000 */   nop
/* 72D38 00172C38 D201033C */  lui        $3, %hi(use_item_list)
/* 72D3C 00172C3C 009A6324 */  addiu      $3, $3, %lo(use_item_list)
/* 72D40 00172C40 21187200 */  addu       $3, $3, $18
/* 72D44 00172C44 000062AC */  sw         $2, 0x0($3)
/* 72D48 00172C48 0000638C */  lw         $3, 0x0($3)
/* 72D4C 00172C4C 05006004 */  bltz       $3, .L00172C64
/* 72D50 00172C50 00000000 */   nop
/* 72D54 00172C54 01003126 */  addiu      $17, $17, 0x1
.L00172C58:
/* 72D58 00172C58 2000232A */  slti       $3, $17, 0x20
/* 72D5C 00172C5C F1FF6014 */  bnez       $3, .L00172C24
/* 72D60 00172C60 00000000 */   nop
.L00172C64:
/* 72D64 00172C64 3000BF7B */  lq         $31, 0x30($sp)
/* 72D68 00172C68 2000B27B */  lq         $18, 0x20($sp)
/* 72D6C 00172C6C 1000B17B */  lq         $17, 0x10($sp)
/* 72D70 00172C70 0000B07B */  lq         $16, 0x0($sp)
/* 72D74 00172C74 4000BD27 */  addiu      $sp, $sp, 0x40
/* 72D78 00172C78 0800E003 */  jr         $31
/* 72D7C 00172C7C 00000000 */   nop
