.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDrawItem__Fv
/* 073480 00173380 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073484 00173384 0000BF7F */  sq          $31, 0x0($29)
/* 073488 00173388 D401013C */  lui         $1, %hi(EdEventInfo + 0x25C)
/* 07348C 0017338C 2CD4238C */  lw          $3, %lo(EdEventInfo + 0x25C)($1)
/* 073490 00173390 0D006010 */  beqz        $3, .L001733C8
/* 073494 00173394 00000000 */   nop
/* 073498 00173398 A0B8040C */  jal         GetVif1Packet__Fv
/* 07349C 0017339C 00000000 */   nop
/* 0734A0 001733A0 C701033C */  lui         $3, %hi(TexManager)
/* 0734A4 001733A4 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 0734A8 001733A8 282E4070 */  paddub      $5, $2, $0
/* 0734AC 001733AC 28000624 */  addiu       $6, $0, 0x28
/* 0734B0 001733B0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0734B4 001733B4 00000000 */   nop
/* 0734B8 001733B8 D401013C */  lui         $1, %hi(EdEventInfo + 0x25C)
/* 0734BC 001733BC 2CD4248C */  lw          $4, %lo(EdEventInfo + 0x25C)($1)
/* 0734C0 001733C0 60BB040C */  jal         MGDraw__FP6CFrame
/* 0734C4 001733C4 00000000 */   nop
.L001733C8:
/* 0734C8 001733C8 0000BF7B */  lq          $31, 0x0($29)
/* 0734CC 001733CC 1000BD27 */  addiu       $29, $29, 0x10
/* 0734D0 001733D0 0800E003 */  jr          $31
/* 0734D4 001733D4 00000000 */   nop
/* 0734D8 001733D8 00000000 */  nop
/* 0734DC 001733DC 00000000 */  nop
