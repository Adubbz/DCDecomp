.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NameExchg__FPci
/* B5840 001B5740 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B5844 001B5744 1000BF7F */  sq         $31, 0x10($sp)
/* B5848 001B5748 0000B07F */  sq         $16, 0x0($sp)
/* B584C 001B574C 28868070 */  paddub     $16, $4, $0
/* B5850 001B5750 C0180500 */  sll        $3, $5, 3
/* B5854 001B5754 CC878227 */  addiu      $2, $gp, -0x7834
/* B5858 001B5758 21184300 */  addu       $3, $2, $3
/* B585C 001B575C D501023C */  lui        $2, %hi(nameblock)
/* B5860 001B5760 80664424 */  addiu      $4, $2, %lo(nameblock)
/* B5864 001B5764 0000658C */  lw         $5, 0x0($3)
/* B5868 001B5768 5A15040C */  jal        strcpy
/* B586C 001B576C 00000000 */   nop
/* B5870 001B5770 D501023C */  lui        $2, %hi(nameblock)
/* B5874 001B5774 80664424 */  addiu      $4, $2, %lo(nameblock)
/* B5878 001B5778 282E0072 */  paddub     $5, $16, $0
/* B587C 001B577C BC14040C */  jal        strcat
/* B5880 001B5780 00000000 */   nop
/* B5884 001B5784 D501023C */  lui        $2, %hi(nameblock)
/* B5888 001B5788 80664224 */  addiu      $2, $2, %lo(nameblock)
/* B588C 001B578C 1000BF7B */  lq         $31, 0x10($sp)
/* B5890 001B5790 0000B07B */  lq         $16, 0x0($sp)
/* B5894 001B5794 2000BD27 */  addiu      $sp, $sp, 0x20
/* B5898 001B5798 0800E003 */  jr         $31
/* B589C 001B579C 00000000 */   nop
