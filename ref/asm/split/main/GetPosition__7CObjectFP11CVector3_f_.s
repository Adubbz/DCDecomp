.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPosition__7CObjectFP11CVector3_f_
/* 056F90 00156E90 100080C4 */  lwc1        $f0, 0x10($4)
/* 056F94 00156E94 0000A0E4 */  swc1        $f0, 0x0($5)
/* 056F98 00156E98 140080C4 */  lwc1        $f0, 0x14($4)
/* 056F9C 00156E9C 0400A0E4 */  swc1        $f0, 0x4($5)
/* 056FA0 00156EA0 180080C4 */  lwc1        $f0, 0x18($4)
/* 056FA4 00156EA4 0800A0E4 */  swc1        $f0, 0x8($5)
/* 056FA8 00156EA8 0800E003 */  jr          $31
/* 056FAC 00156EAC 00000000 */   nop
