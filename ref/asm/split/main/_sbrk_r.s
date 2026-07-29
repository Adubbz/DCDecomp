.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sbrk_r
/* 004B08 00104A08 D0FFBD27 */  addiu       $29, $29, -0x30
/* 004B0C 00104A0C 1000B1FF */  sd          $17, 0x10($29)
/* 004B10 00104A10 0000B0FF */  sd          $16, 0x0($29)
/* 004B14 00104A14 DB01113C */  lui         $17, %hi(errno)
/* 004B18 00104A18 2D808000 */  daddu       $16, $4, $0
/* 004B1C 00104A1C 2000BFFF */  sd          $31, 0x20($29)
/* 004B20 00104A20 2D20A000 */  daddu       $4, $5, $0
/* 004B24 00104A24 5E52040C */  jal         sbrk
/* 004B28 00104A28 94BC20AE */   sw         $0, %lo(errno)($17)
/* 004B2C 00104A2C 2D184000 */  daddu       $3, $2, $0
/* 004B30 00104A30 FFFF023C */  lui         $2, (0xFFFFFFFF >> 16)
/* 004B34 00104A34 FFFF4234 */  ori         $2, $2, (0xFFFFFFFF & 0xFFFF)
/* 004B38 00104A38 05006214 */  bne         $3, $2, .L00104A50
/* 004B3C 00104A3C 2000BFDF */   ld         $31, 0x20($29)
/* 004B40 00104A40 94BC228E */  lw          $2, %lo(errno)($17)
/* 004B44 00104A44 02004054 */  bnel        $2, $0, .L00104A50
/* 004B48 00104A48 000002AE */   sw         $2, 0x0($16)
/* 004B4C 00104A4C 2000BFDF */  ld          $31, 0x20($29)
.L00104A50:
/* 004B50 00104A50 2D106000 */  daddu       $2, $3, $0
/* 004B54 00104A54 1000B1DF */  ld          $17, 0x10($29)
/* 004B58 00104A58 0000B0DF */  ld          $16, 0x0($29)
/* 004B5C 00104A5C 0800E003 */  jr          $31
/* 004B60 00104A60 3000BD27 */   addiu      $29, $29, 0x30
/* 004B64 00104A64 00000000 */  nop
