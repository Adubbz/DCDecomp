.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _fs_version
/* 17E78 00117D78 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 17E7C 00117D7C 2B00023C */  lui        $2, %hi(D_002A8138)
/* 17E80 00117D80 1000B1FF */  sd         $17, 0x10($sp)
/* 17E84 00117D84 2500053C */  lui        $5, %hi(D_002509DC)
/* 17E88 00117D88 0000B0FF */  sd         $16, 0x0($sp)
/* 17E8C 00117D8C 38815124 */  addiu      $17, $2, %lo(D_002A8138)
/* 17E90 00117D90 2000BFFF */  sd         $31, 0x20($sp)
/* 17E94 00117D94 DC09A524 */  addiu      $5, $5, %lo(D_002509DC)
/* 17E98 00117D98 2D800000 */  daddu      $16, $0, $0
/* 17E9C 00117D9C 2D202002 */  daddu      $4, $17, $0
/* 17EA0 00117DA0 C60C040C */  jal        memcmp
/* 17EA4 00117DA4 04000624 */   addiu     $6, $0, 0x4
/* 17EA8 00117DA8 06004010 */  beqz       $2, .L00117DC4
/* 17EAC 00117DAC 2500023C */   lui       $2, (0x250A10 >> 16)
/* 17EB0 00117DB0 2D202002 */  daddu      $4, $17, $0
/* 17EB4 00117DB4 100A458C */  lw         $5, (0x250A10 & 0xFFFF)($2)
/* 17EB8 00117DB8 C60C040C */  jal        memcmp
/* 17EBC 00117DBC 04000624 */   addiu     $6, $0, 0x4
/* 17EC0 00117DC0 2B800200 */  sltu       $16, $0, $2
.L00117DC4:
/* 17EC4 00117DC4 2D100002 */  daddu      $2, $16, $0
/* 17EC8 00117DC8 2000BFDF */  ld         $31, 0x20($sp)
/* 17ECC 00117DCC 1000B1DF */  ld         $17, 0x10($sp)
/* 17ED0 00117DD0 0000B0DF */  ld         $16, 0x0($sp)
/* 17ED4 00117DD4 0800E003 */  jr         $31
/* 17ED8 00117DD8 3000BD27 */   addiu     $sp, $sp, 0x30
/* 17EDC 00117DDC 00000000 */  nop
