.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitFishRecord__Fv
/* 0F30A0 001F2FA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F30A4 001F2FA4 0000BF7F */  sq          $31, 0x0($29)
/* 0F30A8 001F2FA8 C701023C */  lui         $2, %hi(TexManager)
/* 0F30AC 001F2FAC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F30B0 001F2FB0 D901013C */  lui         $1, %hi(FishRecordMenu + 0x1C)
/* 0F30B4 001F2FB4 DC03258C */  lw          $5, %lo(FishRecordMenu + 0x1C)($1)
/* 0F30B8 001F2FB8 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0F30BC 001F2FBC 00000000 */   nop
/* 0F30C0 001F2FC0 C701023C */  lui         $2, %hi(TexManager)
/* 0F30C4 001F2FC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F30C8 001F2FC8 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F30CC 001F2FCC 00000000 */   nop
/* 0F30D0 001F2FD0 CC01023C */  lui         $2, %hi(GamePad)
/* 0F30D4 001F2FD4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F30D8 001F2FD8 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 0F30DC 001F2FDC 00000000 */   nop
/* 0F30E0 001F2FE0 CC01023C */  lui         $2, %hi(GamePad)
/* 0F30E4 001F2FE4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F30E8 001F2FE8 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 0F30EC 001F2FEC 00000000 */   nop
/* 0F30F0 001F2FF0 0000BF7B */  lq          $31, 0x0($29)
/* 0F30F4 001F2FF4 1000BD27 */  addiu       $29, $29, 0x10
/* 0F30F8 001F2FF8 0800E003 */  jr          $31
/* 0F30FC 001F2FFC 00000000 */   nop
