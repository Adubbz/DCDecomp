.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _lf_version
/* 018CE8 00118BE8 D0FFBD27 */  addiu       $29, $29, -0x30
/* 018CEC 00118BEC 2B00023C */  lui         $2, %hi(_lfversion)
/* 018CF0 00118BF0 1000B1FF */  sd          $17, 0x10($29)
/* 018CF4 00118BF4 2500053C */  lui         $5, %hi(D_002509DC)
/* 018CF8 00118BF8 0000B0FF */  sd          $16, 0x0($29)
/* 018CFC 00118BFC A8855124 */  addiu       $17, $2, %lo(_lfversion)
/* 018D00 00118C00 2000BFFF */  sd          $31, 0x20($29)
/* 018D04 00118C04 DC09A524 */  addiu       $5, $5, %lo(D_002509DC)
/* 018D08 00118C08 2D800000 */  daddu       $16, $0, $0
/* 018D0C 00118C0C 2D202002 */  daddu       $4, $17, $0
/* 018D10 00118C10 C60C040C */  jal         memcmp
/* 018D14 00118C14 04000624 */   addiu      $6, $0, 0x4
/* 018D18 00118C18 06004010 */  beqz        $2, .L00118C34
/* 018D1C 00118C1C 2500023C */   lui        $2, %hi(_lfwildcard)
/* 018D20 00118C20 2D202002 */  daddu       $4, $17, $0
/* 018D24 00118C24 240A458C */  lw          $5, %lo(_lfwildcard)($2)
/* 018D28 00118C28 C60C040C */  jal         memcmp
/* 018D2C 00118C2C 04000624 */   addiu      $6, $0, 0x4
/* 018D30 00118C30 2B800200 */  sltu        $16, $0, $2
.L00118C34:
/* 018D34 00118C34 2D100002 */  daddu       $2, $16, $0
/* 018D38 00118C38 2000BFDF */  ld          $31, 0x20($29)
/* 018D3C 00118C3C 1000B1DF */  ld          $17, 0x10($29)
/* 018D40 00118C40 0000B0DF */  ld          $16, 0x0($29)
/* 018D44 00118C44 0800E003 */  jr          $31
/* 018D48 00118C48 3000BD27 */   addiu      $29, $29, 0x30
/* 018D4C 00118C4C 00000000 */  nop
