.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosition__7CObjectFP11CVector3_f_
/* 56F90 00156E90 100080C4 */  lwc1       $f0, 0x10($4)
/* 56F94 00156E94 0000A0E4 */  swc1       $f0, 0x0($5)
/* 56F98 00156E98 140080C4 */  lwc1       $f0, 0x14($4)
/* 56F9C 00156E9C 0400A0E4 */  swc1       $f0, 0x4($5)
/* 56FA0 00156EA0 180080C4 */  lwc1       $f0, 0x18($4)
/* 56FA4 00156EA4 0800A0E4 */  swc1       $f0, 0x8($5)
/* 56FA8 00156EA8 0800E003 */  jr         $31
/* 56FAC 00156EAC 00000000 */   nop
