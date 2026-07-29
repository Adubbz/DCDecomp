.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitHashigo__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
/* 06D820 0016D720 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06D824 0016D724 2000BF7F */  sq          $31, 0x20($29)
/* 06D828 0016D728 1000B17F */  sq          $17, 0x10($29)
/* 06D82C 0016D72C 0000B07F */  sq          $16, 0x0($29)
/* 06D830 0016D730 28868070 */  paddub      $16, $4, $0
/* 06D834 0016D734 288EA070 */  paddub      $17, $5, $0
/* 06D838 0016D738 0000A38C */  lw          $3, 0x0($5)
/* 06D83C 0016D73C 04000224 */  addiu       $2, $0, 0x4
/* 06D840 0016D740 0C006214 */  bne         $3, $2, .L0016D774
/* 06D844 0016D744 00000000 */   nop
/* 06D848 0016D748 D0030426 */  addiu       $4, $16, 0x3D0
/* 06D84C 0016D74C 10002526 */  addiu       $5, $17, 0x10
/* 06D850 0016D750 0C86040C */  jal         sceVu0CopyVector
/* 06D854 0016D754 00000000 */   nop
/* 06D858 0016D758 C0030426 */  addiu       $4, $16, 0x3C0
/* 06D85C 0016D75C 20002526 */  addiu       $5, $17, 0x20
/* 06D860 0016D760 0C86040C */  jal         sceVu0CopyVector
/* 06D864 0016D764 00000000 */   nop
/* 06D868 0016D768 000400AE */  sw          $0, 0x400($16)
/* 06D86C 0016D76C 0B000010 */  b           .L0016D79C
/* 06D870 0016D770 00000000 */   nop
.L0016D774:
/* 06D874 0016D774 C0030426 */  addiu       $4, $16, 0x3C0
/* 06D878 0016D778 10002526 */  addiu       $5, $17, 0x10
/* 06D87C 0016D77C 0C86040C */  jal         sceVu0CopyVector
/* 06D880 0016D780 00000000 */   nop
/* 06D884 0016D784 D0030426 */  addiu       $4, $16, 0x3D0
/* 06D888 0016D788 20002526 */  addiu       $5, $17, 0x20
/* 06D88C 0016D78C 0C86040C */  jal         sceVu0CopyVector
/* 06D890 0016D790 00000000 */   nop
/* 06D894 0016D794 01000224 */  addiu       $2, $0, 0x1
/* 06D898 0016D798 000402AE */  sw          $2, 0x400($16)
.L0016D79C:
/* 06D89C 0016D79C E0030426 */  addiu       $4, $16, 0x3E0
/* 06D8A0 0016D7A0 30002526 */  addiu       $5, $17, 0x30
/* 06D8A4 0016D7A4 0C86040C */  jal         sceVu0CopyVector
/* 06D8A8 0016D7A8 00000000 */   nop
/* 06D8AC 0016D7AC 5000228E */  lw          $2, 0x50($17)
/* 06D8B0 0016D7B0 6C004CC4 */  lwc1        $f12, 0x6C($2)
/* 06D8B4 0016D7B4 2C44040C */  jal         fptosi
/* 06D8B8 0016D7B8 00000000 */   nop
/* 06D8BC 0016D7BC 200402AE */  sw          $2, 0x420($16)
/* 06D8C0 0016D7C0 5000238E */  lw          $3, 0x50($17)
/* 06D8C4 0016D7C4 1C00638C */  lw          $3, 0x1C($3)
/* 06D8C8 0016D7C8 040403AE */  sw          $3, 0x404($16)
/* 06D8CC 0016D7CC 5000238E */  lw          $3, 0x50($17)
/* 06D8D0 0016D7D0 2000638C */  lw          $3, 0x20($3)
/* 06D8D4 0016D7D4 080403AE */  sw          $3, 0x408($16)
/* 06D8D8 0016D7D8 2000BF7B */  lq          $31, 0x20($29)
/* 06D8DC 0016D7DC 1000B17B */  lq          $17, 0x10($29)
/* 06D8E0 0016D7E0 0000B07B */  lq          $16, 0x0($29)
/* 06D8E4 0016D7E4 3000BD27 */  addiu       $29, $29, 0x30
/* 06D8E8 0016D7E8 0800E003 */  jr          $31
/* 06D8EC 0016D7EC 00000000 */   nop
