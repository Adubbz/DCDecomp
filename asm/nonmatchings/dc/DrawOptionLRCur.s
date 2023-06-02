.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawOptionLRCur__Fii
/* 11E550 0021E450 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 11E554 0021E454 0000BF7F */  sq         $31, 0x0($sp)
/* 11E558 0021E458 283EA070 */  paddub     $7, $5, $0
/* 11E55C 0021E45C 3800A327 */  addiu      $3, $sp, 0x38
/* 11E560 0021E460 608982DF */  ld         $2, -0x76A0($gp)
/* 11E564 0021E464 000062FC */  sd         $2, 0x0($3)
/* 11E568 0021E468 40110400 */  sll        $2, $4, 5
/* 11E56C 0021E46C 00014324 */  addiu      $3, $2, 0x100
/* 11E570 0021E470 A0010224 */  addiu      $2, $0, 0x1A0
/* 11E574 0021E474 2000A2AF */  sw         $2, 0x20($sp)
/* 11E578 0021E478 2400A3AF */  sw         $3, 0x24($sp)
/* 11E57C 0021E47C 60000524 */  addiu      $5, $0, 0x60
/* 11E580 0021E480 2800A5AF */  sw         $5, 0x28($sp)
/* 11E584 0021E484 20000324 */  addiu      $3, $0, 0x20
/* 11E588 0021E488 2C00A3AF */  sw         $3, 0x2C($sp)
/* 11E58C 0021E48C 80100400 */  sll        $2, $4, 2
/* 11E590 0021E490 21105D00 */  addu       $2, $2, $sp
/* 11E594 0021E494 3800428C */  lw         $2, 0x38($2)
/* 11E598 0021E498 1000A2AF */  sw         $2, 0x10($sp)
/* 11E59C 0021E49C B4000224 */  addiu      $2, $0, 0xB4
/* 11E5A0 0021E4A0 1400A2AF */  sw         $2, 0x14($sp)
/* 11E5A4 0021E4A4 1800A5AF */  sw         $5, 0x18($sp)
/* 11E5A8 0021E4A8 1C00A3AF */  sw         $3, 0x1C($sp)
/* 11E5AC 0021E4AC D896848F */  lw         $4, -0x6928($gp)
/* 11E5B0 0021E4B0 1000A527 */  addiu      $5, $sp, 0x10
/* 11E5B4 0021E4B4 2000A627 */  addiu      $6, $sp, 0x20
/* 11E5B8 0021E4B8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 11E5BC 0021E4BC 00000000 */   nop
/* 11E5C0 0021E4C0 0000BF7B */  lq         $31, 0x0($sp)
/* 11E5C4 0021E4C4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 11E5C8 0021E4C8 0800E003 */  jr         $31
/* 11E5CC 0021E4CC 00000000 */   nop
