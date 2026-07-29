.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__10CCharacterF11CVector3_f_
/* 039210 00139110 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039214 00139114 0000BF7F */  sq          $31, 0x0($29)
/* 039218 00139118 1000A327 */  addiu       $3, $29, 0x10
/* 03921C 0013911C 0000A278 */  lq          $2, 0x0($5)
/* 039220 00139120 0000627C */  sq          $2, 0x0($3)
/* 039224 00139124 1000ACC7 */  lwc1        $f12, 0x10($29)
/* 039228 00139128 1400ADC7 */  lwc1        $f13, 0x14($29)
/* 03922C 0013912C 1800AEC7 */  lwc1        $f14, 0x18($29)
/* 039230 00139130 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 039234 00139134 00000000 */   nop
/* 039238 00139138 0000BF7B */  lq          $31, 0x0($29)
/* 03923C 0013913C 2000BD27 */  addiu       $29, $29, 0x20
/* 039240 00139140 0800E003 */  jr          $31
/* 039244 00139144 00000000 */   nop
/* 039248 00139148 00000000 */  nop
/* 03924C 0013914C 00000000 */  nop
