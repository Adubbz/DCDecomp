.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __fixdfdi
/* E5F0 0010E4F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E5F4 0010E4F4 1000B1FF */  sd         $17, 0x10($sp)
/* E5F8 0010E4F8 0000B0FF */  sd         $16, 0x0($sp)
/* E5FC 0010E4FC 2D880000 */  daddu      $17, $0, $0
/* E600 0010E500 2D808000 */  daddu      $16, $4, $0
/* E604 0010E504 2000BFFF */  sd         $31, 0x20($sp)
/* E608 0010E508 E840040C */  jal        dpcmp
/* E60C 0010E50C 2D282002 */   daddu     $5, $17, $0
/* E610 0010E510 07004104 */  bgez       $2, .L0010E530
/* E614 0010E514 2D202002 */   daddu     $4, $17, $0
/* E618 0010E518 843F040C */  jal        dpsub
/* E61C 0010E51C 2D280002 */   daddu     $5, $16, $0
/* E620 0010E520 5439040C */  jal        __fixunsdfdi
/* E624 0010E524 2D204000 */   daddu     $4, $2, $0
/* E628 0010E528 03000010 */  b          .L0010E538
/* E62C 0010E52C 2F100200 */   dsubu     $2, $0, $2
.L0010E530:
/* E630 0010E530 5439040C */  jal        __fixunsdfdi
/* E634 0010E534 2D200002 */   daddu     $4, $16, $0
.L0010E538:
/* E638 0010E538 2000BFDF */  ld         $31, 0x20($sp)
/* E63C 0010E53C 1000B1DF */  ld         $17, 0x10($sp)
/* E640 0010E540 0000B0DF */  ld         $16, 0x0($sp)
/* E644 0010E544 0800E003 */  jr         $31
/* E648 0010E548 3000BD27 */   addiu     $sp, $sp, 0x30
/* E64C 0010E54C 00000000 */  nop
