.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PickUpPoly__11CEditGroundFP6CCPolyfff
/* 0A4FE0 001A4EE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0A4FE4 001A4EE4 0000BF7F */  sq          $31, 0x0($29)
/* 0A4FE8 001A4EE8 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 0A4FEC 001A4EEC 00088244 */  mtc1        $2, $f1
/* 0A4FF0 001A4EF0 00000000 */  nop
/* 0A4FF4 001A4EF4 00080C46 */  add.s       $f0, $f1, $f12
/* 0A4FF8 001A4EF8 1000A0E7 */  swc1        $f0, 0x10($29)
/* 0A4FFC 001A4EFC 01600146 */  sub.s       $f0, $f12, $f1
/* 0A5000 001A4F00 2000A0E7 */  swc1        $f0, 0x20($29)
/* 0A5004 001A4F04 00080E46 */  add.s       $f0, $f1, $f14
/* 0A5008 001A4F08 1800A0E7 */  swc1        $f0, 0x18($29)
/* 0A500C 001A4F0C 01700146 */  sub.s       $f0, $f14, $f1
/* 0A5010 001A4F10 2800A0E7 */  swc1        $f0, 0x28($29)
/* 0A5014 001A4F14 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0A5018 001A4F18 00088244 */  mtc1        $2, $f1
/* 0A501C 001A4F1C 00000000 */  nop
/* 0A5020 001A4F20 00080D46 */  add.s       $f0, $f1, $f13
/* 0A5024 001A4F24 1400A0E7 */  swc1        $f0, 0x14($29)
/* 0A5028 001A4F28 01680146 */  sub.s       $f0, $f13, $f1
/* 0A502C 001A4F2C 2400A0E7 */  swc1        $f0, 0x24($29)
/* 0A5030 001A4F30 1000A627 */  addiu       $6, $29, 0x10
/* 0A5034 001A4F34 283E0070 */  paddub      $7, $0, $0
/* 0A5038 001A4F38 D493060C */  jal         PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
/* 0A503C 001A4F3C 00000000 */   nop
/* 0A5040 001A4F40 0000BF7B */  lq          $31, 0x0($29)
/* 0A5044 001A4F44 3000BD27 */  addiu       $29, $29, 0x30
/* 0A5048 001A4F48 0800E003 */  jr          $31
/* 0A504C 001A4F4C 00000000 */   nop
