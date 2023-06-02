.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpPoly__11CEditGroundFP6CCPolyfff
/* A4FE0 001A4EE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A4FE4 001A4EE4 0000BF7F */  sq         $31, 0x0($sp)
/* A4FE8 001A4EE8 F041023C */  lui        $2, (0x41F00000 >> 16)
/* A4FEC 001A4EEC 00088244 */  mtc1       $2, $f1
/* A4FF0 001A4EF0 00000000 */  nop
/* A4FF4 001A4EF4 00080C46 */  add.s      $f0, $f1, $f12
/* A4FF8 001A4EF8 1000A0E7 */  swc1       $f0, 0x10($sp)
/* A4FFC 001A4EFC 01600146 */  sub.s      $f0, $f12, $f1
/* A5000 001A4F00 2000A0E7 */  swc1       $f0, 0x20($sp)
/* A5004 001A4F04 00080E46 */  add.s      $f0, $f1, $f14
/* A5008 001A4F08 1800A0E7 */  swc1       $f0, 0x18($sp)
/* A500C 001A4F0C 01700146 */  sub.s      $f0, $f14, $f1
/* A5010 001A4F10 2800A0E7 */  swc1       $f0, 0x28($sp)
/* A5014 001A4F14 C842023C */  lui        $2, (0x42C80000 >> 16)
/* A5018 001A4F18 00088244 */  mtc1       $2, $f1
/* A501C 001A4F1C 00000000 */  nop
/* A5020 001A4F20 00080D46 */  add.s      $f0, $f1, $f13
/* A5024 001A4F24 1400A0E7 */  swc1       $f0, 0x14($sp)
/* A5028 001A4F28 01680146 */  sub.s      $f0, $f13, $f1
/* A502C 001A4F2C 2400A0E7 */  swc1       $f0, 0x24($sp)
/* A5030 001A4F30 1000A627 */  addiu      $6, $sp, 0x10
/* A5034 001A4F34 283E0070 */  paddub     $7, $0, $0
/* A5038 001A4F38 D493060C */  jal        PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
/* A503C 001A4F3C 00000000 */   nop
/* A5040 001A4F40 0000BF7B */  lq         $31, 0x0($sp)
/* A5044 001A4F44 3000BD27 */  addiu      $sp, $sp, 0x30
/* A5048 001A4F48 0800E003 */  jr         $31
/* A504C 001A4F4C 00000000 */   nop
