.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CCameraFollowFffff
/* 24CF0 00124BF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 24CF4 00124BF4 2000BF7F */  sq         $31, 0x20($sp)
/* 24CF8 00124BF8 1000B07F */  sq         $16, 0x10($sp)
/* 24CFC 00124BFC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 24D00 00124C00 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 24D04 00124C04 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 24D08 00124C08 28868070 */  paddub     $16, $4, $0
/* 24D0C 00124C0C 86650046 */  mov.s      $f22, $f12
/* 24D10 00124C10 466D0046 */  mov.s      $f21, $f13
/* 24D14 00124C14 06750046 */  mov.s      $f20, $f14
/* 24D18 00124C18 067B0046 */  mov.s      $f12, $f15
/* 24D1C 00124C1C BC91040C */  jal        __ct__7CCameraFf
/* 24D20 00124C20 00000000 */   nop
/* 24D24 00124C24 2A00023C */  lui        $2, %hi(__vt__13CCameraFollow)
/* 24D28 00124C28 90104224 */  addiu      $2, $2, %lo(__vt__13CCameraFollow)
/* 24D2C 00124C2C B80202AE */  sw         $2, 0x2B8($16)
/* 24D30 00124C30 C00200AE */  sw         $0, 0x2C0($16)
/* 24D34 00124C34 C40200AE */  sw         $0, 0x2C4($16)
/* 24D38 00124C38 C80200AE */  sw         $0, 0x2C8($16)
/* 24D3C 00124C3C D80214E6 */  swc1       $f20, 0x2D8($16)
/* 24D40 00124C40 DC0214E6 */  swc1       $f20, 0x2DC($16)
/* 24D44 00124C44 D00216E6 */  swc1       $f22, 0x2D0($16)
/* 24D48 00124C48 D40215E6 */  swc1       $f21, 0x2D4($16)
/* 24D4C 00124C4C 01000224 */  addiu      $2, $0, 0x1
/* 24D50 00124C50 E00202AE */  sw         $2, 0x2E0($16)
/* 24D54 00124C54 28160072 */  paddub     $2, $16, $0
/* 24D58 00124C58 2000BF7B */  lq         $31, 0x20($sp)
/* 24D5C 00124C5C 1000B07B */  lq         $16, 0x10($sp)
/* 24D60 00124C60 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 24D64 00124C64 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 24D68 00124C68 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 24D6C 00124C6C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 24D70 00124C70 0800E003 */  jr         $31
/* 24D74 00124C74 00000000 */   nop
/* 24D78 00124C78 00000000 */  nop
/* 24D7C 00124C7C 00000000 */  nop
