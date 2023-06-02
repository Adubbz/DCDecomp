.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _fstat_r
/* 2180 00102080 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2184 00102084 0000B0FF */  sd         $16, 0x0($sp)
/* 2188 00102088 1000B1FF */  sd         $17, 0x10($sp)
/* 218C 0010208C 2D808000 */  daddu      $16, $4, $0
/* 2190 00102090 2D20A000 */  daddu      $4, $5, $0
/* 2194 00102094 DB01113C */  lui        $17, (0x1DB0000 >> 16)
/* 2198 00102098 2000BFFF */  sd         $31, 0x20($sp)
/* 219C 0010209C 2D28C000 */  daddu      $5, $6, $0
/* 21A0 001020A0 8A52040C */  jal        fstat
/* 21A4 001020A4 94BC20AE */   sw        $0, -0x436C($17)
/* 21A8 001020A8 2D184000 */  daddu      $3, $2, $0
/* 21AC 001020AC FFFF0224 */  addiu      $2, $0, -0x1
/* 21B0 001020B0 05006214 */  bne        $3, $2, .L001020C8
/* 21B4 001020B4 2000BFDF */   ld        $31, 0x20($sp)
/* 21B8 001020B8 94BC228E */  lw         $2, -0x436C($17)
/* 21BC 001020BC 02004054 */  bnel       $2, $0, .L001020C8
/* 21C0 001020C0 000002AE */   sw        $2, 0x0($16)
/* 21C4 001020C4 2000BFDF */  ld         $31, 0x20($sp)
.L001020C8:
/* 21C8 001020C8 2D106000 */  daddu      $2, $3, $0
/* 21CC 001020CC 1000B1DF */  ld         $17, 0x10($sp)
/* 21D0 001020D0 0000B0DF */  ld         $16, 0x0($sp)
/* 21D4 001020D4 0800E003 */  jr         $31
/* 21D8 001020D8 3000BD27 */   addiu     $sp, $sp, 0x30
/* 21DC 001020DC 00000000 */  nop
