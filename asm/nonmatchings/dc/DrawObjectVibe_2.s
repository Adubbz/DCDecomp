.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawObjectVibe__FiiP8CTexture4RECTUci
/* 116FD0 00216ED0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 116FD4 00216ED4 0000BF7F */  sq         $31, 0x0($sp)
/* 116FD8 00216ED8 1000A227 */  addiu      $2, $sp, 0x10
/* 116FDC 00216EDC 0000E3C4 */  lwc1       $f3, 0x0($7)
/* 116FE0 00216EE0 0400E2C4 */  lwc1       $f2, 0x4($7)
/* 116FE4 00216EE4 0800E1C4 */  lwc1       $f1, 0x8($7)
/* 116FE8 00216EE8 0C00E0C4 */  lwc1       $f0, 0xC($7)
/* 116FEC 00216EEC 000043E4 */  swc1       $f3, 0x0($2)
/* 116FF0 00216EF0 040042E4 */  swc1       $f2, 0x4($2)
/* 116FF4 00216EF4 080041E4 */  swc1       $f1, 0x8($2)
/* 116FF8 00216EF8 0C0040E4 */  swc1       $f0, 0xC($2)
/* 116FFC 00216EFC 1C00AA8F */  lw         $10, 0x1C($sp)
/* 117000 00216F00 1800A78F */  lw         $7, 0x18($sp)
/* 117004 00216F04 1400A38F */  lw         $3, 0x14($sp)
/* 117008 00216F08 1000A28F */  lw         $2, 0x10($sp)
/* 11700C 00216F0C 2000A2AF */  sw         $2, 0x20($sp)
/* 117010 00216F10 2400A3AF */  sw         $3, 0x24($sp)
/* 117014 00216F14 2800A7AF */  sw         $7, 0x28($sp)
/* 117018 00216F18 2C00AAAF */  sw         $10, 0x2C($sp)
/* 11701C 00216F1C 2000A727 */  addiu      $7, $sp, 0x20
/* 117020 00216F20 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 117024 00216F24 00000000 */   nop
/* 117028 00216F28 0000BF7B */  lq         $31, 0x0($sp)
/* 11702C 00216F2C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 117030 00216F30 0800E003 */  jr         $31
/* 117034 00216F34 00000000 */   nop
/* 117038 00216F38 00000000 */  nop
/* 11703C 00216F3C 00000000 */  nop
