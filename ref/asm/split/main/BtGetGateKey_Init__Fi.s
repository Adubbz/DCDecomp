.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtGetGateKey_Init__Fi
/* 0D3660 001D3560 60FFBD27 */  addiu       $29, $29, -0xA0
/* 0D3664 001D3564 0000BF7F */  sq          $31, 0x0($29)
/* 0D3668 001D3568 28368070 */  paddub      $6, $4, $0
/* 0D366C 001D356C 609486AF */  sw          $6, -0x6BA0($28)
/* 0D3670 001D3570 1000A427 */  addiu       $4, $29, 0x10
/* 0D3674 001D3574 5000A527 */  addiu       $5, $29, 0x50
/* 0D3678 001D3578 48DC060C */  jal         BtGetItemNamePath__FPcPci
/* 0D367C 001D357C 00000000 */   nop
/* 0D3680 001D3580 948B828F */  lw          $2, -0x746C($28)
/* 0D3684 001D3584 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D3688 001D3588 506822AC */  sw          $2, %lo(BtCashBuffer)($1)
/* 0D368C 001D358C 0400023C */  lui         $2, (0x445C0 >> 16)
/* 0D3690 001D3590 C0454234 */  ori         $2, $2, (0x445C0 & 0xFFFF)
/* 0D3694 001D3594 F001013C */  lui         $1, %hi(BtCashBuffer + 0xC)
/* 0D3698 001D3598 5C6822AC */  sw          $2, %lo(BtCashBuffer + 0xC)($1)
/* 0D369C 001D359C F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D36A0 001D35A0 586820AC */  sw          $0, %lo(BtCashBuffer + 0x8)($1)
/* 0D36A4 001D35A4 30FB040C */  jal         StartReadBG__Fv
/* 0D36A8 001D35A8 00000000 */   nop
/* 0D36AC 001D35AC F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D36B0 001D35B0 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D36B4 001D35B4 00190200 */  sll         $3, $2, 4
/* 0D36B8 001D35B8 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D36BC 001D35BC 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D36C0 001D35C0 21284300 */  addu        $5, $2, $3
/* 0D36C4 001D35C4 4C9D85AF */  sw          $5, -0x62B4($28)
/* 0D36C8 001D35C8 1000A427 */  addiu       $4, $29, 0x10
/* 0D36CC 001D35CC 9C00A627 */  addiu       $6, $29, 0x9C
/* 0D36D0 001D35D0 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0D36D4 001D35D4 00000000 */   nop
/* 0D36D8 001D35D8 9C00A28F */  lw          $2, 0x9C($29)
/* 0D36DC 001D35DC 83110200 */  sra         $2, $2, 6
/* 0D36E0 001D35E0 01004224 */  addiu       $2, $2, 0x1
/* 0D36E4 001D35E4 80110200 */  sll         $2, $2, 6
/* 0D36E8 001D35E8 03290200 */  sra         $5, $2, 4
/* 0D36EC 001D35EC F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D36F0 001D35F0 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D36F4 001D35F4 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D36F8 001D35F8 00000000 */   nop
/* 0D36FC 001D35FC F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D3700 001D3600 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D3704 001D3604 00190200 */  sll         $3, $2, 4
/* 0D3708 001D3608 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D370C 001D360C 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D3710 001D3610 21284300 */  addu        $5, $2, $3
/* 0D3714 001D3614 509D85AF */  sw          $5, -0x62B0($28)
/* 0D3718 001D3618 5000A427 */  addiu       $4, $29, 0x50
/* 0D371C 001D361C 9C00A627 */  addiu       $6, $29, 0x9C
/* 0D3720 001D3620 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0D3724 001D3624 00000000 */   nop
/* 0D3728 001D3628 9C00A28F */  lw          $2, 0x9C($29)
/* 0D372C 001D362C 83110200 */  sra         $2, $2, 6
/* 0D3730 001D3630 01004224 */  addiu       $2, $2, 0x1
/* 0D3734 001D3634 80110200 */  sll         $2, $2, 6
/* 0D3738 001D3638 03290200 */  sra         $5, $2, 4
/* 0D373C 001D363C F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D3740 001D3640 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D3744 001D3644 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D3748 001D3648 00000000 */   nop
/* 0D374C 001D364C 0005770C */  jal         ResetMovePower__Fv
/* 0D3750 001D3650 00000000 */   nop
/* 0D3754 001D3654 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D3758 001D3658 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0D375C 001D365C 789C838F */  lw          $3, -0x6388($28)
/* 0D3760 001D3660 01000224 */  addiu       $2, $0, 0x1
/* 0D3764 001D3664 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D3768 001D3668 21086100 */  addu        $1, $3, $1
/* 0D376C 001D366C 0C8B22AC */  sw          $2, -0x74F4($1)
/* 0D3770 001D3670 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D3774 001D3674 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0D3778 001D3678 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D377C 001D367C 1C4522AC */  sw          $2, %lo(BtActStatus + 0x9C)($1)
/* 0D3780 001D3680 649480AF */  sw          $0, -0x6B9C($28)
/* 0D3784 001D3684 5CFA760C */  jal         autoCamTrial__Fv
/* 0D3788 001D3688 00000000 */   nop
/* 0D378C 001D368C 0000BF7B */  lq          $31, 0x0($29)
/* 0D3790 001D3690 A000BD27 */  addiu       $29, $29, 0xA0
/* 0D3794 001D3694 0800E003 */  jr          $31
/* 0D3798 001D3698 00000000 */   nop
/* 0D379C 001D369C 00000000 */  nop
