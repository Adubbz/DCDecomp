.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _fs_version
/* 017E78 00117D78 D0FFBD27 */  addiu       $29, $29, -0x30
/* 017E7C 00117D7C 2B00023C */  lui         $2, %hi(_fsversion)
/* 017E80 00117D80 1000B1FF */  sd          $17, 0x10($29)
/* 017E84 00117D84 2500053C */  lui         $5, %hi(D_002509DC)
/* 017E88 00117D88 0000B0FF */  sd          $16, 0x0($29)
/* 017E8C 00117D8C 38815124 */  addiu       $17, $2, %lo(_fsversion)
/* 017E90 00117D90 2000BFFF */  sd          $31, 0x20($29)
/* 017E94 00117D94 DC09A524 */  addiu       $5, $5, %lo(D_002509DC)
/* 017E98 00117D98 2D800000 */  daddu       $16, $0, $0
/* 017E9C 00117D9C 2D202002 */  daddu       $4, $17, $0
/* 017EA0 00117DA0 C60C040C */  jal         memcmp
/* 017EA4 00117DA4 04000624 */   addiu      $6, $0, 0x4
/* 017EA8 00117DA8 06004010 */  beqz        $2, .L00117DC4
/* 017EAC 00117DAC 2500023C */   lui        $2, %hi(_fswildcard)
/* 017EB0 00117DB0 2D202002 */  daddu       $4, $17, $0
/* 017EB4 00117DB4 100A458C */  lw          $5, %lo(_fswildcard)($2)
/* 017EB8 00117DB8 C60C040C */  jal         memcmp
/* 017EBC 00117DBC 04000624 */   addiu      $6, $0, 0x4
/* 017EC0 00117DC0 2B800200 */  sltu        $16, $0, $2
.L00117DC4:
/* 017EC4 00117DC4 2D100002 */  daddu       $2, $16, $0
/* 017EC8 00117DC8 2000BFDF */  ld          $31, 0x20($29)
/* 017ECC 00117DCC 1000B1DF */  ld          $17, 0x10($29)
/* 017ED0 00117DD0 0000B0DF */  ld          $16, 0x0($29)
/* 017ED4 00117DD4 0800E003 */  jr          $31
/* 017ED8 00117DD8 3000BD27 */   addiu      $29, $29, 0x30
/* 017EDC 00117DDC 00000000 */  nop
