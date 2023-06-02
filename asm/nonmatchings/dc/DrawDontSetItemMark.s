.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawDontSetItemMark__Fiiiii
/* 12D5C0 0022D4C0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 12D5C4 0022D4C4 2000BF7F */  sq         $31, 0x20($sp)
/* 12D5C8 0022D4C8 1000B17F */  sq         $17, 0x10($sp)
/* 12D5CC 0022D4CC 0000B07F */  sq         $16, 0x0($sp)
/* 12D5D0 0022D4D0 288E8070 */  paddub     $17, $4, $0
/* 12D5D4 0022D4D4 2856C070 */  paddub     $10, $6, $0
/* 12D5D8 0022D4D8 284EE070 */  paddub     $9, $7, $0
/* 12D5DC 0022D4DC 28860071 */  paddub     $16, $8, $0
/* 12D5E0 0022D4E0 E1FF4325 */  addiu      $3, $10, -0x1F
/* 12D5E4 0022D4E4 2A18A300 */  slt        $3, $5, $3
/* 12D5E8 0022D4E8 05006014 */  bnez       $3, .L0022D500
/* 12D5EC 0022D4EC 00000000 */   nop
/* 12D5F0 0022D4F0 FFFF2325 */  addiu      $3, $9, -0x1
/* 12D5F4 0022D4F4 2A086500 */  slt        $at, $3, $5
/* 12D5F8 0022D4F8 03002010 */  beqz       $at, .L0022D508
/* 12D5FC 0022D4FC 00000000 */   nop
.L0022D500:
/* 12D600 0022D500 20000010 */  b          .L0022D584
/* 12D604 0022D504 00000000 */   nop
.L0022D508:
/* 12D608 0022D508 5400A5AF */  sw         $5, 0x54($sp)
/* 12D60C 0022D50C 20000224 */  addiu      $2, $0, 0x20
/* 12D610 0022D510 5800A2AF */  sw         $2, 0x58($sp)
/* 12D614 0022D514 C0000224 */  addiu      $2, $0, 0xC0
/* 12D618 0022D518 5C00A2AF */  sw         $2, 0x5C($sp)
/* 12D61C 0022D51C 5400A427 */  addiu      $4, $sp, 0x54
/* 12D620 0022D520 5C00A527 */  addiu      $5, $sp, 0x5C
/* 12D624 0022D524 5800A627 */  addiu      $6, $sp, 0x58
/* 12D628 0022D528 283E4071 */  paddub     $7, $10, $0
/* 12D62C 0022D52C 28462071 */  paddub     $8, $9, $0
/* 12D630 0022D530 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 12D634 0022D534 00000000 */   nop
/* 12D638 0022D538 5800A48F */  lw         $4, 0x58($sp)
/* 12D63C 0022D53C 5C00A38F */  lw         $3, 0x5C($sp)
/* 12D640 0022D540 3C010224 */  addiu      $2, $0, 0x13C
/* 12D644 0022D544 4000A2AF */  sw         $2, 0x40($sp)
/* 12D648 0022D548 4400A3AF */  sw         $3, 0x44($sp)
/* 12D64C 0022D54C 20000224 */  addiu      $2, $0, 0x20
/* 12D650 0022D550 4800A2AF */  sw         $2, 0x48($sp)
/* 12D654 0022D554 4C00A4AF */  sw         $4, 0x4C($sp)
/* 12D658 0022D558 5400A38F */  lw         $3, 0x54($sp)
/* 12D65C 0022D55C 3000B1AF */  sw         $17, 0x30($sp)
/* 12D660 0022D560 3400A3AF */  sw         $3, 0x34($sp)
/* 12D664 0022D564 3800A2AF */  sw         $2, 0x38($sp)
/* 12D668 0022D568 3C00A4AF */  sw         $4, 0x3C($sp)
/* 12D66C 0022D56C A497848F */  lw         $4, -0x685C($gp)
/* 12D670 0022D570 3000A527 */  addiu      $5, $sp, 0x30
/* 12D674 0022D574 4000A627 */  addiu      $6, $sp, 0x40
/* 12D678 0022D578 283E0072 */  paddub     $7, $16, $0
/* 12D67C 0022D57C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12D680 0022D580 00000000 */   nop
.L0022D584:
/* 12D684 0022D584 2000BF7B */  lq         $31, 0x20($sp)
/* 12D688 0022D588 1000B17B */  lq         $17, 0x10($sp)
/* 12D68C 0022D58C 0000B07B */  lq         $16, 0x0($sp)
/* 12D690 0022D590 6000BD27 */  addiu      $sp, $sp, 0x60
/* 12D694 0022D594 0800E003 */  jr         $31
/* 12D698 0022D598 00000000 */   nop
/* 12D69C 0022D59C 00000000 */  nop
