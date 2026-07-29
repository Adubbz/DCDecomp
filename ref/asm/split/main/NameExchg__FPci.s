.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NameExchg__FPci
/* 0B5840 001B5740 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0B5844 001B5744 1000BF7F */  sq          $31, 0x10($29)
/* 0B5848 001B5748 0000B07F */  sq          $16, 0x0($29)
/* 0B584C 001B574C 28868070 */  paddub      $16, $4, $0
/* 0B5850 001B5750 C0180500 */  sll         $3, $5, 3
/* 0B5854 001B5754 CC878227 */  addiu       $2, $28, -0x7834
/* 0B5858 001B5758 21184300 */  addu        $3, $2, $3
/* 0B585C 001B575C D501023C */  lui         $2, %hi(nameblock)
/* 0B5860 001B5760 80664424 */  addiu       $4, $2, %lo(nameblock)
/* 0B5864 001B5764 0000658C */  lw          $5, 0x0($3)
/* 0B5868 001B5768 5A15040C */  jal         strcpy
/* 0B586C 001B576C 00000000 */   nop
/* 0B5870 001B5770 D501023C */  lui         $2, %hi(nameblock)
/* 0B5874 001B5774 80664424 */  addiu       $4, $2, %lo(nameblock)
/* 0B5878 001B5778 282E0072 */  paddub      $5, $16, $0
/* 0B587C 001B577C BC14040C */  jal         strcat
/* 0B5880 001B5780 00000000 */   nop
/* 0B5884 001B5784 D501023C */  lui         $2, %hi(nameblock)
/* 0B5888 001B5788 80664224 */  addiu       $2, $2, %lo(nameblock)
/* 0B588C 001B578C 1000BF7B */  lq          $31, 0x10($29)
/* 0B5890 001B5790 0000B07B */  lq          $16, 0x0($29)
/* 0B5894 001B5794 2000BD27 */  addiu       $29, $29, 0x20
/* 0B5898 001B5798 0800E003 */  jr          $31
/* 0B589C 001B579C 00000000 */   nop
