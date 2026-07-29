.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSystemMesDraw__Fv
/* 073850 00173750 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073854 00173754 0000BF7F */  sq          $31, 0x0($29)
/* 073858 00173758 948F838F */  lw          $3, -0x706C($28)
/* 07385C 0017375C 1400601C */  bgtz        $3, .L001737B0
/* 073860 00173760 00000000 */   nop
/* 073864 00173764 7880050C */  jal         SystemMesDraw__Fv
/* 073868 00173768 00000000 */   nop
/* 07386C 0017376C 5C87838F */  lw          $3, -0x78A4($28)
/* 073870 00173770 0F006018 */  blez        $3, .L001737B0
/* 073874 00173774 00000000 */   nop
/* 073878 00173778 C701023C */  lui         $2, %hi(TexManager)
/* 07387C 0017377C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 073880 00173780 D48B858F */  lw          $5, -0x742C($28)
/* 073884 00173784 D201013C */  lui         $1, %hi(EditSystemMes + 0x174C)
/* 073888 00173788 5C43268C */  lw          $6, %lo(EditSystemMes + 0x174C)($1)
/* 07388C 0017378C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 073890 00173790 00000000 */   nop
/* 073894 00173794 28260070 */  paddub      $4, $0, $0
/* 073898 00173798 046F050C */  jal         setbilinear__Fi
/* 07389C 0017379C 00000000 */   nop
/* 0738A0 001737A0 D201023C */  lui         $2, %hi(EditSystemMes)
/* 0738A4 001737A4 102C4424 */  addiu       $4, $2, %lo(EditSystemMes)
/* 0738A8 001737A8 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0738AC 001737AC 00000000 */   nop
.L001737B0:
/* 0738B0 001737B0 0000BF7B */  lq          $31, 0x0($29)
/* 0738B4 001737B4 1000BD27 */  addiu       $29, $29, 0x10
/* 0738B8 001737B8 0800E003 */  jr          $31
/* 0738BC 001737BC 00000000 */   nop
