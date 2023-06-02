.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetScrPosFromChar__FP10CCharacterPi
/* 4CA80 0014C980 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 4CA84 0014C984 2000BF7F */  sq         $31, 0x20($sp)
/* 4CA88 0014C988 1000B17F */  sq         $17, 0x10($sp)
/* 4CA8C 0014C98C 0000B07F */  sq         $16, 0x0($sp)
/* 4CA90 0014C990 288E8070 */  paddub     $17, $4, $0
/* 4CA94 0014C994 2886A070 */  paddub     $16, $5, $0
/* 4CA98 0014C998 3000A527 */  addiu      $5, $sp, 0x30
/* 4CA9C 0014C99C A000398E */  lw         $25, 0xA0($17)
/* 4CAA0 0014C9A0 A000398F */  lw         $25, 0xA0($25)
/* 4CAA4 0014C9A4 09F82003 */  jalr       $25
/* 4CAA8 0014C9A8 00000000 */   nop
/* 4CAAC 0014C9AC 708181C7 */  lwc1       $f1, -0x7E90($gp)
/* 4CAB0 0014C9B0 B40020C6 */  lwc1       $f0, 0xB4($17)
/* 4CAB4 0014C9B4 42080046 */  mul.s      $f1, $f1, $f0
/* 4CAB8 0014C9B8 3400A0C7 */  lwc1       $f0, 0x34($sp)
/* 4CABC 0014C9BC 00000146 */  add.s      $f0, $f0, $f1
/* 4CAC0 0014C9C0 3400A0E7 */  swc1       $f0, 0x34($sp)
/* 4CAC4 0014C9C4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 4CAC8 0014C9C8 3C00A2AF */  sw         $2, 0x3C($sp)
/* 4CACC 0014C9CC 4000A427 */  addiu      $4, $sp, 0x40
/* 4CAD0 0014C9D0 3000A527 */  addiu      $5, $sp, 0x30
/* 4CAD4 0014C9D4 28360070 */  paddub     $6, $0, $0
/* 4CAD8 0014C9D8 38B9040C */  jal        MGRotTransPers2D__FPiPfi
/* 4CADC 0014C9DC 00000000 */   nop
/* 4CAE0 0014C9E0 4000A38F */  lw         $3, 0x40($sp)
/* 4CAE4 0014C9E4 000003AE */  sw         $3, 0x0($16)
/* 4CAE8 0014C9E8 4400A38F */  lw         $3, 0x44($sp)
/* 4CAEC 0014C9EC 040003AE */  sw         $3, 0x4($16)
/* 4CAF0 0014C9F0 2000BF7B */  lq         $31, 0x20($sp)
/* 4CAF4 0014C9F4 1000B17B */  lq         $17, 0x10($sp)
/* 4CAF8 0014C9F8 0000B07B */  lq         $16, 0x0($sp)
/* 4CAFC 0014C9FC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 4CB00 0014CA00 0800E003 */  jr         $31
/* 4CB04 0014CA04 00000000 */   nop
/* 4CB08 0014CA08 00000000 */  nop
/* 4CB0C 0014CA0C 00000000 */  nop
