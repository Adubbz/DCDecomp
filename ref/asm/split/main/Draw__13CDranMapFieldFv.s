.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__13CDranMapFieldFv
/* 0CD820 001CD720 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0CD824 001CD724 2000BF7F */  sq          $31, 0x20($29)
/* 0CD828 001CD728 1000B17F */  sq          $17, 0x10($29)
/* 0CD82C 001CD72C 0000B07F */  sq          $16, 0x0($29)
/* 0CD830 001CD730 288E8070 */  paddub      $17, $4, $0
/* 0CD834 001CD734 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD838 001CD738 21088100 */  addu        $1, $4, $1
/* 0CD83C 001CD73C A0D4238C */  lw          $3, -0x2B60($1)
/* 0CD840 001CD740 1C006010 */  beqz        $3, .L001CD7B4
/* 0CD844 001CD744 00000000 */   nop
/* 0CD848 001CD748 28860070 */  paddub      $16, $0, $0
/* 0CD84C 001CD74C 13000010 */  b           .L001CD79C
/* 0CD850 001CD750 00000000 */   nop
.L001CD754:
/* 0CD854 001CD754 B0110324 */  addiu       $3, $0, 0x11B0
/* 0CD858 001CD758 18180302 */  mult        $3, $16, $3
/* 0CD85C 001CD75C 21207100 */  addu        $4, $3, $17
/* 0CD860 001CD760 BC00838C */  lw          $3, 0xBC($4)
/* 0CD864 001CD764 0C006010 */  beqz        $3, .L001CD798
/* 0CD868 001CD768 00000000 */   nop
/* 0CD86C 001CD76C 80181000 */  sll         $3, $16, 2
/* 0CD870 001CD770 21187100 */  addu        $3, $3, $17
/* 0CD874 001CD774 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD878 001CD778 21086100 */  addu        $1, $3, $1
/* 0CD87C 001CD77C 70D4238C */  lw          $3, -0x2B90($1)
/* 0CD880 001CD780 05006010 */  beqz        $3, .L001CD798
/* 0CD884 001CD784 00000000 */   nop
/* 0CD888 001CD788 A000998C */  lw          $25, 0xA0($4)
/* 0CD88C 001CD78C AC00398F */  lw          $25, 0xAC($25)
/* 0CD890 001CD790 09F82003 */  jalr        $25
/* 0CD894 001CD794 00000000 */   nop
.L001CD798:
/* 0CD898 001CD798 01001026 */  addiu       $16, $16, 0x1
.L001CD79C:
/* 0CD89C 001CD79C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD8A0 001CD7A0 21082102 */  addu        $1, $17, $1
/* 0CD8A4 001CD7A4 A0D4238C */  lw          $3, -0x2B60($1)
/* 0CD8A8 001CD7A8 2A180302 */  slt         $3, $16, $3
/* 0CD8AC 001CD7AC E9FF6014 */  bnez        $3, .L001CD754
/* 0CD8B0 001CD7B0 00000000 */   nop
.L001CD7B4:
/* 0CD8B4 001CD7B4 2000BF7B */  lq          $31, 0x20($29)
/* 0CD8B8 001CD7B8 1000B17B */  lq          $17, 0x10($29)
/* 0CD8BC 001CD7BC 0000B07B */  lq          $16, 0x0($29)
/* 0CD8C0 001CD7C0 3000BD27 */  addiu       $29, $29, 0x30
/* 0CD8C4 001CD7C4 0800E003 */  jr          $31
/* 0CD8C8 001CD7C8 00000000 */   nop
/* 0CD8CC 001CD7CC 00000000 */  nop
