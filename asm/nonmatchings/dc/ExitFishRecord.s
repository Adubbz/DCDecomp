.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitFishRecord__Fv
/* F30A0 001F2FA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F30A4 001F2FA4 0000BF7F */  sq         $31, 0x0($sp)
/* F30A8 001F2FA8 C701023C */  lui        $2, %hi(TexManager)
/* F30AC 001F2FAC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F30B0 001F2FB0 D901013C */  lui        $at, (0x1D903DC >> 16)
/* F30B4 001F2FB4 DC03258C */  lw         $5, (0x1D903DC & 0xFFFF)($at)
/* F30B8 001F2FB8 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* F30BC 001F2FBC 00000000 */   nop
/* F30C0 001F2FC0 C701023C */  lui        $2, %hi(TexManager)
/* F30C4 001F2FC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F30C8 001F2FC8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F30CC 001F2FCC 00000000 */   nop
/* F30D0 001F2FD0 CC01023C */  lui        $2, %hi(GamePad)
/* F30D4 001F2FD4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F30D8 001F2FD8 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* F30DC 001F2FDC 00000000 */   nop
/* F30E0 001F2FE0 CC01023C */  lui        $2, %hi(GamePad)
/* F30E4 001F2FE4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F30E8 001F2FE8 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* F30EC 001F2FEC 00000000 */   nop
/* F30F0 001F2FF0 0000BF7B */  lq         $31, 0x0($sp)
/* F30F4 001F2FF4 1000BD27 */  addiu      $sp, $sp, 0x10
/* F30F8 001F2FF8 0800E003 */  jr         $31
/* F30FC 001F2FFC 00000000 */   nop
