.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sbrk_r
/* 4B08 00104A08 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4B0C 00104A0C 1000B1FF */  sd         $17, 0x10($sp)
/* 4B10 00104A10 0000B0FF */  sd         $16, 0x0($sp)
/* 4B14 00104A14 DB01113C */  lui        $17, (0x1DB0000 >> 16)
/* 4B18 00104A18 2D808000 */  daddu      $16, $4, $0
/* 4B1C 00104A1C 2000BFFF */  sd         $31, 0x20($sp)
/* 4B20 00104A20 2D20A000 */  daddu      $4, $5, $0
/* 4B24 00104A24 5E52040C */  jal        sbrk
/* 4B28 00104A28 94BC20AE */   sw        $0, -0x436C($17)
/* 4B2C 00104A2C 2D184000 */  daddu      $3, $2, $0
/* 4B30 00104A30 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 4B34 00104A34 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* 4B38 00104A38 05006214 */  bne        $3, $2, .L00104A50
/* 4B3C 00104A3C 2000BFDF */   ld        $31, 0x20($sp)
/* 4B40 00104A40 94BC228E */  lw         $2, -0x436C($17)
/* 4B44 00104A44 02004054 */  bnel       $2, $0, .L00104A50
/* 4B48 00104A48 000002AE */   sw        $2, 0x0($16)
/* 4B4C 00104A4C 2000BFDF */  ld         $31, 0x20($sp)
.L00104A50:
/* 4B50 00104A50 2D106000 */  daddu      $2, $3, $0
/* 4B54 00104A54 1000B1DF */  ld         $17, 0x10($sp)
/* 4B58 00104A58 0000B0DF */  ld         $16, 0x0($sp)
/* 4B5C 00104A5C 0800E003 */  jr         $31
/* 4B60 00104A60 3000BD27 */   addiu     $sp, $sp, 0x30
/* 4B64 00104A64 00000000 */  nop
