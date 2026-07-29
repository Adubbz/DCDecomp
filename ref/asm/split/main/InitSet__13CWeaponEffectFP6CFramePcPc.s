.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitSet__13CWeaponEffectFP6CFramePcPc
/* 0D66C0 001D65C0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0D66C4 001D65C4 3000BF7F */  sq          $31, 0x30($29)
/* 0D66C8 001D65C8 2000B27F */  sq          $18, 0x20($29)
/* 0D66CC 001D65CC 1000B17F */  sq          $17, 0x10($29)
/* 0D66D0 001D65D0 0000B07F */  sq          $16, 0x0($29)
/* 0D66D4 001D65D4 28968070 */  paddub      $18, $4, $0
/* 0D66D8 001D65D8 288EA070 */  paddub      $17, $5, $0
/* 0D66DC 001D65DC 2886E070 */  paddub      $16, $7, $0
/* 0D66E0 001D65E0 040080AC */  sw          $0, 0x4($4)
/* 0D66E4 001D65E4 000080AC */  sw          $0, 0x0($4)
/* 0D66E8 001D65E8 0B002012 */  beqz        $17, .L001D6618
/* 0D66EC 001D65EC 00000000 */   nop
/* 0D66F0 001D65F0 28262072 */  paddub      $4, $17, $0
/* 0D66F4 001D65F4 282EC070 */  paddub      $5, $6, $0
/* 0D66F8 001D65F8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0D66FC 001D65FC 00000000 */   nop
/* 0D6700 001D6600 000042AE */  sw          $2, 0x0($18)
/* 0D6704 001D6604 28262072 */  paddub      $4, $17, $0
/* 0D6708 001D6608 282E0072 */  paddub      $5, $16, $0
/* 0D670C 001D660C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0D6710 001D6610 00000000 */   nop
/* 0D6714 001D6614 040042AE */  sw          $2, 0x4($18)
.L001D6618:
/* 0D6718 001D6618 3000BF7B */  lq          $31, 0x30($29)
/* 0D671C 001D661C 2000B27B */  lq          $18, 0x20($29)
/* 0D6720 001D6620 1000B17B */  lq          $17, 0x10($29)
/* 0D6724 001D6624 0000B07B */  lq          $16, 0x0($29)
/* 0D6728 001D6628 4000BD27 */  addiu       $29, $29, 0x40
/* 0D672C 001D662C 0800E003 */  jr          $31
/* 0D6730 001D6630 00000000 */   nop
/* 0D6734 001D6634 00000000 */  nop
/* 0D6738 001D6638 00000000 */  nop
/* 0D673C 001D663C 00000000 */  nop
