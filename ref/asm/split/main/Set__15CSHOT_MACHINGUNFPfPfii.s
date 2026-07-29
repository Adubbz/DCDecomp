.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__15CSHOT_MACHINGUNFPfPfii
/* 0AE760 001AE660 90FFBD27 */  addiu       $29, $29, -0x70
/* 0AE764 001AE664 6000BF7F */  sq          $31, 0x60($29)
/* 0AE768 001AE668 5000B57F */  sq          $21, 0x50($29)
/* 0AE76C 001AE66C 4000B47F */  sq          $20, 0x40($29)
/* 0AE770 001AE670 3000B37F */  sq          $19, 0x30($29)
/* 0AE774 001AE674 2000B27F */  sq          $18, 0x20($29)
/* 0AE778 001AE678 1000B17F */  sq          $17, 0x10($29)
/* 0AE77C 001AE67C 0000B07F */  sq          $16, 0x0($29)
/* 0AE780 001AE680 28A68070 */  paddub      $20, $4, $0
/* 0AE784 001AE684 289EC070 */  paddub      $19, $6, $0
/* 0AE788 001AE688 2896E070 */  paddub      $18, $7, $0
/* 0AE78C 001AE68C 288E0071 */  paddub      $17, $8, $0
/* 0AE790 001AE690 FFFF1024 */  addiu       $16, $0, -0x1
/* 0AE794 001AE694 281E0070 */  paddub      $3, $0, $0
/* 0AE798 001AE698 0A000010 */  b           .L001AE6C4
/* 0AE79C 001AE69C 00000000 */   nop
.L001AE6A0:
/* 0AE7A0 001AE6A0 80100300 */  sll         $2, $3, 2
/* 0AE7A4 001AE6A4 21105400 */  addu        $2, $2, $20
/* 0AE7A8 001AE6A8 8002428C */  lw          $2, 0x280($2)
/* 0AE7AC 001AE6AC 04004014 */  bnez        $2, .L001AE6C0
/* 0AE7B0 001AE6B0 00000000 */   nop
/* 0AE7B4 001AE6B4 28866070 */  paddub      $16, $3, $0
/* 0AE7B8 001AE6B8 05000010 */  b           .L001AE6D0
/* 0AE7BC 001AE6BC 00000000 */   nop
.L001AE6C0:
/* 0AE7C0 001AE6C0 01006324 */  addiu       $3, $3, 0x1
.L001AE6C4:
/* 0AE7C4 001AE6C4 10006228 */  slti        $2, $3, 0x10
/* 0AE7C8 001AE6C8 F5FF4014 */  bnez        $2, .L001AE6A0
/* 0AE7CC 001AE6CC 00000000 */   nop
.L001AE6D0:
/* 0AE7D0 001AE6D0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0AE7D4 001AE6D4 03000216 */  bne         $16, $2, .L001AE6E4
/* 0AE7D8 001AE6D8 00000000 */   nop
/* 0AE7DC 001AE6DC 11000010 */  b           .L001AE724
/* 0AE7E0 001AE6E0 00000000 */   nop
.L001AE6E4:
/* 0AE7E4 001AE6E4 00111000 */  sll         $2, $16, 4
/* 0AE7E8 001AE6E8 21A88202 */  addu        $21, $20, $2
/* 0AE7EC 001AE6EC 2826A072 */  paddub      $4, $21, $0
/* 0AE7F0 001AE6F0 0C86040C */  jal         sceVu0CopyVector
/* 0AE7F4 001AE6F4 00000000 */   nop
/* 0AE7F8 001AE6F8 0001A426 */  addiu       $4, $21, 0x100
/* 0AE7FC 001AE6FC 282E6072 */  paddub      $5, $19, $0
/* 0AE800 001AE700 0C86040C */  jal         sceVu0CopyVector
/* 0AE804 001AE704 00000000 */   nop
/* 0AE808 001AE708 80101000 */  sll         $2, $16, 2
/* 0AE80C 001AE70C 21185400 */  addu        $3, $2, $20
/* 0AE810 001AE710 000272AC */  sw          $18, 0x200($3)
/* 0AE814 001AE714 400271AC */  sw          $17, 0x240($3)
/* 0AE818 001AE718 01000224 */  addiu       $2, $0, 0x1
/* 0AE81C 001AE71C 800262AC */  sw          $2, 0x280($3)
/* 0AE820 001AE720 28160072 */  paddub      $2, $16, $0
.L001AE724:
/* 0AE824 001AE724 6000BF7B */  lq          $31, 0x60($29)
/* 0AE828 001AE728 5000B57B */  lq          $21, 0x50($29)
/* 0AE82C 001AE72C 4000B47B */  lq          $20, 0x40($29)
/* 0AE830 001AE730 3000B37B */  lq          $19, 0x30($29)
/* 0AE834 001AE734 2000B27B */  lq          $18, 0x20($29)
/* 0AE838 001AE738 1000B17B */  lq          $17, 0x10($29)
/* 0AE83C 001AE73C 0000B07B */  lq          $16, 0x0($29)
/* 0AE840 001AE740 7000BD27 */  addiu       $29, $29, 0x70
/* 0AE844 001AE744 0800E003 */  jr          $31
/* 0AE848 001AE748 00000000 */   nop
/* 0AE84C 001AE74C 00000000 */  nop
