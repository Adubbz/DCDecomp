.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawItem__Fv
/* 73480 00173380 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73484 00173384 0000BF7F */  sq         $31, 0x0($sp)
/* 73488 00173388 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7348C 0017338C 2CD4238C */  lw         $3, -0x2BD4($at)
/* 73490 00173390 0D006010 */  beqz       $3, .L001733C8
/* 73494 00173394 00000000 */   nop
/* 73498 00173398 A0B8040C */  jal        GetVif1Packet__Fv
/* 7349C 0017339C 00000000 */   nop
/* 734A0 001733A0 C701033C */  lui        $3, %hi(TexManager)
/* 734A4 001733A4 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 734A8 001733A8 282E4070 */  paddub     $5, $2, $0
/* 734AC 001733AC 28000624 */  addiu      $6, $0, 0x28
/* 734B0 001733B0 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 734B4 001733B4 00000000 */   nop
/* 734B8 001733B8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 734BC 001733BC 2CD4248C */  lw         $4, -0x2BD4($at)
/* 734C0 001733C0 60BB040C */  jal        MGDraw__FP6CFrame
/* 734C4 001733C4 00000000 */   nop
.L001733C8:
/* 734C8 001733C8 0000BF7B */  lq         $31, 0x0($sp)
/* 734CC 001733CC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 734D0 001733D0 0800E003 */  jr         $31
/* 734D4 001733D4 00000000 */   nop
/* 734D8 001733D8 00000000 */  nop
/* 734DC 001733DC 00000000 */  nop
