.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDispVolumeForFloat__Ff
/* 12ACC0 0022ABC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12ACC4 0022ABC4 2000BF7F */  sq         $31, 0x20($sp)
/* 12ACC8 0022ABC8 1000B07F */  sq         $16, 0x10($sp)
/* 12ACCC 0022ABCC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 12ACD0 0022ABD0 06650046 */  mov.s      $f20, $f12
/* 12ACD4 0022ABD4 2C44040C */  jal        fptosi
/* 12ACD8 0022ABD8 00000000 */   nop
/* 12ACDC 0022ABDC 28864070 */  paddub     $16, $2, $0
/* 12ACE0 0022ABE0 00008244 */  mtc1       $2, $f0
/* 12ACE4 0022ABE4 00000000 */  nop
/* 12ACE8 0022ABE8 20008046 */  cvt.s.w    $f0, $f0
/* 12ACEC 0022ABEC 01A30046 */  sub.s      $f12, $f20, $f0
/* 12ACF0 0022ABF0 9044040C */  jal        fptodp
/* 12ACF4 0022ABF4 00000000 */   nop
/* 12ACF8 0022ABF8 28264070 */  paddub     $4, $2, $0
/* 12ACFC 0022ABFC 282E0070 */  paddub     $5, $0, $0
/* 12AD00 0022AC00 5800040C */  jal        _dpfgt
/* 12AD04 0022AC04 00000000 */   nop
/* 12AD08 0022AC08 02004010 */  beqz       $2, .L0022AC14
/* 12AD0C 0022AC0C 00000000 */   nop
/* 12AD10 0022AC10 01001026 */  addiu      $16, $16, 0x1
.L0022AC14:
/* 12AD14 0022AC14 28160072 */  paddub     $2, $16, $0
/* 12AD18 0022AC18 2000BF7B */  lq         $31, 0x20($sp)
/* 12AD1C 0022AC1C 1000B07B */  lq         $16, 0x10($sp)
/* 12AD20 0022AC20 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 12AD24 0022AC24 3000BD27 */  addiu      $sp, $sp, 0x30
/* 12AD28 0022AC28 0800E003 */  jr         $31
/* 12AD2C 0022AC2C 00000000 */   nop
