.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSeq__12CNPCharacterFPff
/* 564A0 001563A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 564A4 001563A4 3000BF7F */  sq         $31, 0x30($sp)
/* 564A8 001563A8 2000B17F */  sq         $17, 0x20($sp)
/* 564AC 001563AC 1000B07F */  sq         $16, 0x10($sp)
/* 564B0 001563B0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 564B4 001563B4 288EA070 */  paddub     $17, $5, $0
/* 564B8 001563B8 06650046 */  mov.s      $f20, $f12
/* 564BC 001563BC 1C59050C */  jal        GetNextSeq__12CNPCharacterFv
/* 564C0 001563C0 00000000 */   nop
/* 564C4 001563C4 28864070 */  paddub     $16, $2, $0
/* 564C8 001563C8 01000324 */  addiu      $3, $0, 0x1
/* 564CC 001563CC 000043AC */  sw         $3, 0x0($2)
/* 564D0 001563D0 10000426 */  addiu      $4, $16, 0x10
/* 564D4 001563D4 282E2072 */  paddub     $5, $17, $0
/* 564D8 001563D8 0C86040C */  jal        sceVu0CopyVector
/* 564DC 001563DC 00000000 */   nop
/* 564E0 001563E0 200014E6 */  swc1       $f20, 0x20($16)
/* 564E4 001563E4 240014E6 */  swc1       $f20, 0x24($16)
/* 564E8 001563E8 280014E6 */  swc1       $f20, 0x28($16)
/* 564EC 001563EC 01000224 */  addiu      $2, $0, 0x1
/* 564F0 001563F0 3000BF7B */  lq         $31, 0x30($sp)
/* 564F4 001563F4 2000B17B */  lq         $17, 0x20($sp)
/* 564F8 001563F8 1000B07B */  lq         $16, 0x10($sp)
/* 564FC 001563FC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 56500 00156400 4000BD27 */  addiu      $sp, $sp, 0x40
/* 56504 00156404 0800E003 */  jr         $31
/* 56508 00156408 00000000 */   nop
/* 5650C 0015640C 00000000 */  nop
