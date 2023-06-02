.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _kill_r
/* 5070 00104F70 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5074 00104F74 0000B0FF */  sd         $16, 0x0($sp)
/* 5078 00104F78 1000B1FF */  sd         $17, 0x10($sp)
/* 507C 00104F7C 2D808000 */  daddu      $16, $4, $0
/* 5080 00104F80 2D20A000 */  daddu      $4, $5, $0
/* 5084 00104F84 DB01113C */  lui        $17, (0x1DB0000 >> 16)
/* 5088 00104F88 2000BFFF */  sd         $31, 0x20($sp)
/* 508C 00104F8C 2D28C000 */  daddu      $5, $6, $0
/* 5090 00104F90 9252040C */  jal        kill
/* 5094 00104F94 94BC20AE */   sw        $0, -0x436C($17)
/* 5098 00104F98 2D184000 */  daddu      $3, $2, $0
/* 509C 00104F9C FFFF0224 */  addiu      $2, $0, -0x1
/* 50A0 00104FA0 05006214 */  bne        $3, $2, .L00104FB8
/* 50A4 00104FA4 2000BFDF */   ld        $31, 0x20($sp)
/* 50A8 00104FA8 94BC228E */  lw         $2, -0x436C($17)
/* 50AC 00104FAC 02004054 */  bnel       $2, $0, .L00104FB8
/* 50B0 00104FB0 000002AE */   sw        $2, 0x0($16)
/* 50B4 00104FB4 2000BFDF */  ld         $31, 0x20($sp)
.L00104FB8:
/* 50B8 00104FB8 2D106000 */  daddu      $2, $3, $0
/* 50BC 00104FBC 1000B1DF */  ld         $17, 0x10($sp)
/* 50C0 00104FC0 0000B0DF */  ld         $16, 0x0($sp)
/* 50C4 00104FC4 0800E003 */  jr         $31
/* 50C8 00104FC8 3000BD27 */   addiu     $sp, $sp, 0x30
/* 50CC 00104FCC 00000000 */  nop
