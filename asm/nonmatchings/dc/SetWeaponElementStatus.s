.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWeaponElementStatus__FP11WEAPON_HAVE
/* 10F780 0020F680 16008380 */  lb         $3, 0x16($4)
/* 10F784 0020F684 05006328 */  slti       $3, $3, 0x5
/* 10F788 0020F688 01006014 */  bnez       $3, .L0020F690
/* 10F78C 0020F68C 00000000 */   nop
.L0020F690:
/* 10F790 0020F690 28360070 */  paddub     $6, $0, $0
/* 10F794 0020F694 01000724 */  addiu      $7, $0, 0x1
/* 10F798 0020F698 0A000010 */  b          .L0020F6C4
/* 10F79C 0020F69C 00000000 */   nop
.L0020F6A0:
/* 10F7A0 0020F6A0 2118E400 */  addu       $3, $7, $4
/* 10F7A4 0020F6A4 17006580 */  lb         $5, 0x17($3)
/* 10F7A8 0020F6A8 2118C400 */  addu       $3, $6, $4
/* 10F7AC 0020F6AC 17006380 */  lb         $3, 0x17($3)
/* 10F7B0 0020F6B0 2A086500 */  slt        $at, $3, $5
/* 10F7B4 0020F6B4 02002010 */  beqz       $at, .L0020F6C0
/* 10F7B8 0020F6B8 00000000 */   nop
/* 10F7BC 0020F6BC 2836E070 */  paddub     $6, $7, $0
.L0020F6C0:
/* 10F7C0 0020F6C0 0100E724 */  addiu      $7, $7, 0x1
.L0020F6C4:
/* 10F7C4 0020F6C4 0500E328 */  slti       $3, $7, 0x5
/* 10F7C8 0020F6C8 F5FF6014 */  bnez       $3, .L0020F6A0
/* 10F7CC 0020F6CC 00000000 */   nop
/* 10F7D0 0020F6D0 160086A0 */  sb         $6, 0x16($4)
/* 10F7D4 0020F6D4 0800E003 */  jr         $31
/* 10F7D8 0020F6D8 00000000 */   nop
/* 10F7DC 0020F6DC 00000000 */  nop
