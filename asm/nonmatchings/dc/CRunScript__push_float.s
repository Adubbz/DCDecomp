.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel push_float__10CRunScriptFf
/* 13DC20 0023DB20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13DC24 0023DB24 2000BF7F */  sq         $31, 0x20($sp)
/* 13DC28 0023DB28 1000B07F */  sq         $16, 0x10($sp)
/* 13DC2C 0023DB2C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 13DC30 0023DB30 28868070 */  paddub     $16, $4, $0
/* 13DC34 0023DB34 06650046 */  mov.s      $f20, $f12
/* 13DC38 0023DB38 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DC3C 0023DB3C 00000000 */   nop
/* 13DC40 0023DB40 01000424 */  addiu      $4, $0, 0x1
/* 13DC44 0023DB44 1000038E */  lw         $3, 0x10($16)
/* 13DC48 0023DB48 000064AC */  sw         $4, 0x0($3)
/* 13DC4C 0023DB4C 1000048E */  lw         $4, 0x10($16)
/* 13DC50 0023DB50 08008324 */  addiu      $3, $4, 0x8
/* 13DC54 0023DB54 100003AE */  sw         $3, 0x10($16)
/* 13DC58 0023DB58 040094E4 */  swc1       $f20, 0x4($4)
/* 13DC5C 0023DB5C 2000BF7B */  lq         $31, 0x20($sp)
/* 13DC60 0023DB60 1000B07B */  lq         $16, 0x10($sp)
/* 13DC64 0023DB64 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 13DC68 0023DB68 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13DC6C 0023DB6C 0800E003 */  jr         $31
/* 13DC70 0023DB70 00000000 */   nop
/* 13DC74 0023DB74 00000000 */  nop
/* 13DC78 0023DB78 00000000 */  nop
/* 13DC7C 0023DB7C 00000000 */  nop
