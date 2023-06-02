.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EventItemSelectExit__Fv
/* 1241E0 002240E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1241E4 002240E4 0000BF7F */  sq         $31, 0x0($sp)
/* 1241E8 002240E8 C701023C */  lui        $2, %hi(TexManager)
/* 1241EC 002240EC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 1241F0 002240F0 4C97858F */  lw         $5, -0x68B4($gp)
/* 1241F4 002240F4 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 1241F8 002240F8 00000000 */   nop
/* 1241FC 002240FC C701023C */  lui        $2, %hi(TexManager)
/* 124200 00224100 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 124204 00224104 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 124208 00224108 00000000 */   nop
/* 12420C 0022410C CC01023C */  lui        $2, %hi(GamePad)
/* 124210 00224110 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 124214 00224114 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 124218 00224118 00000000 */   nop
/* 12421C 0022411C CC01023C */  lui        $2, %hi(GamePad)
/* 124220 00224120 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 124224 00224124 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 124228 00224128 00000000 */   nop
/* 12422C 0022412C 0000BF7B */  lq         $31, 0x0($sp)
/* 124230 00224130 1000BD27 */  addiu      $sp, $sp, 0x10
/* 124234 00224134 0800E003 */  jr         $31
/* 124238 00224138 00000000 */   nop
/* 12423C 0022413C 00000000 */  nop
