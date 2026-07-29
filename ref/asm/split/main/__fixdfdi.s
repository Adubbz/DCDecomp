.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __fixdfdi
/* 00E5F0 0010E4F0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00E5F4 0010E4F4 1000B1FF */  sd          $17, 0x10($29)
/* 00E5F8 0010E4F8 0000B0FF */  sd          $16, 0x0($29)
/* 00E5FC 0010E4FC 2D880000 */  daddu       $17, $0, $0
/* 00E600 0010E500 2D808000 */  daddu       $16, $4, $0
/* 00E604 0010E504 2000BFFF */  sd          $31, 0x20($29)
/* 00E608 0010E508 E840040C */  jal         dpcmp
/* 00E60C 0010E50C 2D282002 */   daddu      $5, $17, $0
/* 00E610 0010E510 07004104 */  bgez        $2, .L0010E530
/* 00E614 0010E514 2D202002 */   daddu      $4, $17, $0
/* 00E618 0010E518 843F040C */  jal         dpsub
/* 00E61C 0010E51C 2D280002 */   daddu      $5, $16, $0
/* 00E620 0010E520 5439040C */  jal         __fixunsdfdi
/* 00E624 0010E524 2D204000 */   daddu      $4, $2, $0
/* 00E628 0010E528 03000010 */  b           .L0010E538
/* 00E62C 0010E52C 2F100200 */   dsubu      $2, $0, $2
.L0010E530:
/* 00E630 0010E530 5439040C */  jal         __fixunsdfdi
/* 00E634 0010E534 2D200002 */   daddu      $4, $16, $0
.L0010E538:
/* 00E638 0010E538 2000BFDF */  ld          $31, 0x20($29)
/* 00E63C 0010E53C 1000B1DF */  ld          $17, 0x10($29)
/* 00E640 0010E540 0000B0DF */  ld          $16, 0x0($29)
/* 00E644 0010E544 0800E003 */  jr          $31
/* 00E648 0010E548 3000BD27 */   addiu      $29, $29, 0x30
/* 00E64C 0010E54C 00000000 */  nop
