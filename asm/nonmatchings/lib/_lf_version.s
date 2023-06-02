.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _lf_version
/* 18CE8 00118BE8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 18CEC 00118BEC 2B00023C */  lui        $2, %hi(D_002A85A8)
/* 18CF0 00118BF0 1000B1FF */  sd         $17, 0x10($sp)
/* 18CF4 00118BF4 2500053C */  lui        $5, %hi(D_002509DC)
/* 18CF8 00118BF8 0000B0FF */  sd         $16, 0x0($sp)
/* 18CFC 00118BFC A8855124 */  addiu      $17, $2, %lo(D_002A85A8)
/* 18D00 00118C00 2000BFFF */  sd         $31, 0x20($sp)
/* 18D04 00118C04 DC09A524 */  addiu      $5, $5, %lo(D_002509DC)
/* 18D08 00118C08 2D800000 */  daddu      $16, $0, $0
/* 18D0C 00118C0C 2D202002 */  daddu      $4, $17, $0
/* 18D10 00118C10 C60C040C */  jal        memcmp
/* 18D14 00118C14 04000624 */   addiu     $6, $0, 0x4
/* 18D18 00118C18 06004010 */  beqz       $2, .L00118C34
/* 18D1C 00118C1C 2500023C */   lui       $2, (0x250A24 >> 16)
/* 18D20 00118C20 2D202002 */  daddu      $4, $17, $0
/* 18D24 00118C24 240A458C */  lw         $5, (0x250A24 & 0xFFFF)($2)
/* 18D28 00118C28 C60C040C */  jal        memcmp
/* 18D2C 00118C2C 04000624 */   addiu     $6, $0, 0x4
/* 18D30 00118C30 2B800200 */  sltu       $16, $0, $2
.L00118C34:
/* 18D34 00118C34 2D100002 */  daddu      $2, $16, $0
/* 18D38 00118C38 2000BFDF */  ld         $31, 0x20($sp)
/* 18D3C 00118C3C 1000B1DF */  ld         $17, 0x10($sp)
/* 18D40 00118C40 0000B0DF */  ld         $16, 0x0($sp)
/* 18D44 00118C44 0800E003 */  jr         $31
/* 18D48 00118C48 3000BD27 */   addiu     $sp, $sp, 0x30
/* 18D4C 00118C4C 00000000 */  nop
