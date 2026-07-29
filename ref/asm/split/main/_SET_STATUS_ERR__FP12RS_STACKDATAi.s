.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_STATUS_ERR__FP12RS_STACKDATAi
/* 0BD470 001BD370 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BD474 001BD374 0000BF7F */  sq          $31, 0x0($29)
/* 0BD478 001BD378 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD47C 001BD37C 00000000 */   nop
/* 0BD480 001BD380 28264070 */  paddub      $4, $2, $0
/* 0BD484 001BD384 ECC6060C */  jal         BtSetStatusErr__Fi
/* 0BD488 001BD388 00000000 */   nop
/* 0BD48C 001BD38C 1000A427 */  addiu       $4, $29, 0x10
/* 0BD490 001BD390 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0BD494 001BD394 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0BD498 001BD398 0C86040C */  jal         sceVu0CopyVector
/* 0BD49C 001BD39C 00000000 */   nop
/* 0BD4A0 001BD3A0 1400A1C7 */  lwc1        $f1, 0x14($29)
/* 0BD4A4 001BD3A4 8041023C */  lui         $2, (0x41800000 >> 16)
/* 0BD4A8 001BD3A8 00008244 */  mtc1        $2, $f0
/* 0BD4AC 001BD3AC 00000000 */  nop
/* 0BD4B0 001BD3B0 00080046 */  add.s       $f0, $f1, $f0
/* 0BD4B4 001BD3B4 1400A0E7 */  swc1        $f0, 0x14($29)
/* 0BD4B8 001BD3B8 00688044 */  mtc1        $0, $f13
/* 0BD4BC 001BD3BC A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0BD4C0 001BD3C0 00608244 */  mtc1        $2, $f12
/* 0BD4C4 001BD3C4 F09D848F */  lw          $4, -0x6210($28)
/* 0BD4C8 001BD3C8 1000A527 */  addiu       $5, $29, 0x10
/* 0BD4CC 001BD3CC 02000624 */  addiu       $6, $0, 0x2
/* 0BD4D0 001BD3D0 283EC070 */  paddub      $7, $6, $0
/* 0BD4D4 001BD3D4 01000824 */  addiu       $8, $0, 0x1
/* 0BD4D8 001BD3D8 284EC070 */  paddub      $9, $6, $0
/* 0BD4DC 001BD3DC 28560070 */  paddub      $10, $0, $0
/* 0BD4E0 001BD3E0 285E0070 */  paddub      $11, $0, $0
/* 0BD4E4 001BD3E4 E8D5060C */  jal         Set__14CCollisionDataFPfiiffiiii
/* 0BD4E8 001BD3E8 00000000 */   nop
/* 0BD4EC 001BD3EC 01000224 */  addiu       $2, $0, 0x1
/* 0BD4F0 001BD3F0 0000BF7B */  lq          $31, 0x0($29)
/* 0BD4F4 001BD3F4 2000BD27 */  addiu       $29, $29, 0x20
/* 0BD4F8 001BD3F8 0800E003 */  jr          $31
/* 0BD4FC 001BD3FC 00000000 */   nop
