.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcSync
/* 01E800 0011E700 A0FFBD27 */  addiu       $29, $29, -0x60
/* 01E804 0011E704 2000B2FF */  sd          $18, 0x20($29)
/* 01E808 0011E708 2500123C */  lui         $18, %hi(mcRunCmdNo)
/* 01E80C 0011E70C 4000B4FF */  sd          $20, 0x40($29)
/* 01E810 0011E710 3000B3FF */  sd          $19, 0x30($29)
/* 01E814 0011E714 2DA0C000 */  daddu       $20, $6, $0
/* 01E818 0011E718 1000B1FF */  sd          $17, 0x10($29)
/* 01E81C 0011E71C 2D98A000 */  daddu       $19, $5, $0
/* 01E820 0011E720 380A428E */  lw          $2, %lo(mcRunCmdNo)($18)
/* 01E824 0011E724 2D888000 */  daddu       $17, $4, $0
/* 01E828 0011E728 5000BFFF */  sd          $31, 0x50($29)
/* 01E82C 0011E72C 03004014 */  bnez        $2, .L0011E73C
/* 01E830 0011E730 0000B0FF */   sd         $16, 0x0($29)
/* 01E834 0011E734 24000010 */  b           .L0011E7C8
/* 01E838 0011E738 FFFF0224 */   addiu      $2, $0, -0x1
.L0011E73C:
/* 01E83C 0011E73C 2B00103C */  lui         $16, %hi(mcClientID)
/* 01E840 0011E740 A65D040C */  jal         sceSifCheckStatRpc
/* 01E844 0011E744 40860426 */   addiu      $4, $16, %lo(mcClientID)
/* 01E848 0011E748 13002016 */  bnez        $17, .L0011E798
/* 01E84C 0011E74C 2D204000 */   daddu      $4, $2, $0
/* 01E850 0011E750 11008010 */  beqz        $4, .L0011E798
/* 01E854 0011E754 00000000 */   nop
/* 01E858 0011E758 0A000010 */  b           .L0011E784
/* 01E85C 0011E75C 00000000 */   nop
.L0011E760:
/* 01E860 0011E760 A0864234 */  ori         $2, $2, (0x186A0 & 0xFFFF)
/* 01E864 0011E764 00000000 */  nop
.L0011E768:
/* 01E868 0011E768 FFFF4224 */  addiu       $2, $2, -0x1
/* 01E86C 0011E76C 00000000 */  nop
/* 01E870 0011E770 00000000 */  nop
/* 01E874 0011E774 00000000 */  nop
/* 01E878 0011E778 00000000 */  nop
/* 01E87C 0011E77C FAFF4014 */  bnez        $2, .L0011E768
/* 01E880 0011E780 00000000 */   nop
.L0011E784:
/* 01E884 0011E784 A65D040C */  jal         sceSifCheckStatRpc
/* 01E888 0011E788 40860426 */   addiu      $4, $16, %lo(mcClientID)
/* 01E88C 0011E78C F4FF4014 */  bnez        $2, .L0011E760
/* 01E890 0011E790 0100023C */   lui        $2, (0x186A0 >> 16)
/* 01E894 0011E794 2D200000 */  daddu       $4, $0, $0
.L0011E798:
/* 01E898 0011E798 03006012 */  beqz        $19, .L0011E7A8
/* 01E89C 0011E79C 0100842C */   sltiu      $4, $4, 0x1
/* 01E8A0 0011E7A0 380A428E */  lw          $2, %lo(mcRunCmdNo)($18)
/* 01E8A4 0011E7A4 000062AE */  sw          $2, 0x0($19)
.L0011E7A8:
/* 01E8A8 0011E7A8 07008010 */  beqz        $4, .L0011E7C8
/* 01E8AC 0011E7AC 2D108000 */   daddu      $2, $4, $0
/* 01E8B0 0011E7B0 05008012 */  beqz        $20, .L0011E7C8
/* 01E8B4 0011E7B4 380A40AE */   sw         $0, %lo(mcRunCmdNo)($18)
/* 01E8B8 0011E7B8 2B00023C */  lui         $2, %hi(retval)
/* 01E8BC 0011E7BC 009C438C */  lw          $3, %lo(retval)($2)
/* 01E8C0 0011E7C0 000083AE */  sw          $3, 0x0($20)
/* 01E8C4 0011E7C4 2D108000 */  daddu       $2, $4, $0
.L0011E7C8:
/* 01E8C8 0011E7C8 5000BFDF */  ld          $31, 0x50($29)
/* 01E8CC 0011E7CC 4000B4DF */  ld          $20, 0x40($29)
/* 01E8D0 0011E7D0 3000B3DF */  ld          $19, 0x30($29)
/* 01E8D4 0011E7D4 2000B2DF */  ld          $18, 0x20($29)
/* 01E8D8 0011E7D8 1000B1DF */  ld          $17, 0x10($29)
/* 01E8DC 0011E7DC 0000B0DF */  ld          $16, 0x0($29)
/* 01E8E0 0011E7E0 0800E003 */  jr          $31
/* 01E8E4 0011E7E4 6000BD27 */   addiu      $29, $29, 0x60
