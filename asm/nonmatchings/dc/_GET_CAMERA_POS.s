.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CAMERA_POS__FP12RS_STACKDATAi
/* 91D10 00191C10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 91D14 00191C14 1000BF7F */  sq         $31, 0x10($sp)
/* 91D18 00191C18 0000B07F */  sq         $16, 0x0($sp)
/* 91D1C 00191C1C 28868070 */  paddub     $16, $4, $0
/* 91D20 00191C20 0300A128 */  slti       $at, $5, 0x3
/* 91D24 00191C24 04002010 */  beqz       $at, .L00191C38
/* 91D28 00191C28 00000000 */   nop
/* 91D2C 00191C2C 28160070 */  paddub     $2, $0, $0
/* 91D30 00191C30 10000010 */  b          .L00191C74
/* 91D34 00191C34 00000000 */   nop
.L00191C38:
/* 91D38 00191C38 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91D3C 00191C3C 10D2248C */  lw         $4, -0x2DF0($at)
/* 91D40 00191C40 04008014 */  bnez       $4, .L00191C54
/* 91D44 00191C44 00000000 */   nop
/* 91D48 00191C48 28160070 */  paddub     $2, $0, $0
/* 91D4C 00191C4C 09000010 */  b          .L00191C74
/* 91D50 00191C50 00000000 */   nop
.L00191C54:
/* 91D54 00191C54 2000A527 */  addiu      $5, $sp, 0x20
/* 91D58 00191C58 9C91040C */  jal        GetPos__7CCameraFPf
/* 91D5C 00191C5C 00000000 */   nop
/* 91D60 00191C60 28260072 */  paddub     $4, $16, $0
/* 91D64 00191C64 2000A527 */  addiu      $5, $sp, 0x20
/* 91D68 00191C68 942D060C */  jal        SetPosition__FP12RS_STACKDATAPf
/* 91D6C 00191C6C 00000000 */   nop
/* 91D70 00191C70 01000224 */  addiu      $2, $0, 0x1
.L00191C74:
/* 91D74 00191C74 1000BF7B */  lq         $31, 0x10($sp)
/* 91D78 00191C78 0000B07B */  lq         $16, 0x0($sp)
/* 91D7C 00191C7C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 91D80 00191C80 0800E003 */  jr         $31
/* 91D84 00191C84 00000000 */   nop
/* 91D88 00191C88 00000000 */  nop
/* 91D8C 00191C8C 00000000 */  nop
