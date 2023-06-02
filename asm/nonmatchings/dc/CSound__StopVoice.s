.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopVoice__6CSoundFi
/* 43CF0 00143BF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43CF4 00143BF4 1000BF7F */  sq         $31, 0x10($sp)
/* 43CF8 00143BF8 0000B07F */  sq         $16, 0x0($sp)
/* 43CFC 00143BFC 2886A070 */  paddub     $16, $5, $0
/* 43D00 00143C00 00160636 */  ori        $6, $16, 0x1600
/* 43D04 00143C04 01000424 */  addiu      $4, $0, 0x1
/* 43D08 00143C08 30800534 */  ori        $5, $0, 0x8030
/* 43D0C 00143C0C FF00023C */  lui        $2, (0xFFFFFF >> 16)
/* 43D10 00143C10 FFFF4734 */  ori        $7, $2, (0xFFFFFF & 0xFFFF)
/* 43D14 00143C14 E084040C */  jal        sceSdRemote
/* 43D18 00143C18 00000000 */   nop
/* 43D1C 00143C1C 2A00023C */  lui        $2, %hi(_221_2)
/* 43D20 00143C20 D0964424 */  addiu      $4, $2, %lo(_221_2)
/* 43D24 00143C24 282E0072 */  paddub     $5, $16, $0
/* 43D28 00143C28 A611040C */  jal        printf
/* 43D2C 00143C2C 00000000 */   nop
/* 43D30 00143C30 1000BF7B */  lq         $31, 0x10($sp)
/* 43D34 00143C34 0000B07B */  lq         $16, 0x0($sp)
/* 43D38 00143C38 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43D3C 00143C3C 0800E003 */  jr         $31
/* 43D40 00143C40 00000000 */   nop
/* 43D44 00143C44 00000000 */  nop
/* 43D48 00143C48 00000000 */  nop
/* 43D4C 00143C4C 00000000 */  nop
