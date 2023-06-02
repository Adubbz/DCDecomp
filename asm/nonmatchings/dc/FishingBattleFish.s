.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingBattleFish__Fi
/* A9750 001A9650 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* A9754 001A9654 0000BF7F */  sq         $31, 0x0($sp)
/* A9758 001A9658 709380AF */  sw         $0, -0x6C90($gp)
/* A975C 001A965C 12008004 */  bltz       $4, .L001A96A8
/* A9760 001A9660 00000000 */   nop
/* A9764 001A9664 06008128 */  slti       $at, $4, 0x6
/* A9768 001A9668 0F002010 */  beqz       $at, .L001A96A8
/* A976C 001A966C 00000000 */   nop
/* A9770 001A9670 C0180400 */  sll        $3, $4, 3
/* A9774 001A9674 21186400 */  addu       $3, $3, $4
/* A9778 001A9678 80190300 */  sll        $3, $3, 6
/* A977C 001A967C 21186400 */  addu       $3, $3, $4
/* A9780 001A9680 00210300 */  sll        $4, $3, 4
/* A9784 001A9684 6893838F */  lw         $3, -0x6C98($gp)
/* A9788 001A9688 21206400 */  addu       $4, $3, $4
/* A978C 001A968C 5000858C */  lw         $5, 0x50($4)
/* A9790 001A9690 08000324 */  addiu      $3, $0, 0x8
/* A9794 001A9694 0400A314 */  bne        $5, $3, .L001A96A8
/* A9798 001A9698 00000000 */   nop
/* A979C 001A969C 709384AF */  sw         $4, -0x6C90($gp)
/* A97A0 001A96A0 5003090C */  jal        SetBattleMode__5CFishFv
/* A97A4 001A96A4 00000000 */   nop
.L001A96A8:
/* A97A8 001A96A8 0000BF7B */  lq         $31, 0x0($sp)
/* A97AC 001A96AC 1000BD27 */  addiu      $sp, $sp, 0x10
/* A97B0 001A96B0 0800E003 */  jr         $31
/* A97B4 001A96B4 00000000 */   nop
/* A97B8 001A96B8 00000000 */  nop
/* A97BC 001A96BC 00000000 */  nop
