.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingFishStatus__FPi
/* A9670 001A9570 6893828F */  lw         $2, -0x6C98($gp)
/* A9674 001A9574 04004014 */  bnez       $2, .L001A9588
/* A9678 001A9578 00000000 */   nop
/* A967C 001A957C FFFF0224 */  addiu      $2, $0, -0x1
/* A9680 001A9580 2F000010 */  b          .L001A9640
/* A9684 001A9584 00000000 */   nop
.L001A9588:
/* A9688 001A9588 FFFF0224 */  addiu      $2, $0, -0x1
/* A968C 001A958C 28360070 */  paddub     $6, $0, $0
/* A9690 001A9590 28000010 */  b          .L001A9634
/* A9694 001A9594 00000000 */   nop
.L001A9598:
/* A9698 001A9598 02008010 */  beqz       $4, .L001A95A4
/* A969C 001A959C 00000000 */   nop
/* A96A0 001A95A0 000086AC */  sw         $6, 0x0($4)
.L001A95A4:
/* A96A4 001A95A4 FFFF0324 */  addiu      $3, $0, -0x1
/* A96A8 001A95A8 0D004314 */  bne        $2, $3, .L001A95E0
/* A96AC 001A95AC 00000000 */   nop
/* A96B0 001A95B0 C0180600 */  sll        $3, $6, 3
/* A96B4 001A95B4 21186600 */  addu       $3, $3, $6
/* A96B8 001A95B8 80190300 */  sll        $3, $3, 6
/* A96BC 001A95BC 21186600 */  addu       $3, $3, $6
/* A96C0 001A95C0 00290300 */  sll        $5, $3, 4
/* A96C4 001A95C4 6893838F */  lw         $3, -0x6C98($gp)
/* A96C8 001A95C8 21186500 */  addu       $3, $3, $5
/* A96CC 001A95CC 5000658C */  lw         $5, 0x50($3)
/* A96D0 001A95D0 07000324 */  addiu      $3, $0, 0x7
/* A96D4 001A95D4 0200A314 */  bne        $5, $3, .L001A95E0
/* A96D8 001A95D8 00000000 */   nop
/* A96DC 001A95DC 28166070 */  paddub     $2, $3, $0
.L001A95E0:
/* A96E0 001A95E0 C0180600 */  sll        $3, $6, 3
/* A96E4 001A95E4 21186600 */  addu       $3, $3, $6
/* A96E8 001A95E8 80190300 */  sll        $3, $3, 6
/* A96EC 001A95EC 21186600 */  addu       $3, $3, $6
/* A96F0 001A95F0 00290300 */  sll        $5, $3, 4
/* A96F4 001A95F4 6893838F */  lw         $3, -0x6C98($gp)
/* A96F8 001A95F8 21186500 */  addu       $3, $3, $5
/* A96FC 001A95FC 5000658C */  lw         $5, 0x50($3)
/* A9700 001A9600 08000324 */  addiu      $3, $0, 0x8
/* A9704 001A9604 0400A314 */  bne        $5, $3, .L001A9618
/* A9708 001A9608 00000000 */   nop
/* A970C 001A960C 28166070 */  paddub     $2, $3, $0
/* A9710 001A9610 0B000010 */  b          .L001A9640
/* A9714 001A9614 00000000 */   nop
.L001A9618:
/* A9718 001A9618 0B000324 */  addiu      $3, $0, 0xB
/* A971C 001A961C 0400A314 */  bne        $5, $3, .L001A9630
/* A9720 001A9620 00000000 */   nop
/* A9724 001A9624 28166070 */  paddub     $2, $3, $0
/* A9728 001A9628 05000010 */  b          .L001A9640
/* A972C 001A962C 00000000 */   nop
.L001A9630:
/* A9730 001A9630 0100C624 */  addiu      $6, $6, 0x1
.L001A9634:
/* A9734 001A9634 0600C328 */  slti       $3, $6, 0x6
/* A9738 001A9638 D7FF6014 */  bnez       $3, .L001A9598
/* A973C 001A963C 00000000 */   nop
.L001A9640:
/* A9740 001A9640 0800E003 */  jr         $31
/* A9744 001A9644 00000000 */   nop
/* A9748 001A9648 00000000 */  nop
/* A974C 001A964C 00000000 */  nop