.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__5CFishFPf
/* 141100 00241000 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 141104 00241004 2000BF7F */  sq         $31, 0x20($sp)
/* 141108 00241008 1000B17F */  sq         $17, 0x10($sp)
/* 14110C 0024100C 0000B07F */  sq         $16, 0x0($sp)
/* 141110 00241010 288E8070 */  paddub     $17, $4, $0
/* 141114 00241014 2886A070 */  paddub     $16, $5, $0
/* 141118 00241018 A0002426 */  addiu      $4, $17, 0xA0
/* 14111C 0024101C 4001398E */  lw         $25, 0x140($17)
/* 141120 00241020 3400398F */  lw         $25, 0x34($25)
/* 141124 00241024 09F82003 */  jalr       $25
/* 141128 00241028 00000000 */   nop
/* 14112C 0024102C 50122426 */  addiu      $4, $17, 0x1250
/* 141130 00241030 282E0072 */  paddub     $5, $16, $0
/* 141134 00241034 F012398E */  lw         $25, 0x12F0($17)
/* 141138 00241038 3400398F */  lw         $25, 0x34($25)
/* 14113C 0024103C 09F82003 */  jalr       $25
/* 141140 00241040 00000000 */   nop
/* 141144 00241044 2000BF7B */  lq         $31, 0x20($sp)
/* 141148 00241048 1000B17B */  lq         $17, 0x10($sp)
/* 14114C 0024104C 0000B07B */  lq         $16, 0x0($sp)
/* 141150 00241050 3000BD27 */  addiu      $sp, $sp, 0x30
/* 141154 00241054 0800E003 */  jr         $31
/* 141158 00241058 00000000 */   nop
/* 14115C 0024105C 00000000 */  nop
