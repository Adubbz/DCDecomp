.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingInitFishStatus__Fv
/* 0A99C0 001A98C0 6893838F */  lw          $3, -0x6C98($28)
/* 0A99C4 001A98C4 13006010 */  beqz        $3, .L001A9914
/* 0A99C8 001A98C8 00000000 */   nop
/* 0A99CC 001A98CC 282E0070 */  paddub      $5, $0, $0
/* 0A99D0 001A98D0 0D000010 */  b           .L001A9908
/* 0A99D4 001A98D4 00000000 */   nop
.L001A98D8:
/* 0A99D8 001A98D8 C0180500 */  sll         $3, $5, 3
/* 0A99DC 001A98DC 21186500 */  addu        $3, $3, $5
/* 0A99E0 001A98E0 80190300 */  sll         $3, $3, 6
/* 0A99E4 001A98E4 21186500 */  addu        $3, $3, $5
/* 0A99E8 001A98E8 00210300 */  sll         $4, $3, 4
/* 0A99EC 001A98EC 6893838F */  lw          $3, -0x6C98($28)
/* 0A99F0 001A98F0 21206400 */  addu        $4, $3, $4
/* 0A99F4 001A98F4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0A99F8 001A98F8 500083AC */  sw          $3, 0x50($4)
/* 0A99FC 001A98FC 4C0083AC */  sw          $3, 0x4C($4)
/* 0A9A00 001A9900 5C0080AC */  sw          $0, 0x5C($4)
/* 0A9A04 001A9904 0100A524 */  addiu       $5, $5, 0x1
.L001A9908:
/* 0A9A08 001A9908 0600A328 */  slti        $3, $5, 0x6
/* 0A9A0C 001A990C F2FF6014 */  bnez        $3, .L001A98D8
/* 0A9A10 001A9910 00000000 */   nop
.L001A9914:
/* 0A9A14 001A9914 0800E003 */  jr          $31
/* 0A9A18 001A9918 00000000 */   nop
/* 0A9A1C 001A991C 00000000 */  nop
