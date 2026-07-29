.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetFBuffBackTex__FP9sceGsTex0
/* 02F2A0 0012F1A0 C08B838F */  lw          $3, -0x7440($28)
/* 02F2A4 0012F1A4 05006010 */  beqz        $3, .L0012F1BC
/* 02F2A8 0012F1A8 00000000 */   nop
/* 02F2AC 0012F1AC C701033C */  lui         $3, %hi(mgDBuff + 0x60)
/* 02F2B0 0012F1B0 30536624 */  addiu       $6, $3, %lo(mgDBuff + 0x60)
/* 02F2B4 0012F1B4 03000010 */  b           .L0012F1C4
/* 02F2B8 0012F1B8 00000000 */   nop
.L0012F1BC:
/* 02F2BC 0012F1BC C701033C */  lui         $3, %hi(mgDBuff + 0x150)
/* 02F2C0 0012F1C0 20546624 */  addiu       $6, $3, %lo(mgDBuff + 0x150)
.L0012F1C4:
/* 02F2C4 0012F1C4 0200C390 */  lbu         $3, 0x2($6)
/* 02F2C8 0012F1C8 3F006330 */  andi        $3, $3, 0x3F
/* 02F2CC 0012F1CC B82B0300 */  dsll        $5, $3, 14
/* 02F2D0 0012F1D0 0000C394 */  lhu         $3, 0x0($6)
/* 02F2D4 0012F1D4 FF016330 */  andi        $3, $3, 0x1FF
/* 02F2D8 0012F1D8 40190300 */  sll         $3, $3, 5
/* 02F2DC 0012F1DC 2528A300 */  or          $5, $5, $3
/* 02F2E0 0012F1E0 0300C390 */  lbu         $3, 0x3($6)
/* 02F2E4 0012F1E4 3F006330 */  andi        $3, $3, 0x3F
/* 02F2E8 0012F1E8 381D0300 */  dsll        $3, $3, 20
/* 02F2EC 0012F1EC 25306500 */  or          $6, $3, $5
/* 02F2F0 0012F1F0 02000324 */  addiu       $3, $0, 0x2
/* 02F2F4 0012F1F4 3C280300 */  dsll32      $5, $3, 0
/* 02F2F8 0012F1F8 0028033C */  lui         $3, (0x28000000 >> 16)
/* 02F2FC 0012F1FC 25186500 */  or          $3, $3, $5
/* 02F300 0012F200 2518C300 */  or          $3, $6, $3
/* 02F304 0012F204 000083FC */  sd          $3, 0x0($4)
/* 02F308 0012F208 0800E003 */  jr          $31
/* 02F30C 0012F20C 00000000 */   nop
