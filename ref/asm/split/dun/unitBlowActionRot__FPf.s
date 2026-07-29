.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel unitBlowActionRot__FPf
/* 015180 01DC0E80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 015184 01DC0E84 1000BF7F */  sq          $31, 0x10($29)
/* 015188 01DC0E88 0000B07F */  sq          $16, 0x0($29)
/* 01518C 01DC0E8C 28868070 */  paddub      $16, $4, $0
/* 015190 01DC0E90 109D848F */  lw          $4, -0x62F0($28)
/* 015194 01DC0E94 2000A527 */  addiu       $5, $29, 0x20
/* 015198 01DC0E98 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 01519C 01DC0E9C 00000000 */   nop
/* 0151A0 01DC0EA0 00000CC6 */  lwc1        $f12, 0x0($16)
/* 0151A4 01DC0EA4 08000DC6 */  lwc1        $f13, 0x8($16)
/* 0151A8 01DC0EA8 5077040C */  jal         atan2f
/* 0151AC 01DC0EAC 00000000 */   nop
/* 0151B0 01DC0EB0 2400A227 */  addiu       $2, $29, 0x24
/* 0151B4 01DC0EB4 000040E4 */  swc1        $f0, 0x0($2)
/* 0151B8 01DC0EB8 B08081C7 */  lwc1        $f1, -0x7F50($28)
/* 0151BC 01DC0EBC 41000146 */  sub.s       $f1, $f0, $f1
/* 0151C0 01DC0EC0 000041E4 */  swc1        $f1, 0x0($2)
/* 0151C4 01DC0EC4 2C8580C7 */  lwc1        $f0, -0x7AD4($28)
/* 0151C8 01DC0EC8 36080046 */  c.le.s      $f1, $f0
/* 0151CC 01DC0ECC 00000000 */  nop
/* 0151D0 01DC0ED0 05000045 */  bc1f        .L01DC0EE8_2FC4E8
/* 0151D4 01DC0ED4 00000000 */   nop
/* 0151D8 01DC0ED8 000041C4 */  lwc1        $f1, 0x0($2)
/* 0151DC 01DC0EDC 308580C7 */  lwc1        $f0, -0x7AD0($28)
/* 0151E0 01DC0EE0 00080046 */  add.s       $f0, $f1, $f0
/* 0151E4 01DC0EE4 000040E4 */  swc1        $f0, 0x0($2)
.L01DC0EE8_2FC4E8:
/* 0151E8 01DC0EE8 109D848F */  lw          $4, -0x62F0($28)
/* 0151EC 01DC0EEC 2000ACC7 */  lwc1        $f12, 0x20($29)
/* 0151F0 01DC0EF0 00004DC4 */  lwc1        $f13, 0x0($2)
/* 0151F4 01DC0EF4 2800AEC7 */  lwc1        $f14, 0x28($29)
/* 0151F8 01DC0EF8 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0151FC 01DC0EFC 00000000 */   nop
/* 015200 01DC0F00 1000BF7B */  lq          $31, 0x10($29)
/* 015204 01DC0F04 0000B07B */  lq          $16, 0x0($29)
/* 015208 01DC0F08 3000BD27 */  addiu       $29, $29, 0x30
/* 01520C 01DC0F0C 0800E003 */  jr          $31
/* 015210 01DC0F10 00000000 */   nop
/* 015214 01DC0F14 00000000 */  nop
/* 015218 01DC0F18 00000000 */  nop
/* 01521C 01DC0F1C 00000000 */  nop
