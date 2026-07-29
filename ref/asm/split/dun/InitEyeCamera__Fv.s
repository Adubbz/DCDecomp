.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitEyeCamera__Fv
/* 015A90 01DC1790 E0FFBD27 */  addiu       $29, $29, -0x20
/* 015A94 01DC1794 0000BF7F */  sq          $31, 0x0($29)
/* 015A98 01DC1798 EA01023C */  lui         $2, %hi(CharaMain)
/* 015A9C 01DC179C 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 015AA0 01DC17A0 E05B050C */  jal         GetRotation__7CObjectFv
/* 015AA4 01DC17A4 00000000 */   nop
/* 015AA8 01DC17A8 040040C4 */  lwc1        $f0, 0x4($2)
/* 015AAC 01DC17AC AC9C80E7 */  swc1        $f0, -0x6354($28)
/* 015AB0 01DC17B0 B09C80AF */  sw          $0, -0x6350($28)
/* 015AB4 01DC17B4 1000A427 */  addiu       $4, $29, 0x10
/* 015AB8 01DC17B8 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 015ABC 01DC17BC 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 015AC0 01DC17C0 0C86040C */  jal         sceVu0CopyVector
/* 015AC4 01DC17C4 00000000 */   nop
/* 015AC8 01DC17C8 0000BF7B */  lq          $31, 0x0($29)
/* 015ACC 01DC17CC 2000BD27 */  addiu       $29, $29, 0x20
/* 015AD0 01DC17D0 0800E003 */  jr          $31
/* 015AD4 01DC17D4 00000000 */   nop
/* 015AD8 01DC17D8 00000000 */  nop
/* 015ADC 01DC17DC 00000000 */  nop
