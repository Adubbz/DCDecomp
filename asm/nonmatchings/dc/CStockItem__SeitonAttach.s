.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonAttach__10CStockItemFv
/* 140010 0023FF10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 140014 0023FF14 2000BF7F */  sq         $31, 0x20($sp)
/* 140018 0023FF18 1000B17F */  sq         $17, 0x10($sp)
/* 14001C 0023FF1C 0000B07F */  sq         $16, 0x0($sp)
/* 140020 0023FF20 288E8070 */  paddub     $17, $4, $0
/* 140024 0023FF24 28860070 */  paddub     $16, $0, $0
/* 140028 0023FF28 0F000010 */  b          .L0023FF68
/* 14002C 0023FF2C 00000000 */   nop
.L0023FF30:
/* 140030 0023FF30 001E2426 */  addiu      $4, $17, 0x1E00
/* 140034 0023FF34 7CFF080C */  jal        SeitonAttachBoardSub__FP11ATTACH_LIST
/* 140038 0023FF38 00000000 */   nop
/* 14003C 0023FF3C 0D004014 */  bnez       $2, .L0023FF74
/* 140040 0023FF40 00000000 */   nop
/* 140044 0023FF44 2C8A838F */  lw         $3, -0x75D4($gp)
/* 140048 0023FF48 01006324 */  addiu      $3, $3, 0x1
/* 14004C 0023FF4C 2C8A83AF */  sw         $3, -0x75D4($gp)
/* 140050 0023FF50 2C8A838F */  lw         $3, -0x75D4($gp)
/* 140054 0023FF54 05006328 */  slti       $3, $3, 0x5
/* 140058 0023FF58 02006014 */  bnez       $3, .L0023FF64
/* 14005C 0023FF5C 00000000 */   nop
/* 140060 0023FF60 2C8A80AF */  sw         $0, -0x75D4($gp)
.L0023FF64:
/* 140064 0023FF64 01001026 */  addiu      $16, $16, 0x1
.L0023FF68:
/* 140068 0023FF68 0500032A */  slti       $3, $16, 0x5
/* 14006C 0023FF6C F0FF6014 */  bnez       $3, .L0023FF30
/* 140070 0023FF70 00000000 */   nop
.L0023FF74:
/* 140074 0023FF74 2000BF7B */  lq         $31, 0x20($sp)
/* 140078 0023FF78 1000B17B */  lq         $17, 0x10($sp)
/* 14007C 0023FF7C 0000B07B */  lq         $16, 0x0($sp)
/* 140080 0023FF80 3000BD27 */  addiu      $sp, $sp, 0x30
/* 140084 0023FF84 0800E003 */  jr         $31
/* 140088 0023FF88 00000000 */   nop
/* 14008C 0023FF8C 00000000 */  nop
