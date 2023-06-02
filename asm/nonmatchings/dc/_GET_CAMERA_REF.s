.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CAMERA_REF__FP12RS_STACKDATAi
/* 91E20 00191D20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 91E24 00191D24 1000BF7F */  sq         $31, 0x10($sp)
/* 91E28 00191D28 0000B07F */  sq         $16, 0x0($sp)
/* 91E2C 00191D2C 28868070 */  paddub     $16, $4, $0
/* 91E30 00191D30 0300A128 */  slti       $at, $5, 0x3
/* 91E34 00191D34 04002010 */  beqz       $at, .L00191D48
/* 91E38 00191D38 00000000 */   nop
/* 91E3C 00191D3C 28160070 */  paddub     $2, $0, $0
/* 91E40 00191D40 10000010 */  b          .L00191D84
/* 91E44 00191D44 00000000 */   nop
.L00191D48:
/* 91E48 00191D48 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91E4C 00191D4C 10D2248C */  lw         $4, -0x2DF0($at)
/* 91E50 00191D50 04008014 */  bnez       $4, .L00191D64
/* 91E54 00191D54 00000000 */   nop
/* 91E58 00191D58 28160070 */  paddub     $2, $0, $0
/* 91E5C 00191D5C 09000010 */  b          .L00191D84
/* 91E60 00191D60 00000000 */   nop
.L00191D64:
/* 91E64 00191D64 2000A527 */  addiu      $5, $sp, 0x20
/* 91E68 00191D68 A891040C */  jal        GetRef__7CCameraFPf
/* 91E6C 00191D6C 00000000 */   nop
/* 91E70 00191D70 28260072 */  paddub     $4, $16, $0
/* 91E74 00191D74 2000A527 */  addiu      $5, $sp, 0x20
/* 91E78 00191D78 942D060C */  jal        SetPosition__FP12RS_STACKDATAPf
/* 91E7C 00191D7C 00000000 */   nop
/* 91E80 00191D80 01000224 */  addiu      $2, $0, 0x1
.L00191D84:
/* 91E84 00191D84 1000BF7B */  lq         $31, 0x10($sp)
/* 91E88 00191D88 0000B07B */  lq         $16, 0x0($sp)
/* 91E8C 00191D8C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 91E90 00191D90 0800E003 */  jr         $31
/* 91E94 00191D94 00000000 */   nop
/* 91E98 00191D98 00000000 */  nop
/* 91E9C 00191D9C 00000000 */  nop
