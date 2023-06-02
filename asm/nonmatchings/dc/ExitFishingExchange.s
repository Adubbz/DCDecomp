.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitFishingExchange__Fv
/* F2E30 001F2D30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* F2E34 001F2D34 0000BF7F */  sq         $31, 0x0($sp)
/* F2E38 001F2D38 FFFF0224 */  addiu      $2, $0, -0x1
/* F2E3C 001F2D3C DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* F2E40 001F2D40 E40B22AC */  sw         $2, (0x1DA0BE4 & 0xFFFF)($at)
/* F2E44 001F2D44 1C8D848F */  lw         $4, -0x72E4($gp)
/* F2E48 001F2D48 D901013C */  lui        $at, (0x1D90398 >> 16)
/* F2E4C 001F2D4C 9803258C */  lw         $5, (0x1D90398 & 0xFFFF)($at)
/* F2E50 001F2D50 605F050C */  jal        SetFishingPoint__9CSaveDataFi
/* F2E54 001F2D54 00000000 */   nop
/* F2E58 001F2D58 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F2E5C 001F2D5C 90032584 */  lh         $5, (0x1D90390 & 0xFFFF)($at)
/* F2E60 001F2D60 C701023C */  lui        $2, %hi(TexManager)
/* F2E64 001F2D64 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F2E68 001F2D68 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* F2E6C 001F2D6C 00000000 */   nop
/* F2E70 001F2D70 C701023C */  lui        $2, %hi(TexManager)
/* F2E74 001F2D74 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F2E78 001F2D78 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F2E7C 001F2D7C 00000000 */   nop
/* F2E80 001F2D80 CC01023C */  lui        $2, %hi(GamePad)
/* F2E84 001F2D84 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F2E88 001F2D88 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* F2E8C 001F2D8C 00000000 */   nop
/* F2E90 001F2D90 CC01023C */  lui        $2, %hi(GamePad)
/* F2E94 001F2D94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F2E98 001F2D98 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* F2E9C 001F2D9C 00000000 */   nop
/* F2EA0 001F2DA0 0000BF7B */  lq         $31, 0x0($sp)
/* F2EA4 001F2DA4 1000BD27 */  addiu      $sp, $sp, 0x10
/* F2EA8 001F2DA8 0800E003 */  jr         $31
/* F2EAC 001F2DAC 00000000 */   nop
