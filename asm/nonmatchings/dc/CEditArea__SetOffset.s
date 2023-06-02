.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetOffset__9CEditAreaFfff
/* 70230 00170130 10008CE4 */  swc1       $f12, 0x10($4)
/* 70234 00170134 14008DE4 */  swc1       $f13, 0x14($4)
/* 70238 00170138 18008EE4 */  swc1       $f14, 0x18($4)
/* 7023C 0017013C 0800E003 */  jr         $31
/* 70240 00170140 00000000 */   nop
/* 70244 00170144 00000000 */  nop
/* 70248 00170148 00000000 */  nop
/* 7024C 0017014C 00000000 */  nop
