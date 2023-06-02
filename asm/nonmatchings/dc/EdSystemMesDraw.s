.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSystemMesDraw__Fv
/* 73850 00173750 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73854 00173754 0000BF7F */  sq         $31, 0x0($sp)
/* 73858 00173758 948F838F */  lw         $3, -0x706C($gp)
/* 7385C 0017375C 1400601C */  bgtz       $3, .L001737B0
/* 73860 00173760 00000000 */   nop
/* 73864 00173764 7880050C */  jal        SystemMesDraw__Fv
/* 73868 00173768 00000000 */   nop
/* 7386C 0017376C 5C87838F */  lw         $3, -0x78A4($gp)
/* 73870 00173770 0F006018 */  blez       $3, .L001737B0
/* 73874 00173774 00000000 */   nop
/* 73878 00173778 C701023C */  lui        $2, %hi(TexManager)
/* 7387C 0017377C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 73880 00173780 D48B858F */  lw         $5, -0x742C($gp)
/* 73884 00173784 D201013C */  lui        $at, (0x1D2435C >> 16)
/* 73888 00173788 5C43268C */  lw         $6, (0x1D2435C & 0xFFFF)($at)
/* 7388C 0017378C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 73890 00173790 00000000 */   nop
/* 73894 00173794 28260070 */  paddub     $4, $0, $0
/* 73898 00173798 046F050C */  jal        setbilinear__Fi
/* 7389C 0017379C 00000000 */   nop
/* 738A0 001737A0 D201023C */  lui        $2, %hi(EditSystemMes)
/* 738A4 001737A4 102C4424 */  addiu      $4, $2, %lo(EditSystemMes)
/* 738A8 001737A8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 738AC 001737AC 00000000 */   nop
.L001737B0:
/* 738B0 001737B0 0000BF7B */  lq         $31, 0x0($sp)
/* 738B4 001737B4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 738B8 001737B8 0800E003 */  jr         $31
/* 738BC 001737BC 00000000 */   nop
