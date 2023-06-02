.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSyncIop
/* 19610 00119510 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 19614 00119514 0000BFFF */  sd         $31, 0x0($sp)
/* 19618 00119518 CC51040C */  jal        sceSifGetReg
/* 1961C 0011951C 04000424 */   addiu     $4, $0, 0x4
/* 19620 00119520 0400033C */  lui        $3, (0x40000 >> 16)
/* 19624 00119524 24104300 */  and        $2, $2, $3
/* 19628 00119528 07004010 */  beqz       $2, .L00119548
/* 1962C 0011952C 04000424 */   addiu     $4, $0, 0x4
/* 19630 00119530 C851040C */  jal        sceSifSetReg
/* 19634 00119534 0400053C */   lui       $5, (0x40000 >> 16)
/* 19638 00119538 E451040C */  jal        sceResetttyinit
/* 1963C 0011953C 00000000 */   nop
/* 19640 00119540 02000010 */  b          .L0011954C
/* 19644 00119544 01000224 */   addiu     $2, $0, 0x1
.L00119548:
/* 19648 00119548 2D100000 */  daddu      $2, $0, $0
.L0011954C:
/* 1964C 0011954C 0000BFDF */  ld         $31, 0x0($sp)
/* 19650 00119550 0800E003 */  jr         $31
/* 19654 00119554 1000BD27 */   addiu     $sp, $sp, 0x10
