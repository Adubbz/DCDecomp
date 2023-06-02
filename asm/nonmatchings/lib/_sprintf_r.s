.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sprintf_r
/* 50F0 00104FF0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 50F4 00104FF4 2D60A000 */  daddu      $12, $5, $0
/* 50F8 00104FF8 FF7F023C */  lui        $2, (0x7FFFFFFF >> 16)
/* 50FC 00104FFC 5400A4AF */  sw         $4, 0x54($sp)
/* 5100 00105000 FFFF4234 */  ori        $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 5104 00105004 2D28C000 */  daddu      $5, $6, $0
/* 5108 00105008 08020324 */  addiu      $3, $0, 0x208
/* 510C 0010500C 6000BFFF */  sd         $31, 0x60($sp)
/* 5110 00105010 B800A7FF */  sd         $7, 0xB8($sp)
/* 5114 00105014 2D20A003 */  daddu      $4, $sp, $0
/* 5118 00105018 C000A8FF */  sd         $8, 0xC0($sp)
/* 511C 0010501C B800A627 */  addiu      $6, $sp, 0xB8
/* 5120 00105020 C800A9FF */  sd         $9, 0xC8($sp)
/* 5124 00105024 D000AAFF */  sd         $10, 0xD0($sp)
/* 5128 00105028 D800ABFF */  sd         $11, 0xD8($sp)
/* 512C 0010502C 0C00A3A7 */  sh         $3, 0xC($sp)
/* 5130 00105030 1000ACAF */  sw         $12, 0x10($sp)
/* 5134 00105034 1400A2AF */  sw         $2, 0x14($sp)
/* 5138 00105038 0000ACAF */  sw         $12, 0x0($sp)
/* 513C 0010503C 021F040C */  jal        vfprintf
/* 5140 00105040 0800A2AF */   sw        $2, 0x8($sp)
/* 5144 00105044 0000A38F */  lw         $3, 0x0($sp)
/* 5148 00105048 6000BFDF */  ld         $31, 0x60($sp)
/* 514C 0010504C 000060A0 */  sb         $0, 0x0($3)
/* 5150 00105050 0800E003 */  jr         $31
/* 5154 00105054 E000BD27 */   addiu     $sp, $sp, 0xE0
