.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sbprintf
/* 6F08 00106E08 70FBBD27 */  addiu      $sp, $sp, -0x490
/* 6F0C 00106E0C 00040A24 */  addiu      $10, $0, 0x400
/* 6F10 00106E10 7004B1FF */  sd         $17, 0x470($sp)
/* 6F14 00106E14 6000AB27 */  addiu      $11, $sp, 0x60
/* 6F18 00106E18 6004B0FF */  sd         $16, 0x460($sp)
/* 6F1C 00106E1C 2D888000 */  daddu      $17, $4, $0
/* 6F20 00106E20 8004BFFF */  sd         $31, 0x480($sp)
/* 6F24 00106E24 2D20A003 */  daddu      $4, $sp, $0
/* 6F28 00106E28 0C002296 */  lhu        $2, 0xC($17)
/* 6F2C 00106E2C 5400288E */  lw         $8, 0x54($17)
/* 6F30 00106E30 0E002996 */  lhu        $9, 0xE($17)
/* 6F34 00106E34 FDFF4230 */  andi       $2, $2, 0xFFFD
/* 6F38 00106E38 1C00278E */  lw         $7, 0x1C($17)
/* 6F3C 00106E3C 2400238E */  lw         $3, 0x24($17)
/* 6F40 00106E40 5400A8AF */  sw         $8, 0x54($sp)
/* 6F44 00106E44 0C00A2A7 */  sh         $2, 0xC($sp)
/* 6F48 00106E48 0E00A9A7 */  sh         $9, 0xE($sp)
/* 6F4C 00106E4C 1C00A7AF */  sw         $7, 0x1C($sp)
/* 6F50 00106E50 2400A3AF */  sw         $3, 0x24($sp)
/* 6F54 00106E54 1000ABAF */  sw         $11, 0x10($sp)
/* 6F58 00106E58 1400AAAF */  sw         $10, 0x14($sp)
/* 6F5C 00106E5C 0000ABAF */  sw         $11, 0x0($sp)
/* 6F60 00106E60 0800AAAF */  sw         $10, 0x8($sp)
/* 6F64 00106E64 B01B040C */  jal        vfiprintf
/* 6F68 00106E68 1800A0AF */   sw        $0, 0x18($sp)
/* 6F6C 00106E6C 2D804000 */  daddu      $16, $2, $0
/* 6F70 00106E70 06000006 */  bltz       $16, .L00106E8C
/* 6F74 00106E74 0C00A297 */   lhu       $2, 0xC($sp)
/* 6F78 00106E78 0806040C */  jal        fflush
/* 6F7C 00106E7C 2D20A003 */   daddu     $4, $sp, $0
/* 6F80 00106E80 FFFF0324 */  addiu      $3, $0, -0x1
/* 6F84 00106E84 0B806200 */  movn       $16, $3, $2
/* 6F88 00106E88 0C00A297 */  lhu        $2, 0xC($sp)
.L00106E8C:
/* 6F8C 00106E8C 40004230 */  andi       $2, $2, 0x40
/* 6F90 00106E90 05004010 */  beqz       $2, .L00106EA8
/* 6F94 00106E94 2D100002 */   daddu     $2, $16, $0
/* 6F98 00106E98 0C002296 */  lhu        $2, 0xC($17)
/* 6F9C 00106E9C 40004234 */  ori        $2, $2, 0x40
/* 6FA0 00106EA0 0C0022A6 */  sh         $2, 0xC($17)
/* 6FA4 00106EA4 2D100002 */  daddu      $2, $16, $0
.L00106EA8:
/* 6FA8 00106EA8 8004BFDF */  ld         $31, 0x480($sp)
/* 6FAC 00106EAC 7004B1DF */  ld         $17, 0x470($sp)
/* 6FB0 00106EB0 6004B0DF */  ld         $16, 0x460($sp)
/* 6FB4 00106EB4 0800E003 */  jr         $31
/* 6FB8 00106EB8 9004BD27 */   addiu     $sp, $sp, 0x490
/* 6FBC 00106EBC 00000000 */  nop
