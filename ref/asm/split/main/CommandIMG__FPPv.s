.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandIMG__FPPv
/* 03AB50 0013AA50 C0FFBD27 */  addiu       $29, $29, -0x40
/* 03AB54 0013AA54 2000BF7F */  sq          $31, 0x20($29)
/* 03AB58 0013AA58 1000B17F */  sq          $17, 0x10($29)
/* 03AB5C 0013AA5C 0000B07F */  sq          $16, 0x0($29)
/* 03AB60 0013AA60 988C838F */  lw          $3, -0x7368($28)
/* 03AB64 0013AA64 22006010 */  beqz        $3, .L0013AAF0
/* 03AB68 0013AA68 00000000 */   nop
/* 03AB6C 0013AA6C 0000838C */  lw          $3, 0x0($4)
/* 03AB70 0013AA70 0000718C */  lw          $17, 0x0($3)
/* 03AB74 0013AA74 04002006 */  bltz        $17, .L0013AA88
/* 03AB78 0013AA78 00000000 */   nop
/* 03AB7C 0013AA7C 0400232A */  slti        $3, $17, 0x4
/* 03AB80 0013AA80 03006014 */  bnez        $3, .L0013AA90
/* 03AB84 0013AA84 00000000 */   nop
.L0013AA88:
/* 03AB88 0013AA88 19000010 */  b           .L0013AAF0
/* 03AB8C 0013AA8C 00000000 */   nop
.L0013AA90:
/* 03AB90 0013AA90 0400858C */  lw          $5, 0x4($4)
/* 03AB94 0013AA94 B08C848F */  lw          $4, -0x7350($28)
/* 03AB98 0013AA98 3C00A627 */  addiu       $6, $29, 0x3C
/* 03AB9C 0013AA9C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 03ABA0 0013AAA0 00000000 */   nop
/* 03ABA4 0013AAA4 28864070 */  paddub      $16, $2, $0
/* 03ABA8 0013AAA8 11000012 */  beqz        $16, .L0013AAF0
/* 03ABAC 0013AAAC 00000000 */   nop
/* 03ABB0 0013AAB0 3C00A28F */  lw          $2, 0x3C($29)
/* 03ABB4 0013AAB4 03110200 */  sra         $2, $2, 4
/* 03ABB8 0013AAB8 01004524 */  addiu       $5, $2, 0x1
/* 03ABBC 0013AABC 988C848F */  lw          $4, -0x7368($28)
/* 03ABC0 0013AAC0 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 03ABC4 0013AAC4 00000000 */   nop
/* 03ABC8 0013AAC8 80201100 */  sll         $4, $17, 2
/* 03ABCC 0013AACC C801033C */  lui         $3, %hi(load_img)
/* 03ABD0 0013AAD0 B0B06324 */  addiu       $3, $3, %lo(load_img)
/* 03ABD4 0013AAD4 21186400 */  addu        $3, $3, $4
/* 03ABD8 0013AAD8 000062AC */  sw          $2, 0x0($3)
/* 03ABDC 0013AADC 3C00A68F */  lw          $6, 0x3C($29)
/* 03ABE0 0013AAE0 0000648C */  lw          $4, 0x0($3)
/* 03ABE4 0013AAE4 282E0072 */  paddub      $5, $16, $0
/* 03ABE8 0013AAE8 EC0C040C */  jal         memcpy
/* 03ABEC 0013AAEC 00000000 */   nop
.L0013AAF0:
/* 03ABF0 0013AAF0 2000BF7B */  lq          $31, 0x20($29)
/* 03ABF4 0013AAF4 1000B17B */  lq          $17, 0x10($29)
/* 03ABF8 0013AAF8 0000B07B */  lq          $16, 0x0($29)
/* 03ABFC 0013AAFC 4000BD27 */  addiu       $29, $29, 0x40
/* 03AC00 0013AB00 0800E003 */  jr          $31
/* 03AC04 0013AB04 00000000 */   nop
/* 03AC08 0013AB08 00000000 */  nop
/* 03AC0C 0013AB0C 00000000 */  nop
