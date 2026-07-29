.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditMenuExit__Fv
/* 110EA0 00210DA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 110EA4 00210DA4 0000BF7F */  sq          $31, 0x0($29)
/* 110EA8 00210DA8 2900023C */  lui         $2, %hi(LIT_466__2)
/* 110EAC 00210DAC B03C4224 */  addiu       $2, $2, %lo(LIT_466__2)
/* 110EB0 00210DB0 1000A427 */  addiu       $4, $29, 0x10
/* 110EB4 00210DB4 00004378 */  lq          $3, 0x0($2)
/* 110EB8 00210DB8 100042C4 */  lwc1        $f2, 0x10($2)
/* 110EBC 00210DBC 0000837C */  sq          $3, 0x0($4)
/* 110EC0 00210DC0 100082E4 */  swc1        $f2, 0x10($4)
/* 110EC4 00210DC4 4096828F */  lw          $2, -0x69C0($28)
/* 110EC8 00210DC8 1000A2AF */  sw          $2, 0x10($29)
/* 110ECC 00210DCC 4896828F */  lw          $2, -0x69B8($28)
/* 110ED0 00210DD0 1400A2AF */  sw          $2, 0x14($29)
/* 110ED4 00210DD4 4C96828F */  lw          $2, -0x69B4($28)
/* 110ED8 00210DD8 1800A2AF */  sw          $2, 0x18($29)
/* 110EDC 00210DDC 5096828F */  lw          $2, -0x69B0($28)
/* 110EE0 00210DE0 1C00A2AF */  sw          $2, 0x1C($29)
/* 110EE4 00210DE4 4CB4080C */  jal         MenuTextureDelete__FPi
/* 110EE8 00210DE8 00000000 */   nop
/* 110EEC 00210DEC C701023C */  lui         $2, %hi(TexManager)
/* 110EF0 00210DF0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 110EF4 00210DF4 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 110EF8 00210DF8 00000000 */   nop
/* 110EFC 00210DFC CC01023C */  lui         $2, %hi(GamePad)
/* 110F00 00210E00 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 110F04 00210E04 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 110F08 00210E08 00000000 */   nop
/* 110F0C 00210E0C CC01023C */  lui         $2, %hi(GamePad)
/* 110F10 00210E10 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 110F14 00210E14 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 110F18 00210E18 00000000 */   nop
/* 110F1C 00210E1C 0000BF7B */  lq          $31, 0x0($29)
/* 110F20 00210E20 3000BD27 */  addiu       $29, $29, 0x30
/* 110F24 00210E24 0800E003 */  jr          $31
/* 110F28 00210E28 00000000 */   nop
/* 110F2C 00210E2C 00000000 */  nop
