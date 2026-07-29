.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_NPC_CLOTH__FP12RS_STACKDATAi
/* 08F3B0 0018F2B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08F3B4 0018F2B4 0000BF7F */  sq          $31, 0x0($29)
/* 08F3B8 0018F2B8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F3BC 0018F2BC 00000000 */   nop
/* 08F3C0 0018F2C0 FFFF0324 */  addiu       $3, $0, -0x1
/* 08F3C4 0018F2C4 05004314 */  bne         $2, $3, .L0018F2DC
/* 08F3C8 0018F2C8 00000000 */   nop
/* 08F3CC 0018F2CC D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08F3D0 0018F2D0 1CD2228C */  lw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 08F3D4 0018F2D4 04000010 */  b           .L0018F2E8
/* 08F3D8 0018F2D8 00000000 */   nop
.L0018F2DC:
/* 08F3DC 0018F2DC 28264070 */  paddub      $4, $2, $0
/* 08F3E0 0018F2E0 702C060C */  jal         GetNPC__Fi
/* 08F3E4 0018F2E4 00000000 */   nop
.L0018F2E8:
/* 08F3E8 0018F2E8 04004014 */  bnez        $2, .L0018F2FC
/* 08F3EC 0018F2EC 00000000 */   nop
/* 08F3F0 0018F2F0 28160070 */  paddub      $2, $0, $0
/* 08F3F4 0018F2F4 08000010 */  b           .L0018F318
/* 08F3F8 0018F2F8 00000000 */   nop
.L0018F2FC:
/* 08F3FC 0018F2FC 28264070 */  paddub      $4, $2, $0
/* 08F400 0018F300 FFFF0524 */  addiu       $5, $0, -0x1
/* 08F404 0018F304 A000598C */  lw          $25, 0xA0($2)
/* 08F408 0018F308 9400398F */  lw          $25, 0x94($25)
/* 08F40C 0018F30C 09F82003 */  jalr        $25
/* 08F410 0018F310 00000000 */   nop
/* 08F414 0018F314 01000224 */  addiu       $2, $0, 0x1
.L0018F318:
/* 08F418 0018F318 0000BF7B */  lq          $31, 0x0($29)
/* 08F41C 0018F31C 1000BD27 */  addiu       $29, $29, 0x10
/* 08F420 0018F320 0800E003 */  jr          $31
/* 08F424 0018F324 00000000 */   nop
/* 08F428 0018F328 00000000 */  nop
/* 08F42C 0018F32C 00000000 */  nop
